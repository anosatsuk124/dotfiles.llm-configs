let LLMCodeConventionRule
    : Type
    = { headding : Text, headdingDepth : Natural, content : Text }

let LLMCodeConventionRules =
      { rules : List LLMCodeConventionRule, rootDepth : Natural }

let LLMCodeConventionConfigElement
    : Type
    = < Rule : LLMCodeConventionRule | Rules : LLMCodeConventionRules >

let LLMCodeConventionConfig
    : Type
    = List LLMCodeConventionConfigElement

in  { LLMCodeConventionRule
    , LLMCodeConventionRules
    , LLMCodeConventionConfig
    , LLMCodeConventionConfigElement
    }
