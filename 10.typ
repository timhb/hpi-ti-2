#import "template.typ": *
#import "@preview/cetz:0.5.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set enum(numbering: "(a)")
#set list(marker: $ dot $)
#set scale(reflow: true)
#set text(lang: "de", font: "CMU Serif")
#let week = 10

#let qed = [#h(1fr) $ square$]

#show: template.with(
  names: [Simon Bachran, Sven Hafemann, Tim Beier],
  number: week,
  course: "Theoretische Informatik II",
)


#exercise[2 Punkte, Beweisaufgabe][
  #let lqp = math.attach($<=$, br: "p")

  Beweise, dass $lqp$ eine Quasiordnung ist. \ \
  *Reflexivität*: Sei $f$ die Identitätsfunktion. Diese ist durch eine deterministische polynomialzeitbeschränkte Turingmaschine berechenbar. Es gilt nun offensichtlich für eine beliebige Sprache $L subset.eq Sigma^*$ 
  $ x in L <=> f(x) in L $
  Somit gilt $L lqp L$. Da $L$ beliebig ist, gilt dies für alle Sprachen, somit ist $lqp$ reflexiv. \ 
  #v(0.5em)
  *Transitivität*: Sei $A, B, C subset.eq Sigma^*$ mit $A lqp B, B lqp C$. Es gibt nun ein $f$ und $f'$, welche jeweils durch deterministische polynomialzeitbeschränkte Turingmaschinen berechenbar sind mit
  $ x in A <=> f(x) in B " und " x in B <=> f'(x) in C $
  Da der Output von $f$ als Input für $f'$ genommen werden kann und beide Funktionen polynomialzeitbeschränkt sind, ist auch $f circle.small f'$ durch eine deterministische polynomialzeitbeschränkte Turingmaschine berechenbar. Somit gilt für $f'' = f circle.small f'$
  $ x in A <=> f''(x) in C $
  Da $A, B, C$ beliebig sein dürfen, ist $lqp$ transitiv. \ 
  #v(0.7em)
  Da $lqp$ sowohl reflexiv als auch transitiv ist, handelt es sich um eine Quasiordnung. #qed
]


#pagebreak()
#exercise[ Punkte, ][]

#pagebreak()
#exercise[ Punkte, ][]

#pagebreak()