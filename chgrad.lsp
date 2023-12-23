
(defun C:chgrad () 
  ;自己写的
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

(defun c:chgrad1 () 
  ;书本上的源代码
  (setvar "cmdecho" 0)
  ;这句记得加上，不执行返回，一般是nil
  (setq en (entsel "选择已知圆："))
  ;要求选择一个圆，我的程序直接画了一个圆
  (setq en_data (entget (car en)))
  ;提取对象属性列表，记得先加个car
  (setq old_rad_list (assoc 40 en_data))
  ;提取出来的是列表，带40，不是半径数值
  (setq old_rr (cdr old_rad_list))
  ;提取半径
  (princ "\n旧圆半径是:")(princ old_rr)
  ;打印半径
  (setq cenpt (cdr (assoc 10 en_data)))
  ;提取旧圆的圆心
  (setq new_rr (getdist cenpt "\nnew radius:"))
  ;以圆心为起点求一段距离，我的程序直接随机要了一个距离
  (setq new_rad_list (cons 40 new_rr))
  ;替换新半径列表
  (setq en_data (subst new_rad_list old_rad_list en_data))
  ;替换整个数据列表
  (entmod en_data)
  ;更新数据
  (prin1)
)