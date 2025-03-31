let Types = ./types.dhall

let makeHeaddingWithDepth =
      \(initialDepth : Natural) ->
      \(rule : Types.LLMCodeConventionRule) ->
        let headdingDepth = rule.headdingDepth + initialDepth

        let headding = rule.headding

        in  Natural/fold
              headdingDepth
              Text
              (\(acc : Text) -> "#" ++ acc)
              " ${headding}"

let makeText =
      \(initialDepth : Natural) ->
      \(rule : Types.LLMCodeConventionRule) ->
        let headding = makeHeaddingWithDepth initialDepth rule

        in  ''
            ${headding}

            ${rule.content}


            ''

let makeTextFromRules =
      \(rules : Types.LLMCodeConventionRules) ->
        let initialDepth = rules.rootDepth

        let rulesList = rules.rules

        in  List/fold
              Types.LLMCodeConventionRule
              rulesList
              Text
              ( \(rule : Types.LLMCodeConventionRule) ->
                \(acc : Text) ->
                  let text = makeText initialDepth rule in text ++ acc
              )
              ""

let makeLLMPrompt =
      \(config : Types.LLMCodeConventionConfig) ->
        let handler = { Rule = makeText 0, Rules = makeTextFromRules }

        in  List/fold
              Types.LLMCodeConventionConfigElement
              config
              Text
              ( \(element : Types.LLMCodeConventionConfigElement) ->
                \(acc : Text) ->
                  let text = merge handler element in text ++ acc
              )
              ""

in  { makeHeaddingWithDepth, makeText, makeTextFromRules, makeLLMPrompt }
