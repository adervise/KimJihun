set linesize 1000
set pagesize 0
set pause off
set timing off
set term off
set feedback off
SET TRIMSPOOL ON
spool /home/openmate/data/spool/bcmi/dat/tbmiadmistat.txt
select '2013'
	|| '|' || a.admi_cd 
	|| '|' || b.mega_cd 
	|| '|' || b.cty_cd 
	|| '|' || b.mega_nm 
	|| '|' || b.cty_nm 
	|| '|' || b.admi_nm 
	|| '|' || to_char(a.hous                 )
	|| '|' || to_char(a.pop                  )
	|| '|' || to_char(a.POP_00               )
	|| '|' || to_char(a.POP_10               )
	|| '|' || to_char(a.POP_20               )
	|| '|' || to_char(a.POP_30               )
	|| '|' || to_char(a.POP_40               )
	|| '|' || to_char(a.POP_50               )
	|| '|' || to_char(a.POP_60               )
	|| '|' || to_char(a.POP_70               )
	|| '|' || to_char(a.POP_80 + a.POP_90    )
	|| '|' || to_char(a.POP_M                )
	|| '|' || to_char(a.POP_M_00             )
	|| '|' || to_char(a.POP_M_10             )
	|| '|' || to_char(a.POP_M_20             )
	|| '|' || to_char(a.POP_M_30             )
	|| '|' || to_char(a.POP_M_40             )
	|| '|' || to_char(a.POP_M_50             )
	|| '|' || to_char(a.POP_M_60             )
	|| '|' || to_char(a.POP_M_70             )
	|| '|' || to_char(a.POP_M_80 + a.POP_M_90)
	|| '|' || to_char(a.POP_W                )
	|| '|' || to_char(a.POP_W_00             )
	|| '|' || to_char(a.POP_W_10             )
	|| '|' || to_char(a.POP_W_20             )
	|| '|' || to_char(a.POP_W_30             )
	|| '|' || to_char(a.POP_W_40             )
	|| '|' || to_char(a.POP_W_50             )
	|| '|' || to_char(a.POP_W_60             )
	|| '|' || to_char(a.POP_W_70             )
	|| '|' || to_char(a.POP_W_80 + a.POP_w_90)
from VWPOP_admiPOP_PER10 a, vwadm_admi b
where 1=1
    and a.admi_cd = b.admi_cd
/
spool off
exit
