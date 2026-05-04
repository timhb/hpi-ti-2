#import "template.typ": *
#import "@preview/cetz:0.4.2": *

#set enum(numbering: "a)")
#set list(marker: $dot$)
#set text(lang: "de", font: "CMU Serif")
#let week = 3

#let qed = [#h(1fr) $square$]

#show: template.with(
  names: [Simon Bachran, Sven Hafeman, Tim Beier],
  week: week,
  course: "Theoretische Informatik II",
)

#exercise[4 Punkte, Verständnisaufabe][]


#exercise[6 Punkte, Modellierungsaufgabe][]


#exercise[6 Punkte, Beweisaufgabe][]

