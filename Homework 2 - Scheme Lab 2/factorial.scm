(define factorial
  (lambda (n)
    (if (equal? n 0)
        1
        (* n (factorial (- n 1))))))

,tr (factorial 5)