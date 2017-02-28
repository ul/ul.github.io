#lang pollen

◊define[point-size 20]
◊define[line-height 1.35]
◊define[min-line-length 45]
◊define[line-length 60]
◊define[text-color "#222"]
◊define[background-color "#fffff8"]
◊define[code-background-color "#fcfcf8"]
◊define[code-border-color "#f0f0f8"]
◊define[link-background-color "#afeeee"]
◊define[margin-width 12]

html, body {
  font-size: ◊|point-size|px;
  width: 100vw;
  min-height: 100vh;
}

body {
  font-family: 'PT Serif', serif;
  line-height: ◊|line-height|;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-rendering: optimizeLegibility;
  font-feature-settings: 'liga' 1, 'kern' 1;
  color: ◊|text-color|;
  background-color: ◊|background-color|;
}

.content {
  flex: 1;
  /* min-width: ◊|line-length|ch; */
  max-width: ◊|line-length|ch;
  padding: 0;
  position: relative;
  margin: 3em ◊|margin-width|rem 0 ◊|margin-width|rem;
}

.topic {
  text-transform: uppercase;
  padding-top: 0em;
  margin-top: 0;
}

.highlight {
  width: 100%;
  margin-right: 4rem;
  background-color: ◊|code-background-color|;
  padding: 0.5rem;
  border-top: 1px solid ◊|code-border-color|;
  border-bottom: 1px solid ◊|code-border-color|;
  margin-bottom: 1.2rem;
  /* font-size: ◊|(- point-size 4)|px; */
  font-size: 80%;
}

.highlight .linenos {
  display: none;
}

pre, .code, .mono, .gist * {
  font-family: 'PT Mono', monospace;
}

.gist .gist-meta {
  display: none;
}

◊; syntax colors adapted from Racket documentation
◊define[paren-color]{#888}
◊define[comment-color]{#c2741f}
◊define[keyword-color]{#07a}
◊define[name-color]{#444}
◊define[literal-color]{#275}

.code {
  color: ◊|keyword-color|;
  background-color: ◊|code-background-color|;
}

◊; styling classes for Pygments
.p { color: ◊|paren-color|;}
.c { color: #998; font-style: italic; } /* Comment */
.err { color: red; font-style: italic; } /* Error */
.o { color: #000; } /* Operator */
.cm { color: ◊|comment-color|; font-style: italic } /* Comment.Multiline */
.cp { color: ◊|comment-color|; font-style: italic } /* Comment.Preproc */
.c1 { color: ◊|comment-color|; font-style: italic } /* Comment.Single */
.cs { color: ◊|comment-color|; font-style: italic } /* Comment.Special */
.gd { color: #000; background-color: #ffdddd } /* Generic.Deleted */
.ge { color: #000; font-style: italic } /* Generic.Emph */
.gr { color: #a00; } /* Generic.Error */
.gh { color: #999; } /* Generic.Heading */
.gi { color: #000; background-color: #ddffdd } /* Generic.Inserted */
.go { color: #888; } /* Generic.Output */
.gp { color: #555; } /* Generic.Prompt */
.gs { } /* Generic.Strong */
.gu { color: #aaa; } /* Generic.Subheading */
.gt { color: #a00; } /* Generic.Traceback */
.k { color: ◊|keyword-color|; } /* Keyword */
.kc { color: ◊|keyword-color|; } /* Keyword.Constant */
.kd { color: ◊|keyword-color|; } /* Keyword.Declaration */
.kn { color: ◊|keyword-color|; } /* Keyword.Namespace */
.kp { color: ◊|keyword-color|; } /* Keyword.Pseudo */
.kr { color: ◊|keyword-color|; } /* Keyword.Reserved */
.kt { color: ◊|keyword-color|; } /* Keyword.Type */
.na { color: ◊|name-color|; } /* Name.Attribute */
.nb { color: ◊|keyword-color|; } /* Name.Builtin */
.nc { color: ◊|name-color|; } /* Name.Class */
.no { color: ◊|name-color|; } /* Name.Constant */
.nd { color: ◊|name-color|; } /* Name.Decorator */
.ni { color: ◊|name-color|; } /* Name.Entity */
.ne { color: ◊|name-color|; } /* Name.Exception */
.nf { color: ◊|name-color|; } /* Name.Function */
.nl { color: ◊|name-color|; } /* Name.Label */
.nn { color: ◊|name-color|; } /* Name.Namespace */
.nt { color: ◊|name-color|; } /* Name.Tag */
.nv { color: ◊|name-color|; } /* Name.Variable */
.ow { color: ◊|name-color|; } /* Operator.Word */
.w { color: #bbb; } /* Text.Whitespace */
.m { color: ◊|literal-color|; } /* Literal.Number */
.mf { color: ◊|literal-color|; } /* Literal.Number.Float */
.mh { color: ◊|literal-color|; } /* Literal.Number.Hex */
.mi { color: ◊|literal-color|; } /* Literal.Number.Integer */
.mo { color: ◊|literal-color|; } /* Literal.Number.Oct */
.s { color: ◊|literal-color|;} /* Literal.String */
.sb { color: ◊|literal-color|; } /* Literal.String.Backtick */
.sc { color: ◊|literal-color|; } /* Literal.String.Char */
.sd { color: ◊|literal-color|; } /* Literal.String.Doc */
.s2 { color: ◊|literal-color|; } /* Literal.String.Double */
.se { color: ◊|literal-color|; } /* Literal.String.Escape */
.sh { color: ◊|literal-color|; } /* Literal.String.Heredoc */
.si { color: ◊|literal-color|; } /* Literal.String.Interpol */
.sx { color: ◊|literal-color|; } /* Literal.String.Other */
.sr { color: ◊|literal-color|; } /* Literal.String.Regex */
.s1 { color: ◊|literal-color|; } /* Literal.String.Single */
.ss { color: ◊|literal-color|; } /* Literal.String.Symbol */
.bp { color: #999; } /* Name.Builtin.Pseudo */
.vc { color: #077; } /* Name.Variable.Class */
.vg { color: #077; } /* Name.Variable.Global */
.vi { color: #077; } /* Name.Variable.Instance */
.il { color: #099; } /* Literal.Number.Integer.Long */

◊;{
FIXME c&p'ed from http://practicaltypography.com/, tune!
}

a {
  text-decoration: none;
  color: inherit;
  transition-property: background;
  transition-duration: 0.2s;
}

a:active {
  color: #777;
}

a:after {
  position: relative;
  content: "\FEFF°";
  margin-left: 0.10em;
  font-size: 90%;
  top: -0.10em;
  color: #933;
}

a[name]:after{ content: none; }

a.no-symbol-before:hover {
  background: none;
}

a.no-symbol-before:after {
  content: none;
}

div > a:after, li a:after {
  content: none;
}

a:hover {
  background-color: ◊|link-background-color|;
  transition-property: background;
  transition-duration: 0.2s;
  border-radius: 0.35rem;
}

.box-link {
  text-transform: uppercase;
  padding: 1rem;
  color: black;
  opacity: 0.5;
  font-size: 80%;
  transition-property: opacity;
  transition-duration: 0.2s;
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 1;
}

.nav > div {
  width: 33.333%;
  display: flex;
}

.box-link.previous {
  text-align: right;
}

.box-link.top {
  text-align: center;
}

.box-link.next {
  text-align: left;
}

.box-link:hover {
  border-radius: 0.1rem;
  opacity: 1;
  transition-property: opacity;
  transition-duration: 0.2s;
}

.box-link:not(:first-child) {
  border-left: 1px dotted ◊|text-color|;
}

.nav {
  display: flex;
  width: 100%;
  /* min-width: ◊|line-length|ch; */
  max-width: ◊|line-length|ch;
  margin: 3em ◊|margin-width|rem 0 ◊|margin-width|rem;
}

@media all and (max-width: ◊|(* line-length point-size)|px) {
  html, body {
    font-size: 16px;
  }
  .nav, .content {
    margin: 0.5rem 0.5rem 0 0.5rem;
    /* min-width: inherit; */
  }
  /*.topic {
    margin-top: 0.5rem;
  }*/
  .left-margin, .right-margin {
    display: none !important;
  }
}

@media all and (max-width: ◊|(* 0.5 line-length point-size)|px) {
  body {
    align-items: inherit;
  }
}

.date {
  opacity: 0.8;
  white-space: nowrap;
}

.left-margin {
  position: absolute;
  left: -◊|margin-width|rem;
  width: 10rem;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  margin: 0;
}

ul {
  list-style-type: circle;
  padding-left: 0;
  line-height: 1.45;
}

h3.left-margin, h4.left-margin, .left-margin h3, .left-margin h4 {
  margin: 0;
  text-align: right;
}

h4.left-margin, .left-margin h4 {
  opacity: 0.6;
}

.right-margin {
  position: absolute;
  left: calc(2rem + ◊|line-length|ch);
  width: 10rem;
  display: flex;
  flex-direction: column;
  margin: 0;
}

.left-margin, .right-margin {
  opacity: 0.8;
}

.todo {
  font-size: 80%;
  background-color: ◊|code-background-color|;
}

.todo-tag {
  color: ◊|keyword-color|;
}