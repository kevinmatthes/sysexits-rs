#
# SPDX-License-Identifier: Apache-2.0 OR MIT
#
# Copyright (C) 2022 Shun Sakai and Contributors
#

set positional-arguments

alias all := default
alias lint := clippy

# Run default recipe
default: build

# Build a package
@build:
    cargo build

# Remove generated artifacts
@clean:
    cargo clean

# Check a package
@check:
    cargo check

# Run tests
@test:
    cargo test

# Run the formatter
@fmt:
    cargo fmt

# Run the linter
@clippy:
    cargo clippy -- -D warnings

# Run the linter for GitHub Actions workflow files
@lint-github-actions:
    actionlint

# Run the formatter for the README
@fmt-readme:
    npx prettier -w README.md

# Prepare the version increment
@new-version version part:
    bump2version --new-version $1 $2
