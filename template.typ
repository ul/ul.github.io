#let project(
  title: "",
  body,
) = {
  // Set the document's basic properties.
  set document(title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Atkinson Hyperlegible", lang: "en")

  // Title row.
  align(left)[
    #block(text(weight: 700, 1.75em, title))
  ]

  // Main body.
  set par(justify: true)

  body

  align(right)[
    #v(1em)
    #emph[Updated on #datetime.today().display()]
  ]
}