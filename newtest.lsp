(defun c:pbox ()
  ;根据输入的长方形的宽和高，画出长方形和对边中线连线  
  (setvar "cmdecho" 0)
  (setq pa (getpoint "\n请输入左下角点"))
  (setq ww (getdist pa "\n宽度<1000.0>"))
  (if (null ww) (setq ww 1000.0))
  (setq hh (getdist pa "\n高度<700.0>"))
  (if (null hh) (setq hh 700.0))
  (setq pb (polar pa 0.0 ww))
  (setq pc (polar pb (/ pi 2) hh))
  (setq pd (polar pa (/ pi 2) hh))
  (command "pline" pa pb pc pd "c")
  (princ)
)
(defun c:pbox () 
  (setvar "cmdecho" 0)
  (setq pa (getpoint "\n请输入左下角点"))
  (setq pc (getcorner pa "\n对角点"))
  (command "_rectang" pa pc "")
  (princ)
)

(defun c:pbox2 (/ pa pb pc pd ww mp1 mp2 mp3 mp4 dd) 
  (setvar "cmdecho" 0)
  (setvar "blipmode" 0)
  (setq pa (getpoint "\n请输入左下角点"))
  (setq ww (getdist pa "\n宽度<1000.0>"))
  (if (null ww) (setq ww 1000.0))
  (setq dd (getdist pa "\n高度<700.0>"))
  (if (null dd) (setq dd 700.0))
  (setq pb (polar pa 0.0 ww))
  (setq pc (polar pb (/ pi 2) dd))
  (setq pd (polar pa (/ pi 2) dd))
  (command "pline" pa pb pc pd "c")
  (setq mp1 (polar pa 0.0 (/ ww 2)))
  (setq mp2 (polar pb (/ pi 2) (/ dd 2)))
  (setq mp3 (polar mp1 (/ pi 2) dd))
  (setq mp4 (polar pa (/ pi 2) (/ dd 2)))
  (command "pline" mp1 mp3 "")
  (command "pline" mp2 mp4 "")
  (princ)
)
(prompt "作者：fanyb")
(prompt "第一个lisp程序")
(princ)

