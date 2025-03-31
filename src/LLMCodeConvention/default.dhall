let Types = ./types.dhall

let DefaultLLMPromptHeader
    : Types.LLMCodeConventionRule
    = { headding = "Project Contribution Guidelines"
      , headdingDepth = 1
      , content =
          ''
          This document outlines the essential rules and guidelines for contributing to this project. Adhering to these guidelines ensures consistency, maintainability, and effective collaboration.
          ''
      }

let DefaultLLMCodeConventionConfig
    : Types.LLMCodeConventionConfig
    = [ DefaultLLMPromptHeader
      , { headding = "General Rules"
        , headdingDepth = 2
        , content =
            ''
            - **Mandatory Reading:** Before starting any work, you **must read and understand all guidelines** outlined in this document.
            - **Documentation Review:** Thoroughly review the main documentation file (`./docs/index.md`) and all other documents within the `./docs/` directory. Understanding the existing project structure and specifications is crucial.
            - **Language:** All code, documentation, comments, and commit messages must be written in **English**.
                  ''
        }
      ]

in  DefaultLLMCodeConventionConfig
