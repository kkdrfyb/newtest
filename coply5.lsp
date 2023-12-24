;----文本接口：免费百度未能识别----
;请编写一个CPOLY5.LSP，选择CIRCLE后，自动产生一个圆内接正五边形，此程序的执行过程要求如下。
;（1）命令：cpoly5。
;（2）Select CIRCLE：选择界面上已有的圆。
;（3）自动产生一个内接正五边形
; 根据输入边数生成正多变形状
(defun c:coply5 () 
  (setvar "cmdecho" 0)
  (setq circle (entsel "请选择圆形"))
  (setq circle_data (entget (car circle)))
  (setq circle_center (assoc 10 circle_data))
  (setq center_point (cdr circle_center))
  (setq rr (cdr (assoc 40 circle_data)))
  (setq num (getint "请输入多边形的数目"))
  (setq angle_1 (- (/ pi 2) (/ (* 2 pi) num)))
  (setq point1 (polar center_point (/ pi 2) rr))
  ;(setq side_length (* rr (sin angle_1) 2))
  ;(setq angle_2 (- (/ pi 2) angle_1))
  (setq point2_x (+ (car center_point) (* rr (cos angle_1))))
  (setq point2_y (+ (cadr center_point) (* rr (sin angle_1))))
  (setq point2 (list point2_x point2_y (caddr center_point)))
  (command "line" point1 point2 "")
  (setq side_len (entlast))
  (command "array" side_len "" "p" center_point num 360 "Y")
  (princ)
)
(prompt "***************C:coply5*********************")
(prin1)