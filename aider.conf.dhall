let ModelConfig = { model = "gemini/gemini-2.5-pro-exp-03-25" }

let GitConfig =
      { auto-commits = False
      , dirty-commits = False
      , git-commit-verify = True
      , gitignore = False
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
