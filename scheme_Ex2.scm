(define (sublist ls index mn mx)
  (cond ((null? ls) '())
	((> mn mx) '())
	((> index mx) '())
	((>= index mn)
	 (cons (car ls) (sublist (cdr ls) (+ index 1) mn mx)))
	(else(sublist (cdr ls) (+ index 1) mn mx))))

(define (slist ls mn mx)
    (sublist ls 1 mn mx))

(slist '(10 7 6 5 3 1) 2 3)
(slist '(10 7 6 5 3 1) 3 2)
(slist '(10 7 6 5 3 1) -1 2)
