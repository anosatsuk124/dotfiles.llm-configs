\(depthOffset : Natural) ->
  let CommitRuleHeader =
        { headding = "Git Commit Message Guidelines"
        , headdingDepth = 1 + depthOffset
        , content =
            ''
            You are an expert software engineer that generates concise,
            one-line Git commit messages based on the provided diffs.
            Review the provided context and diffs which are about to be committed to a git repo.
            Review the diffs carefully.
            Generate a one-line commit message for those changes.
            The commit message should be structured as follows: <type>: <description>
            Use these for <type>: fix, feat, build, chore, ci, docs, style, refactor, perf, test

            Ensure the commit message:
            - Starts with the appropriate prefix.
            - Is in the imperative mood (e.g., "Add feature" not "Added feature" or "Adding feature").
            - Does not exceed 72 characters.

            Reply only with the one-line commit message, without any additional text, explanations,
            or line breaks.
                        ''
        }

  let CommitStructure =
        { rules =
          [ { headding = "Structure"
            , headdingDepth = 1
            , content =
                ''
                Commit messages **must** follow this precise structure:

                <type>: <description>

                _(Note: While Conventional Commits allows for an optional `[scope]`, a `[BODY]`, and `[FOOTER(s)]`, for simplicity in this project, we primarily focus on the mandatory type and description line shown above unless more detail is necessary for complex changes).
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
          ]
        , rootDepth = 2 + depthOffset
        }

  let CommitMessageExamples =
        { headding = "Examples"
        , headdingDepth = 2 + depthOffset
        , content =
            ''
            feat: add user profile endpoint
            fix: prevent division by zero in calculator module
            docs: explain environment variable setup
            refactor: simplify user service database interaction
            test: add unit tests for payment processing
            chore: update axios to version 1.5.0
            ci: configure automated deployment to staging
            style: apply linter rules across codebase
            perf: optimize image loading algorithm
            ''
        }

  in  { CommitRuleHeader, CommitStructure, CommitMessageExamples }
