;; Guiles, a simple IRC bot written in Guile Scheme
;; Copyright (C) 2017 Robert Bolton

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(define-module (core util))

(define (assoc-def key lst def)
  (let ((pair (assoc key lst)))
    (if pair
	(cdr pair)
	def)))

(define (exit-with-error msg)
  (let ((port (current-error-port)))
    (display msg port)
    (newline port)
    (quit 1)))

(define (rand-sel lst)
  (list-ref lst
	    (inexact->exact
	     (floor (* (random:uniform)
		       (length lst))))))

(export assoc-def
	exit-with-error
	rand-sel)
