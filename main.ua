# Experimental!
BaseBoard      ← ↯⊟.⊙∞                                        # ? n 
ToIndex        ← ⌅(/+⍜⊢×|⊟⊃(⌊÷|◿):)                           # ? [y x] n
IncPos         ← ⌝ToIndex+₁⊸ToIndex                           # [y x] + 1 ? [y x] n
Neighs         ← ⊃{⊙⊙⋅⊙}{⊙⋅⊙⊙} ⊸⊃(IncPos⊙◌|⊃⍜⊡⋅0⍜⊡⋅1) ∩₃°□°⊟₃ # ? [y x] board n
DiagsOf        ← ≡(⌝⤸0_0↻¯)⊃(⇡⧻|¤)                            # ? board
VerifyHoris    ← =₀ /+ ≡(>₁/+)                                # ? board
VerifyDiag     ← VerifyHoris DiagsOf                          # ? board
VerifyComplete ← =/+♭                                         # ? board n

# ? Board n
IsValid ← ↧↧↧⊃(
  VerifyHoris
| VerifyHoris⍉
| VerifyDiag
| VerifyComplete
)

[0 0] ⊸BaseBoard 9
⊟₃∩₃□
¤
⍚Neighs
⍚Neighs
⍚Neighs
# IncPos
