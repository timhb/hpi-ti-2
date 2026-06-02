#import "template.typ": *

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 8

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  name: "Übungsblatt",
  number: week,
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Verständnisaufgabe][
  + (1 Punkt) Sei eine Grammatik $G_a$ durch die Regeln $S -> S + S | 42$ gegeben, wobei $S$ das
    einzige Nichtterminal ist. Gib ein Wort aus $L(G_a)$ an, welches zwei unterschiedliche
    Ableitungen hat.

    *Lösung:*

  + (1 Punkt) Gib ein Wort aus $L(G_b)$ an, welches zwei unterschiedliche Ableitungsbäume hat,
    welche zwei Berechnungen mit unterschiedlichem Ergebnis liefern (wenn man abgeleitete
    Teilausdrücke implizit klammert).

    *Lösung:*

  + (2 Punkte) Konstruiere eine Grammatik $G_c$, welche die gleichen Worte wie $G_b$ akzeptiert,
    aber die Operator-Reihenfolge beachtet (Multiplikation bindet stärker als Addition). Mit anderen
    Worten, jede Ableitung für ein Wort sollte nach arithmetischer Auswertung (mit impliziter
    Klammerung) zum gleichen Ergebnis kommen.

    *Lösung:*
]

#pagebreak()
#exercise[6 Punkte, Beweisaufgabe][
  Beweise mit dem Pumping-Lemma, dass die folgenden Sprachen nicht regulär sind:

  + $L_a = { c^p | p "ist Primzahl" }$

    *Lösung:*

  + $L_b = { a^i b^j c^k d^ell | i, j, k, ell in NN and (i = k or j = ell) }$

    *Lösung:*
]

#pagebreak()
#exercise[6 Punkte, Knobelaufgabe][
  Zeige oder widerlege, dass die folgenden Sprachen regulär sind. Nutze hierfür die
  Abschlusseigenschaften regulärer Sprachen.

  + $L_a = { a^n b^m | n, m in NN and n != m }$

    *Lösung:*

  + $L_b = { a^n b^m c^k | n, m in NN and n + m = k }$

    *Lösung:*

  + $L_c = { a^n b^m | n, m in NN and n != 41337 and m != 42024 }$

    *Lösung:*

  + $L_d = { a^n b^m | n, m in NN and n <= m }$

    *Lösung:*
]
