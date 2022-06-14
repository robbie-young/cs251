(define gen-list
  (lambda (start stop)
    (if (> start stop)
      '()
      (cons start (gen-list (+ start 1) stop)))
      ))

(define pair-sum?
  (lambda (lst val)
    (if (< (length lst) 2)
      #f
      (if (equal? (+ (list-ref lst 0) (list-ref lst 1)) val)
        #t
        (pair-sum? (cdr lst) val)))
  ))

(define gen-lazy-list
  (lambda (start stop)
    (if (> start stop)
        #f
        (cons start
            (lambda () (gen-lazy-list (+ start 1) stop))))))

(define pair-sum-lazy?
  (lambda (lst val)
    (if (or (null? ((cdr lst))) (equal? val (car lst)) (equal? ((cdr lst)) #f))
      #f
      (if (equal? (+ (car lst) (car ((cdr lst)))) val)
        #t
        (pair-sum-lazy? ((cdr lst)) val)
        ))
  ))
      

(define make-lazy
  (lambda (lst)
    (if (null? lst)
      #f
      (cons (car lst) (lambda () (make-lazy (cdr lst)))))))