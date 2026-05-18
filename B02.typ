#import "template.typ": *
#import "@preview/cetz:0.4.2": *

#set enum(numbering: "a)")
#set text(lang: "de")
#let week = 2

#show: template.with(
  names: [Tim Beier, Simon Bachran, Sven Luca Hafemann],
  week: week,
  course: "Theoretische Informatik II"
)

Wir definieren 2 weitere Hilflemmata:\

*Lemma 3:* Zu einem beliebigen Zustand (möglicherweise nicht aufgeräumt) in  dem Fibonacci Heap mit Größe $n$, ist der Grad eines Knoten maximal $log_phi (n)$.\
\
_Beweis_. Angenommen der maximale Grad wäre Größer.\ 
Dann gibt es einen Knoten $K$ mit Grad $g_K > log_phi (n)$. 
Dann folgt mit Lemma 2 direkt, dass $n >= phi^g_K > phi^(log_phi (n)) = n$. Dies ist ein Widerspruch. 

\
\
*Lemma 4:* Ein aufgeräumter Fibonacci Heap der Größe $n$ hat maximal $log_phi (n) +1$ Wurzelknoten.\
\
_Beweis_. Da der Fibonacci Heap aufgeräumt ist, haben alle Wurzelknoten paarweise unterschiedlichen Grad. Aufgrund Lemma 3 ist der maximale Grad des Fibonacci Heaps jedoch $log_phi (n)$. \
Damit kann es also nicht mehr als $log_phi (n)+1$ Wurzelknoten geben, da es nur $log_phi (n)+1$ natürliche Zahlen kleiner gleich $log_phi (n)$ gibt.  