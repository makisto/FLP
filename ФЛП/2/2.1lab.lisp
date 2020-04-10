(defun add(x l &optional added)
	(cond
		((null l) nil)
		((and (< x (car l))(null added))        (cons x (cons (car l) (add x (cdr l) t))))
		((and (>= x (car l))(null (cadr l)))    (cons (car l) (cons x nil)))
		((and (>= x (car l))(< x (cadr l)))     (cons (car l) (cons x (add x (cdr l) t))))
		((cons (car l) (add x (cdr l) added)))	
	)
)	

(trace add)

(add 1 '(2 3 4 5 8 9 10))
 
