(define seq
  (lambda (first last)
    (if (> first last)
      '()
      (cons first (lambda () (seq (+ first 1) last))))))

(define inf-seq
  (lambda (first)
    (cons first (lambda () (inf-seq (+ first 1))))))

(define first-n
  (lambda (lazy-list n)
    (if (null? lazy-list)
      '()
      (if (= n 0)
        '()
        (cons (car lazy-list) (first-n ((cdr lazy-list)) (- n 1)))))))

(define nth
  (lambda (lazy-list n)
    (if (null? lazy-list)
      #f
        (if (= n 1)
          (car lazy-list)
          (nth ((cdr lazy-list)) (- n 1))))))

(define filter-multiples
  (lambda (lazy-list n)
    (if (null? lazy-list)
      '()
      (if (equal? (remainder (car lazy-list) n) 0)
        (filter-multiples ((cdr lazy-list)) n)
        (cons (car lazy-list) (lambda () (filter-multiples ((cdr lazy-list)) n)))))))

(define primes 
  (lambda ()
    (sieve (inf-seq 2))))

(define sieve
  (lambda (lazy-list)
    (cons (car lazy-list) 
          (lambda () (sieve (filter-multiples ((cdr lazy-list)) (car lazy-list)))))))