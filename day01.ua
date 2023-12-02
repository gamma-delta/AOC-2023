# uiuaism: split into lines
# using behavior of partition, which collects
# "runs" of identical
# numbers, omitting <= 0.
# TBH i do not actually understand this
# &fras "inputs/day01"
"5lfprlrznvgtsix4xmdxvgsv7six"
⊜□≠, @\n

# tmp, to make it easier to print
# ↙ 2

ProcessLineA ← (
  # Mask of digit characters
  × ≤@9, ≥@0.
  # Fetch them
  ▽ ∩⊔
  # could use parse here but that feels cheap
  # Get first and last; turn into numbers;
  # mul 10s place, add 1s place
  + ×10 : ∩(-@0) ⊢⇌:⊢.
)

ProcessLineB ← |1 (
  # Get needed length
  ⊢ △.
  :

  {"one" "two" "three" "four" "five"
   "six" "seven" "eight" "nine"}
  # Make mask of: row[x][y] is 1 if the word "x"
  # starts there
  ≡⊐⌕ ,,
  # Find out how much needs to be rotated by
  # ⊗ 1
  ⊚
  # Must transform this into jagged array somehow
  # Magic invocation from Kai on uiuacord
  /⊕□⍉
  # Pad out to length 9
  ⬚(□[])↙ ⧻,
  dump∘
  :

  # Get length of each number word
  ∵⧻ ⊃⋅⋅∘ ⊙∘
  ↘1 ⇡10
  # array of "1 1 1 0 0" b/c "one" is 3 chars long,
  # etc
  ⬚0 ≡▽ :
  # Fetch max len from the bottom again auguh
  ⊃⋅⋅⋅⋅∘ ⊙⊙⊙∘
  # Pad out number word mask to given length
  ⬚0≡↙

  : # fetch number mask
  # Rotate each row by the correct amount
  ≡↻¯
  # But then mask away every "non-rotation"
  # rotation
  ≡×
  # Sum each row -- this forms the word number
  # mask
  /+

  # great now I have to do part 1, again
  :

  # Mask of digit characters
  × ≤@9, ≥@1.
  # Turn string into list of digits,
  # then mask away non 0-9
  × -@0 :
  # combine the two masks!
  +
  # Strip zeroes
  ▽ ≠0 .
  # get first and last; turn into numbers;
  # mul 10s place, add 1s place
  + ×10 : ⊢⇌:⊢.
)

# &s /+ ∵ProcessLineA .
/+ ∵ProcessLineB

# 53259 : too low
