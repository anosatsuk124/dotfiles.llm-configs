\(depthOffset : Natural) ->
  let const = ./const.dhall

  let DefaultLLMPromptHeader =
        { headding = "Project Contribution Guidelines"
        , headdingDepth = 1 + depthOffset
        , content =
            ''
            This document outlines the essential rules and guidelines for contributing to this project. Adhering to these guidelines ensures consistency, maintainability, and effective collaboration.

            Always respond in ${const.ResponseLanguage} in all chats. Use ${const.DocumentationLanguage} only for comments within code blocks.
            ''
        }

  let GeneralRules =
        { headding = "General Rules"
        , headdingDepth = 2 + depthOffset
        , content =
            ''
            - **Mandatory Reading:** Before starting any work, you **must read and understand all guidelines** outlined in this document.
            - **Language:** All code, documentation, comments, and commit messages must be written in **${const.DocumentationLanguage}**.
                  ''
        }

  let DocumentationRules =
        { headding = "Documentation Guidelines"
        , headdingDepth = 2 + depthOffset
        , content =
            ''
            Maintaining clear and up-to-date documentation is vital for this project.

            - **Documentation Review:** Thoroughly review the main documentation file (`./docs/index.md`) and all other documents within the `./docs/` directory. Understanding the existing project structure and specifications is crucial.

            - **Primary Document (`./docs/index.md`):**
              - Always **read and update** this file as changes are made to the project.
              - If `./docs/index.md` doesn't exist, you are responsible for creating it. Analyze the project structure and document the essential information.
              - This file must clearly describe the **project's purpose, overall structure, setup instructions, and usage guidelines**.
            - **Supporting Documents:**
              - You may create additional Markdown documents (`.md`) inside the `./docs/` directory as needed to elaborate on specific components, features, or processes, ensuring clarity and maintainability.
                  ''
        }

  let GitRules = ./git-rules.dhall

  in  { DefaultLLMPromptHeader, GeneralRules, DocumentationRules, GitRules }
