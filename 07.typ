#import "template.typ": *

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 7

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  name: "Übungsblatt",
  number: week,
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Verständnisaufgabe][
  + "$==>$": Wir zeigen $L "hat einen endlichen Index" -> overline(L) "hat einen endlichen Index"$.
    \
    Angenommen $L$ hat einen endlichen Index. So gilt nach Myhill-Nerode $L in R E G$. Nach den
    Abschlusseigenschaften der regulären Sprachen gilt auch $Sigma^* \\ L = overline(L) in R E G$
    womit $overline(L)$ nach Myhill-Nerode einen endlichen Index hat.
  
    "$<==$": Wir zeigen $overline(L) "hat einen endlichen Index" -> L "hat einen endlichen Index"$.
    \
    Angenommen $overline(L)$ hat einen endlichen Index. So gilt nach Myhill-Nerode $overline(L) in R
    E G$. Nach den Abschlusseigenschaften der regulären Sprachen gilt auch $ overline(overline(L)) =
    L in R E G$ womit $L$ nach Myhill-Nerode einen endlichen Index hat.
  
    Somit ist $L "hat einen endlichen Index" <=> overline(L) "hat einen endlichen Index"$ gezeigt.
    #qed
  
  + Sei $L = Sigma^*$ mit $Sigma = {0, 1}$ und $L' = {0} subset.eq L$. \
    $L$ hat einen Index $i$ von 1, da alle Wörter $w in Sigma^*$ in $L$ liegen, also alle in der
    selben Äquivalenzklasse. $L'$ hat mindestens einen Index $i'$ von 2, $[0]_L'$ und $[epsilon]_L'$
    _(auf $epsilon$ kann noch eine 0 folgen, auf $0$ nicht mehr, ohne dass das Wort nicht mehr in
    $L'$ liegt)_. Somit gilt $i' >= 2 > 1 = i$. Dies ist ein Widerspruch zu $i' <= i$, die Aussage
    ist also falsch. #qed
  
  + Wir nehmen an, $A_N$ ist nicht der minimale DEA für die Sprache $L$. \
    Sei $L = {0}$. So ist $A_N$ wie folgt aufgebaut: \
    #diagram(
      node-stroke: 0.5pt,
      {
        let (a, b, c, d) = ((0, 1), (1, 0.5), (1, 1.5), (2, 1))
        node(a, $q_0$)
        node(b, $q_1$, extrude: (0,3))
        node(c, $q_2$, extrude: (0,3))
        node(d, $q_3$)
  
        edge(a,b, "->", $0$, label-sep: 1pt)
        edge(a,c, "->", $0$, label-side: right, label-sep: 1pt)
        edge(a,d, "->", $1$, label-sep: -1pt)
        edge(b,d, "->", ${0,1}$, label-sep: 1pt)
        edge(c,d, "->", ${0,1}$, label-side: right, label-sep: 1pt)
        edge(d,d, "->", loop-angle: 180deg, bend: -130deg, ${0,1}$, label-sep: 0pt)
      }
    )\ 
    $A_N$ akzeptiert nur das Eingabewort $0 in Sigma^*$. Bei allen weiteren Eingaben verfällt $A_N$
    in $q_3$, von wo aus es keinen Weg mehr in einen akzeptierenden Zustand gibt. \
    Sei $A_D$ ein DEA welcher $L = {0}$ akzeptiert. $A_D$ ist wie folgt aufgebaut: \
    #diagram(
      node-stroke: 0.5pt,
      {
        let (a, b, c) = ((0,0), (1,0), (2,0))
        node(a, $q_0$)
        node(b, $q_1$, extrude: (0,3))
        node(c, $q_2$)
  
        edge(a,b, "->", $0$, label-sep: 0pt)
        edge(a,c, "->", bend: 50deg, $1$)
        edge(b,c, "->", ${0,1}$, label-sep: 0pt)
        edge(c,c, "->", loop-angle: 180deg, bend: -130deg, ${0,1}$, label-sep: 0pt)
      }
    ) \
    Auch $A_D$ akzeptiert nur das Wort $0$, und fällt bei sonstigen Eingaben sofort in den Zustand
    $q_2$ von wo aus es keinen Weg mehr in einen akzeptierenden Zustand in $A_D$ gibt. \
    Sei $Q_N$ die Zustände in $A_N$ und $Q_D$ die Zustände in $A_D$. So gilt $|Q_N| > |Q_D|$. Dies
    ist ein Widerspruch zu $2^(|Q_N|) >= |Q_D| >= |Q_N|$. Die Aussage ist widerlegt. #qed
]

#pagebreak()

#exercise[6 Punkte, Verständnis-/Beweisaufgabe][
  #let eqA = $scripts(equiv)_A$
  #let eqB = $scripts(equiv)_B$

  + Seien ${[0]_A, [1]_A, [2]_A, [3]_A, [4]_A, [5]_A, [6]_A}$ alle Äquivalenzklasse unter
    Myhill-Nerode von $A$. Für jedes $i in {0, .. 6}$ gilt $[i]_A = {w in Sigma^* | |w| mod 7 = i}$.
    \
    Seien $u, v in Sigma^*$ wobei gilt $|u| scripts(equiv)_7 |v|$. Somit gilt $u eqA v$. Hängen wir
    nun ein Wort $w in Sigma^*$ an $u,v$ so gilt $|u w| = |u| + |w| scripts(equiv)_7 |v| + |w| = |v
    w|$. $u$ und $v$ sind also immer noch in der gleichen Äquivalenzklasse. Nur wenn $|v| mod 7 = 0$
    gilt, hat das Wort ein vielfache Länge von 7, und wird nur dann angenommen. Somit ist gezeigt,
    dass ${[0]_A, [1]_A, [2]_A, [3]_A, [4]_A, [5]_A, [6]_A}$ Äquivalenzklassen zu $A$ sind. \
    Da jede Modulooperation die natürlichen Zahlen in disjunkte Teilmengen teilt und $|w|_1 in NN$
    gilt, gehört jedes Wort $w$ zu mindestens einer Äquivalenzklasse. \
    Da Modulooperationen Funktionen sind, sind sie auch rechtseindeutig. Da für ein Wort $w$ die
    Anzahl der vorkommenden 1en $|w|_1$ auch eindeutig ist, kann jedes Wort auch immer nur maximal
    einer Äquivalenzklasse zugeordnet werden. \
    Außerdem sind die Äquivalenzklassen nicht leer: $epsilon in [0]_1$, $1 in [1]_1$ ... . \
    Die Äquivalenzklassen sind also minimal. #qed
  
  + Angenommen es gäbe zwei Wörter $u,v in Sigma^*$ mit $u = 0^j 1$ und $v = 0^k 1$ mit o.B.d.A $j <
    k$ für die gilt $u eqB v$. \
    Dies ist ein Widerspruch, da für $w = 0^j$, $u w in L$ und $v w in.not L$ gilt. Da $j, k$
    beliebig sein können gilt dies für alle $j < k$, also für unendlich viele Wörter, was wiederum
    zu unendlich vielen Äquivalenzklassen führt. #qed
]

#pagebreak()
#exercise[6 Punkte, Knobelaufgabe][
  Sei $L$ eine reguläre Sprache. Zeige folgende Aussagen:
  
  + $L^R = {w^R | w in L}$ ist regulär. \
    Dabei ist $w^R$ die Spiegelung des Wortes $w$, d.h. für $w in Sigma^*, w_1, ..., w_(|w|) in
    Sigma$ mit $w = w_1 w_2 ... w_(|w|)$ ist $w^R$ definiert als $w^R := w_(|w|) w_(|w|-1) ... w_1$.
  
    *Lösung:*
  
    Da $L$ eine reguläre Sprache ist, gibt es einen DEA $M=(Q,Sigma,delta,q_0,F)$, für den gilt
    $L(M)=L$.
  
    Setze $delta^(-1): Q times Sigma -> cal(P)(Q)$ so, dass für alle $q_i,q_j in Q$ und alle $a in
    Sigma$ gilt: $q_j in delta^(-1)(q_i,a) <-> delta(q_j,a) = q_i$.
  
    Wir konstruieren den NEA $M^R = (Q, Sigma, delta^(-1), F, {q_0})$ und wollen zeigen, dass
    $L(M^R)=L^R$.
  
    Wir zeigen zunächst $L(M^R) subset.eq L^R$:
  
    Sei $w in L(M^R)$ mit Länge $n in NN$ und $w= w_1 w_2 ... w_n$. Da $w$ von $M^R$ akzeptiert
    wird, gibt es eine Berechnung $M^R (w)= (r_0, r_1, ..., r_n) in Q^(n+1)$, sodass:
  
    - $r_0 in F$, also Teil der Startzustände von $M^R$ (entspricht akzeptierenden Zuständen von
      $M$)
    - $forall i in [n]: r_i in delta^(-1)(r_(i-1),w_i)$
    - demnach $r_n = q_0$.
  
    Per Definition von $delta^(-1)$ gilt also für alle $i in [n]$, dass $delta(r_i, w_i)=r_(i-1)$.
    Außerdem ist gegeben, dass $w^R = w_n w_(n-1) ... w_1$, also gilt für alle $i in [n]: w^R_i =
    w_(n-i+1)$.
  
    Wir definieren nun für alle $i in {0,1,...,n}: s_i = r_(n-i)$. Nun gilt:
  
    - $s_0 = r_n = q_0$
    - $forall i in [n]: s_i = r_(n-i) = delta(r_(n-i+1), w_(n-i+1)) = delta(r_(n-(i-1)), w^R_i) =
      delta(s_(i-1),w^R_i)$
    - $s_n = r_0 in F$.
  
    $(s_0, s_1, ..., s_n)$ ist per Definition eine akzeptierende Berechnung von $M$ auf $w^R$. Es
    gilt also $w^R in L(M)=L$ und damit $(w^R)^R = w in L^R$.
  
    Es verbleibt zu zeigen, dass $L^R subset.eq L(M^R)$:
  
    Sei $w in L^R$, also $w^R in L=L(M)$. Da $w^R$ von $M$ akzeptiert wird, gibt es eine Berechnung
    $M(w^R) = (r_0,r_1,...,r_n) in Q^(n+1)$, sodass:
  
    - $r_0 = q_0$
    - $forall i in [n]: r_i = delta(r_(i-1),w^R_i)$
    - $r_n in F$.
  
    Per Definition von $delta^(-1)$ gilt also für alle $i in [n]$, dass $r_(i-1) in delta^(-1)(r_i,
    w^R_i)$.
  
    Wir definieren nun für alle $i in {0,1,...,n}: s_i = r_(n-i)$. Es gilt:
  
    - $s_0 = r_n in F$
    - $forall i in [n]: s_i = r_(n-i) in delta^(-1)(r_(n-i+1), w^R_(n-i+1)) =
      delta^(-1)(r_(n-(i-1)), w_i) = delta^(-1)(s_(i-1), w_i)$
    - $s_n = r_0 in {q_0}$.
  
    $(s_0, s_1, ..., s_n)$ ist per Definition eine akzeptierende Berechnung von $M^R$ auf $w$. Also
    $w in L(M^R)$.
  
    Da $L(M^R) subset.eq L^R$ und $L^R subset.eq L(M^R)$, gilt $L(M^R) = L^R$. Somit ist $L^R$
    regulär. #qed
  
    #colbreak()
  
  + $min(L) = {w in L | "kein echtes Präfix von" w "ist in" L}$ ist regulär.
  
    *Lösung:*
  
    Sei $w in L$. Ein echter Präfix von $w$ ist genau dann in $L$, wenn es $u in L$ und $x in
    Sigma^+$ gibt, sodass $w = u x$. Es gilt also $min(L) = L \\ (L compose Sigma^+)$.
  
    Dabei ist $L$ als regulär gegeben und $Sigma^+$ ist regulär, da dieser DEA $Sigma^+$ akzeptiert:
  
    #diagram(
      node-stroke: 0.5pt,
      {
        let (a, b) = ((0,0), (1,0))
        node(a, $q_0$)
        node(b, $q_1$, extrude: (0,3))
  
        edge(a,b, "->", $Sigma$, label-sep: 0pt)
        edge(b,b, "->", loop-angle: 180deg, bend: -130deg, $Sigma$, label-sep: 0pt)
      }
    )
  
    Da reguläre Sprachen unter Konkatenation und Mengendifferenz abgeschlossen sind, ist $min(L)$
    also regulär.
]
