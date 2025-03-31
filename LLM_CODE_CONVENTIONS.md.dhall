let defaultConfig = ./src/LLMCodeConvention/default.dhall 0

let gitRules = defaultConfig.GitRules 1

let utils = ./src/LLMCodeConvention/utils.dhall

let Types = ./src/LLMCodeConvention/types.dhall

let GeneralPrompt =
      utils.makeLLMPrompt
        ( Types.LLMCodeConventionConfig.Rules
            { rules =
              [ defaultConfig.DefaultLLMPromptHeader
              , defaultConfig.GeneralRules
              , defaultConfig.DocumentationRules
              ]
            , rootDepth = 1
            }
        )

let GitRulesPrompt =
          utils.makeLLMPrompt
            (Types.LLMCodeConventionConfig.Rule gitRules.CommitRuleHeader)
      ++  utils.makeLLMPrompt
            (Types.LLMCodeConventionConfig.Rules gitRules.CommitStructure)
      ++  utils.makeLLMPrompt
            (Types.LLMCodeConventionConfig.Rule gitRules.CommitMessageExamples)

in  GeneralPrompt ++ GitRulesPrompt
