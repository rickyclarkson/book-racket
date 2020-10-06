#lang plai-typed
(print-only-errors #t)

(define-type ArithC
             [numC (n : number)]
             [plusC (l : ArithC) (r : ArithC)]
             [multC (l : ArithC) (r : ArithC)])

(define-type ArithS
	     [numS (n : number)]
	     [plusS (l : ArithS) (r : ArithS)]
	     [bminusS (l : ArithS) (r : ArithS)]
	     [multS (l : ArithS) (r : ArithS)]
	     [uminusS (n : ArithS)])

(define (desugar [as : ArithS]) : ArithC
  (type-case ArithS as
	     [numS (n) (numC n)]
	     [plusS (l r) (plusC (desugar l)
				 (desugar r))]
	     [multS (l r) (multC (desugar l)
				 (desugar r))]
	     [bminusS (l r) (plusC (desugar l)
				   (multC (numC -1)
					  (desugar r)))]
	     [uminusS (n) (multC (desugar n)
				 (numC -1))]
	     ))
