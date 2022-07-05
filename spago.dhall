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
, license = "MIT-0"
, repository = "https://github.com/sigma-andex/purescript-fallback.git"
}
