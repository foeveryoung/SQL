--mbzt01  手机号过去3分钟内所关联的银行卡号
select t1.ID, count(distinct t2.CRD_NO) as mbzt01
from yeebao_y as t1 left join yeebao_y as t2
on t1.MOBILE =t2.MOBILE
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
group by t1.ID
order by t1.ID
--mbzt02  手机号过去1小时内所关联的银行卡号
select t1.ID, count(distinct t2.CRD_NO) as mbzt02
from yeebao_y as t1 left join yeebao_y as t2
on t1.MOBILE =t2.MOBILE
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
group by t1.ID
order by t1.ID
--mbzt03  手机号过去1天内所关联的银行卡号
select t1.ID, count(distinct t2.CRD_NO) as mbzt03
from yeebao_y as t1 left join yeebao_y as t2
on t1.MOBILE =t2.MOBILE
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
group by t1.ID
order by t1.ID
--mbzt04  手机号过去3分钟内所关联的证件号
select t1.ID, count(distinct t2.ID_NO) as mbzt04
from yeebao_y as t1 left join yeebao_y as t2
on t1.MOBILE =t2.MOBILE
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
group by t1.ID
order by t1.ID
--mbzt05  手机号过去1小时内所关联的证件号
select t1.ID, count(distinct t2.ID_NO) as mbzt04
from yeebao_y as t1 left join yeebao_y as t2
on t1.MOBILE =t2.MOBILE
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
group by t1.ID
order by t1.ID
--mbzt06  手机号过去1天内所关联的证件号
select t1.ID, count(distinct t2.ID_NO) as mbzt04
from yeebao_y as t1 left join yeebao_y as t2
on t1.MOBILE =t2.MOBILE
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
group by t1.ID
order by t1.ID