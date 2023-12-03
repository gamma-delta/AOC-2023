&fras "inputs/day02"
⊜□≠, @\n
# ↙ 2
ParseLine ← |1 (
  ⊔
  # kill the game number, unneeded
  ⊔ ⊡ 1 ⊜□≠, @:
  # split on semicolons
  ⊜□≠, @;
  ≡(
    ⊔
    ⊜□ ≠, @,
    # Figure out if it has R/G/B
    ⊞(/+⌕ ∩⊔) {"red" "green" "blue"} .
    # Reshape it to be 3 across
    ≡(⬚0↙3)
    # Turn into index lookup
    /+ × +1⇡3 ⍉
    # Same as day 1: find number chars
    ≡(parse ▽ × ≤@9, ≥@0 . ⊔) :
    # Extend to 3 again
    ⬚0↙3
    # Zero is the sentinel "DNE" value, so at
    # idx 0 put zero to indicate no cubes
    ⊂ 0
    # for pick to have expected behavior here,
    # it has to be of shape [3 1] not [3],
    # so do that
    ⊡ ↯ 3_1 :
    # ok that was a pain in the ass
  )
)

SolvePartA ← |1 (
  # this is the actual entire first part
  # make sure, for each game, rgb < 12 13 14
  # easy as
  ≡(/×♭ ≡≤ ¤12_13_14 ParseLine)
  # then find the passing indices, +1 b/c one-
  # indexed puzzle, sum 'em
  /+ +1 ⊚
)

SolvePartB ← |1 (
  # uiua sweep
  # find the maximum number of cubes shown at
  # a time; compute "power"; add
  /+ ≡(/× /↥ ParseLine)
)

&s SolvePartA .
&s SolvePartB
