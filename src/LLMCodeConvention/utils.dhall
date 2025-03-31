let Types = ./types.dhall

let makeHeaddingWithDepth =
      \(rule : Types.LLMCodeConventionRule) ->
        let headdingDepth = rule.headdingDepth

        let headding = rule.headding

        in  Natural/fold
              headdingDepth
              Text
              (\(acc : Text) -> "#" ++ acc)
              " ${headding}"

let makeLLMPrompt =
      \(config : Types.LLMCodeConventionConfig) ->
        List/fold
          Types.LLMCodeConventionRule
          config
          Text
          ( \(rule : Types.LLMCodeConventionRule) ->
            \(acc : Text) ->
              let headding = makeHeaddingWithDepth rule

              in      ''
                      ${headding}

                      ${rule.content}


                      ''
                  ++  acc
          )
          ""

in  { makeLLMPrompt }
