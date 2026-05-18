#import "template.typ": *
#import "@preview/cetz:0.5.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 5

#let qed = [#h(1fr) $ square$]

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  week: week,
  course: "Theoretische Informatik II",
)

#exercise[5 Punkte, Verständnisaufgabe][]
Seien $x, y in RR$. 
+ _maximiere_
  $ 1 dot z $ 
  _unter_
  $ - 1 dot z <= - x $
  $ - 1 dot z <= - y $
  $ 1 dot z <= x $
  $ 1 dot z <= y $
  Nach Definition *Lineares Programm (LP)* gilt (_wir definieren $x$ als $v$, da $x$ bereits eine Variable in der Gleichung ist_):
  #list(
    marker: $dot$,
    spacing: 1.5em,
    [$A = mat(-1 ; - 1; 1; 1) in RR^4$],
    [$b = mat(-x; -y; x; y) in RR^4$],
    [$c = 1 in RR$],
    [$v = z in RR$]
  )
  *Begründung*: Wir nehmen an, dass $z$ sowohl $max(x,y)$ als auch $min(x,y)$ entsprechen muss. Daher muss $x = y$ gelten, damit unser LP valide ist. Das stimmt auch mit der Gleichung überein, hier würde es ja auch keine Lösung geben, wenn $x != y$ gilt. \
  Für $z = max(x,y)$ muss $z >= x$ und $z >= y$ gelten, wobei $z$ so klein wie möglich sein soll: Wir minieren also $z$. _(NB (1) + (2))_ \
  Für $z = min(x,y)$ muss $z <= x$ und $z <= y$ gelten, wobei wir $z$ maximieren. _(NB (3) + (4))_ \
  Da es aber nur eine Lösung für $z$ geben kann, nämlich $z = x = y$ ist es egal ob wir $z$ maximieren oder minimieren.

+ _maximiere_
  $ 1 dot z $ 
  _unter_
  $ 1 dot z <= | x - y | $
  Nach Definition *Lineares Programm (LP)* gilt (_wir definieren $x$ als $v$, da $x$ bereits eine Variable in der Gleichung ist_):
  #list(
    marker: $dot$,
    spacing: 1.5em,
    [$A = 1 in RR$],
    [$b = | x - y | in RR$],
    [$c = 1 in RR$],
    [$v = z in RR$]
  )
  *Begründung*: Da $x, y in RR$ Variablen sind und zu Beginn des LP feststehen, kann auch in Ungleichung $| x - y |$ auf der rechten Seite der Nebenbedingung stehen, da immer nur als reelle Zahl interpretiert wird.
+ _maximiere_
  $ - 1 dot z $ 
  _unter_
  $ -1 dot z <= -14 $
  $ -1 dot z <= - 12 x y $
  Nach Definition *Lineares Programm (LP)* gilt (_wir definieren $x$ als $v$, da $x$ bereits eine Variable in der Gleichung ist_):
  #list(
    marker: $dot$,
    spacing: 1.5em,
    [$A = mat(-1; -1) in RR^2$],
    [$b = mat(-14; -12 x y) in RR^2$],
    [$c = -1 in RR$],
    [$v = z in RR$]
  )
  *Begründung*: Identisch zu Begründung in (a) zu $z = max(x,y)$.
+ Nicht möglich, da Nicht-Linearität durch $z^3 = 12y^3$. Es ist zwar möglich $root(3, dot)$ zu machen, man muss hier allerdings eine Fallunterscheidung einführen, da $y^3$ bei $y < 0$ negativ ist und wir (in $RR$) keine negativen Wurzeln ziehen können. Daher immer noch nicht-linear.
+ _maximiere_
  $ 1 dot z $ 
  _unter_
  $ 1 dot z <= y $
  Nach Definition *Lineares Programm (LP)* gilt (_wir definieren $x$ als $v$, da $x$ bereits eine Variable in der Gleichung ist_):
  #list(
    marker: $dot$,
    spacing: 1.5em,
    [$A = 1 in RR$],
    [$b = y in RR$],
    [$c = 1 in RR$],
    [$v = z in RR$]
  )
  *Begründung*: Im Gegensatz zu (d) können wir hier die Wurzel ziehen, da das Quadrat einer Zahl ($in RR$) immer positiv ist. Da $sqrt(dot)$ streng monoton in $RR_(>=0)$ ist, gilt 
  $ z^2 = y^2 <=> z = y $

#pagebreak()
#exercise[6 Punkte, Modellierungsaufgabe][]

#pagebreak()
#exercise[5 Punkte, Modellierungsaufgabe][] 
_Aus Aufgabe 4.1 b) wissen wir, dass man ein Flussnetzwerk mit Knotenkapazitäten in ein klassisches Flussnetzwerk umwandeln kann._ \
*Eingabe*: Ein Graph $G = (V, E)$, wobei $s$ der Startknoten ist. Der Graph stellt die Zugangsübergänge zwischen Zuständen des Artifakts da. $s in V$ ist der Startzustand. \
*Ausgabe*: Eine Zahl $k in NN$, die Anzahl der möglichen zustandsverschiedenen Transformationsdurchläufe. \
*Korrektheitsbedingung*: Die Ausgabe ist korrekt wenn es genau $k$ viele zustandsverschiedene Transformationsdurchläufe gibt, wobei zustandsverschieden bedeutet, dass zwischen zwei beliebigen Transformationsdurchläufen $t, t'$ bis auf der Startknoten $s$ kein Knoten in beiden besucht wird. \
\
*Algorithmusbeschreibung*:
Wir konstruieren ein gerichtetes Flussnetzwerk $G' := (V', E', c, c')$ mit Knotenkapazitäten $c': V' -> NN$. Wir definieren die Knotenmenge $V'$ als die Menge aller Zustände, die das Artefakt erreichen kann ($V' = V union {t}$). Insbesondere modellieren Quelle $s in V'$ und Senke $t in V'$ den Startzustand. \

Zwischen zwei Knoten $v,w in V'$ existiert eine Kante $(v,w) in E'$ gdw. es möglich ist von Zustand $v$ zu $w$ zu kommen mit der Ausnahme für $t in V'$ für welches gilt, dass alle Zustandsübergänge die nach $s$ gehen, jetzt nach $t$ gehen. 
$ E' = {E minus {(v,s) | (v,s) in E and v in V}} union {(v, t) | (v,s) in E and v in V} $ \
Für alle Kanten $e in E$ gilt $c(e) = 1$, sowie für alle Knoten $v in V$ $c'(v) = 1$. \
Wir suchen einen maximum Fluss in $G'$. Sobald wir einen gefunden haben, geben wir die Menge an Flussvolumen $f^-(t)$ (_Definition aus 4.1 b)_)aus. \
*Korrektheitsbegründung*: Für einen Fluss in $G'$ gilt durch $c'(v) = 0$ für jeden Knoten $v in V'$, dass jeder Zustand nur genau einmal besucht wird. Jedes mal wenn also ein Flussvolumen nach $t$ bekommen, muss dieses von einem knotendisjunkten Pfad $P'$ gegenüber den bereits angekommenen Pfaden $p in P$ gekommen sein, also aus einem zustandsverschiedenen Transformationsdurchlauf. \
*Laufzeitanalyse*: Als Laufzeit erhalten wir $O(n m)$, da das Konstruieren von $G'$ $O(n + m)$ dauert (pro Knoten $v$ genau zwei Knoten $(v_("in"), v_("out"))$ mit einer Kante $(v_("in"), v_("out"))$ erstellen, sowie alle Kanten korrekt ziehen) und das Finden eines maximum Flows $O(m dot C)$ (Ford-Fulkerson) dauert, da wir aber immer Kantenkapazitäten von $1$ haben $C <= n - 1$  gilt, gilt $O(m dot C) = O(n m)$. #qed

#pagebreak()