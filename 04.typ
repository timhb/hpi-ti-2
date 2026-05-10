#import "template.typ": *
#import "@preview/cetz:0.5.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set enum(numbering: "(a)")
#set list(marker: $dot$)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 3

#let qed = [#h(1fr) $square$]

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  week: week,
  course: "Theoretische Informatik II",
)

#exercise[6 Punkte, Verständnisaufabe][]
+  
  #let (va, vb) = ($v_{v,w}$, $v'_{v,w}$)
  Sei $G = (V, E, c)$ das ungerichtete Flussnetzwerk wie in der Aufgabenstellung beschrieben. Wir konstruieren uns ein Flussnetzwerk $G' = (V', E', c')$. Die Knotenmenge $V'$ ist definiert als:
  $ V' = V union {va, vb} quad "für alle " {v, w} in E $
  und die Kantenmenge $E'$ definiert als:
  $ E' = union.big_({v, w} in E) {(v, va), (w, va), (va, vb), (vb, v), (vb, w)} $
  und die Kapazitätsfunktion $c'$ definiert als:
  $ c'(e') = c(e) $
  für alle $e' in E'$ welche durch $e in E$ erzeugt worden sind. \
  Es handelt sich hierbei um ein klassisches Flussnetzwerk. Das Problem lässt sich also als Max Flow Problem modellieren und lösen. \
  *Beweis*: Wir wissen, dass für einen Fluss $f$ in $G$ $f((v,w)) + f((w, v)) <= c({v,w})$ für alle Kanten ${v,w} in E$. Sei $G'$ nun unser konstruiertes Flussnetzwerk. Nun gilt folgendes für jeden möglichen Fluss $f'$ in $G'$:
  $ 0 <= f'((v, va)) + f'((w, va)) = f'((vb, v)) + f'((vb, w)) <= c'((va, vb)) = c({v,w}) $
  und 
  $ 0 <= f'((v, va)) + f'((vb, w)) <= c({v,w}) $
  sowie 
  $ 0 <= f'((w, va)) + f'(vb, v) <= c({v,w}) $
  Demnach erhält unser konstruiertes Flussnetzwerk die Eigenschaften des ungerichteten Flussnetzwerks. \ 
  Haben wir einen maximum Fluss $f'$ in $G'$ gefunden, so können wir diesen einfach in einen maximum Fluss $f$ in $G$ übersetzen indem wir 
  $ f'((vb, v)) = f((w, v)) $
  und 
  $ f'((vb, w)) = f((v, w)) $
  setzen, und somit
  $ f((v, w)) + f((v, w)) <= c({v,w}) $
  einhalten. #qed

+
  #let (va, vb) = ($v_{"in"}$, $v_{"out"}$)
  Sei $G = (V, E, c)$ das ungerichtete Flussnetzwerk aus (a), wobei zusätzlich für die Kapazitätsfunktion $c: V union E -> NN$ gilt, wir also zusätzlich auch Knotenkapazitäten gegeben haben. \
  _Der Einfachkeit halber ignorieren wir die Übersetzung aus (a) und gehen von einem ungerichteten Flussnetzwerk aus._
  Wir konstruieren uns ein Flussnetzwerk $G' = (V', E', c')$. Die Knotenmenge $V'$ ist definiert als:
  $ V' = union.big_(v in V) {va, vb} $
  und die Kantenmenge $E'$ definiert als:
  $ E' =  union.big_(v in V) {(va, vb)} union {(w, va) | w in delta^-(v)} union {(vb, w) | w in delta^+(v)} $
  und die Kapazitätsfunktion $c'$ definiert als:
  $ c'((va, vb)) = c(v) quad "für alle " v in V $
  Es handelt sich hierbei um ein klassisches Flussnetzwerk. Das Problem lässt sich also als Max Flow Problem modellieren und lösen. \
  *Beweis*: Sei $f$ ein Fluss in $G$. Sei $f^-: V -> NN, v mapsto sum_(w in delta^-(v)) f((w, v)),  quad f^+: V -> NN, v mapsto sum_(w in delta^+(v)) f((v, w))$. Es muss gelten:
  $ f^-(v) = f^+(v) <= c(v) quad "für alle " v in V $
  Wir definieren uns nun $f'^-, f'^+$ äquivalent zu $G'$ und einen Fluss $f'$. Es folgt:
  $ 0 <= f'^-(va)) = f'^+(vb) <= c'(va, vb) = c(v) quad "für alle " v in V $
  Somit ist der Fluss durch einen Knoten $v in V$ begrenzt durch die in $G$ angegebene Knotenkapazität. \
  Haben wir einen maximum Fluss in $G'$ gefunden, so lässt sich dieser einfach nach $G$ übersetzen, indem Knoten $va$ und $vb$ zu $v in V$ kontrahiert werden. #qed

+ 
  _Wir nutzen weiterhin Definitionen aus den vorherigen Aufgaben._
  Sei $G = (V, E, c, b)$ ein gerichtetes Flussnetzwerk mit $b: V -> ZZ$. Es soll nun entschieden werden ob ein Fluss $f$ in $G$ existiert für den für alle Knoten gilt:
  $ f^-(v) - f^+(v) = b(v) $
  Wir konstruieren uns ein Flussnetzwerk $G' = (V', E', c')$. Die Knotenmenge $V'$ ist definiert als:
  $ V' = V union {s, t} $ 
  und die Kantenmenge $E'$ definiert als:
  $ E' = E union {(s, v) | v in V and b(v) < 0} union {(v, t) | v in V and b(v) > 0} $
  und die Kapazitätsfunktion $c'$ definiert als: 
  $ c'(e) = c(e) quad "für alle " e in E $ 
  $ c'((s, v)) = -b(v) quad "für alle " v in V and b(v) < 0 $ 
  $ c'((v, t)) = b(v) quad "für alle " v in V and b(v) > 0 $
  Es handelt sich hierbei um ein klassisches Flussnetzwerk. Das Problem lässt sich also als Max Flow Problem modellieren und lösen. Dabei muss für den maximum Fluss $f'$ in $G'$ gelten, dass dieser gesättigt ist, also alle ausgehenden Kanten von $s$ sowie eingehende Kanten nach $t$ ausfüllt. \
  *Beweis*: Sei $f'$ ein gesättigter maximum Fluss in $G'$. Es gibt nun drei Fälle für $v in V$: \
  *Fall 1* ($b(v) < 0$): Für $f'$ gilt:
  $ f'^-(v) = f'^+(v) $
  $ f'^-(v) - f'((s, v)) - f'^+(v)  = f'^-(v) - (- b(v)) - f'^+(v) = b(v) $
  *Fall 2* ($b(v) > 0$): Für $f'$ gilt:
  $ f'^-(v) = f'^+(v) $
  $ f'^-(v) - (f'^+(v) - f'((v, t))) = f'^-(v) - f'^+(v) + b(v) = b(v) $
  *Fall 3* ($b(v) = 0$): Für $f'$ gilt:
  $ f'^-(v) = f'^+(v) $
  $ f'^-(v) - f'^+(v) = 0 = b(v) $
  Da $G$ dem induzierten Teilgraphen $G' - {s, t}$ entspricht, wodurch die Ungleichung stimmt ist der Bedarf für jeden Knoten $v in V$ erfüllt. \
  Ist der maximum Fluss nicht gesättigt so stimmt der Bedarf für jeden Knoten $v in V$ nicht, da es ein $f'((s,v))!= -b(v) $ oder $f'((v,t)) != b(v)$ geben muss und somit die obigen Gleichungen nicht erfüllt wären. #qed
  
+ 

#exercise[5 Punkte, Modellierungsaufgabe][]

#exercise[5 Punkte, Beweisaufgabe][]