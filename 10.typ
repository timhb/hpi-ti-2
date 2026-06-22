#import "template.typ": *
#import "@preview/cetz:0.5.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 10

#let qed = [#h(1fr) $ square$]

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  number: week,
  course: "Theoretische Informatik II",
)

#let lqp = math.attach($<=$, br: "p")
#exercise[2 Punkte, Beweisaufgabe][

  Beweise, dass $lqp$ eine Quasiordnung ist. \ \
  *Reflexivität*: Sei $f$ die Identitätsfunktion. Diese ist durch eine deterministische polynomialzeitbeschränkte Turingmaschine berechenbar. Es gilt nun offensichtlich für eine beliebige Sprache $L subset.eq Sigma^*$ 
  $ x in L <=> f(x) in L $
  Somit gilt $L lqp L$. Da $L$ beliebig ist, gilt dies für alle Sprachen, somit ist $lqp$ reflexiv. \ 
  #v(0.5em)
  *Transitivität*: Sei $A, B, C subset.eq Sigma^*$ mit $A lqp B, B lqp C$. Es gibt nun ein $f$ und $f'$, welche jeweils durch deterministische polynomialzeitbeschränkte Turingmaschinen berechenbar sind mit
  $ x in A <=> f(x) in B " und " x in B <=> f'(x) in C $
  Da der Output von $f$ als Input für $f'$ genommen werden kann und beide Funktionen polynomialzeitbeschränkt sind, ist auch $f circle.small f'$ durch eine deterministische polynomialzeitbeschränkte Turingmaschine berechenbar. Somit gilt für $f'' = f circle.small f'$
  $ x in A <=> f''(x) in C $
  Da $A, B, C$ beliebig sein dürfen, ist $lqp$ transitiv. \ 
  #v(0.7em)
  Da $lqp$ sowohl reflexiv als auch transitiv ist, handelt es sich um eine Quasiordnung. #qed
]


#pagebreak()
#exercise[8 Punkte, Knobelaufgabe][

  + Sei $G_1 = (V_1, E_1), G_2 = (V_2, E_2), G_3 = (V_3, E_3)$. \ 
    Es gilt $G_1 ~ G_2$. Sei $f: V_1 -> V_2$, dann ist $f$ wie folgt definiert
    $ f(1) = "I" $
    $ f(2) = "IV" $
    $ f(3) = "V" $
    $ f(4) = "VI" $
    $ f(5) = "III" $
    $ f(6) = "II" $
    Es gilt $G_2 tilde.not G_3$, da $G_2$ eine und $G_3$ zwei Zusammenhangskomponenten hat. Somit kann es kein valides $f$ geben. \
    Da $f$ eine Funktion ist, ist sie transitiv. Da $f$ zusätzlich biijektiv ist, ist es auch umkehrbar. Somit ist $~$ transitiv und symmetrisch, womit sich $G_1 tilde.not G_3, G_2 ~ G_1, G_3 tilde.not G_1, G_3 tilde.not G_2$ ergeben.
  
  + Der Algorithmus enthält als Eingabe zwei Graphen $G = (V_G, E_G), H = (V_H, E_H)$ mit $n = |V_G|$. Er entscheidet nichtdeterministisch ob ein Knoten $v in V_G$ Teil des Teilgraphen von $G$ sein soll oder nicht. Auf diesen Teilgraphen probiert er dann nichtdeterministisch alle möglichen Kombinationen für $f$ aus und prüft ob diese ein valider Isomorphismus für $G$ und $H$ ist. \
    Das Generieren der Teilgraphen benötigt $n$ nichtdeterministisch binäre Entscheidungen und erfolgt somit in linearer Zeit. Für jeden Teilgraphen werden zusätzlich maximal $n$ nichtdeterministische Entscheidungen für $f$ getroffen, erfolgt somit auch in linearer Zeit. Die Isomorphismusbedingung kann man in $O(n^2)$ mittel Adjazenzmatrix überprüfen. Demnach läuft der Algorithmus in $O(n + n + n^2) = O(n^2)$, also in Polynomialzeit. \
    Sofern es einen zu $H$ isomorphen induzierten Teilgraphen $G'$ gibt, wird dieser in einem der Ausführungpfade genutzt und ein passendes $f$ ausprobiert und akzeptiert. Wird ein Ausführungspfad akzeptiert, so handelt es sich um einen validen Teilgraphen mit einer passenden bijektiven Funktion, also einem isomorphen induzierten Teilgraphen zu $H$. Somit ist der Algorithmus korrekt und es gilt $"SGI" in "NP"$. #qed

  + Der Verifizierer erhält als Eingabe zwei Graphen $G = (V_G, E_G), H = (V_H, E_H)$, sowie ein Zertifikat $y$, welches den induzierten Teilgraphen $G' subset.eq G$ und eine Bijektion $f: V_G' -> V_H$ kodiert. \
    Zunächst prüft der Verifizierer ob $f$ tatsächlich bijektiv ist. Anschließend überprüft er die Isomorphismusbedingung 
    $ {u, v} in E_G' <=> {f(u), f(v)} in E_H $
    Dies geht in $O(n^2)$. Auch die Prüfung der Bijektion geht in Polynomialzeit. \
    Das Zertifikat wird genau dann akzeptiert, wenn $G'$ zu $H$ isomorph ist. Somit gilt $"SGI" in "NP"$. #qed

  + Zu zeigen ist $"IS" lqp "SGI"$. \ #v(0.5em)
    Reduktion $f$: Sei der Graph $G = (V, E)$ der Input für $f$. Wir berechnen nun ob $G$ einen induzierten Teilgraphen $U subset.eq G$ zu $H = ({v_1, v_2 ... v_k}, emptyset)$ besitzt. \ #v(0.3em)
    "$arrow.r.double$": Sei $G = (V, E) in "IS"_k$. Dann gilt für $G$, dass es eine Teilmenge $U subset.eq V$ mit $|U| >= k$ gibt, sodass für jede zwei Knoten $u, v in V$ gilt ${u, v} in.not E$. Es ist nun schnell ersichtlich, dass es dann auch einen Isomorphismus $f$ von $U$ nach $H$ geben muss, da wir einfach diese $k$ Knoten als Teilgraphen wählen können, zwischen denen keine Kanten bestehen, und die Bedingung 
    $ forall u,v in V_U : {u,v} in E_U <=> {f(u), f(v)} in E_H $
    somit immer für alle bijektiven $f$ erfüllt ist. Somit gilt $G in "IS" => f(G) in "SGI"$\ #v(0.3em)
    "$arrow.l.double$": Sei $G$ ein Graph zu welchem es einen induzierten Teilgraphen $U subset.eq G$ von $H = ({v_1, ... v_n}, emptyset)$ gibt. Da $f$ bijektiv ist muss es in $G$ auch mindestens $k$ verschiedene Knoten geben, zwischen welchen paarweise auch keine Kante besteht. Somit gilt $f(G) in "SGI" => G in "IS"$. \ #v(0.3em)
    Damit gilt $G in "IS" <=> f(G) in "SGI"$. Da $f$ in Polynomialzeit berechenbar ist gilt $"IS" lqp "SGI"$. Somit ist SGI NP-schwer. #qed
]

#pagebreak()
#exercise[ Punkte, ][]

#pagebreak()