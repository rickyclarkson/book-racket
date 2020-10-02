#lang plai-typed

(define-type MisspelledAnimal
	     [yacc (height : number)]
	     [caml (humps : number)])

(define ma1 : MisspelledAnimal (yacc 3))
(define ma2 : MisspelledAnimal (caml 2))

(define (good? [ma : MisspelledAnimal]) : boolean
  (
   type-case MisspelledAnimal ma
   (
    [yacc (height) (>= height 2.1)]
    [caml (humps) (>= humps 2)])))

(good? (yacc 1))
