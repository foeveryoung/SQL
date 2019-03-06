--trm01  终端号过去3分钟的累计交易金额
--trm02  终端号过去3分钟的累计交易笔数
select t1.ID, sum(t2.AMT) as trm01,count(*) as trm02
from yeebao_y as t1 left join yeebao_y as t2
on t1.GIF_TRMID =t2.GIF_TRMID
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
group by t1.ID
order by t1.ID
--trm03  终端号过去3分钟的大额交易（>70000)笔数
select t1.ID, count(*) as trm03
from yeebao_y as t1 left join yeebao_y as t2
on t1.GIF_TRMID =t2.GIF_TRMID
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
and t2.AMT>=70000
group by t1.ID
order by t1.ID
--trm04  终端号过去1小时的累计交易金额
--trm05  终端号过去1小时的累计交易笔数
select t1.ID, sum(t2.AMT) as trm04,count(*) as trm05
from yeebao_y as t1 left join yeebao_y as t2
on t1.GIF_TRMID =t2.GIF_TRMID
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
group by t1.ID
order by t1.ID
--trm06  终端号过去1小时的大额交易（>70000)笔数
select t1.ID, count(*) as trm06
from yeebao_y as t1 left join yeebao_y as t2
on t1.GIF_TRMID =t2.GIF_TRMID
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
and t2.AMT>=70000
group by t1.ID
order by t1.ID
--trm07  终端号过去1天的累计交易金额
--trm08  终端号过去1天的累计交易笔数
select t1.ID, sum(t2.AMT) as trm07,count(*) as trm08
from yeebao_y as t1 left join yeebao_y as t2
on t1.GIF_TRMID =t2.GIF_TRMID
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
group by t1.ID
order by t1.ID
--trm09  终端号过去1天的大额交易（>70000)笔数
select t1.ID, count(*) as trm09
from yeebao_y as t1 left join yeebao_y as t2
on t1.GIF_TRMID =t2.GIF_TRMID
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
and t2.AMT>=70000
group by t1.ID
order by t1.ID
--trm10  终端号过去1小时所关联的手机号
--trm11  终端号过去1小时所关联的银行卡号
select t1.ID, count(distinct t2.MOBILE) as trm10,count(distinct t2.CRD_NO) as trm11
from yeebao_y as t1 left join yeebao_y as t2
on t1.GIF_TRMID =t2.GIF_TRMID
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
group by t1.ID
order by t1.ID
--trm12  终端号过去1天所关联的手机号
--trm13  终端号过去1天所关联的银行卡号
--trm14  终端号过去1天所关联的IP数量
select t1.ID, count(distinct t2.MOBILE) as trm12,count(distinct t2.CRD_NO) as trm13,count(distinct t2.USR_IP) as trm14
from yeebao_y as t1 left join yeebao_y as t2
on t1.GIF_TRMID =t2.GIF_TRMID
where t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
group by t1.ID
order by t1.ID

