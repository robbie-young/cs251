(define curry3
  (lambda (f)
    (lambda (x)
      (lambda (y)
        (lambda (z)
          (f x y z))))))

(define uncurry3
  (lambda (curry2)
    (lambda (x y z)
				(((curry2 x) y) z)
		)))

(define uncurry
  (lambda (curry?)
    (lambda args
      (uncurry-help curry? args)
    )))

(define uncurry-help
	(lambda (curry lst)
		(if (and (function curry) (list? lst))
        (uncurry-help (curry (car lst)) (cdr lst))
        curry)
	))

(define my-filter
  (lambda (function lst)
    (if (null? lst)
      lst
      (if (function (car lst))
        (cons (car lst) (my-filter function (cdr lst)))
        (my-filter function (cdr lst)))
    )))

(define union 
  (lambda (s1 s2)
    (union-help (append s1 s2) '())
    ))

(define union?
	(lambda (first-element)
		(lambda (x)
			(not (equal? first-element x))
		)))

(define union-help
  (lambda (initial-lst final-lst)
		(if (null? initial-lst)
			final-lst
			(union-help (my-filter (union? (car initial-lst)) (cdr initial-lst)) (cons (car initial-lst) final-lst ))
		)))

(define intersect
  (lambda (s1 s2)
    (my-filter (lambda (item) (member item s2)) s1))) 

(define exists
   (lambda (function lst)
     (if (null? lst)
       #f
       (if (null? (my-filter function lst))
         #f
         #t))))