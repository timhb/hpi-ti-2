#import "template.typ": *
#import "@preview/cetz:0.4.2": *

#set enum(numbering: "a)")
#set list(marker: $dot$)
#set text(lang: "de", font: "CMU Serif")
#let week = 3

#let qed = [#h(1fr) $square$]

#show: template.with(
  names: [Simon Bachran, Sven Hafeman, Tim Beier],
  week: week,
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Verständnisaufabe][]
Sei $G = (X, Y, E)$ ein bipartiter Graph und $M subset.eq E$ ein Matching and Adjazenzliste. Sollte es einen augmentierenden Pfad in $G$ geben, dann findet folgender Algorithmus diesen in $cal(O)(|E|)$. \
Wir bauen uns einen Hilfsgraphen $G' = (X, Y, E')$ auf welchen wir nun operieren, wobei gilt, dass alle Kanten in $M$ nur noch von $Y$ nach $X$ laufen können, und alle anderen Kanten nur noch von $X$ nach $Y$. Unser Algorithmus ist also gezwungen abwechselnd Kanten aus Matching $M$ und nicht aus Matching $M$ zu wählen.
Im ersten Schritt werden wir alle Knoten $v in X$, welche noch nicht Teil von den Knoten in $M$ sind, in eine Queue speichern. $""^1$ \
Nun werden wir alle solcher Knoten in der Queue mittels der Breitensuche abarbeiten, dabei merken wir uns über ein `visited`-Array der Länge $n$, welche Knoten wir bereits besucht haben und ihm `parent`-Array der Länge $n$ welchen Vorgänger ein Knoten hat. Wir initialisieren ein Array $M$ der Länge $n$, wo wir uns für jeden Knoten speichern, ob dieser in $M$ vorkommt. \
Wir nehmen einen Knoten $v'$ aus der Queue Datenstruktur. Für alle seine Nachbarn $v'_n in N(v')$, welche wir mittels Adjazenzliste finden, gibt es nun verschiedene Fälle: 
- Ist $v'_n$ bereits besucht worden, so ignorieren wir diesen.
- Ist $v'_n$ Teil unbesucht und Teil von den Knoten in $M$ so fügen wir $v'_n$ in die Queue ein und markieren ihn als besucht. Wir speichern uns den Vorgänger $v$ in `parent` von $v'_n$.
- Ist $v'_n$ nicht Teil von den Knoten in $M$, so fügen wir $v$ als `parent` von $v'_n$ hinzu und beenden die Suche. Wir haben einen augmentierenden Pfad gefunden und können den nun über das `parent`-Array wiedergeben.

Haben wir alle Nachbarn eines Knotens besucht, so untersuchen wir den nächsten Knoten in der Queue. \
Haben wir am Ende des Algorithmus keinen augmentierenden Pfad gefunden so gibt es keinen, da unser BFS ihn sonst gefunden hätte, denn es gäbe ja sonst einen Pfad in $G'$ von einem Knoten in $X$ zu einen Knoten aus $Y$, welche beide nicht in den Knoten von $M$ sind. \
Gäbe es einen augmentierenden Pfad, so müsste es auch einen Pfad in $G'$ geben von einem Knoten in $X$ zu einen Knoten aus $Y$, welche beide nicht in den Knoten von $M$ sind. \
Demnach findet unser Algorithmus also immer einen augmentierenden Pfad, sollte einer existieren. #qed

*Laufzeitanalyse* \
Das Konstruieren des Hilfsgraphen $G'$ dauert $cal(O)(|E|)$ Schritte, da wir jede Kante genau einmal richten müssen. \
Das Initialisieren von `visited` und `parent` dauern jeweils $cal(O)(|V|)$ Schritte. Wir gehen aber davon aus, dass es keine isolierten Knoten in $G$ gibt, womit $|V| <= |E| dot 2$ gilt, also $cal(O)(|E|)$. \
Wir schauen uns für jeden Knoten alle seine Nachbarn an, über alle Knoten also insgesamt $cal(O)(|E|)$ mal. Zugriffe auf Arrays für `visited` und `parent` sind konstant, das Insert/Remove aus einer Queue auch. \
Das Prüfen ob ein Knoten in einen der Knoten in $M$ liegt geht in $cal(O)(|E|)$, da wir nur zu Beginn ein Array $M$ füllen müssen in $cal(O)(|V|) = cal(O)(|E|)$ und ab da an konstanten Zugriff auf das Array ausüben können. \
Das Rekonstruieren von `parent` zu einem augmentierenden Pfad geht auch in $cal(O)(|V|) = cal(O)(|E|)$, da wir maximal alle Knoten abgehen müssen. \
Insgesamt entsteht so also eine Laufzeit von $cal(O)(|E|)$. 

$""^1$_Wir könnten hier auch mit $w in Y$ starten und die gerichteten Kanten umdrehen, dies würde aber auf das selbe hinauslaufen, da ein aufmentierender Pfad, der in $X$ startet auch immer in $Y$ enden muss, bei ungerichteten Graphen also zu keinem Unterschied führt._

#pagebreak()
#exercise[6 Punkte, Modellierungsaufgabe][]

#pagebreak()
#exercise[6 Punkte, Beweisaufgabe][]
Sei $G = (X, Y, E)$ ein bipartiter Graph. Wir zeigen "$=>$" per Widerspruch. \
Angenommen für alle $S subset.eq X$ gilt $|N(S)| >= |S|$ und wir haben ein maximales Matching $M$ für das gilt $|M| < |X|$, es ist also mindestens ein Knoten $x in X$ nicht im Matching enthalten. Es gilt nun einen augmentierenden Pfad $P$ in $G$ zu $M$ zu finden. \
Dafür starten wir bei Knoten $x$, welcher nicht Teil von den Knoten in $M$ ist. Wir können nun über Breitensuche alle adjazenten Knoten zu $x$ besuchen, welche alle Teil von $Y$ sind (bipartit) und zudem, zumindest im ersten Schritt, Teil der Knoten in $M$ sind ($M$ ist maximal). Es wird nun immer eine mögliche weitere Kante existieren, da für alle Knoten in unserem aktuellen Pfad $P'$ $S_P subset X$ weiterhin gilt $|N(S_P)| >= |S_P|$, es gibt also eine weiteren Knoten in $Y$ der besucht werden kann. Dies kann ewig weitergeführt werden bis ein Knoten $y in Y$ gefunden wird, welcher nicht Teil des Matchings ist. Den muss es geben, da $|Y| >= |N(X)| >= |X| > |M|$. Sobald dieser Knoten gefunden wurde, handelt es sich um einen augmentierenden Pfad, nach Satz von Berge ist $M$ also nicht maximal, was ein Widerspruch ist. \
Somit ist "$=>$" gezeigt. #qed