(define sum
  (lambda (lst)
    (if (equal? (length lst) 0)
      0
     (+ (car lst) (sum (cdr lst))))))

(define keep-first-n
  (lambda (n lst)
    (cond ((equal? n 0)
            '())
          ((< (length lst) n)
            '())
          ((< n 0)
            '())
          (else
            (cons (car lst) (keep-first-n (- n 1) (cdr lst)))))))