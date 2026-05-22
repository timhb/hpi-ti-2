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

  + (2 Punkte) $r + s$

    *Lösung:*

  + (2 Punkte) $r^*$

    *Lösung:*

