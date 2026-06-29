#import "template.typ": *
#import "@preview/cetz:0.5.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 11

#let qed = [#h(1fr) $ square$]
#let lqp = math.attach($<=$, br: "p")

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  number: week,
  name: "Übungsblatt",
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Beweis- und Verständnisaufgabe][
  Zu zeigen:
  $ "IS" lqp "SD"^((1)) quad <=> quad (G, k) in "IS" <=> (G', k) in "SD" quad quad "und" quad quad
  "SD" in "NP" $
  $=>$ \
  Sei $G = (V,E)$ ein Graph mit $k$ vielen unabhängigen Knoten. Es gilt $(G, k) in "IS"$. \
  Wir fügen nun einen weiteren Knoten $v$ zu $G$ hinzu, welcher mit allen Knoten in $G$ benachbart
  ist. Diesen Graphen nennen wir $G'$. Somit hat $G'$ einen Stern $U subset.eq G'$ der Größe $k +
  1$, wobei $v$ mit allen $k$ unabhängigen Knoten verbunden ist. Somit gilt $(G', k) in "SD"$. \
  #v(0.5em)
  $arrow.double.l$ \
  Sei $G' = (V, E)$ ein Graph mit einem Stern $U subset.eq V$ der Größe $k + 1$. Es gilt $G' in
  "SD"$ Entfernen wir den Knoten, welcher mit allen $k$ unabhängigen Knoten verbunden ist, haben wir
  ein Independent Set der Größe $k$. Wir nennen diesen Graphen $G$. Es gilt $(G, k) in "IS"$. \
  #v(0.5em)
  Nun verbleibt zu zeigen, dass die Transformation $f$ des Graphen in Polynomialzeit stattfindet. Da
  wir den neuen Knoten $v$ mit allen bereits bestehenden Knoten verbinden müssen dauert dies $O(n)$.
  Somit haben wir den Graphen $G'$ schon erstellt für $f$ gilt also $f in O(n)$ und somit $f in P$.
  \ \
  Nun muss nur noch $"SD" in "NP"$ gezeigt werden. Sei $y$ ein Zertifikat als Bitstring der Länge
  $n$ wobei jedes Bit kodiert, ob ein Knoten im Stern $U subset.eq V$ ist oder nicht. Ein
  Verifizierer prüft nun für jeden Knoten ob er unabhängig zu allen anderen Knoten bis auf einen ist
  $O(n^2)$ und ob dieser eine überall der selbe ist $O(n)$. Dies geht in Polynomialzeit somit gilt
  $"SD" in "NP"$.\ \
  Damit ist gezeigt, dass SD NP-vollständig ist. #qed

]
$" "^((1))$ SD = STARDISCOVERY

#pagebreak()
#exercise[6 Punkte, Beweisaufgabe][
  Zu zeigen:
  $ "DHC" lqp "TSP" quad <=> quad (G, k) in "DHC" <=> (G', k) in "TSP" quad quad "und" quad quad
  "TSP" in "NP" $
  $=>$ \
  Sei $G = (V, E)$ ein gerichteter Graph mit einem Hamiltonkreis. Wir konstruieren die $n times n$
  Matrix $C$ wie folgt:
  $ C(u, v) = cases(1 & (u, v) in E, infinity quad & "sonst") $
  Wir wählen $k = n$. Ein Hamiltonkreis hat genau $n$ Kanten. Da die Partition $pi$ auch nur $n$
  Knoten besucht und ein Kreis ist, hat sie auch nur eine Gesamtlänge von $n$. Einen Zyklus mit
  Länge $n$ gibt es nur, wenn $n$ Kanten in Summe $<= n$ sind. Wenn wir nur Kanten aus $G$ besuchen
  geht dies genau auf. Daraus folgt $(C, n) in "TSP"$. \ #v(0.5em)
  $arrow.double.l$ \
  Sei $(C, n) in "TSP"$. Es gibt also eine Partition $pi$, welche nur Kanten mit Länge 1 besucht. Da
  die Partition ein Kreis sein muss und alle Knoten genau einmal besucht und Kanten Länge 1 nur
  haben können, wenn sie auch in $G$ vorkommen, hat $G$ einen Hamiltonkreis. Es gilt $G in "DHC"$. \
  #v(0.5em)
  Nun verbleibt zu zeigen, dass die Transformation $f$ in Polynomialzeit stattfindet. Für jeden
  Eintrag $(u, v)$ der $n times n$ Matrix muss geprüft werden ob $(u, v)$ als Kante in $G$ existiert
  $O(1)$. Da dies $n^2$ oft geschieht und $k = n$ in $O(1)$ geschieht, gilt $f in O(n^2)$ und somit
  $f in P$. \ #v(0.5em)
  Nun muss nur noch $"TSP" in "NP"$ gezeigt werden. Sei $y$ ein Zertifikat wobei $y$ die Permutation
  $pi$ als Liste kodiert und somit eine Länge von $O(n log(n))$ hat. Die Liste als Permutation zu
  prüfen geht in $O(n)$. Nun wird $C(pi(n), pi(1)) + sum_(i = 1)^(n - 1) C(pi(i), pi(i + 1) ) <= k$
  in $O(n)$ geprüft. Somit kann man eindeutig das Zertifikat akzeptieren oder ablehnen. Somit gilt
  $f in P$. \
  Damit ist gezeigt, dass TSP NP-vollständig ist. #qed
]

#pagebreak()
#exercise[6 Punkte, Knobelaufgabe][
  + DHC #lqp DHP

    Sei $F$ eine DHC-Instanz mit einem Graphen $G=(V,E)$.

    Wir definieren die Reduktion $f$ wie folgt:

    Wir konstruieren aus $G$ einen neuen Graphen $G'=(V',E')$. Sei $v in V$ beliebig unser gewählter
    Start- und Endpunkt. Wir setzen $V' = V \\ {v} union {v',v'',s,t}$, wobei für alle $(v,u) in E$
    gilt $(v',u) in E'$ und für alle $(u,v) in E$ gilt $(u,v'') in E'$, sowie $(s,v') in E'$ und
    $(v'',t) in E'$.

    "$->$":

    Sei $F$ eine erfüllende DHC-Instanz mit dem Graphen $G=(V,E)$. Es gibt also einen Hamiltonkreis
    $(v_1, v_2, ..., v_n, v_1)$ mit $n in NN$ in $G$.

    $f(F)$ hat nun den Graphen $G'=(V',E')$. O.B.d.A sei $v_1$ der Knoten, der von $f$ aufgespalten
    wurde. Da es sich um einen Hamiltonkreis handelt, spielt es keine Rolle, welcher Knoten gewählt
    wurde. In $G'$ gibt es nun einen Hamiltonpfad $(s,v'_1,v_2,...,v_n,v''_1,t)$. $f(F)$ ist also
    eine erfüllende DHP-Instanz. Da konstant viele Knoten und Kanten hinzugefügt und entfernt
    wurden, ist $f$ eine Polynomialzeitreduktion.

    "$<-$":

    Sei $f(F)$ eine erfüllende DHP-Instanz mit dem Graphen $G'=(V',E')$. Es gibt also einen
    Hamiltonpfad $(s, v'_1, v_2, ..., v_n, v''_1, t)$. Durch die Konstruktion von $f$ gibt es in
    $G'$ genau einen Knoten mit Eingangsgrad 0 und einen Knoten mit Ausgangsgrad 0, wodurch wir $s$
    und $t$ eindeutig finden können.

    Durch die Definition von $f$ enthält $F$ nun einen Hamiltonkreis $(v_1, v_2, ..., v_n, v_1)$,
    $F$ ist also eine erfüllende DHC-Instanz.

    #qed
    #colbreak()

  + DHP #lqp DHC

    Sei $F$ eine DHP-Instanz mit einem Graphen $G=(V,E)$.

    Wir definieren die Reduktion $f$ wie folgt:

    Wir konstruieren aus $G$ einen neuen Graphen $G'=(V union {x},E')$, wobei\
    $E' = E union {(x,v) | v in V} union {(v,x) | v in V}$.

    "$->$":

    Sei $F$ eine erfüllende DHP-Instanz mit dem Graphen $G=(V,E)$. Es gibt also einen Hamiltonpfad
    $(v_1, v_2, ..., v_n)$ mit $n in NN$ in $G$. $f(F)$ mit dem Graphen $G'$ hat nun per Definition
    einen Hamiltonkreis $(x, v_1, v_2, ..., v_n, x)$. $f(F)$ ist also eine erfüllende DHC-Instanz.

    "$<-$":

    Sei $f(F)$ eine erfüllende DHC-Instanz mit dem Graphen $G'=(V',E')$. Es gibt also einen
    Hamiltonkreis $(x, v_1, v_2, ..., v_n, x)$. Damit gilt für $F$ und dessen Graphen $G$, dass
    dieser einen Hamiltonpfad $(v_1, v_2, ..., v_n)$ enthält. $F$ ist also eine erfüllende
    DHP-Instanz.

    #qed
]
