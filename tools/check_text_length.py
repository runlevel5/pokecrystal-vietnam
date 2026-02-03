#!/usr/bin/env python3
"""
Check that text lines in assembly files don't exceed the maximum character width.
This helps ensure text fits on the Game Boy screen (20 tiles wide, but typically 18 usable).

You can override the max length for a file by adding a comment at the top:
; pokemon-translate-lint: max-length=8
"""

import sys
import re
import os
from pathlib import Path

# Maximum characters per line (Game Boy screen is 20 tiles, but borders take 2)
MAX_LINE_LENGTH = 18

# Pattern to match lint directive comment
LINT_DIRECTIVE_PATTERN = re.compile(r";\s*pokemon-translate-lint:\s*max-length=(\d+)")

# Patterns to match text definitions
# Matches: db "text here", text "...", line "...", cont "...", para "...", next "..."
TEXT_STRING_PATTERN = re.compile(r'^\s*(?:db|text|line|cont|para|next)\s+"([^"]*)"')

# Characters that map to control codes (don't count towards visible length)
CONTROL_CODES = {
    "<NULL>",
    "<PLAY_G>",
    "<MOBILE>",
    "<CR>",
    "<BSP>",
    "<LF>",
    "<POKE>",
    "<WBR>",
    "<RED>",
    "<GREEN>",
    "<ENEMY>",
    "<MOM>",
    "<PKMN>",
    "<_CONT>",
    "<SCROLL>",
    "<NEXT>",
    "<LINE>",
    "<PARA>",
    "<PLAYER>",
    "<RIVAL>",
    "<CONT>",
    "<……>",
    "<DONE>",
    "<PROMPT>",
    "<TARGET>",
    "<USER>",
    "<PC>",
    "<TM>",
    "<TRAINER>",
    "<PK>",
    "<MN>",
    "<DOT>",
    "<COLON>",
    "<JP_18>",
    "<NI>",
    "<TTE>",
    "<WO>",
    "<TA!>",
    "<KOUGEKI>",
    "<WA>",
    "<NO>",
    "<ROUTE>",
    "<WATASHI>",
    "<KOKO_WA>",
    "<GA>",
    "<POKEMON>",
    "<BOLD_A>",
    "<BOLD_B>",
    "<BOLD_C>",
    "<BOLD_D>",
    "<BOLD_E>",
    "<BOLD_F>",
    "<BOLD_G>",
    "<BOLD_H>",
    "<BOLD_I>",
    "<BOLD_V>",
    "<BOLD_S>",
    "<BOLD_L>",
    "<BOLD_M>",
    "<LV>",
    "<DO>",
    "<ID>",
}

# Single-tile sprites (count as 1 character)
SINGLE_TILE_CODES = {
    "<ROCKET>",  # "m" sprite (meter)
    "<DEXEND>",  # "kg" sprite (kilogram)
}

# Control codes that expand to variable-length strings (max lengths)
VARIABLE_LENGTH_CODES = {
    "<PLAYER>": 8,  # Player name, max 8 chars
    "<RIVAL>": 8,  # Rival name, max 8 chars
    "<PLAY_G>": 8,  # Player name (gendered), max 8 chars
    "<TARGET>": 11,  # Target Pokemon name, max 11 chars
    "<USER>": 11,  # User Pokemon name, max 11 chars
    "<ENEMY>": 11,  # Enemy Pokemon name, max 11 chars
}

# Pattern to find control codes in text
CONTROL_CODE_PATTERN = re.compile(r"<[^>]+>")

# Files/directories to check
CHECK_PATHS = [
    "data/text/",
    "engine/menus/",
]

# Files to exclude from checking
EXCLUDE_FILES = [
    "name_input_chars.asm",  # Name input has special formatting
    "mail_input_chars.asm",  # Mail input has special formatting
]


def get_visible_length(text):
    """
    Calculate the visible length of a text string, accounting for:
    - Control codes that expand to variable-length strings
    - Special characters that expand to multiple tiles
    - Single-tile sprite codes (count as 1)
    - Multi-byte Vietnamese characters (count as 1)
    """
    length = 0

    # First, handle variable-length control codes
    for code, max_len in VARIABLE_LENGTH_CODES.items():
        count = text.count(code)
        length += count * max_len
        text = text.replace(code, "")

    # Handle single-tile codes (count as 1 character each)
    for code in SINGLE_TILE_CODES:
        count = text.count(code)
        length += count
        text = text.replace(code, "")

    # Remove remaining control codes (they don't render)
    visible = CONTROL_CODE_PATTERN.sub("", text)

    # Handle {d:...} number macros (expand to max 3 digits)
    import re

    visible = re.sub(r"\{d:[^}]+\}", "999", visible)

    # Count visible characters
    # Special handling for # which expands to "POKé" (4 tiles)
    # #MON = "POKéMON" = 7 tiles
    # #DEX = "POKéDEX" = 7 tiles
    # #GEAR = "POKéGEAR" = 8 tiles (handle before general # case)
    i = 0
    while i < len(visible):
        if visible[i] == "#":
            # Check if this is #GEAR (POKéGEAR = 8 tiles)
            if visible[i : i + 5] == "#GEAR":
                length += 8  # #GEAR expands to "POKéGEAR" (8 tiles)
                i += 5  # Skip past #GEAR
            # Check if this is #DEX (POKéDEX = 7 tiles)
            elif visible[i : i + 4] == "#DEX":
                length += 7  # #DEX expands to "POKéDEX" (7 tiles)
                i += 4  # Skip past #DEX
            else:
                length += 4  # # expands to "POKé" (4 tiles)
                i += 1
        else:
            length += 1
            i += 1

    return length


def check_file(filepath, global_max_length=MAX_LINE_LENGTH):
    """Check a single file for text lines exceeding max length."""
    errors = []

    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()

    # Check for per-file max-length directive in the first 10 lines
    file_max_length = global_max_length
    for line in lines[:10]:
        match = LINT_DIRECTIVE_PATTERN.search(line)
        if match:
            file_max_length = int(match.group(1))
            break

    for line_num, line in enumerate(lines, 1):
        match = TEXT_STRING_PATTERN.match(line)
        if match:
            text = match.group(1)
            visible_len = get_visible_length(text)

            if visible_len > file_max_length:
                errors.append(
                    {
                        "file": filepath,
                        "line": line_num,
                        "text": text,
                        "length": visible_len,
                        "max": file_max_length,
                    }
                )

    return errors


def main():
    """Main entry point."""
    import argparse

    parser = argparse.ArgumentParser(
        description="Check text line lengths in assembly files"
    )
    parser.add_argument(
        "files", nargs="*", help="Specific files to check (default: check all)"
    )
    parser.add_argument(
        "--max-length",
        type=int,
        default=MAX_LINE_LENGTH,
        help=f"Maximum line length (default: {MAX_LINE_LENGTH})",
    )
    parser.add_argument(
        "--warn-only",
        action="store_true",
        help="Exit with 0 even if errors found (warnings only)",
    )
    args = parser.parse_args()

    max_length = args.max_length

    # Find project root (where Makefile is)
    script_dir = Path(__file__).parent
    project_root = script_dir.parent

    all_errors = []

    if args.files:
        # Check specific files
        for filepath in args.files:
            if os.path.isfile(filepath):
                all_errors.extend(check_file(filepath, max_length))
    else:
        # Check default paths
        for check_path in CHECK_PATHS:
            full_path = project_root / check_path
            if full_path.is_dir():
                for asm_file in full_path.rglob("*.asm"):
                    if asm_file.name not in EXCLUDE_FILES:
                        all_errors.extend(check_file(str(asm_file), max_length))
            elif full_path.is_file():
                if full_path.name not in EXCLUDE_FILES:
                    all_errors.extend(check_file(str(full_path), max_length))

    # Filter by max_length if different from default
    if max_length != MAX_LINE_LENGTH:
        all_errors = [e for e in all_errors if e["length"] > max_length]
        for e in all_errors:
            e["max"] = max_length

    # Report errors
    if all_errors:
        print(
            f"Text length errors found ({len(all_errors)} lines exceed max characters):\n"
        )
        for error in all_errors:
            print(
                f"{error['file']}:{error['line']}: "
                f"length {error['length']} > {error['max']}"
            )
            print(f'  Text: "{error["text"]}"')
            print()

        if not args.warn_only:
            sys.exit(1)
    else:
        print(f"All text lines are within the allowed character limits.")

    sys.exit(0)


if __name__ == "__main__":
    main()
