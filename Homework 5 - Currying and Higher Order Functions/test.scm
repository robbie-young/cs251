(define curry3
  (lambda (f)
    (lambda (x)
      (lambda (y)
        (lambda (z)
          (f x y z))))))

(define uncurry3
  (lambda (f)
    (lambda (x y z)
      (((f x) y) z))))

(define uncurry
  (lambda (f)
    (lambda args
      (if (null? (cdr args))
        '())
      ((apply f (list (car args) ((uncurry f) (1 2 3 4 5))))))))

(define curry-plus-four
    (lambda ()
        (lambda (x)
            (lambda (y)
              (lambda (z)
                  (lambda (w)
                    (+ x y z w)))))))