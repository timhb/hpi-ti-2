#import "template.typ": *

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 9

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  name: "Übungsblatt",
  number: week,
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Verständnisaufgabe][
  Sei $L = { a^ell b^m c^k | ell = m "oder" m = k }$. Zeige oder widerlege, dass $L$ kontextfrei
  ist.

  *Lösung:*

  Sei $L_1 = {a^ell b^ell c^k}$ und $L_2 = {a^ell b^m c^m}$. Es gilt $L = L_1 union L_2$. Setze $T =
  {a,b,c}$.

  Sei $G_1 = (N_1, T, P_1, S_1)$ eine Grammatik mit $N_1 = {S_1, A_1, C_1}$ und $P_1$:

  $S_1 -> A_1 C_1$\
  $A_1 -> a A_1 b | epsilon$\
  $C_1 -> c C_1 | epsilon$

  Es gilt $L(G_1) = L_1$.

  Sei $G_2 = (N_2, T, P_2, S_2)$ eine Grammatik mit $N_2 = {S_2, A_2, B_2}$ und $P_2$:

  $S_2 -> A_2 B_2$\
  $A_2 -> a A_2 | epsilon$\
  $B_2 -> b B_2 c | epsilon$

  Es gilt $L(G_2) = L_2$.

  $G_1$ und $G_2$ sind per Definition kontextfrei.

  Wir konstruieren nun $G = (N_1 union N_2 union {S}, T, P_1 union P_2 union {S -> S_1 | S_2}}$ mit
  $S in.not N_1 union N_2$.

  Da kontextfreie Sprachen unter Vereinigung abgeschlossen sind, ist $G$ eine kontextfreie
  Grammatik.

  Außerdem gilt $L(G) = L(G_1) union L(G_2) = L_1 union L_2 = L$. Somit ist $L$ kontextfrei.
]

#pagebreak()
#exercise[6 Punkte, Knobelaufgabe][
  Zeige, dass die Sprache $L = { w w | w in {0, 1}^+ }$ kontextsensitiv ist, indem du eine
  kontextsensitive Grammatik dafür konstruierst.

  *Lösung:*
]

#pagebreak()
#exercise[6 Punkte, Knobelaufgabe][
  Sei für $k in NN$ und $ell in NN$ die Sprache $L_(k, ell)$ definiert als:
  $ L_(k, ell) = { a^n b^m | n >= k, m >= min(n, ell) } $
  Für welche Werte von $k$ und $ell$ ist $L_(k, ell)$ regulär?

  *Lösung:*
]
