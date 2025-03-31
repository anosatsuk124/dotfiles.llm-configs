let defaultConfig = ./src/LLMCodeConvention/default.dhall

let utils = ./src/LLMCodeConvention/utils.dhall

in  utils.makeLLMPrompt defaultConfig
