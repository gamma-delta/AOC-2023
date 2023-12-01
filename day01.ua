# uiuaism: split into lines
# using behavior of partition, which collects
# "runs" of identical
# numbers, omitting <= 0.
# TBH i do not actually understand this
⊜□≠, @\n &fras "inputs/day01"

# tmp, to make it easier to print
# ↙ 5

ProcessLine ← (
  # Mask of digit characters 
  × ≤@9, ≥@0.
  # Fetch them
  ▽ ∩⊔
  # could use parse here but that feels cheap
  # Get first and last; turn into numbers;
  # mul 10s place, add 1s place
  + ×10 : ∩(-@0) ⊢⇌:⊢.
)

/+ ∵ProcessLine
