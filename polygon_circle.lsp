
(defun c: poly_cr()
  (setq pa (getpoint "\n请确定中心点："))
  (setq rr (getdist "\n请确定小圆半径"))
  (setq num (getint "\n请给出小圆的数量"))
  (setvar angle_1 (/ (/ 90 pi) num))
  (setvar hh (/ rr (/ (sin angle_1) (cos angel_1) )))
  (setq brr (sqrt (* rr rr) (* hh hh)))
)