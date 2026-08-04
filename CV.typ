#import "template.typ": *

#let title = "Ruslan Prakapchuk"

#show: project.with(
  title: title,
)

#let gg(..children) = context grid(columns: (measure(text(weight: "semibold", leading*3, " Ruslan")).width, auto), row-gutter: leading, ..children)

#let section(body) = [
  #v(leading*3)
  #text(size: leading*2, tracking: leading/2, upper(body))
  #v(leading)
]

#let entry(year, role, description) = [
  #v(leading)
  #gg(emph[#year], strong[#role], [], description)
]

// #section[Personal information]
#v(leading*2)

#gg(
  emph[aka],       [Ruslan Pr#highlight("o")k#highlight("o")pchuk],
  emph[hybrid],    [Sydney, Australia],
  emph[remote],    [any timezone],
  emph[email],     link("mailto:fer.obbee@gmail.com"),
  emph[github],    link("https://github.com/ul"),
  emph[phone],     [+61 408 703 246]
)

//#section([Profile])

#v(leading*2)
#gg(emph[profile], [
I'm a hands-on Principal Software Engineer focused on making complex systems understandable and adaptable.
I turn ambiguous engineering problems into decidable questions, then use investigation, evidence, and working code to establish architecture, patterns, and tools that help teams act with confidence.
My deepest experience is in large-scale frontend architecture and complex web applications, including performance, scalability, and pragmatic adoption of new technologies.
I'm particularly drawn to developer tools and technically deep products where better abstractions make sophisticated capabilities easier to understand and control.
])

#section[Work experience]

#entry([2020--Present], [Principal Software Engineer \@ Atlassian], [
I support teams across Jira, mostly working on Premium and Enterprise experiences.
My current focus is on platform adoption, efficient decision-making, quality uplift, and ownership system improvements.
I regularly enjoy deep engineering challenges in the frontend space, and work on efficient and responsible use of AI in development.
In the past, I also helped establish foundations for performance and scalability, operational excellence and all things frontend in multiple teams.
])

#entry([2017--2020], [Senior Software Engineer \@ Atlassian], [
I led frontend engineering of Advanced Roadmaps (formerly Portfolio for Jira) since its inception as Portfolio 3.0 through the release for Jira Server and onto
Jira Cloud. As a member of a fantastic team, I had the opportunity to contribute to all stages of product development.

- Designed and documented app architecture.
- Organized regular knowledge-sharing sessions.
- Facilitated cross-team collaboration and alignment.
- Led development of several high-impact features.
- Implemented a series of performance optimizations.
- Advised on and aided in process improvements.
])

#entry([2006--2017], [Various roles], [
For more details on my previous roles, please feel free to reach out to me. Otherwise, enjoy the time saved ;-)
])

#pagebreak(weak: true)

#section([Volunteer experience])

#entry([2024--Present], [RFS Volunteer \@ Mount Wilson], [
I'm an active NSW Rural Fire Service member.
])

#entry([2016--2017], [CS Teacher \@ IT2School Odesa], [
I taught two Computer Science & Python courses for children ages 9 to 18.
])

#section[Misc]

#gg(
  emph[Languages],
  gg([English],    [Advanced (CEFR level C1)],
     [Russian],    [Native],
     [Belarusian], [Native])
)

#v(leading*2)
#gg(emph[Updated on], datetime.today().display())
