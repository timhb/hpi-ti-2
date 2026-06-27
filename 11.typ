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
  $ "IS" lqp "SD"^((1)) quad <=> quad G in "IS" <=> G' in "SD" $
  $=>$ \
  Sei $G = (V,E)$ ein Graph mit $k$ vielen unabhängigen Knoten. Es gilt $(G, k) in "IS"$. \
  Wir fügen nun einen weiteren Knoten $v$ zu $G$ hinzu, welcher mit allen Knoten in $G$ benachbart ist. Diesen Graphen nennen wir $G'$. Somit hat $G'$ einen Stern $U subset.eq G'$ der Größe $k + 1$, wobei $v$ mit allen $k$ unabhängigen Knoten verbunden ist. Somit gilt $(G', k) in "SD"$. \ #v(0.5em)
  $arrow.double.l$ \
  Sei $G' = (V, E)$ ein Graph mit einem Stern $U subset.eq V$ der Größe $k + 1$. Es gilt $G' in "SD"$ Entfernen wir den Knoten, welcher mit allen $k$ unabhängigen Knoten verbunden ist, haben wir ein Independent Set der Größe $k$. Wir nennen diesen Graphen $G$. Es gilt $G in "IS"$. \ #v(0.5em)
  Nun verbleibt zu zeigen, dass die Transformation $f$ des Graphen in Polynomialzeit stattfindet. Da wir den neuen Knoten $v$ mit allen bereits bestehenden Knoten verbinden müssen dauert dies $O(n)$. Somit haben wir den Graphen $G'$ schon erstellt für $f$ gilt also $f in O(n)$ und somit $f in P$. \ \
  Damit ist $"IS" lqp "SD"$ gezeigt. #qed

]
$" "^((1))$ SD = STARDISCOVERY

#pagebreak()
#exercise[ Punkte, ][]

#pagebreak()
#exercise[ Punkte, ][]

#pagebreak()