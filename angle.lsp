(defun C:draw_triangle () 
  ;根据直角边长和斜边边长画三角形
  (setq pa (getpoint "请输入直角点pa:"))
  (setq aa (getdist pa "请输入直角边长度"))
  (if (null aa) (setq aa 100))
  (setq pb (polar pa 0 aa))
  (setq cc (getdist pa "请输入斜边长度"))
  (if (null bb) (setq bb 200))
  (setq bb (sqrt (- (* cc cc) (* aa aa))))
  (setq pc (polar pa (/ pi 2) bb))
  (command "pline" pa pb pc "c")
  (setq ang_pb (atan (/ bb aa)))
  (setq ang_pb (/ (* ang_pb 180) pi))
  (princ "第一个锐角是")
  (princ ang_pb)
  (princ "度")
  (prin1)
)