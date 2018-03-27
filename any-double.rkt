#lang racket

(require profile)
(require profile/render-text)

(provide place-entry)

(define (any-double? l)
  (for/or ([i (in-list l)])
    (for/or ([i2 (in-list l)])
      (= i2 (* 2 i)))))

(define (place-entry ch)
  (define profile? (place-channel-get ch))

  (profile-thunk
   (thunk
    (let loop ()
      (define l (place-channel-get ch))      
      (define l-double? (any-double? l))
      (place-channel-put ch l-double?)
      (loop)))
   #:use-errortrace? #t
   #:threads #t))
    