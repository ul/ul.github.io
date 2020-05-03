#lang pollen

◊(require pollen/pagetree)

◊h1{Hello}

◊p{My name is Ruslan Prakapchuk. ◊sup[#:id "note-1-ref"]{◊link["#note-1"]{*}}}
◊p{I appreciate minimalism, experimental music and reliable software.}

◊h2{Would you like to...}
     
◊table{
  ◊row{
    ◊cell{read blog}
    ◊cell{◊link["#Archive"]{Archive}}
  }
  ◊row{
    ◊cell{read code}
    ◊cell{◊link["https://github.com/ul"]{GitHub}}
  }
  ◊row{
    ◊cell{hear noise}
    ◊cell{
      ◊link["https://karusduo.bandcamp.com/releases"]{Bandcamp},
      ◊link["https://soundcloud.com/ruslan-prokopchuk"]{SoundCloud}}
  }
  ◊row{
    ◊cell{head hunt}
    ◊cell{
      ◊link["CV.pdf"]{CV},
      ◊link["https://www.linkedin.com/in/ruslan-prakapchuk/"]{LinkedIn}}
  }
  ◊row{
    ◊cell{get in touch}
    ◊cell{
      ◊link["mailto:fer.obbee@gmail.com"]{fer.obbee@gmail.com},
      ◊link["http://twitter.com/northern_witch"]{@northern_witch}},
      ◊link["https://x.ai/calendar/ul"]{calendar}}
  }
}

◊h2[#:id "Archive"]{Archive}

◊items{
  ◊(for/splice ([node (other-siblings 'index.html
                                      (dynamic-require "index.ptree" 'doc))])
               (item (link (symbol->string node)
                           (select 'h1 (get-doc node)))))}

◊spacer[]

◊h6{Footnotes}

◊support[#:id "note-1"]{◊sup{◊link["#note-1-ref"]{^}} I'm also known as Ruslan Pr◊highlight{o}k◊highlight{o}pchuk}
