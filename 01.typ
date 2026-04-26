#import "template.typ": *
#import "@preview/cetz:0.4.2": *

#set enum(numbering: "a)")
#set text(lang: "de", font: "CMU Serif")
#let week = 1

#show: template.with(
  names: [Simon Bachran, Tim Beier],
  week: week,
  course: "Theoretische Informatik II"
)

#exercise[*4 Punkte, Verständnisaufabe*][]
+ Sei $G = (V, E)$ ein ungerichteter Graph mit beliebiger Anzahl Knoten und Kanten. Jede Kante $e in E$ hat genau zwei Endpunkte trägt daher auch nur genau zweimal zu der Summe der Knotengrade bei. Daher gilt $sum_(v in V) deg(v) = 2 dot |E|$. #h(1fr) $square$

+ Wir zeigen dies nachfolgend über Induktion. \
  Sei $G = (V, E)$ ein ungerichteter Graph mit $|V| = 1$ und $|E| = 0$. Es gilt, dass $G$ zusammenhängend und kreisfrei ist, nach der Definition ist $G$ also ein Baum. Wie zu beweisen gilt $|E| = n - 1$. \
  Für alle Bäume soll nun gelten $|E| = n - 1$. \
  Sei $G = (V, E)$ ein Baum und wir fügen $G$ einen Knoten $v'$ hinzu, $G' = G union {v'}$ mit $n' = n + 1$. Nun ist $G' = (V', E')$ kein Baum mehr, da der Graph nicht mehr zusammenhängend ist, da $v'$ über keine Kante $e in E'$ mit einem Knoten $v in V$ verbunden ist. Wir müssen also eine Kante zwischen einem Knoten $v in V$ und $v'$ ziehen, damit der Graph wieder zusammenhängend ist. Jeder Knoten in $G'$ ist also nun mit jedem anderen Knoten verbunden. Würden wir nun eine weitere Kante zwischen zwei Knoten $a, b in V'$ ziehen für die gilt, dass diese keine Nachbarn sind, so gäbe es nun einen Kreis, nämlich $({a, v_1}, ..., {v_k, b}, {b, a})$. Somit wäre $G'$ kein Baum mehr, es gilt also nun $|E| = n' - 1 = (n + 1) - 1 $. \
  Somit ist bewiesen, dass für alle Bäume mit $n >= 1$ Knoten $|E| = n - 1$ gilt. #h(1fr) $square$

#pagebreak()
#exercise[5 Punkte, Knobelaufgabe][]
Sei $G = (V, E)$ ein beliebiger ungerichteter Graph. Zu Beginn allozieren wir ein festes Array der Größe $n$ und initialisieren es mit 0. \
Wir beginnen beim ersten Knoten $v_1 in V$ und tragen eine 1 in die Stelle 1 des Arrays (wir haben bei 1 indiziert). Dann legen wir alle Nachbarn von $v_1$ die an ihrer Stelle im Array eine 0 haben auf einen Stack (DFS) und schreiben an ihrer Stelle eine 2. Wir popen den nächsten Knoten aus dem Stack und überprüfen, ob alle Nachbarn entweder eine 0 sind (dann packen wir sie auf den Stack und setzen im Array die Stelle auf jeweils 1 wenn der gerade untersuchte Knoten eine 2 ist, und auf 2 wenn dieser eine 1 ist) oder die jeweils andere Zahl (1 bei 2, 2 bei 1) sind. Trifft dies bei einem Nachbarn nicht zu, so wissen wir, dass dass der Graph nicht zwei-färbbar ist, da ein Knoten weder 1 noch 2 sein kann, damit keiner seiner Nachbarn dieselbe Farbe wie er selbst hat. Damit ist der Graph nicht zwei-färbbar und somit auch nicht bipartit. Ist der Stack leer, haben wir also alle Knoten besucht und konnten jedem eine valide Farbe zuordnen, der Graph ist also zwei-färbbar und somit bipartit. \
Wir allozieren und initialisieren zu Beginn ein Array der Größe $n$. Für jeden Knoten schauen wir uns alle Nachbarn an, also alle Kanten genau zweimal $O(m)$. Da wir ein festes Array haben ist lesen und schreiben $O(1)$. Somit beträgt die Gesamtlaufzeit $O(n + m)$. #h(1fr) $square)$

#pagebreak()
#exercise[7 Punkte, Knobelaufgabe][]
+ Angenommen es gebe zwei Knoten $v, w$ in einem Turniergraphen $G = (V, E)$ für die gilt, dass sie keine ausgehenden Kanten haben. Da allerdings jeder Knoten mit jedem über eine gerichtete Kante verbunden sein muss, muss es auch eine Kante $(v, w)$ oder $(w, v)$ in $E$ geben. Einer von beiden Knoten hätte dann auf jeden Fall eine ausgehende Kante, es kann also immer nur maximal einen solchen Knoten geben. #h(1fr) $square$

+ Sei $G = (V, E)$ ein Turniergraph. Wir gehen die Adjazenzliste knotenweise durch und schauen, ob es für diesen Knoten einen Knoten in der Adjazenzliste gibt. Gibt es keinen, dann wissen wir, dass die Mannschaft (Knoten) gegen keine andere Mannschaft verloren hat. Da es keinen Gleichstand gibt und sie gegen alle gespielt hat, hat sie also gegen alle gewonnen und ist somit absoluter Gewinner. Gibt es diese Mannschaft nicht, so gehen wir die ganze Liste einmal durch ohne einen solchen Knoten gefunden zu haben. \
  Wir gehen alle Knoten genau einmal durch $O(n)$, wobei wir für jeden Knoten schauen ob dessen Liste leer ist $O(1)$. Somit beträgt die Laufzeit insgesamt $O(n)$. #h(1fr) $square$

+ Sei $G = (V, E)$ ein Turniergraph. Wir gehen die Adjazenzmatrix in der ersten Zeile von links nach rechts durch. Wenn wir auf eine 0 stoßen, dann wissen wir, dass es keine gerichtete Kante von dem untersuchenden Knoten zu den aktuellen Knoten gibt, die derzeit untersuchende Mannschaft hat also gegen die andere gewonnen, wir können die Zeile weitergehen und sicher sein, dass die andere Mannschaft kein absoluter Gewinner sein kann. Stoßen wir auf Knoten mit einer 1, wissen wir, dass wir von dem aktuell untersuchenden Knoten zu diesem kommen können, die aktuelle Mannschaft hat also gegen diese verloren, wir schauen uns fortan nichtmehr die Zeile des zu untersuchenden Knotens, sondern die des aktuellen an. Wir können sicher sein, dass der vorher zu untersuchende Knoten kein absoluter Gewinner ist, da es eine Kannte von ihm aus, zu einem anderen Knoten gibt, die Mannschaft also einmal verloren hat. In der neuen Zeile müssen wir nun nicht mehr die vorher schon untersuchten Knoten anschauen, da wir diese schon sicher ausschließen können. Wir machen also in der neuen Zeile in der Spalte weiter, bei welcher wir in der letzten auch weitergemacht hätten. \
  Kommen wir so an das Ende einer Zeile, gehen wir diese erneut komplett durch und schauen, ob sie nur 0 enthält, also ob es sich um eine Senke handelt und die Mannschaft immer gewonnen hat. Ist das der Fall handelt es sich um den aktuellen Gewinner, ansonsten gibt es keinen. \
  Wir gehen jede Spalte nur einmal durch und schauen uns diese auch nur genau einmal in genau einer Zeile an $O(n)$. Zugriff in einer Matrix dauert $O(1)$ und das finale Durchsuchen der letzten Liste dauert auch nur $O(n)$. Die Gesamtlaufzeit beträgt also auch $O(n)$. #h(1fr) $square$