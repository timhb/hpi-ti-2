#import "template.typ": *
#import "@preview/cetz:0.4.2": *

#set enum(numbering: "a)")
#set text(lang: "de", font: "CMU Serif")
#let week = 2

#show: template.with(
  names: [Tim Beier, Simon Bachran, Sven Luca Hafemann],
  week: week,
  course: "Theoretische Informatik II"
)

Wir definieren 2 weitere Hilflemmata:\

*Lemma 3:* Zu einem beliebigen Zustand (möglicherweise nicht aufgeräumt) in  dem Fibonacci Heap mit Größe $n$, ist der Grad eines Knoten maximal $log_phi (n)$.\
\
_Beweis_. Angenommen der maximale Grad wäre größer.\ 
Dann gibt es einen Knoten $K$ mit Grad $g_K > log_phi (n)$. 
Dann folgt mit Lemma 2 direkt, dass $n >= phi^(g_K) > phi^(log_phi (n)) = n$. Dies ist ein Widerspruch. 

\
\
*Lemma 4:* Ein aufgeräumter Fibonacci Heap der Größe $n$ hat maximal $log_phi (n) +1$ Wurzelknoten.\
\
_Beweis_. Da der Fibonacci Heap aufgeräumt ist, haben alle Wurzelknoten paarweise unterschiedlichen Grad. Aufgrund Lemma 3 ist der maximale Grad des Fibonacci Heaps jedoch $log_phi (n)$. \
Damit kann es also nicht mehr als $log_phi (n)+1$ Wurzelknoten geben, da es nur $log_phi (n)+1$ natürliche Zahlen kleiner gleich $log_phi (n)$ gibt.  


\ \
Wir verwenden die Potentialfunktion
$ Phi(D) = alpha W(D) + beta M(D), $
wobei $W(D)$ die Anzahl der Wurzelknoten und $M(D)$ die Anzahl der markierten Knoten im Fibonacci-Heap $D$ sind. Die Konstanten $alpha, beta > 0$ wählen wir später groß genug. \
Da $W(D) >= 0$ und $M(D) >= 0$ gilt, ist $Phi(D) >= 0$ für jeden Heap $D$. Für den leeren Heap $D_0$ gilt insbesondere
$ Phi(D_0) = alpha dot 0 + beta dot 0 = 0. $
Für eine Operation von einem Zustand $D$ in einen Zustand $D'$ definieren wir die amortisierten Kosten wie üblich durch
$ a_i = t_i + Phi(D') - Phi(D). $

Für *Insert* gilt direkt $t_i in cal(O)(1)$. Außerdem wird genau ein neuer Wurzelknoten eingefügt und es entstehen keine neuen markierten Knoten. Also ist $W(D') = W(D) + 1$ und $M(D') = M(D)$. Damit folgt
$ a_i = t_i + alpha (W(D) + 1) + beta M(D) - alpha W(D) - beta M(D)
  = t_i + alpha in cal(O)(1). $

Nun betrachten wir *ExtractMax*. Sei $n$ die Anzahl der Knoten vor der Operation und sei $x$ der entfernte Max-Knoten. Nach Lemma 3 hat $x$ höchstens $log_phi (n)$ Kinder. Direkt nach dem Entfernen von $x$ und dem Einfügen seiner Kinder in die Wurzelebene gibt es maximal
$ omega = W(D) - 1 + log_phi (n) $
Wurzelknoten. Haben zwei Wurzeln denselben Grad, so werden sie zusammengefügt. Da eine solche Zusammenfüg-Operation die Anzahl der Wurzelknoten um genau $1$ reduziert, wird sie maximal $omega$-mal ausgeführt. Zusätzlich muss zum Aktualisieren des Max-Pointers höchstens über die Wurzeln des aufgeräumten Heaps iteriert werden. Insgesamt gibt es also eine Konstante $c_E$ mit
$ t_i <= c_E dot (W(D) + log_phi (n)). $
Nach dem Ausführen von ExtractMax ist der Heap aufgeräumt. $D'$ hat nun Größe $n - 1$, also gilt mit Lemma 4:
$ W(D') <= log_phi (n) + 1. $
Bei ExtractMax werden keine neuen Markierungen erzeugt, also gilt $M(D') <= M(D)$. Damit erhalten wir für die Potentialänderung
$ Phi(D') - Phi(D)
  = alpha (W(D') - W(D)) + beta (M(D') - M(D))
  <= alpha (log_phi (n) + 1 - W(D)). $
Somit gilt
$ a_i
  <= c_E (W(D) + log_phi (n)) + alpha (log_phi (n) + 1 - W(D))
  = (c_E - alpha) W(D) + (c_E + alpha) log_phi (n) + alpha. $
Wählen wir nun $alpha >= c_E$, verschwindet der potentiell große Term in $W(D)$ nach oben. Also ist
$ a_i in cal(O)(log n). $

Es bleibt *IncreaseKey*. Sei $c$ die Anzahl der Knoten, die im Verlauf der Operation abgeschnitten und als unmarkierte Wurzeln in die Wurzelebene eingefügt werden. Dann gilt für eine Konstante $c_I$
$ t_i <= c_I dot (c + 1), $
denn pro abgeschnittenem Knoten wird nur konstant viel Arbeit ausgeführt. Außerdem steigt die Anzahl der Wurzeln genau um $c$:
$ W(D') - W(D) = c. $
Für die Markierungen gilt: Alle abgeschnittenen Knoten außer möglicherweise dem ersten waren vor dem Abschneiden markiert und werden danach unmarkiert. Dadurch verschwinden mindestens $c - 1$ Markierungen. Am Ende wird höchstens ein Vorgängerknoten neu markiert. Also gilt
$ M(D') - M(D) <= 1 - (c - 1) = 2 - c. $
Damit folgt
$ Phi(D') - Phi(D)
  = alpha (W(D') - W(D)) + beta (M(D') - M(D))
  <= alpha c + beta (2 - c)
  = 2 beta - (beta - alpha)c. $
Für die amortisierten Kosten erhalten wir daher
$ a_i
  <= c_I (c + 1) + 2 beta - (beta - alpha)c
  = c_I + 2 beta + (c_I + alpha - beta)c. $
Wählen wir $beta >= alpha + c_I$, so ist der Koeffizient von $c$ höchstens $0$. Damit bleibt
$ a_i <= c_I + 2 beta in cal(O)(1). $

Insbesondere sind $alpha >= c_E$ und $beta >= alpha + c_I$ verträglich miteinander. \
Somit gilt insgesamt: *ExtractMax* hat amortisierte Kosten $cal(O)(log n)$ und *IncreaseKey* hat amortisierte Kosten $cal(O)(1)$. $qed$
