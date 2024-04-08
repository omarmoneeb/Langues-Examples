(define (divis_able n divisor)
  (cond ((= divisor 1) #f)
	((= (modulo n divisor) 0)#t)
	(else (divis_able n (- divisor 1)))))

(define (is_prime n)
  (cond ((or (= n 1) (= n 0)) #f)
	((= n 2)#t)
	((even? n)#f)
	(else(not (divis_able n (floor (sqrt n)))))))

(define (sumprimes start end)
  (if (> start end)
      0
      (if(is_prime start)
	(+ (expt start 3) (sumprimes (+ start 1) end))
	(sumprimes (+ start 1) end))))

(sumprimes 2 9)
