#import "template.typ": *
#import "@preview/cetz:0.4.2": *

#set enum(numbering: "a)")
#set list(marker: $dot$)
#set text(lang: "de", font: "CMU Serif")
#let week = 3

#let qed = [#h(1fr) $square$]

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  week: week,
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Verständnisaufabe][]


#exercise[6 Punkte, Modellierungsaufgabe][]

=== Modellierung

Sei $S$ die Menge der Studierenden, $A$ die Menge der Artefakte und $K$ die
Menge der Kammern. Für alle $s in S$ sei $A_s$ die Menge an Artefakten, die
Studi $s$ untersuchen möchte. Für alle $a in A$ sei $K_a$ die Menge an Kammern,
in der sich Artefakt $a$ aufhalten kann.

Es ist explizit ein _bipartites_ Matching gefordert, bei dem Studierenden ein
Artefakt und eine Kammer zugeordnet wird. Daher weisen wir Studierenden jeweils
ein Paar aus Artefakt und Kammer zu.

Setze $E = {(s,a,k) | forall s in S forall a in A forall k in K: a in A_s and k
in K_a}$

Sei $G = (S, A times K, E)$ ein bipartiter Graph. Gesucht ist ein Maximum-Matching $M
subset.eq E$.

=== Algorithmusbeschreibung

Sei $"aug": (G, M) -> cal(P)(E)$ ein Algorithmus, der in $cal(O)(|E|)$ einen augmentierenden
Pfad in $G$ zu $M$ finden kann (siehe Aufgabe 1). Falls kein augmentierender
Pfad existiert, gibt $"aug"(G,M)=emptyset$ zurück.

Setze $M = emptyset$. Solange $"aug"(G,M) != emptyset$, setze $M = M Delta
"aug"(G,M)$.

Danach haben wir also ein $M$ gefunden, für das es keinen augmentierenden Pfad
mehr gibt. Laut dem Satz von Berge ist $M$ damit ein Maximum-Matching in G.

// Die Lösung ist gerade noch unvollständig, weil ich mir nicht sicher bin,
// wie man das korrekt als reines bipartites Matching ohne Flows lösen
// soll, mit den Nebenbedingungen. Ich schaue es mir morgen nochmal an und
// aktualisiere unsere Abgabe dann, wenn das für euch passt.

#exercise[6 Punkte, Beweisaufgabe][]

