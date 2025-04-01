let utils = ./src/LLMCodeConvention/utils.dhall

let Types = ./src/LLMCodeConvention/types.dhall

let CommitPrompt =
      let CodeConventions = ./src/LLMCodeConvention/default.dhall 0

      let GitRules = CodeConventions.GitRules 1

      in  ''
          ${utils.makeLLMPrompt
              ( Types.LLMCodeConventionConfig.Rules
                  { rules =
                    [ CodeConventions.DefaultLLMPromptHeader
                    , CodeConventions.GeneralRules
                    ]
                  , rootDepth = 1
                  }
              )}

          ${utils.makeLLMPrompt
              (Types.LLMCodeConventionConfig.Rule GitRules.CommitRuleHeader)}

          ${utils.makeLLMPrompt
              (Types.LLMCodeConventionConfig.Rules GitRules.CommitStructure)}

          ${utils.makeLLMPrompt
              ( Types.LLMCodeConventionConfig.Rule
                  GitRules.CommitMessageExamples
              )}
                        ''

let ModelConfig = { model = "openrouter/deepseek/deepseek-chat-v3-0324" }

let GitConfig =
      { auto-commits = False
      , dirty-commits = False
      , git-commit-verify = True
      , gitignore = False
      , commit-prompt = CommitPrompt
      }

let MiscConfig =
      { chat-language = "Japanese"
      , dark-mode = True
      , read =
        [ ".cursorrules"
        , "CONVENTIONS.md"
        , "AIDER_CONVENTIONS.md"
        , "LLM_CODE_CONVENTIONS.md"
        ]
      , restore-chat-history = True
      , vim = True
      , voice-language = "ja"
      }

let Config = MiscConfig /\ GitConfig /\ ModelConfig

in  Config
