#lang racket
(define (f lst)
  ; (a) ; check if the list is null
  (if (null? lst)
      ; (b) ; if the list is null, return null list
      '()
      ; (c) ; if the list is not null, plus 1 to the fist element of
      ; the list, and cons the result to (f (cdr lst)), which is a recursive computation
      (cons (+ 1 (car lst)) (f (cdr lst)))
  ))

(define (member? e lst)
  ;; If the list is null
  (if (null? lst)
      ;; False
      #f
      ;; If the first element is equal to `e`
      (if (eq? e (car lst))
          ;; True
          #t
          ;; else go to recursion
          (member? e (cdr lst)))))

(define (set? lst)
  ;; If th list is null
  (if (null? lst)
      ;; True
      #t
      ;; If the first element is a member of the rest of the list
      (if (member? (car lst) (cdr lst))
          ;; false
          #f
          ;; else go into iteration
          (set? (cdr lst))))
  )

(define (dedup lst)
  ;; A helper function for union.
  ;; To remove duplicate elements of a list
  (if (set? lst)
      lst
      (if (member? (car lst) (cdr lst))
          (dedup (cdr lst))
          (cons (car lst) (dedup (cdr lst))))))

;; The following codes are obselete
;; (define (dedup1 e)
;;   (if (null? e) '()
;;       (cons (car e) (dedup1 (my-filter (lambda (x) (not (equal? x (car e))))
;;                                     (cdr e))))))

;; (define (my-filter pred ls)
;;   (cond ((null? ls) '())
;;         ((pred (car ls)) (cons (car ls) (my-filter pred (cdr ls))))
;;         (else (my-filter pred (cdr ls)))))

(define (union lst1 lst2)
  ;; We don't need to check if the lists are null.
  ;; Just append the two lists and deduplicate the result
  (if (null? lst1)
      lst2
      (if (member? (car lst1) lst2)
          (union (cdr lst1) lst2)
          (union (cdr lst1) (cons (car lst1) lst2)))))

(define (union1 s1 s2) 
(cond ((null? s1) s2)
((member? (car s1) s2)(union1 (cdr s1) s2))
(else (cons (car s1)(union1 (cdr s1) s2)))))

(define (intersect s1 s2)
    (cond ((null? s1) '())
    ((member? (car s1) s2)(cons (car s1)(intersect (cdr s1) s2)))
    (else (intersect (cdr s1) s2))))

(define (difference lst1 lst2)
    (cond
      ((null? lst1) '())
      ((member? (car lst1) lst2) (difference (cdr lst1) lst2))
      (else (cons (car lst1) (difference (cdr lst1) lst2)))
          ))

(define (difference2 lst1 lst2)
  ;; This function is similar to function deduplicate
  (if (null? lst1)
      '()
      (if (member? (car lst2) lst1)
          (difference2 lst1 (cdr lst2))
          (flatten (cons (difference2 lst1 (cdr lst2)) (car lst2)))
  )))

(define (flatten lst)
  ;; three situations
  (cond
    ;; When the list is null return empty list
    [(null? lst) '()]
    ;; If the list is a pair, that's to say,
    ;; a list with two element and maybe one of the two
    ;; is also a list, we flatten them perpectively
    [(pair? lst) (append (flatten (car lst)) (flatten (cdr lst)))]
    ;; If the list only has one element, return it
    [else (list lst)]))

(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
(define line (read-line (current-input-port) 'any))
(if (eof-object? line)
(display "")
(begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))