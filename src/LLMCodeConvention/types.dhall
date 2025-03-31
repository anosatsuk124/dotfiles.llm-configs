let LLMCodeConventionRule
    : Type
    = { headding : Text, headdingDepth : Natural, content : Text }

let LLMCodeConventionRules =
      { rules : List LLMCodeConventionRule, rootDepth : Natural }

let LLMCodeConventionConfig
    : Type
    = < Rule : LLMCodeConventionRule | Rules : LLMCodeConventionRules >

in  { LLMCodeConventionRule, LLMCodeConventionRules, LLMCodeConventionConfig }
