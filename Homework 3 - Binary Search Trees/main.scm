(define entry
  (lambda (bst)
    (cond
      ((null? bst) #f)
      ((not (= 3 (length bst))) #f)
      ((not (list? (car (cdr bst)))) #f)
      ((not (list? (car (cdr (cdr bst))))) #f)
      (else (car bst)))))

(define left
  (lambda (bst)
    (cond
      ((null? bst) #f)
      ((not (= 3 (length bst))) #f)
      ((not (list? (car (cdr bst)))) #f)
      ((not (list? (car (cdr (cdr bst))))) #f)
      (else (car (cdr bst))))))

(define right
  (lambda (bst)
    (cond
      ((null? bst) #f)
      ((not (= 3 (length bst))) #f)
      ((not (list? (car (cdr bst)))) #f)
      ((not (list? (car (cdr (cdr bst))))) #f)
      (else (car (cdr (cdr bst)))))))

(define make-bst
  (lambda (elt left-bst right-bst)
    (cond
      ((not (integer? elt)) #f)
      ((and (not (null? left-bst)) (or (not (list? left-bst)) (not (= 3 (length left-bst))) (and (= 3 (length left-bst)) (or (not (list? (car (cdr left-bst)))) (not (list? (car (cdr (cdr left-bst))))))))) #f)
      ((and (not (null? right-bst)) (or (not (list? right-bst)) (not (= 3 (length right-bst))) (and (= 3 (length right-bst)) (or (not (list? (car (cdr right-bst)))) (not (list? (car (cdr (cdr right-bst))))))))) #f)
      (else (list elt left-bst right-bst)))))

(define preorder
  (lambda (bst)
    (if (null? bst)
      '()
    (append (list (entry bst)) (preorder (left bst)) (preorder (right bst))))))

(define postorder
  (lambda (bst)
    (if (null? bst)
      '()
    (append (postorder (left bst)) (postorder (right bst)) (list (entry bst))))))

(define inorder
  (lambda (bst)
    (if (null? bst)
      '()
    (append (inorder (left bst)) (list (entry bst)) (inorder (right bst))))))

(define insert
  (lambda (v bst)
    (cond
      ((null? bst)
        (make-bst v '() '()))
      ((< v (entry bst))
        (make-bst (entry bst) (insert v (left bst)) (right bst)))
      ((> v (entry bst))
        (make-bst (entry bst) (left bst) (insert v (right bst))))
      (else
        bst))))