\(depthOffset : Natural) ->
  let CommitRuleHeader =
        { headding = "Git Commit Message Guidelines"
        , headdingDepth = 1 + depthOffset
        , content =
            ''
            We follow the Conventional Commits specification (v1.0.0) for Git commit messages. This provides a consistent history and facilitates automated changelog generation.
            ''
        }

  let CommitStructure =
        { rules =
          [ { headding = "Structure"
            , headdingDepth = 1
            , content =
                ''
                Commit messages **must** follow this precise structure:

                ```
                <type>: <description>
                ```

                _(Note: While Conventional Commits allows for an optional `[scope]`, a `[BODY]`, and `[FOOTER(s)]`, for simplicity in this project, we primarily focus on the mandatory type and description line shown above unless more detail is necessary for complex changes)._
                ''
            }
          , { headding = "Types"
            , headdingDepth = 1
            , content =
                ''
                The `<type>` field indicates the nature of the change introduced by the commit. Use one of the following lowercase types:

                - **feat**: Introduces a new feature for the user.
                - **fix**: Patches a bug in the codebase.
                - **build**: Changes affecting the build system or external dependencies (e.g., npm, gulp, webpack).
                - **chore**: Routine tasks or maintenance that don't modify `src` or `test` files (e.g., updating dependencies, regenerating lock files).
                - **ci**: Changes to Continuous Integration configuration files and scripts (e.g., GitHub Actions, Travis CI).
                - **docs**: Documentation-only changes (e.g., updating README, adding guides).
                - **style**: Changes that do not affect the meaning or logic of the code (e.g., white-space, formatting, missing semi-colons, linting fixes).
                - **refactor**: A code change that neither fixes a bug nor adds a feature, but improves structure, readability, or performance without changing behavior.
                - **perf**: A code change that specifically improves performance.
                - **test**: Adding missing tests or correcting existing tests.
                ''
            }
          , { headding = "Description"
            , headdingDepth = 1
            , content =
                ''
                  The `<description>` provides a concise summary of the code change:

                  - Use the **imperative, present tense**: "add", "change", "fix", "refactor" (e.g., "fix: correct login validation" not "fix: fixed login validation").
                  - **Do not capitalize** the first letter.
                  - **Do not end** the description with a period (`.`).
                  - The entire commit subject line (`<type>: <description>`) **must not exceed 72 characters**.
                ''
            }
          ]
        , rootDepth = 2 + depthOffset
        }

  let CommitMessageExamples =
        { headding = "Examples"
        , headdingDepth = 2 + depthOffset
        , content =
            ''
            ```
            feat: add user profile endpoint
            fix: prevent division by zero in calculator module
            docs: explain environment variable setup
            refactor: simplify user service database interaction
            test: add unit tests for payment processing
            chore: update axios to version 1.5.0
            ci: configure automated deployment to staging
            style: apply linter rules across codebase
            perf: optimize image loading algorithm
            ```
            ''
        }

  in  { CommitRuleHeader, CommitStructure, CommitMessageExamples }
