#import "template.typ": *

#set enum(numbering: "a)")
#set list(marker: $dot$)
#set text(lang: "de", font: "CMU Serif")
#let week = 2

#show: template.with(
  names: [Simon Bachran, Sven Hafeman, Tim Beier],
  name: "Übungsblatt",
  number: week,
  course: "Theoretische Informatik II",
)

#exercise[5 Punkte, Verständnisaufabe][
  + Zeige, dass Dijkstra nicht funktioniert, wenn der Graph negative Kantengewichte enthält.

    *Lösung:*

    Es ist zu zeigen, dass Dijkstra nicht für beliebige Graphen mit negativen Kantengewichten den
    kürzesten Pfad zwischen beliebigen Knoten findet. Dafür konstruieren wir ein minimales
    Gegenbeispiel:

    Sei $G = (V, E, w)$ folgender Graph, der negative Kantengewichte enthält:

    #diagram(
      node-stroke: 0.5pt,
      {
        let (a, b, c) = ((0, 0.75), (1, 0), (2, 0.75))
        node(a, $A$)
        node(b, $B$)
        node(c, $C$)

        edge(a, b, "->", $2$, label-sep: 1pt)
        edge(b, c, "->", $-3$, label-sep: 1pt)
        edge(a, c, "->", $1$, label-sep: 1pt)
      }
    )

    Wir wollen den kürzesten Pfad von $A$ nach $C$ finden. Dieser kürzeste Pfad ist $P = (A, B, C)$,
    da dessen Länge $|P| = 2 + (-3) = -1$ und dies kürzer ist, als die einzige Alternative $P' = (A,
    C)$ mit Länge $|P'| = 1$.

    Wenden wir Dijkstra's Algorithmus auf $G$ an, passiert Folgendes:

    Wir beginnen mit $A$ und betrachten dessen Nachbarn $B$ und $C$. Wir fügen beide mit ihren
    Abständen zur Priority Queue hinzu. $C$ steht dabei vorne, da $1 < 2$. Da ein Pfad zu $C$
    gefunden wurde, bricht der Algorithmus ab und gibt 1 als Länge des kürzesten Pfades von $A$ nach
    $C$ zurück, was jedoch falsch ist.

    Dijkstra funktioniert in $G$ nicht, da durch das negative Kantengewicht das Lemma nicht gilt,
    dass beim Besuchen eines Knotens bereits die kürzeste Distanz gefunden wurde.

    #colbreak()
  + Wir möchten Dijkstra erweitern, damit er auch auf Graphen mit negativen Kantengewichten
    funktioniert. Dazu bearbeiten wir den Eingabegraphen $G = (V, E, w)$, wie folgt, sofern er
    mindestens eine negative Kante enthält: Wir suchen das minimale Kantengewicht $w_min$ und
    addieren seinen Betrag zum Gewicht jeder Kante. Im neuen Graphen $G' = (V, E, w')$ gilt also für
    jedes $e in E$, dass $w'(e) = w(e) + |w_min|$ ist. Damit hat $G'$ nur noch nicht-negative Kanten
    und wir können Dijkstras Algorithmus verwenden, um die kürzesten Wege zu finden. Deren echte
    Länge kann dann wiederum aus dem Originalgraph abgelesen werden. Beweise oder widerlege, dass
    der oben beschriebene Algorithmus korrekt ist.

    *Lösung:*

    Die Korrektheit dieses modifizierten Algorithmus lässt sich am selben Beispiel widerlegen. Setze
    $G$ gleich dem Graphen aus a). Es gilt $w_min = -3$, also ist $G'$ visuell:

    #diagram(
      node-stroke: 0.5pt,
      {
        let (a, b, c) = ((0, 0.75), (1, 0), (2, 0.75))
        node(a, $A$)
        node(b, $B$)
        node(c, $C$)

        edge(a, b, "->", $5$, label-sep: 1pt)
        edge(b, c, "->", $0$, label-sep: 1pt)
        edge(a, c, "->", $4$, label-sep: 1pt)
      }
    )

    Wir wissen bereits, dass der kürzeste Pfad von $A$ nach $C$ in $G$ gleich $P = (A, B, C)$ ist.
    Wenn der vorgeschlagene Algorithmus korrekt wäre, würde er also denselben Pfad finden.

    Wendet man jedoch Dijkstra auf $G'$ an, wählt dieser wieder die Kante von $A$ nach $C$ mit
    Gewicht 4 und bricht ab. Der gefundene Pfad $P' = (A, C)$ ist nicht der kürzeste Weg in $G$.
    Damit ist der Algorithmus nicht korrekt.
]

#pagebreak()

#exercise[5 Punkte, Beweisaufgabe][
  + - *Input:* Ein kantengewichteter Graph $G = (V, E)$ mit $|V| = n$ Knoten als $n times n$
      Adjazenzmatrix $M$ über $RR union {infinity}$.
    - *Output:* $n times n$ Distanzmatrix $D$ über $RR union {infinity}$
    - *Korrektheitsbedingung:*
      #enum(
        numbering: "1.",
        [
          Alle diagonalen Einträge $D[i][i], i in [n]$ sind nicht-negativ. _Wenn es einen Weg von
          Knoten $i$ zu sich selbst gebe und es dabei negative Kosten hätte, so gibt es einen Kreis
          mit negativen Gesamtgewicht. Insbesondere ist dies bei jedem Kreis mit negativen
          Gesamtgewicht der Fall, da ein Kreis zwangsweise Knoten mehrfach enthält._
        ],
        [
          Für alle Einträge $D[i][j], i, j in [n]$ gilt, dass es keinen Weg von $i$ nach $j$ gibt
          mit einer geringeren Distanz als $D[i][j]$.
        ],
        [
          Für alle Einträge $D[i][j], i, j in [n]$ gibt es tatsächlich einen Weg von $i$ nach $j$ in
          $G$ mit den Gesamtkosten $D[i][j]$.
        ]
      )
    - *Interpretation*: $M[i][j] = infinity$ bedeutet, dass es keinen Pfad von Knoten $i$ zu $j$
      gibt (äquivalent bei $D$). Jeder Eintrag in $D[i][j],  i,j in [n]$ bedeutet, dass es einen Weg
      von $i$ nach $j$ gibt, dessen Gesamtgewicht $D[i][j]$ beträgt.
  + *Laufzeit*: Das Zuweisen von $M$ auf $D$ geht in $O(n^2)$. Die innere Schleife wird genau $n
    times n times n$-mal durchlaufen, also $O(n^3)$. Zugriffe/Schreiben auf ein Array und
    `min`-Operation gehen jeweils in $O(1)$, daher ist die Gesamtlaufzeit $O(n^2 + n^3) = O(n^3)$.
    #qed
  + *Korrektheitsbeweis*: 
    - *IA*: Sei $k = 0$, wir befinden uns also noch vor dem ersten Schleifendurchlauf. Für jede
      Kombination $i, j in [n]$ haben wir nun per Definition der Adjazenzmatrix den kürzesten Weg
      von $i$ nach $j$, wenn man über keinen anderen Zwischenknoten geht.
    - *IV*: Es gilt für alle Knoten $i in [n]$, dass im $k-$ten Durchlauf, alle Wege mit
      Zwischenknoten ${1,..,k}$ zu $j$ betrachtete und jeweils die kürzesten ausgewählt worden sind.
      $D[i][j]$ enthält also den kürzesten Weg von $i$ nach $j$ mit Zwischenknoten aus der Menge
      ${1, .., k}$.
    - *IS*: Sei nun $k' = k + 1$. Es gilt nun, dass für alle Knoten $1, .. k$ vom Endknoten aus die
      kürzeste Distanz bereits bestimmt ist. Nun wird geschaut, ob es von einem Knoten $i$ zu $j$
      kürzer ist erst von $i$ zu $k'$ zu gehen und dann von $k'$ nach $j$, statt den Knoten $k$ zu
      überspringen und direkt zu $j$ zu gehen. Es gibt nun zwei Fälle
      - *Fall 1*: $k'$ ist nicht in einem kürzesten Weg von $i$ nach $j$ enthalten. Dann ist der
        bisherige Weg der kürzeste und $D[i][k] + D[k][j] > D[i][j]$ muss logischerweise gelten. Wir
        bleiben also beim optimalen Weg.
      - *Fall 2*: $k'$ ist in einem kürzesten Weg von $i$ nach $j$ enthalten. Dann wird der Weg in
        zwei Teilwege zerlegt $D[i][k]$ und $D[k][j]$. Für diese wissen wir per
        Induktionsvoraussetzung bereits die kürzesten Wege mit Zwischenknoten ${1, .. k}$. Da der
        Graph keine negativen Zyklen enthält, müssen wir nur diese betrachten. Die Länge des besten
        Weges ist also $D[i][k] + D[k][j]$ und ist somit kleiner als $D[i][j]$.
    Dies gilt nun auch für $k=n$ zu welchem Zeitpunkt alle möglichen inneren Knoten bereits
    betrachtet sind, für jedes Knotenpaar also eine minimale Distanz bekannt ist. #qed
]

#pagebreak()

#exercise[6 Punkte, Knobelaufgabe][
  - *Input*: Ein Baum $G = (V, E)$ mit $|V| = n$ Knoten und $|E| = n - 1$ Kanten.
  - *Output*: Ein $w in RR$, als die Länge des maximal langen Pfads $P$ in $G$.
  - *Korrektheitsbedingung*: 
    #enum(
      numbering: "1.",
      [Es gibt einen Pfad $P$ in $G$ dessen Gesamtlänge $w$ beträgt.],
      [Es gibt keinen validen Pfad $P'$ in $G$ mit einer höheren Gesamtlänge als $P$.]
    )
  - *Interpretation*: bereits oben erwähnt.
  - *Algorithmusbeschreibung*: 
    - Datenstrukturen: Array $D$ der Länge $n$ ($D[i]$ = maximale Länge wenn wir von Knoten $i$ nach
      unten gehen). $m in RR = - infinity$ (die momentan längste Pfadlänge) Wir starten bei einem
      beliebigen Knoten unserer Wahl und werden diesen fortan als Wurzel bezeichnen. Nun gehen wir
      mittels Tiefensuche den Baum runter. Sind wir an einem Blatt $j$ angekommen dann tragen wir in
      $D[j] = 0$ ein und gehen wieder hoch. Wir befinden uns also nun bei dem Elternknoten $i$ und
      merken uns $D[i] = w(i, j) + D[j]$. Für alle weiteren Kinderknoten werden wir irgendwann auch
      alle maximalen Längen in $D$ kennen, sodass wir $D[i]$ auf $max(w(i, j'), D[j'])$ für alle
      Kinder $j'$ von $i$ setzen werden und uns in $b 2$ den zweilängsten Weg von $i$ nach unten
      merken werden (wenn es diesen gibt, sonst $b 2 = - infinity$). Wir setzten unsere maximal
      Weglänge $m = max(m, D[i], D[i] + b 2)$. Jetzt gehen wir von $i$ aus wieder zum Elternknoten
      und kennen den maximalen Weg von $i$ abwärts nämlich $D[i]$ und wiederholen die obigen
      Schritte. \ Kennen wir also alle Kinder von unserer Wurzel und haben die obigen Schritte
      gemacht steht in $m$ die maximale Pfadlänge in $G$.
  - *Korrektheitsbeweis*: Ist ein Knoten $i$ auf einem maximalen Pfad, so gibt es zwei
    Möglichkeiten:
    - Fall 1: Der Pfad geht durch $i$ und geht fortan nurnoch abwärts (das Wurzelmodell bleibt
      vorhanden).
    - Fall 2: $i$ ist innerhalb des Pfades und verbindet zwei seiner Kinder zum längsten Pfad.
      Kennen wir die Längen aller Kinder $j$ von $i$, so können wir bestimmen, ob der Weg von $i$
      abwärts länger ist, als die Verbindung der beiden längsten Kinder über $i$. Für den
      Elternknoten können wir aber nurnoch den Weg von $i$ abwärts nutzen, weswegen wir uns diesen
      in $D[i]$ speichern und weiter nach oben geben. So werden wir alle Knoten abarbeiten und dank
      Tiefensuche und Postorder garantieren, dass wir immer zu jedem Knoten aller Kinder abgesucht
      haben, bis wir bei der Wurzel ankommen, wo dies immernoch gilt. Somit haben wir eine maximale
      Länge gefunden. 
  - *Laufzeitanalyse*: Tiefensuche geht in $O(n + m)$. In dem Fall eines Baumes allerdings in $O(n +
    n - 1) = O(n)$. Das Zugreifen und Schreiben auf ein Array geht in $O(1)$, das Erstellen in
    $O(n)$. Das Vergleichen auf ein Maximum geht in $O(1)$ (wenn wir immer direkt vergleichen),
    womit wir bei einer Laufzeit von insgesamt $O(n)$ angekommen sind. 
  Der Algorithmus ist also korrekt und innerhalb der Laufzeitschranke. #qed
]
