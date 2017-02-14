#lang racket/base
(require
 racket/file
 pollen/tag
 pollen/decode
 txexpr
 pollen/misc/tutorial
 pollen/unstable/pygments)
(provide (all-defined-out) highlight)

(define exclusion-mark-attr '(decode "exclude"))
(define (root . elements)
  (txexpr 'div '((class "content"))
          (decode-elements elements
                           #:txexpr-elements-proc decode-paragraphs
                           #:string-proc (compose1 smart-quotes smart-dashes)
                           #:exclude-tags '(style script pre)
                           #:exclude-attrs (list exclusion-mark-attr)
                           )))

#|
`show-source` converts a source file to a displayable page.
|#
(define (show-source lang path)
  `(@ ,(title path) ,(highlight lang (file->string path))))

(define (show-source-link filename)
  (define url (format "~a.html" filename))
  (code (link url filename)))

(define (topic . elements)
  `(h1 ((class "topic")) ,@elements))

(define title-tag 'h1)
(define (title . elements)
  `(,title-tag ,@elements))

(define code-tag 'span)
(define code-class "my-code")
(define (code . elements)
  `(,code-tag ((class ,code-class) ,exclusion-mark-attr) ,@elements))

(define extlink-class "ext")
(define (extlink url . texts)
  `(a ((href ,url)(class ,extlink-class)) ,@texts))

(define (link url . texts)
  `(a ((href ,url)) ,@texts))

(define (gitlink repo . texts)
  `(span ((class ,code-class)) ,(apply link (format "http://github.com/~a" repo) texts)))
