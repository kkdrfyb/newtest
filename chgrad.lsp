(defun C:chgrad()
  (command "circle" (getpoint) (getdist) "")
  ;(setq yuan (entlast))
  (setq yuan1 (entsel))
  (setq yuan2 (car yuan1))
  (setq yuan_data (entget yuan2))
  (setq oldr (assoc 40 yuan_data))
  (prompt "圆的半径是")
  (print (cdr oldr))
  (setq newr (cons 40 (getreal "请输入新的半径值")))
  (setq yuan_data (subst newr oldr yuan_data))
  (entmod yuan_data)
  (prin1)
)