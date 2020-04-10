(defun del (l)
	(cond
		((<(length l)2) l) ((cons (car l) (del (cddr l))))
	)
)
 
(del '(a b c d e f g))