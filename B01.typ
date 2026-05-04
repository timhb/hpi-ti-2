#import "template.typ": *
#import "@preview/cetz:0.4.2": *

#set enum(numbering: "a)")
#set text(lang: "de")
#let week = 2

#show: template.with(
  names: [Tim Beier, Simon Bachran, Sven Luca Hafemann],
  week: week,
  course: "Theoretische Informatik I"
)

Wir zeigen zunächst die Aussage:\
*"$<==$"*\ Angenommen, es existiert ein Eulerkreis in G. Sei $(v_1, v_2, ..., v_k)$ ein solcher Eulerkreis (Der Einfachheit halber definieren wir $v_(k+1)=v_1$ und $v_0 = v_k$), wobei $(v_i, v_(i+1)) in E$ für alle i = 1, 2, ..., k. \
Da ein Eulerpfad jede Kante genau einmal abläuft, muss gelten:
${(v_i, v_(i+1)) | i = 1, 2, ..., k} = E$.\
Insbesonder gilt für einen beliebigen Knoten $v in V$, mit Vorkommen $n_1, n_2, ..., n_l$ für ein $l in NN$,  dass die Menge der Kanten, die von $v$ ausgehen, genau die Menge der Kanten $K:= {(v_(n_i), v_(n_i+1)| i = 1, 2, ..., l}$ ist. \
Analog folgt die Menge der in $v$ eingehenden Kanten $K':= {(v_(n_i-1), v_(n_i)| i = 1, 2, ..., l}$.\
Damit gilt:
$ deg_-(v) = |K| = l = |K'| = deg_+ (v) $
Da $v$ beliebig gewählt war, gilt die Behauptung für alle Knoten $v in V$.\
\
*"$==>$"*\ Bevor wir diese Richtung zeigen, wollen wir zuerst einige Hilfslemmata aufstellen, die sich im Verlauf als nützlich erweisen werden. \

* Definition: Flusskonsistenz *
Einen gerichteten Graphen $G = (V, E)$ nennen wir im folgenden Flusskonsistent, wenn gilt: \
$deg_-(v) = deg_+(v)$ für alle $v in V$\
(Der Name Flusskonsistenz ergibt sich aus der Eigenschaft, dass jeder Fluss (Grad) der in einen Knoten strömt auch wieder aus ihm hinausströmen kann.)

* Lemma 1:*\
Ein gerichteter flusskonsistenter Graphen $G = (V, E)$ mit min. einer gerichteten Kante $(v, w) in E$ hat einen Zyklus, der $v$ enthällt.

_Beweis:_\
Angenommen es gibt keinen Zyklus in $G$, der $v$ enthält.\
Wir konstruieren nun eine Folge von Knoten $(v_0, v_1, ...)$ und Kanten $(e_1, e_2, ...)$ induktiv wie folgt:\
$ v_0 = v, v_1 =w $
$ e_1 = (v, w) $
$ v_(i+1) in {v^* in V | (v_i, v^*) in E without (union.big_{j= 1}^(i){e_j}) } $ 
$ e_(i+1) = (v_i, v_(i+1)) $
Es folgt direkt, dass alle $e_i$ unterschiedlich sind, da $e_(i+1) in E without (union.big_{j= 1}^(i){e_j})$. \
Es verbleibt zu zeigen, dass $v_(i+1)$ immer existiert.
Dies wollen wir induktiv zeigen.\
$v_0$ existiert per Definition.\
Sei also $n in NN$ beliebig aber fest, so dass $v_n$ existiert. \
Dann gilt: $v_n != v_0$, da wir sonst einen Zyklus gefunden hätten, der $v_0$ enthält.\
Seien zudem $n_1 < n_2 < ... < n_l < n$ alle vorherigen Vorkommen von $v_n$ in der Knotenfolge: 
$ v_(n_1) = v_(n_2) = ... = v_(n_l) = v_n $ 
Dann gilt nach Vorraussetzung: 
$ deg_-(v_n) = deg_+(v_n) >= |{(v_(n_i-1), v_(n_i)) | i = 1, ..., l} union {(v_(n-1), v_n)}| = l+1 $
wobei $v_(n_(i)-1)$ aufgrund von $v_n != v_0$ immer definiert ist. \
Das bedeutet, dass es mindestens $l+1$ eingehende Kanten in $v$ gibt und auch mindestens $l+1$ ausgehende Kanten aus $v$ geben muss. \
Wir haben jedoch bis jetzt nur $l$ ausgehende Kanten aus $v$ genutzt: 
$ l = |{(v_(n_i), v_(n_i+1)) | i = 1, ..., l}| $
Folglich ist: 
$ |{(v_n, v^*) in E without (union.big_{j= 1}^(i){e_j})}| >= 1 $ Also gibt es min. ein Element von dem wir wählen können und somit ist auch $v_(n+1)$ existent.\
Per Induktion folgt dann die Existenz aller $v_i$ und $e_i$ für $i = 1, 2, ...$\
Wie wir jedoch festgestellt haben sind alle $e_i$ paarweise verschieden. Dies ist ein Widerspruch, da es nur endlich viele Kanten in $G$ gibt.\
Folglich war die Prämisse falsch und $G$ beinhaltet einen Zyklus, der insbesondere $v$ enthält.\




\
\

* Lemma 2 *:
Die Kanten eines beliebigen flusskonsistente Graphen $G = (V, E)$ lassen sich in disjunkte Zyklen $C_1, C_2, ..., C_l$ zerlegen:  $ union.big_(i = 1)^l C_i = E $ 

_Beweis:_
Um die Aussage für alle Graphen zu zeigen, führen wir eine Induktion über die Anzahl an Kanten durch:\
Sei $G_0=(V, E)$ ein beliebiger flusskonsistenter Graph ohne Kanten. Dann ist $E$ bereits mit der leeren Menge partitioniert. \
Sei im folgenden $n in NN_+$  beliebig, so dass sich beliebige flusskonsistente Graphen $G = (V, E)$ mit $|E| < n$ in disjunkte Zyklen zerlegen lassen.\
Sei $G_n = (V, E)$ beliebig flusskonsistent mit $|E| = n> 0$. Damit existiert nach *Lemma 1* in $G_n$ ein Zyklus $C_0$. Wir betrachten nun den Graphen $G^* = (V, E^*)$, der durch Entfernen der Kanten des Zyklus $C_0$ entsteht. \
Dann ist $G^*$ ebenfalls flusskonsistent, da für jede eingehende Kante in einen Knoten, die entfernt wird, auch eine ausgehende Kante entfernt wird. \
Per Induktionsvorraussetzung lässt sich $G^*$ in disjunkte Zyklen $(C_1, C_2, ..., C_m)$ partitionieren. Damit ist $(C_0, C_1, C_2, ..., C_m)$ eine gültige Partitionierung von $G_n$.
\
\
\

Kommen wir nun zurück zu unserem eigentlichen Beweis: \
Sei $G = (V, E)$ ein beliebiger zusammenhängender flusskonsistenter Graph. \
Nach *Lemma 2* kann man nun $G$ in disjunkte Zyklen $(C_1, C_2, ..., C_k)$ partitionieren.\
Wir werden im Folgenden diese Zyklen zu einem Eulerkreis zusammensetzen.\
Dass dies immer möglich ist, wollen wir induktiv über die Anzahl der "zusammengesetzten" Zyklen zeigen.\
Angenommen es gibt nur einen Zyklus $C_1$ der alle Kanten von $G$ enthält. Dann ist $C_1$ bereits ein Eulerkreis.\
Sei nun $n_1, n_2, ..., n_l in NN$ und $G^*:=(V_(n_1) union ... union V_(n_l), E_(n_1) union ... union E_(n_l))$ bereits "zusammengesetzt". Das bedeutet, es gibt einen Zyklus $P$ in $G^*$, der alle Kanten von $E_(n_1) union ... union E_(n_l)$ enthält.\
Es gilt zu zeigen, dass wir einen weiteren Zyklus $C_j$ mit $j in.not {n_1, n_2, ..., n_l}$ finden können, sodass wir diesen in $P$ einfügen können, um einen neuen Zyklus zu erhalten, der die Kanten aus $E_(n_1) union ... union E_(n_l) union E_j$ enthält.\
Ist $l = k$ so haben wir bereits alle Zyklen zusammengesetzt und es gibt nichts zu zeigen.\
Ist $l < k$ so gibt es noch einen Zyklus $C_j$ mit $j in.not {n_1, n_2, ..., n_l}$, der sich einen Knoten mit den anderen Zyklen teilt.\
Angenommen es gäbe keinen solchen Zyklus $C_j$, der sich einen Knoten mit $P$ teilt. Dann seien $V_P$ die Knoten in $P$ und $V_Q = V minus V_P$ die Knoten, die noch nicht in $P$ liegen. Insbesondere sind $V_P$ und $V_Q$ nicht leer. \
Da $G$ zusammenhängend ist, gibt es eine Kante $(v, w)$ mit $v in V_P$ und $w in V_Q$. \
Da jedoch $C_1 union ... union C_k = E$, folgt, dass die Kante $(v, w)$ in einem der Zyklen $C_1, C_2, ..., C_k$ liegt. \
Dies ist ein Widerspruch. Folglich, gibt es einen solchen Zyklus. \
Sei der Zyklus $P = (v_1, v_2, ..., v_h)$ für ein $h in NN$ und $C_j = (w_1, w_2, ..., w_m)$ für ein $m in NN$. O.b.d.A. sei $v_1 = w_1$ (ansonsten können wir die Knoten von $C_j$ zyklisch verschieben, sodass dies der Fall ist).\ 
Dann ist $P' = (w_1, w_2, ..., w_m, v_1, v_2, ..., v_h)$ wiederum ein Zyklus, der alle Kanten von $P$ und $C_j$ enthält.\
Damit ist der Induktionsschritt gezeigt.\

Somit können wir alle Zyklen $C_1, C_2, ..., C_k$ zu einem Zyklus $P$ zusammensetzen.\ 
Da $P$ per Konstruktion alle Kanten von $G$ enthält, ist $P$ ein Eulerkreis.\

\
\
\
Im Folgenden beschreiben wir einen ALgorithmus, der einen Eulerkreis in einem Graphen $G$ findet, der die Bedingung erfüllt, dass für alle Knoten $v in V$ gilt: $deg_-(v) = deg_+(v)$.\
\


*Eingabe:*
  flusskonsistenter, zusammenhängender gerichteter Graph $G = (V, E)$ in Form einer Adjazenzliste. .

*Ausgabe:*
  Ein Eulerkreis auf $G$ als Folge von Knoten $(v_1, v_2, ..., v_k)$.

*Korrektheitsbedingung:*
  Es muss gelten: \
  ${(v_i, v_(i+1)) | i = 1, 2, ..., k} = E$ $space$ (Alle Kanten werden genau einmal abgelaufen) \
  $v_1 = v_k$ $space$ (Der Pfad ist ein Kreis)

*Algorithmus:*\
  Sei $G := (V, E)$ der Eingabegraph. 
  Wir wählen eine beliebige Kante $(v, w) in E$ und verfahren analog zu Lemma 1, um einen Zyklus $C_1$ zu finden, der $v$ enthält. \ 
  Analog zu dem Verfahren in Lemma 2, entfernen wir nun weiterhin Zyklen, bis $G$ leer ist. \
  Nun haben wir eine Menge von Zyklen $C_1, C_2, ..., C_k$ gefunden, die paarweise disjunkt sind und deren Vereinigung alle Kanten von $G$ enthält.\
  Diese Zyklen können wir nun zu einem Eulerkreis zusammensetzen. \
  Vorab speichern wir uns für jeden Knoten in welchen Zyklen er vorkommt. 
  Nun starten wir mit Zyklus $C_1$ und dem Pfad $P = (v_1, ..., v_h)$. 
  Für alle Knoten $v_i$ in $P$ speichern wir uns ihr erstes Vorkommen in $P$.\
  Die Zyklen, die Knoten von $P$ enthalten, speichern wir uns separat in einer Liste $L$.\
  Analog zu unserem Beweis wollen wir jetzt die Zyklen zusammensetzen. Per Konstruktion können wir zu jedem Schritt einen Zyklus $C_j$ aus $L$ auswählen, der sich einen Knoten mit $P$ teilt. (dieser existiert, da $G$ zusammenhängend ist).\
  Dann können wir $C_j$ zyklisch verschieben und in $P$ an geeigneter Stelle einfügen.\ 
  Per Konstruktion erhalten wir so nach $k$ Iterationen einen Eulerzyklus $P$.

*Laufzeit:*\
  Der Algorithmus hat Laufzeit $cal(O)(|E|)$.\
  Für den Beweis werden wir als bekannt vorraussetzen, dass die Summe der Längen aller Zyklen $|E|$ ist und sich somit für Algorithmen über die Längen aller Zyklen eine amortisierte Laufzeit von $cal(O)(|E|)$ ergibt.\
  \
  
  Das Finden der Zyklen hat amortisierte Laufzeit $cal(O)(|E|)$, da jede Kante genau einmal besucht wird.\
  
  Das Speichern der ersten Vorkommen der Knoten in $P$ wird mit jedem neu eingefügten Zyklus um die hinzugefügten Knoten aktualisiert.\
  Die Liste $L$ wird dann mithilfe der neu hinzugefügten Knoten und der vorab gespeicherten Informationen über die Zyklen, in denen die Knoten vorkommen, aktualisiert.\
  Diese Operationen werden ebenfalls armotisiert $cal(O)(|E|)$ mal ausgeführt, da sie pro Knoten im Eulerzyklus (also pro Kante) ausgeführt werden.\
  Jeder Zyklus wird dann um maximal seine Länge zyklisch verschoben und an den vorberechneten Index eingefügt, was wieder in amortisiert $cal(O)(|E|)$ Zeit geschieht.\
  \
  Um ein Indexweise Einfügen zu ermöglichen, verwenden wir für die konkrete Implementierung eine Linked List für die Darstellung von $P$, wobei wir uns für jeden Knoten in einem Array speichern, welches Element (Referenz) der Linked List einem Vorkommen des Knoten entspricht.\  

  