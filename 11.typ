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
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Beweis- und Verständnisaufgabe][
  Zu zeigen:
  $ "IS" lqp "SD"^((1)) quad <=> quad (G, k) in "IS" <=> (G', k) in "SD" quad quad "und" quad quad "SD" in "NP" $
  $=>$ \
  Sei $G = (V,E)$ ein Graph mit $k$ vielen unabhängigen Knoten. Es gilt $(G, k) in "IS"$. \
  Wir fügen nun einen weiteren Knoten $v$ zu $G$ hinzu, welcher mit allen Knoten in $G$ benachbart ist. Diesen Graphen nennen wir $G'$. Somit hat $G'$ einen Stern $U subset.eq G'$ der Größe $k + 1$, wobei $v$ mit allen $k$ unabhängigen Knoten verbunden ist. Somit gilt $(G', k) in "SD"$. \ #v(0.5em)
  $arrow.double.l$ \
  Sei $G' = (V, E)$ ein Graph mit einem Stern $U subset.eq V$ der Größe $k + 1$. Es gilt $G' in "SD"$ Entfernen wir den Knoten, welcher mit allen $k$ unabhängigen Knoten verbunden ist, haben wir ein Independent Set der Größe $k$. Wir nennen diesen Graphen $G$. Es gilt $(G, k) in "IS"$. \ #v(0.5em)
  Nun verbleibt zu zeigen, dass die Transformation $f$ des Graphen in Polynomialzeit stattfindet. Da wir den neuen Knoten $v$ mit allen bereits bestehenden Knoten verbinden müssen dauert dies $O(n)$. Somit haben wir den Graphen $G'$ schon erstellt für $f$ gilt also $f in O(n)$ und somit $f in P$. \ \
  Nun muss nur noch $"SD" in "NP"$ gezeigt werden. Sei $y$ ein Zertifikat als Bitstring der Länge $n$ wobei jedes Bit kodiert, ob ein Knoten im Stern $U subset.eq V$ ist oder nicht. Ein Verifizierer prüft nun für jeden Knoten ob er unabhängig zu allen anderen Knoten bis auf einen ist $O(n^2)$ und ob dieser eine überall der selbe ist $O(n)$. Dies geht in Polynomialzeit somit gilt $"SD" in "NP"$.\ \
  Damit ist gezeigt, dass SD NP-vollständig ist. #qed

]
$" "^((1))$ SD = STARDISCOVERY

#pagebreak()
#exercise[6 Punkte, Beweisaufgabe][
  Zu zeigen:
  $ "DHC" lqp "TSP" quad <=> quad (G, k) in "DHC" <=> (G', k) in "TSP" quad quad "und" quad quad "TSP" in "NP" $
  $=>$ \
  Sei $G = (V, E)$ ein gerichteter Graph mit einem Hamiltonkreis. Wir konstruieren die $n times n$ Matrix $C$ wie folgt:
  $ C(u, v) = cases(1 & (u, v) in E, infinity quad & "sonst") $
  Wir wählen $k = n$. Ein Hamiltonkreis hat genau $n$ Kanten. Da die Partition $pi$ auch nur $n$ Knoten besucht und ein Kreis ist, hat sie auch nur eine Gesamtlänge von $n$. Einen Zyklus mit Länge $n$ gibt es nur, wenn $n$ Kanten in Summe $<= n$ sind. Wenn wir nur Kanten aus $G$ besuchen geht dies genau auf. Daraus folgt $(C, n) in "TSP"$. \ #v(0.5em)
  $arrow.double.l$ \
  Sei $(C, n) in "TSP"$. Es gibt also eine Partition $pi$, welche nur Kanten mit Länge 1 besucht. Da die Partition ein Kreis sein muss und alle Knoten genau einmal besucht und Kanten Länge 1 nur haben können, wenn sie auch in $G$ vorkommen, hat $G$ einen Hamiltonkreis. Es gilt $G in "DHC"$. \ #v(0.5em)
  Nun verbleibt zu zeigen, dass die Transformation $f$ in Polynomialzeit stattfindet. Für jeden Eintrag $(u, v)$ der $n times n$ Matrix muss geprüft werden ob $(u, v)$ als Kante in $G$ existiert $O(1)$. Da dies $n^2$ oft geschieht und $k = n$ in $O(1)$ geschieht, gilt $f in O(n^2)$ und somit $f in P$. \ #v(0.5em)
  Nun muss nur noch $"TSP" in "NP"$ gezeigt werden. Sei $y$ ein Zertifikat wobei $y$ die Permutation $pi$ als Liste kodiert und somit eine Länge von $O(n log(n))$ hat. Die Liste als Permutation zu prüfen geht in $O(n)$. Nun wird $C(pi(n), pi(1)) + sum_(i = 1)^(n - 1) C(pi(i), pi(i + 1) ) <= k$ in $O(n)$ geprüft. Somit kann man eindeutig das Zertifikat akzeptieren oder ablehnen. Somit gilt $f in P$. \
  Damit ist gezeigt, dass TSP NP-vollständig ist. #qed
]

#pagebreak()
#exercise[ Punkte, ][]

#pagebreak()