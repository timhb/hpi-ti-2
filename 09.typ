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
