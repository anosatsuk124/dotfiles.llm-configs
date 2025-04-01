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

let ModelConfig =
      let alias =
            [ "main:openrouter/deepseek/deepseek-chat-v3-0324"
            , "weak:openrouter/mistralai/mistral-small-3.1-24b-instruct"
            , "cheap:openrouter/mistralai/mistral-small-3.1-24b-instruct"
            , "think:openrouter/google/gemini-2.5-pro-exp-03-25"
            ]

      in  { model = "main", weak-model = "weak", alias }

let GitConfig =
      { auto-commits = True
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
        , ".llmrules"
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
