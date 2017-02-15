#lang racket/base
(require
 racket/file
 txexpr
 pollen/cache
 pollen/core
 pollen/file
 pollen/pagetree
 pollen/tag
 pollen/decode
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
(define code-class "code")
(define (code . elements)
  `(,code-tag ((class ,code-class) ,exclusion-mark-attr) ,@elements))

(define extlink-class "ext")
(define (extlink url . texts)
  `(a ((href ,url)(class ,extlink-class)) ,@texts))

(define (link url . texts)
  `(a ((href ,url)) ,@texts))

(define (gitlink repo . texts)
  `(span ((class ,code-class)) ,(apply link (format "http://github.com/~a" repo) texts)))

(define (date metas)
  `(sup ((class "date")) ,(select-from-metas 'date metas)))

(define (left-date metas)
  `(div ((class "date left-margin")) ,(select-from-metas 'date metas)))

(define (nav-link doc arr cls)
  `(div
    ,(when/splice
      doc
      (let ([href (symbol->string doc)])
        `(a ((class ,(string-append "box-link " cls)) (href ,href))
            (div ,arr)
            (div ,(select 'h1 doc)))))))

(define (page-children metas)
  (let-values ([(dir name _)
                (split-path (->output-path (select-from-metas 'here-path metas)))])
    (children name "index.ptree")))

(define (pm-metas out)
  (cached-metas (->markup-source-path out)))

(define (pm-doc out)
  (cached-doc (->markup-source-path out)))

(define (post->item post)
  (let* ([post (symbol->string post)]
         [metas (pm-metas post)]
         [doc (pm-doc post)])
    `(li ,(link post (select 'h1 doc) (date metas)))))

(define (list-posts metas)
  `(ul ,@(map post->item (page-children metas))))
