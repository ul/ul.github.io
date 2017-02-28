#lang pollen

◊define-meta[date]{2017-02-28}

◊topic{Chez Scheme ◊date[metas]}

◊main{

This is the first post from ◊code{TIL} series, where I'm going to capture my
discoveries. They would be a kind of short references to either my progress or
wonderful things encountered.

And today's one is to ◊link["https://cisco.github.io/ChezScheme/"]{Chez Scheme}.
It's one of ◊link["http://ecraven.github.io/r7rs-benchmarks/benchmark.htm"]{the
fastest} industrial Scheme implementations over there. And
◊link["http://racket-lang.org/"]{Racket} is going to be rewritten on top of it
--- see Matthew Flatt's
◊link["https://groups.google.com/forum/#!msg/racket-dev/2BV3ElyfF8Y/4RSd3XbECAAJ"]{announce}
=)

I'm going to keep an eye on it, perhaps one day I'll use it for either
◊ul{
  ◊li{high-performance scripting}
  ◊li{live coding}
}}

I dabbled with it today just a little, mostly trying FFI. Didn't complete with
◊link["http://libsound.io/"]{libsoundio} front page example yet, but
documentation is great and wrapping mechanism is both thin and versatile.

I imagine Chez (or Racket built on top of it) to be a good foundation for live
coding environment. While ◊link["http://extempore.moso.com.au/"]{Extempore's}
approach to have C-like xtlang is reasonable, I think that having optimizing
Scheme compiler with efficient GC and GC/memory control should be enough
soft-realtime-wise. We could trade maintaining own compiler for full-blown
standard-compliant mature Scheme one.
