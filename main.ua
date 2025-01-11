# Experimental!
Usage          ← |0.0 &exit1 &p "Usage:\tuiua run main.ua N\n\tFinds a valid N-queens solution"
BaseBoard      ← |1 ↯⊟.⊙∞                                                                            # ? n 
ToIndex        ← |2 ⌅(/+⍜⊢×|⊟⊃(⌊÷|◿):)                                                               # ? [y x] n
IncPos         ← |2 ⌝ToIndex+₁⊸ToIndex                                                               # ? [y x]+1 ? [y x] n
PosValid       ← |3 >⊃(ToIndex|⋅ⁿ₂)⊙◌                                                                # ? [y x] board n
BothAdj        ← |2.2 ⊃⍜⊡⋅0⍜⊡⋅1                                                                      # ? [y x] board
DiagsOf        ← |1 ≡(⌝⤸0_0↻¯)⊃(⇡⧻|¤)                                                                # ? board
VerifyHoris    ← |1 =₀ /+ ≡(>₁/+) ∵⨬∘⋅0 ≡⊸(¬∊[0 1])                                                  # ? board
VerifyDiag     ← |1 ↧ ∩VerifyHoris ⊃(×⊞≥.|×⊞<.) ⊸(⇡⧻) DiagsOf                                        # ? board
VerifyComplete ← |2 =/+♭                                                                             # ? board n
IsPartialValid ← |2 ↧↧↧↧⊃(VerifyHoris|VerifyHoris⍉|VerifyDiag|VerifyDiag⇌)                           # ? board n
IsValid        ← |2 ↧⊃(IsPartialValid|VerifyComplete)                                                # ? board n
StartConf      ← |1 {[0 0] BaseBoard}                                                                # ? n
Neighs         ← |2 ⨬([]|▽⤚≡(IsPartialValid °□⊣) [⊃{⊙⊙⋅}{⊙⋅⊙}]⊸⊃(IncPos⊙⋅⊙|BothAdj))◡PosValid∩₂°□°⊟₂ # ? {[y x] board} n
FindPath       ← |1 path(Neighs|IsValid°□⊣) ⊸StartConf                                               # ? n
Color          ← |1 ⍣(1 °1|0 °0|0.5)                                                                 # ? square
MakeGif        ← |1.0 &gifs 10 ≡(▽⟜≡▽100 ∵Color°□)                                                   # ? path

# ===== Main =====
FindPath ⍣(⋕ °□ ⊏₁|Usage) &args
⊃(MakeGif⊢≡₂⊣|&s)
