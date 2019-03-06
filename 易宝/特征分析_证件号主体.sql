--idzt01  证件号过去3分钟内所关联的银行卡号
--idzt02  证件号过去3分钟内所关联的手机号
select t1.ID, count(distinct t2.CRD_NO) as trm01,count(distinct t2.MOBILE) as trm02
from yeebao_y as t1 left join yeebao_y as t2
on t1.ID_NO =t2.ID_NO
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
group by t1.ID
order by t1.ID
--idzt03  证件号过去1小时内所关联的银行卡号
--idzt04  证件号过去1小时内所关联的手机号
select t1.ID, count(distinct t2.CRD_NO) as trm03,count(distinct t2.MOBILE) as trm04
from yeebao_y as t1 left join yeebao_y as t2
on t1.ID_NO =t2.ID_NO
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
group by t1.ID
order by t1.ID
--idzt05  证件号过去1天内所关联的银行卡号
--idzt06  证件号过去1天内所关联的手机号
select t1.ID, count(distinct t2.CRD_NO) as trm05,count(distinct t2.MOBILE) as trm06
from yeebao_y as t1 left join yeebao_y as t2
on t1.ID_NO =t2.ID_NO
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
group by t1.ID
order by t1.ID