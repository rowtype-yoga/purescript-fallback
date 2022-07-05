# purescript-fallback

Idris-style fallback for do comprehensions.

## installation

```bash
spago install fallback
```

## Usage

```purescript
withFallback do
    i :: String <- Nothing |> const (Just 0)
    result <- Int.fromString i |> const (Just 1)
    pure result
-- Just 0

withFallback do
    i :: String <- Just "abc" |> const (Just 0)
    result <- Int.fromString i |> const (Just 1)
    pure result
-- Just 1

withFallback do
    i :: String <- Just "10" |> const (Just 0)
    result <- Int.fromString i |> const (Just 1)
    pure result
-- Just 10
```
