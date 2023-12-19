
(defun C:poly ()
  ; (vl-load-com)
  (setvar "cmdecho" 0)
  (setq pa (getpoint "\n请输入左下角点"))
  (setq rr (getreal "\n请确定小圆半径"))
  (setq num (getreal "\n请给出小圆的数量"))
  (setq angle_1 (/ 180 num))
  (setq hh (/ rr (/ (sin angle_1) (cos angle_1))))
  (setq brr (sqrt (-(* rr rr) (* hh hh))))
  (setq tmp_point1 (polar pa (/ pi 2) hh))
  (setq cir_center1 (polar tmp_point1 0 rr))
  (command "circle" cir_center1 rr "")
  (setq small_circle entlast)
  ; (command "_.pause" "3")
  ; (vl-debug-enter "my debug point")
  ; (vl-debug-enter "My Debug Point")
  ; (setq ss (ssget "_C" (list (cons 0 "circle"))))
  ;(setq ss (ssget "_C" (list (cons 0 '(0 . "circle")))))
  ; (setq ss (ssget "_C" (list (cons 0 '(0 . "CIRCLE")))))
  ; (vl-debug-leave)
  ; (vl-debug-leave)
  (setq rotate_angle (/ (* 2 pi) num))
  (setq count 1)
  (while (>= count num) 
    (command "rotate" small_circle pa (* (- num count) rotate_angle))
    (1+ count)
  )
  (prin1)
)