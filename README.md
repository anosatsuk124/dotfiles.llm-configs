# LLM Code Convention Configuration

This project uses Dhall to manage and generate configuration files related to LLM code conventions, ensuring consistency across the development workflow.

## Purpose

This is to manage code contribution guidelines, Git commit message formats, and potentially other configuration settings for LLMs (vibe-coding).

## Prerequisites

- [Dhall](https://dhall-lang.org/) must be installed. Follow the installation instructions on the official Dhall website.

## Usage

To generate the configuration files from the Dhall sources, run the build script:

```bash
make init
make all
```

This script will typically:

1.  Read the Dhall configurations from the `src/` directory.
2.  Generate the corresponding output files (e.g., `LLM_CODE_CONVENTIONS.md`, `aider.conf.yml`).

## Project Structure

- `src/`: Contains the Dhall source files defining the configurations.
  - `LLMCodeConvention/`: Dhall package for code convention definitions.
- `*.dhall`: Top-level Dhall files potentially importing from `src/`.
- `Makefile`: Contains the build script to generate the configuration files.
