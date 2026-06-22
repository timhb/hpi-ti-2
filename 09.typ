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

  $ S -> epsilon | S_1 $
  $ S_1 -> 0 S_1 0 | 1 S_1 1 | epsilon $
  Das ist ein Palindrom. Jetzt muss das Ende nur umgedreht werden. Wir kommen hier aber nicht weiter. Es wäre super wenn du die Lösung hier einfügen könntest Felix. Vielen Dank!
]

#pagebreak()
#exercise[6 Punkte, Knobelaufgabe][
  Sei für $k in NN$ und $ell in NN$ die Sprache $L_(k, ell)$ definiert als:
  $ L_(k, ell) = { a^n b^m | n >= k, m >= min(n, ell) } $
  Für welche Werte von $k$ und $ell$ ist $L_(k, ell)$ regulär?

  *Lösung:*

  Sei $k >= l$. Dann gilt für $L_(k,l) = {a^n b^m | n >= k, m >= l}$, da $m >= n >= k >= l$. Dies kann man mit einem endlichen Automaten darstellen:

  #diagram(
    node-stroke: 0.5pt,
    let (a, b, c, d, e, f, g, h) = ((0, 1), (1, 1), (2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (9, 1)),

    node(a, $a_0$),
    node(b, $a_1$),
    node(c, $a_2$),
    node(d, $a_k$),

    node(e, $b_1$),
    node(f, $b_2$),
    node(g, $b_l$, extrude: (0,3)),

    edge(a, b, $a$, "->"),
    edge(b, c, $a$, "->"),
    edge(c, (2.5, 1), $a$, "->"),
    node((3, 1), $...$, stroke: 0pt),
    edge((3.5, 1), d, $a$, "->"),
    edge(d, d, bend: 130deg, "->", $a$),

    edge(d, e, $b$, "->"),
    edge(e, f, $b$, "->"),
    edge(f, (6.7, 1), $b$, "->"),
    edge((7.5, 1), g, $b$, "->"),
    node((7, 1), $...$, stroke: 0pt),
    edge(g, g, bend: 130deg, "->", $b$),

    render: (grid, nodes, edges, options) => {
      cetz.canvas({
        import cetz.draw: *

        fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)

        cetz.decorations.flat-brace((1, -0.5), (7.5, -0.5), name: "a", flip: true)
        content("a.content", [$k$-mal], anchor: "north")

        cetz.decorations.flat-brace((8.5, -0.5), (16, -0.5), name: "b", flip: true)
        content("b.content", [$l$-mal], anchor: "north")
      })
    }
  )

Sollte ein Zeichen ohne ausgehende Kante eingelesen werden, so geht der Automat in einen dauerhaft ablehnenden Zustand. \
Sollte jemals $k < l$ gelten, so geht dies auch. Es allgemein zu beschreiben wäre schwer, aber hier ist ersteinmal ein beispielhafter DEA für $k = 2, l = 4$. \ \ 
#diagram(
  node-stroke: 0.5pt,
  {
    let (a0, a1, a2, a3, a4, b1, b2, b3, b4) = ((0, 0), (1, 0), (2, 0), (3, 0), (4, 0), (5, 0), (6, 0), (7, 0), (8, 0))

    node(a0, $a_0$)
    node(a1, $a_1$)
    node(a2, $a_2$)
    node(a3, $a_3$)
    node(a4, $a_4$)
    node(b1, $b_1$)
    node(b2, $b_2$)
    node(b3, $b_3$)
    node(b4, $b_4$, extrude: (0,3))

    edge(a0, a1, $a$, "->")
    edge(a1, a2, $a$, "->")
    edge(a2, a3, $a$, "->")
    edge(a3, a4, $a$, "->")
    edge(a4, a4, bend: 130deg, $a$, "->")
    edge(a4, b1, $b$, "->")
    edge(b1, b2, $b$, "->")
    edge(b2, b3, $b$, "->")
    edge(b3, b4, $b$, "->")
    edge(b4, b4, bend: 130deg, "->", $b$)

    edge(a2, b2, bend: -30deg, $b$, "->")
    edge(a3, b1, bend: -30deg, $b$, "->")
  }
)

Ist $n < l$, so muss es mindestens $n$-viele $b$'s geben. Da $k <= n < l$ endlich ist, gibt es genau endlich viele solcher Zustände und wir können für jeden solcher Zustand in endlich vielen Schritten die Mindestanzahl $b$'s annehmen. \
Ist $n >= l$, so interessiert uns die Anzahl $a$'s nicht mehr, wir brauchen durch $m >= min(n, l)$ mindestens $l$ viele $b$'s was wiederum endlich ist \ \
Da die Fälle $k < l$ und $k >= l$ alle möglichen Kombinationen abdecken, sind alle $k, l$ möglich. #qed
]
