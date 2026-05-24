#import "template.typ": *
#import "@preview/cetz:0.5.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 6

#let qed = [#h(1fr) $ square$]

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  week: week,
  course: "Theoretische Informatik II",
)

#exercise[5 Punkte, Verständnisaufgabe][]
Gib einen regulären Ausdruck für die folgenden Sprachen über dem Alphabet $Sigma = {0, 1, 2, dots, 9}$ an:

  + (1 Punkt) $L_1 = {w | w " ist eine positive ganze Zahl"}$, das heißt $L_1 = {1, 2, dots}$.

    *Lösung:*

    $A = (1+2+3+4+5+6+7+8+9)$\
    $B = (0+1+2+3+4+5+6+7+8+9)^*$\
    $L_1 = A B$

  + (1 Punkt) $L_2 = {w | w " ist eine gerade Zahl"}$, das heißt $L_2 = {0, 2, 4, dots}$.

    *Lösung:*

    $C = (0+2+4+6+8)$\
    $L_2 = C+L_1 C$

  + (1 Punkt) $L_3 = {w | w " enthält nicht die Ziffer 7"}$, das heißt $L_3 = Sigma^* without {7, 17, dots, 70, dots}$.

    *Lösung:*

    $L_3 = (0+1+2+3+4+5+6+8+9)^*$

  + (1 Punkt) $L_4 = {w | w " enthält die Ziffer 5 nicht genau einmal"}$, das heißt $L_4 = Sigma^* without {5, 15, dots, 54, 56, dots}$.

    *Lösung:*

    $D = (0+1+2+3+4+6+7+8+9)^*$\
    $L_4 = D + D 5 D 5 D$

  + (1 Punkt) $L_5 = {w | w " ist durch 4 teilbar"}$, das heißt $L_5 = {0, 4, 8, dots}$.

    *Lösung:*

    $E = (0+4+8)$

    $F = (&12+14+20+24+28+32+36+40+44+48+52+56+60+64+68+72+\
    &76+80+84+88+92+96)$

    $L_5 = E+F+(A B^* (0+E)+F)$

#pagebreak()
#exercise[6 Punkte, Knobelaufgabe][]
Zeige, dass die folgenden Sprachen über dem Alphabet $Sigma = {0, 1}$ regulär
sind, indem du jeweils einen DEA angibst, der die Sprache akzeptiert.

  _Anmerkung:_ Vergiss nicht zu begründen, warum dein DEA die genannte Sprache
  akzeptiert. Ein Induktionsbeweis ist _nicht_ nötig, eine stichhaltige
  Begründung jedoch schon. Diese umfasst insbesondere eine Erklärung, welche
  gelesenen Präfixe den Automaten in welchen Zustand bringen.

  + (1 Punkt) $L_6 = {w in {0, 1}^* | w " enthält 010 als Teilwort"}$

    *Lösung:*

  + (2 Punkte) $L_7 = {w in {0, 1}^* | w " enthält höchstens zwei 1en"}$

    *Lösung:*

  + (2 Punkte) $L_8 = {w in {0, 1}^* | w " als Binärzahl aufgefasst ist durch 5 teilbar"}$ \
    (Das niedrigste Bit steht dabei ganz rechts, das höchste Bit ganz links. Führende 0en sind erlaubt. Das leere Wort $epsilon$ ist durch 5 teilbar.)

    *Lösung:*
    Sei $n in NN$. Aus 
    $ 2^0 mod 5 = 1 $
    $ 2^1 mod 5 = 2 $
    $ 2^2 mod 5 = 4 $
    $ 2^3 mod 5 = 3 $
    $ 2^4 mod 5 = 1 $
    wissen wir, dass jede $4n$-te Binärstelle (von rechts gelesen, mit 0 indiziert) die finale Zahl um $1$ im Modulo 5, erhöht. Bei $1 + 4n$ um $2$, $2 + 4n$ um $4$ und bei $3 + 4n$ um 3. \
    Unser DEA wird also 4 verschiedene Zustände sich merken müssen. Am Ende wollen wir wissen, ob unsere finale Zahl Modulo 5 gleich 0 ergibt, also durch 5 teilbar ist. Dabei wissen wir, dass jede gelesene 0 das finale Modulo 5 nicht verändert und jede gelesene 1 jeweils für unser aktuelles Modulo es um eine bestimmte Anzahl erhöht, je nachdem an welcher Stelle es steht. Wir bekommen also folgenden DEA, wobei dies nur eine Skizze ist mit folgenden Beschränkungen, die lediglich der Darstellung dienen: die obere und untere Zeile sind dieselben Zustände, der linke und der rechte "DEA" bilden gemeinsam einen DEA. 
    #image("assets/6.2.c.png", width: 20em)
    Dabei ist jeder Zustand 0 (die genaue Benennung wurde hier als nicht notwendig betrachtet) ein akzeptierender Zustand des DEAs. Allerdings funktioniert dies nur, wenn das Wort $w$ von rechts nach links eingelesen wird, es wird aber von links nach rechts eingelesen. \
    Wir drehen also zuerst alle Pfeile um, da wir ja jetzt immer den aktuellen Index der Binärzahl um 1 verringern mit jedem Schritt, statt ihn zu erhöhen. Wir können allerdings auch nicht wissen um welchen Index es sich denn gerade handelt, wenn wir das Wort $w$ einlesen. Wir müssen also von allen möglichen zu Beginn ausgehen und somit mit mehreren Startzustände in allen Ebenen bei 0 starten. Erst am Ende, wenn wir das Wort eingelesen haben, können wir uns sicher sein um welchen es sich zu Beginn gehandelt hat. Für uns ist also nur die oberste/unterste Zeile relevant, da wenn wir in dieser enden wissen, dass der "Pfad" der dorthin geführt hat an der richtigen Stelle begonnen hat. Finaler Endzustand wird also die 0 in der obersten/untersten Zeile. Alle anderen werden abgelehnt. Nun wäre der Potenzautomat des aktuell beschriebenen NEAs der gesuchte DEA.
    #image("assets/6.2.c2.png", width: 20em)

#pagebreak()
#exercise[5 Punkte, Knobelaufgabe][] 
Sei $a$ ein Symbol. Seien $r, s$ Reguläre Ausdrücke, für die du jeweils auch
einen äquivalenten Automaten als Blackbox mit genau einem Start- und einem
Endzustand gegeben hast. Erkläre, wie du einen NEA konstruieren kannst, der
wiederum genau einen Start- und einen Endzustand besitzt, und äquivalent ist zu
den Regulären Ausdrücken ist. #emph[Hinweis:] Die konstruierten Automaten
müssen nicht minimal sein.

  + (1 Punkt) $a$

    *Lösung:*
    #image("6.3.a.png", width: 10em)
    Nach der Definition von RA gilt: $L({a}) = {a}$. Der Automat nimmt eindeutig nur das Wort $w = {a}$ an. Jedes andere Symbol würde sofort in den $emptyset$-Zustand kommen, sowie jedes weitere Symbol in $w$ außer das eine $a$. Somit ist er identisch zu $a$.

  + (2 Punkte) $r + s$

    *Lösung:*
    #image("6.3.b.png", width: 15em)
    Nach der Definition von RA gilt: $L(r + s) = L(r) union L(s)$. Der Automat läuft durch $epsilon$-Übergang beide Blöcke für $r$ und $s$ durch. Kommt einer der beiden Blöcke in einen akzeptierenden Zustand, so ist der 
    Automat durch $epsilon$-Übergang auch in einem akzeptierenden Zustand. Ist dies nicht der Fall, kann der Automat auch nicht in einen akzeptierenden Zustand kommen. Somit ist er identisch zu $r + s$.

  + (2 Punkte) $r^*$

    *Lösung:*
    #image("6.3.c.png", width: 15em)
    Nach der Definition von RA gilt: $L(r^*) = L(r)^*$. Der Automat akzeptiert ${epsilon}$, da der Startzustand bereits ein akzeptierender Zustand ist. Desweiteren kann er per $epsilon$-Übergang beliebig oft $r$ durchlaufen und per erneuten $epsilon$-Übergang dies beliebig oft wiederholen. Nur wenn es eine abzählbare Anzahl an $r$ in $w$ gibt, akzeptiert der Automat also $w$. Somit ist er identisch zu $r^*$.