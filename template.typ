#let leading = 0.65em

#let project(
  title: "",
  body,
) = {
  // Set the document's basic properties.
  set document(title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Atkinson Hyperlegible", lang: "en", fill: luma(10%))
  set par(leading: leading)

  // Title row.
  align(left)[
    #block(text(weight: "semibold", leading*3, title))
  ]

  // Main body.
  set par(justify: true)

  body

  align(right)[
    #v(leading*3)
    #emph[Updated on #datetime.today().display()]
  ]
}
