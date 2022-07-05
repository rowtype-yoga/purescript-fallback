{ name = "fallback"
, dependencies =
  [ "console"
  , "effect"
  , "either"
  , "foldable-traversable"
  , "prelude"
  , "transformers"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
