let LLMCodeConventionRule
    : Type
    = { headding : Text, headdingDepth : Natural, content : Text }

let LLMCodeConventionConfig
    : Type
    = List LLMCodeConventionRule

in  { LLMCodeConventionRule, LLMCodeConventionConfig }
