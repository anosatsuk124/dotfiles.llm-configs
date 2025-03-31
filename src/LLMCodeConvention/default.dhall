let Types = ./types.dhall

let utils = ./utils.dhall

let DefaultLLMPromptHeader =
      Types.LLMCodeConventionConfigElement.Rule
        { headding = "Project Contribution Guidelines"
        , headdingDepth = 1
        , content =
            ''
            This document outlines the essential rules and guidelines for contributing to this project. Adhering to these guidelines ensures consistency, maintainability, and effective collaboration.
            ''
        }

let GeneralRules =
      Types.LLMCodeConventionConfigElement.Rule
        { headding = "General Rules"
        , headdingDepth = 2
        , content =
            ''
            - **Mandatory Reading:** Before starting any work, you **must read and understand all guidelines** outlined in this document.
            - **Documentation Review:** Thoroughly review the main documentation file (`./docs/index.md`) and all other documents within the `./docs/` directory. Understanding the existing project structure and specifications is crucial.
            - **Language:** All code, documentation, comments, and commit messages must be written in **English**.
                  ''
        }

let DocumentationRules =
      Types.LLMCodeConventionConfigElement.Rule
        { headding = "Documentation Guidelines"
        , headdingDepth = 2
        , content =
            ''
            Maintaining clear and up-to-date documentation is vital for this project.

            - **Primary Document (`./docs/index.md`):**
              - Always **read and update** this file as changes are made to the project.
              - If `./docs/index.md` doesn't exist, you are responsible for creating it. Analyze the project structure and document the essential information.
              - This file must clearly describe the **project's purpose, overall structure, setup instructions, and usage guidelines**.
            - **Supporting Documents:**
              - You may create additional Markdown documents (`.md`) inside the `./docs/` directory as needed to elaborate on specific components, features, or processes, ensuring clarity and maintainability.
                  ''
        }

let GitCommitRules =
      Types.LLMCodeConventionConfigElement.Rules
        { rules =
          [ { headding = "Git Commit Message Guidelines"
            , headdingDepth = 0
            , content =
                ''
                We follow the Conventional Commits specification (v1.0.0) for Git commit messages. This provides a consistent history and facilitates automated changelog generation.
                ''
            }
          ]
        , rootDepth = 2
        }

in  [ DefaultLLMPromptHeader, GeneralRules, DocumentationRules, GitCommitRules ]
