--ip01  IP过去3分钟的累计交易金额
--ip02  IP过去3分钟的累计交易笔数
select t1.ID, sum(t2.AMT) as ip01,count(*) as ip02
from yeebao_y as t1 left join yeebao_y as t2
on t1.USR_IP =t2.USR_IP
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
group by t1.ID
order by t1.ID

--ip03  IP过去3分钟的大额交易（>70000)笔数
select t1.ID, count(*) as ip03
from yeebao_y as t1 left join yeebao_y as t2
on t1.USR_IP =t2.USR_IP
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
and t2.AMT>=70000
group by t1.ID
order by t1.ID
--ip04  IP过去1小时的累计交易金额
--ip05  IP过去1小时的累计交易笔数
select t1.ID, sum(t2.AMT) as ip04,count(*) as ip05
from yeebao_y as t1 left join yeebao_y as t2
on t1.USR_IP =t2.USR_IP
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
group by t1.ID
order by t1.ID
--ip06  IP过去1小时的大额交易（>70000)笔数
select t1.ID, count(*) as ip06
from yeebao_y as t1 left join yeebao_y as t2
on t1.USR_IP =t2.USR_IP
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
and t2.AMT>=70000
group by t1.ID
order by t1.ID
--ip07  IP过去1天的累计交易金额
--ip08  IP过去1天的累计交易笔数
select t1.ID, sum(t2.AMT) as ip07,count(*) as ip08
from yeebao_y as t1 left join yeebao_y as t2
on t1.USR_IP =t2.USR_IP
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
group by t1.ID
order by t1.ID
--ip09  IP过去1天的大额交易（>70000)笔数
select t1.ID, count(*) as ip09
from yeebao_y as t1 left join yeebao_y as t2
on t1.USR_IP =t2.USR_IP
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
and t2.AMT>=70000
group by t1.ID
order by t1.ID
--ip10  IP过去1小时所关联的手机号
--ip11  IP过去1小时所关联的银行卡号
select t1.ID,count(distinct t2.MOBILE) as ip10 ,count(distinct t2.CRD_NO) as ip11
from yeebao_y as t1 left join yeebao_y as t2
on t1.USR_IP =t2.USR_IP
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
group by t1.ID
order by t1.ID
--ip12  IP过去1天所关联的手机号
--ip13  IP过去1天所关联的银行卡号
select t1.ID,count(distinct t2.MOBILE) as ip12 ,count(distinct t2.CRD_NO) as ip13
from yeebao_y as t1 left join yeebao_y as t2
on t1.USR_IP =t2.USR_IP
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
group by t1.ID
order by t1.ID