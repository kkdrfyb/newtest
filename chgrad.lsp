
(defun C:chgrad () 
  ;�Լ�д��
  (command "circle" (getpoint) (getdist) "")
  ;(setq yuan (entlast))
  (setq yuan1 (entsel))
  (setq yuan2 (car yuan1))
  (setq yuan_data (entget yuan2))
  (setq oldr (assoc 40 yuan_data))
  (prompt "Բ�İ뾶��")
  (print (cdr oldr))
  (setq newr (cons 40 (getreal "�������µİ뾶ֵ")))
  (setq yuan_data (subst newr oldr yuan_data))
  (entmod yuan_data)
  (prin1)
)

(defun c:chgrad1 () 
  ;�鱾�ϵ�Դ����
  (setvar "cmdecho" 0)
  ;���ǵü��ϣ���ִ�з��أ�һ����nil
  (setq en (entsel "ѡ����֪Բ��"))
  ;Ҫ��ѡ��һ��Բ���ҵĳ���ֱ�ӻ���һ��Բ
  (setq en_data (entget (car en)))
  ;��ȡ���������б��ǵ��ȼӸ�car
  (setq old_rad_list (assoc 40 en_data))
  ;��ȡ���������б���40�����ǰ뾶��ֵ
  (setq old_rr (cdr old_rad_list))
  ;��ȡ�뾶
  (princ "\n��Բ�뾶��:")(princ old_rr)
  ;��ӡ�뾶
  (setq cenpt (cdr (assoc 10 en_data)))
  ;��ȡ��Բ��Բ��
  (setq new_rr (getdist cenpt "\nnew radius:"))
  ;��Բ��Ϊ�����һ�ξ��룬�ҵĳ���ֱ�����Ҫ��һ������
  (setq new_rad_list (cons 40 new_rr))
  ;�滻�°뾶�б�
  (setq en_data (subst new_rad_list old_rad_list en_data))
  ;�滻���������б�
  (entmod en_data)
  ;��������
  (prin1)
)