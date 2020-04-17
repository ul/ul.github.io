#lang racket/base

(require racket/string racket/file pollen/tag)
(provide (all-defined-out))

(define styles
  (string-replace
    (string-append (file->string "./fonts.css")
                   (file->string "./a17t.css")
                   (file->string "./styles.css"))
    #px"\\s+"
    " "))

(define (link url text) `(a ((href ,url)) ,text))

(define spacer (default-tag-function 'div #:style "flex:1;"))

(define highlight (default-tag-function 'mark))

(define descriptions (default-tag-function 'dl))
(define term (default-tag-function 'dt))
(define details (default-tag-function 'dd 'p))

(define items (default-tag-function 'ul))
(define item (default-tag-function 'li 'p))

(define table (default-tag-function 'table #:class "table"))
(define row (default-tag-function 'tr))
(define cell (default-tag-function 'td))

(define card (default-tag-function 'section #:class "card"))
(define support (default-tag-function 'p #:class "support"))
