#import "template.typ": *

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 8

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  name: "Übungsblatt",
  number: week,
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Verständnisaufgabe][
  + (1 Punkt) Sei eine Grammatik $G_a$ durch die Regeln $S -> S + S | 42$ gegeben, wobei $S$ das
    einzige Nichtterminal ist. Gib ein Wort aus $L(G_a)$ an, welches zwei unterschiedliche
    Ableitungen hat.

    *Lösung:*

    Sei $G_a = ({S}, {42, +}, P, S)$ wobei die Produktionsregeln $S -> S + S$ und $S -> 42$ gelten.
    Seien $sigma, sigma'$ zwei unterschiedliche Ableitungen für $w = 42 + 42$. Es gilt
    $ sigma = ((S), (S + S), (42 + S), (42 + 42)) $
    $ sigma' = ((S), (S + S), (S + 42), (42 + 42)) $
    Man sieht, dass hier nur valide Produktionsregeln angewendet worden sind, weshalb $w$ in der
    Grammatik ist. Zudem sind beide Ableitungen unterschiedlich, erzeugen aber dasselbe Wort.

  + (1 Punkt) Gib ein Wort aus $L(G_b)$ an, welches zwei unterschiedliche Ableitungsbäume hat,
    welche zwei Berechnungen mit unterschiedlichem Ergebnis liefern (wenn man abgeleitete
    Teilausdrücke implizit klammert).

    *Lösung:*

    Sei $G_b = {{S}, {42, +, dot}, P, S}$ mit Produktionsregeln $S -> S + S$, $S -> S dot S$, $S ->
    42$. Seien $sigma, sigma'$ zwei unterschiedliche Ableitungen für $w = 42 + 42 dot 42$. Es gilt
    $ sigma = ((S), (S + S), (S + (S dot S), ... (42 + (42 dot 42))) $
    $ sigma' = ((S), (S dot S),((S + S) dot S), ... ((42 + 42) dot 42)) $
    _Die Klammern dienen lediglich der Lesbarkeit, die Wörter sind dennoch gleich_. \
    $sigma$ und $sigma'$ sind eindeutig unterschiedlich. Zudem ergibt die Berechnung für $sigma$
    1.806 und die für $sigma'$ 3.528, sie sind somit auch unterschiedlich.

    #colbreak()

  + (2 Punkte) Konstruiere eine Grammatik $G_c$, welche die gleichen Worte wie $G_b$ akzeptiert,
    aber die Operator-Reihenfolge beachtet (Multiplikation bindet stärker als Addition). Mit anderen
    Worten, jede Ableitung für ein Wort sollte nach arithmetischer Auswertung (mit impliziter
    Klammerung) zum gleichen Ergebnis kommen.

    *Lösung:* 

    Sei $G_c = {{S, T}, {42, + , dot}, P, S}$ eine Grammatik mit den Produktionsregeln $P$:

    $S -> S + S | T$\
    $T -> 42 dot 42 | 42$.

    $G_c$ akzeptiert dieselben Wörter wie $G_b$, da in beiden beliebig wiederholte
    Aneinanderreihungen von 42 möglich sind, die durch jeweils ein + oder $dot$ getrennt sind. In
    $G_c$ ist es anders als in $G_b$ jedoch nicht möglich, eine Summe als letzten nichtterminalen
    Ableitunsschritt zu erzeugen. Somit ist es unmöglich, eine Ableitung wie "$(42+42) dot 42$" zu
    erzeugen, in der eine Summe stärker bindet, als ein Produkt. Es gibt auch in $G_c$ Wörter, die
    durch mehrere Ableitungen mit unterschiedlichen impliziten Klammerungen erzeugt werden können
    (z.B. "$((42 dot 42) dot 42)+42$" und "$(42 dot (42 dot 42)) + 42$"). Diese erzeugen aber durch
    Akkusativität von + und $dot$ stets dieselben Ergebnisse.
]

#v(2em)

#exercise[6 Punkte, Beweisaufgabe][
  Beweise mit dem Pumping-Lemma, dass die folgenden Sprachen nicht regulär sind:

  + $L_a = { c^p | p "ist Primzahl" }$

    *Lösung:*
    Sei $k$ beliebig und $w = c^(p_k)$, wobei $p_k$ die nächst größte Primzahl nach $k$ ist (dies
    geht da unendlich viele Primzahlen),  womit $|w| >= k$. Nun gilt für jede Aufteilung von $w$ in
    $x y z$, dass $|y| != 0$. Sei also für jede beliebige Aufteilung $a = |x z|$ und $b = |y|$ mit
    $a + b = p_k$. Wählen wir also nun $i = (p_k b - a)$. Somit ist $i$ nie negativ. Dann gilt
    $ x y^i z = c^(p_k b - a + a) = c^(p_k b) $
    Da $p_k b$ keine Primzahl ist, ist $x y^i z$ nicht in $L_a$. Nach dem Pumping-Lemma ist $L_a$
    also nicht regulär. #qed
    
  + $L_b = { a^i b^j c^k d^l | i, j, k, l in NN and (i = k or j = l) }$

    *Lösung:*
    Sei $k'$ beliebig und $w = a^k' b^k' c^k' d^k'$. Es gilt $|w| >= k'$ und $w in L$. Teilen wir
    also $w$ in $x y z$ auf, so kann aufgrund von $|x y| <= k'$, $y$ nur aus $a$ bestehen. Sei also
    $i' = 2$. Dann gilt
    $ x y^i z = a^(k'') b^k' c^k' d^k' "mit" k' < k'' <= 2k' $  
    Da $k'' != k'$ ist $x y^i z$ nicht in $L_b$. Nach dem Pumping-Lemma ist $L_b$ also nicht
    regulär. #qed

]

#pagebreak()
#exercise[6 Punkte, Knobelaufgabe][
  Zeige oder widerlege, dass die folgenden Sprachen regulär sind. Nutze hierfür die
  Abschlusseigenschaften regulärer Sprachen.

  + $L_a = { a^n b^m | n, m in NN and n != m }$

    *Lösung:*
    Angenommen $L_a$ sei regulär. Wir wissen, dass $L = {a^n b^m | n, m in NN}$ regulär ist. Damit
    wäre aber auch $L \\ L_a = {a^n b^n | n in NN}$ regulär, dies ist ein Widerspruch. \
    Demnach muss $L_a$ nicht regulär sein. #qed

  + $L_b = { a^n b^m c^k | n, m in NN and n + m = k }$

    *Lösung:*
    Angenommen $L_b$ sei regulär. Wir wissen, dass $L = {a^n c^m | n,m in NN}$ regulär ist, _$Sigma$
    kann schließlich beliebig sein und muss nicht zwingend ${a,b}$ sein._ Daraus folgt dass $L inter
    L_b = {a^n b^0 c^k | n, k in NN and n + 0 = k} = {a^n c^k | n, m in NN and n = m}$ auch regulär
    sein muss. Diese ist aber bekannterweise nicht regulär. Wir haben also einen Widerspruch
    erzeugt. \
    Demnach muss $L_b$ nicht reguläre sein. #qed

  + $L_c = { a^n b^m | n, m in NN and n != 41337 and m != 42024 }$

    *Lösung:*
    Wir wissen, dass $L = {a^n b^m | n,m in NN}$ regulär ist. Zudem ist $L' = {a^n b^m | n, m in NN
    and n = 41337 and m = 42024}$ regulär, da diese Sprache nur endlich viele Zustände braucht. Es
    folgt $L \\ L' = L_c$, $L_c$ ist somit auch regulär. #qed

  + $L_d = { a^n b^m | n, m in NN and n <= m }$

    *Lösung:*
    Angenommen $L_d$ sei regulär. Wir wissen, dass $L = {b}$ regulär ist. Nach den
    Abschlusseigenschaften ist auch $L = L_d dot b = { a^n b^(m + 1) | n,m in NN and n <= m}$
    regulär. Nun gilt $L_d \\ L = {a^n b^n | n in NN}$, da $L$ alle $a^n b^m$ enthält wo $n < m$
    gilt. ${a^n b^n | n in NN}$ ist aber bekannterweise nicht regulär. Wir haben also einen
    Widerspruch erzeugt. \
    Demnnach muss $L_d$ nicht regulär sein. #qed
]
