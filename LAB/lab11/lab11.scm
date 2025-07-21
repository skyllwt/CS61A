(define (if-program condition if-true if-false)
  (list 'if condition if-true if-false)
)

(define (square n) (* n n))

(define (pow-expr base exp) 
  (cond
  ((= exp 0) 1 )
  ((= exp 1) (list '* base 1))
  ((even? exp) (list 'square (pow-expr base (/ exp 2))))
  (else (list '* base (pow-expr base (- exp 1))))
  )
)


