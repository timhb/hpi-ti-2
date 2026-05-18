#let VSPACE = 1em
#let HSPACE = 1em

#let exercise_counter = counter("exercise")

#let exercise_ex(name, in_parens, content) = block[
    *#name* (#in_parens) \
]

#let exercise(in_parens, content) = [
    #exercise_counter.step()
    #exercise_ex([Aufgabe #context exercise_counter.display("1")], in_parens, content)
]

#let solution(content) = [
  *Lösung:*\
  #pad(left: HSPACE, top: 0em, content)
  #v(VSPACE)
]


#let template(
  document,
  names: none,
  week: 1,
  group: none,
  course: [Theoretische Informatik I],
  semester: [Sommersemester 2026],
) = {
  set par(justify: true)
  set list(indent: .5em)
  set text(lang: "de")
  
  show link: text.with(fill: blue)
  show heading.where(level: 1): set text(size: 20pt)

  set page(
    footer: context [
      #set align(center)
      #v(1.5em)
      #counter(page).display()
    ], 
    header: context [
      #if here().page() != 1 [
        #course
        #h(1fr)
        Übungsblatt #week – #course
        // #datetime.today().display("[day].[month].[year]")
        // #h(1fr)
        #v(-.5em)
        #line(length: 100%, stroke: .5pt + black)
      ]
    ],
    paper: "a4",
  )

  align(center, rect(inset:   1em)[
    #names #h(1fr) #semester \
    #align(center)[#text(size: 20pt, weight: 600)[Übungsblatt #week - #course]]
    #v(1em)
  ])

  v(2em)

  document
}