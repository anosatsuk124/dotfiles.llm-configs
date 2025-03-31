let Types = ./types.dhall

let makeHeaddingWithDepth =
      \(initialDepth : Natural) ->
      \(rule : Types.LLMCodeConventionRule) ->
        let headdingDepth =
              Natural/subtract 1 (rule.headdingDepth + initialDepth)

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
        let handler = { Rule = makeText 1, Rules = makeTextFromRules }

        in  merge handler config

in  { makeHeaddingWithDepth, makeText, makeTextFromRules, makeLLMPrompt }
