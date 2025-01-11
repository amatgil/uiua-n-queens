# Experimental!
BaseBoard       ← |1 ↯⊟.⊙∞                                                      # ? n 
ToIndex         ← |2 ⌅(/+⍜⊢×|⊟⊃(⌊÷|◿):)                                         # ? [y x] n
IncPos          ← |2 ⌝ToIndex+₁⊸ToIndex                                         # ? [y x]+1 ? [y x] n
PosValid        ← |3 >⊃(ToIndex|⋅ⁿ₂)⊙◌                                          # ? [y x] board n
BothAdj         ← |2.2 ⊃⍜⊡⋅0⍜⊡⋅1                                                # ? [y x] board
DiagsOf         ← |1 ≡(⌝⤸0_0↻¯)⊃(⇡⧻|¤)                                          # ? board
VerifyHoris     ← |1 =₀ /+ ≡(>₁/+) ∵⨬∘⋅0 ≡⊸(¬∊[0 1])                            # ? board
VerifyDiag      ← |1 ↧ ∩VerifyHoris ⊃(×⊞≥.|×⊞<.) ⊸(⇡⧻) DiagsOf                  # ? board
VerifyMinorDiag ← |1 VerifyDiag⇌                                                # ? board
VerifyComplete  ← |2 =/+♭                                                       # ? board n
IsPartialValid  ← |2 ↧↧↧↧⊃(VerifyHoris|VerifyHoris⍉|VerifyDiag|VerifyMinorDiag) # ? board n
IsValid         ← |2 ↧⊃(IsPartialValid|VerifyComplete)                          # ? board n
StartConf       ← |1 {[0 0] ⊸BaseBoard}                                         # ? n
# ? {[y x] board n}
Neighs ← |1 (
  ∩₃°□°⊟₃
  ◡PosValid
  ⨬([]|▽⊸≡(IsPartialValid◌°{⊙⊙⊙}) [⊃{⊙⊙⋅⊙}{⊙⋅⊙⊙}] ⊸⊃(IncPos⊙◌⊙|BothAdj))
)
FindSolved ← ⊣⊢path(Neighs|IsValid ◌°{⊙⊙⊙}) StartConf # ? n

# ⍣(⋕ °□ ⊏1|&exit1 &p "First argument must be integer") &args
⋅⊙◌ °{⊙⊙⊙} FindSolved 4
# ∩₃°□°⊟₃
# ◡PosValid
# ⨬([]|▽⊸≡(IsPartialValid◌°{⊙⊙⊙}) [⊃{⊙⊙⋅⊙}{⊙⋅⊙⊙}] ⊸⊃(IncPos⊙◌⊙|BothAdj))
