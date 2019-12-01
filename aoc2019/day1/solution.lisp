(defmacro while (to-do exp &rest body)
  `(tagbody
    start
      ,to-do
      (if (not ,exp)
          (go end)
          ,@body)
      (go start)
    end))

(defconstant +input-path+ "./input")

(defun mass->fuel (mass)
  (declare (type integer mass)
           (optimize (speed 3)))
  (let ((result (- (floor (/ mass 3))
                   2)))
    (if (< result 0)
        0
        result)))

(defun mass+fuel->fuel (mass)
  (declare (type integer mass)
           (optimize (speed 3)))
  (labels ((rec (fuel-mass acc)
             (let ((f (mass->fuel acc)))
               (if (zerop f)
                   fuel-mass
                   (rec (+ fuel-mass f) f)))))
    (let ((init (mass->fuel mass)))
      (rec init init))))

(defun compute-fuel-mass ()
  (declare (optimize (speed 3)))
  (with-open-file (stream +input-path+)
    (let ((fuel-mass (the integer 0)))
      (do ((line (read-line stream nil nil)
                 (read-line stream nil nil)))
          ((null line))
        (let ((i (parse-integer line)))
          (setf fuel-mass (+ fuel-mass (mass->fuel i)))))
      fuel-mass)))

(defun compute-fuel-mass-enhanced ()
  (declare (optimize (speed 3)))
  (with-open-file (stream +input-path+)
    (let ((fuel-mass (the integer 0)))
      (do ((line (read-line stream nil nil)
                 (read-line stream nil nil)))
          ((null line))
        (let ((i (parse-integer line)))
          (setf fuel-mass (+ fuel-mass (mass+fuel->fuel i)))))
      fuel-mass)))
