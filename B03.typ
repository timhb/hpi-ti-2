#import "template.typ": *

#set enum(numbering: "a)")
#set text(lang: "de", font: "CMU Serif")

#show: template.with(
  names: [Tim Beier, Simon Bachran, Sven Luca Hafemann],
  name: "Bonusblatt",
  number: 3,
  course: "Theoretische Informatik II"
)

+ Ganz so trivial ist dies nicht. Die beidseitig-unendliche Turing-Maschine ist identisch mit der
  Standard Turing-Maschine bis auf den Fakt wie ein Übergang „L“ an Position 0 gehandhabt wird.
  Wir können fast alle Komponenten der Definition analog übernehmen. Konkret o.B.d.A:

  $ Q' &= Q union.plus {0} \
    Sigma' &= Sigma times {1} \
    Gamma' &= Gamma times {0, 1} \
    square' &= square \
    q_0' &= 0 \
    F' &= F $

  (In der Formalen Definition betrachten wir die dann Bijektionen von $Sigma'$ und $Gamma'$ sodass
  gilt: $Sigma' = Sigma$ und $Gamma' supset.eq Gamma$. Der Übersichtlichkeit halber verwenden wir
  im folgenden aber die etwas inkonsistente Formalisierung.)

  Die Zustandsübergangsfunktion $delta'$ definieren wir nun explizit.

  Zunächst markiert der neue Startzustand die aktuelle Kopfposition als Position $(0)$. Für alle
  $gamma in Sigma$ setzen wir
  $ delta'(0, (gamma, 1)) = (q_0, (gamma, 0), S). $

  Sei nun
  $ delta(q, gamma) = (p, gamma', D) $
  ein Übergang der ursprünglichen Maschine.

  Für $D = R$ definieren wir
  $ delta'(q, (gamma, z)) = (p, (gamma', z), R) $
  für alle $z in {0, 1}$.

  Für $D = S$ definieren wir
  $ delta'(q, (gamma, z)) = (p, (gamma', z), S) $
  für alle $z in {0, 1}$.

  Für $D = L$ definieren wir
  $ delta'(q, (gamma, z)) = cases(
    (p, (gamma', 1), L) & "falls" z = 1,
    (p, (gamma', 0), S) & "falls" z = 0
  ). $

  Die zweite Komponente eines Bandsymbols bleibt dabei unverändert. Da genau die Position $(0)$
  durch den Wert $(0)$ in der zweiten Komponente markiert wird, ersetzt die Konstruktion genau
  diejenigen Linksbewegungen, die von Position $(0)$ aus erfolgen würden, durch ein Stehenbleiben.

  #colbreak()

+ Mit der Vorarbeit von a) ist dieser Teil tatsächlich einfacher. Wir definieren uns:

  $ Q' &= Q times {+, -} union.plus {(0, +), (0, -)} \
    Sigma' &= Sigma times {square} times {1} \
    Gamma' &= Gamma times Gamma times {0, 1} \
    square' &= square \
    q_0' &= 0 \
    F' &= F $

  Ein Eintrag an einer Position $p$ symbolisieren in der Reihenfolge den Wert des Eintrags in der
  ursprünglichen TM in Position $p$, den Wert des Eintrags der ursprünglichen TM in Position $-p$,
  sowie einen Marker der genau dann $0$ ist, wenn $p = 0$ gilt.

  Die Übergangsfunktion definieren wir nun explizit. Analog zu a) markieren wir im ersten Zustand
  die Position $0$ als solche. Also gelte für alle $gamma_1, gamma_2 in Gamma$ erneut:
  $ delta'((0, 0), (gamma_1, gamma_2, 1)) = ((q_0, +), (gamma_1, gamma_2, 0), S). $

  Sei nun
  $ delta(q_1, gamma_1) = (p_1, gamma', D) $
  ein Übergang der ursprünglichen Maschine. Seien nun $q_2 in {+, -}$, sowie $gamma_2 in Gamma$ und
  $gamma_3 in {0, 1}$.

  Ist $gamma_3 = 0$ (Wir befinden uns an Position 0):
  $ delta((q_1, q_2), (gamma_1, gamma_2, 0)) = cases(
    ((p_1, q_2), (gamma', gamma', 0), S) & "falls" D = S,
    ((p_1, +), (gamma', gamma', 0), R) & "falls" D = R,
    ((p_1, -), (gamma', gamma', 0), R) & "falls" D = L
  ) $

  Ist sonst $q_2 = +$ (Wir befinden uns in einem positiven Zustand):
  $ delta((q_1, +), (gamma_1, gamma_2, 1)) = cases(
    ((p_1, +), (gamma', gamma, 1), S) & "falls" D = S,
    ((p_1, +), (gamma', gamma, 1), R) & "falls" D = R,
    ((p_1, +), (gamma', gamma, 1), L) & "falls" D = L
  ) $

  Ist sonst $q_2 = -$ (Wir befinden uns in einem negativen Zustand):
  $ delta((q_1, -), (gamma_1, gamma_2, 1)) = cases(
    ((p_1, -), (gamma', gamma, 1), S) & "falls" D = S,
    ((p_1, -), (gamma', gamma, 1), L) & "falls" D = R,
    ((p_1, -), (gamma', gamma, 1), R) & "falls" D = L
  ) $

  Damit gilt, dass $L(M) = L(M')$, da wir alle Informationen kodieren können und somit den
  Algorithmus direkt analog laufen lassen.\
  Dann führt $M'$ auch genau $cal(O)(n)$ Operationen aus, da jede Operation analog ist.
