# Experimental!
BaseBoard       ← |1 ↯⊟.⊙∞                                                         # ? n 
ToIndex         ← |2 ⌅(/+⍜⊢×|⊟⊃(⌊÷|◿):)                                            # ? [y x] n
IncPos          ← |2 ⌝ToIndex+₁⊸ToIndex                                            # ? [y x]+1 ? [y x] n
PosValid        ← |3 >⊃(ToIndex|⋅ⁿ₂)⊙◌                                             # ? [y x] board n
BothAdj         ← |2.2 ⊃⍜⊡⋅0⍜⊡⋅1                                                   # ? [y x] board
Neighs          ← |1 ⨬([]|[⊃{⊙⊙⋅⊙}{⊙⋅⊙⊙}] ⊸⊃(IncPos⊙◌⊙|BothAdj)) ◡PosValid ∩₃°□°⊟₃ # ? {[y x] board n}
DiagsOf         ← |1 ≡(⌝⤸0_0↻¯)⊃(⇡⧻|¤)                                             # ? board
VerifyHoris     ← |1 =₀ /+ ≡(>₁/+)                                                 # ? board
VerifyDiag      ← |1 ↧ ∩VerifyHoris ⊃(×⊞≥.|×⊞<.) ⊸(⇡⧻) DiagsOf
VerifyMinorDiag ← |1 VerifyDiag⇌                                                            # ? board
VerifyComplete  ← |2 =/+♭                                                                   # ? board n
IsValid         ← ↧↧↧↧⊃(VerifyHoris|VerifyHoris⍉|VerifyDiag|VerifyMinorDiag|VerifyComplete) # ? board n
StartConf       ← |1 {[0 0] ⊸BaseBoard}                                                     # ? n
FindSolved      ← ⊣⊢path(Neighs|IsValid ◌°{⊙⊙⊙}) StartConf                                  # ? n

⍣(⋕ °□ ⊏1|&p "First arg, must be integer") &args
⋅⊙◌ °{⊙⊙⊙} FindSolved
