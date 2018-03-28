#lang racket

(define (main)
  (define p
    (dynamic-place "any-double.rkt" 'place-entry))

  ;; enable profiling
  (place-channel-put p #t)

  (for ([i (in-range 1000000)])
    (define l (build-list (random 10000) (lambda (_) (random 100))))
    (place-channel-put p l)
    (place-channel-get p))

  (place-kill p))

(main)
