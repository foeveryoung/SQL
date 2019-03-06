--mbid01   同手机同银行卡过去3分钟的累计交易金额
select t1.ID, sum(t2.AMT) AS mbid01
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
ORDER BY t1.ID

--mbid02   同手机同银行卡过去3分钟的累计交易笔数
select t1.ID, count(*) AS mbid02
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID

--mbid03   同手机同银行卡过去3分钟的大额交易（>70000)笔数
SELECT t1.ID, count(*) as mbid03
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
and t2.AMT>=70000
GROUP BY t1.ID
order by t1.ID
--mbid04   同手机同银行卡过去1小时内的累计交易金额
select t1.ID, sum(t2.AMT) AS mbid04
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
ORDER BY t1.ID
--mbid05   同手机同银行卡号过去1小时内的累加交易笔数
select t1.ID, count(*) AS mbid05
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
order by t1.ID
--mbid06   同手机同银行卡过去1小时的大额（>70000)交易笔数
SELECT t1.ID, count(*) as mbid06
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
and t2.AMT>=70000
GROUP BY t1.ID
order by t1.ID
--mbid07   同手机同银行卡过去1小时是否连续五笔以上的交易金额连续递增
--mbid08   同手机同银行卡过去3分钟是否连续三笔以上的交易金额连续递增

--mbid09   同手机同银行卡过去1天的累计交易金额
select t1.ID, sum(t2.AMT) AS mbid09
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
ORDER BY t1.ID
--mbid10   同手机同银行卡过去1天的累计交易笔数
select t1.ID, count(*) AS mbid10
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
order by t1.ID
--mbid11   同手机同银行卡过去1天的大额交易（>70000)笔数
SELECT t1.ID, count(*) as mbid11
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
and t2.AMT>=70000
GROUP BY t1.ID
order by t1.ID
--mbid12   同手机同银行卡当前交易金额占过去过去1小时内累计交易金额的比例  *
select t1.ID,sum(t2.AMT) AS mbid12
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
ORDER BY t1.ID
--mbid13   同手机同银行卡当前交易金额是否大于过去1天的金额（平均值+2*标准差） * 3*均值
select t1.ID,avg(t2.AMT) AS mbid13_1
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
ORDER BY t1.ID
select t1.ID,std(t2.AMT) AS mbid13_2
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
ORDER BY t1.ID


--mbid14   同手机同银行卡过去3分钟关联的IP数
--mbid15   同手机同银行卡过去3分钟内关联的终端号
SELECT t1.ID, count(distinct t2.USR_IP) as mbid14,count(distinct t2.GIF_TRMID) as mbid15
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID






--mbid16   同手机同银行卡过去1小时关联的IP数量
--mbid17   同手机同银行卡过去1小时关联的终端号
SELECT t1.ID, count(distinct t2.USR_IP) as mbid16,count(distinct t2.GIF_TRMID) as mbid17
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
order by t1.ID




--mbid18   同手机同银行卡过去1天关联的IP数量
--mbid19   同手机同银行卡过去1天关联的终端号
SELECT t1.ID, count(distinct t2.USR_IP) as mbid18,count(distinct t2.GIF_TRMID) as mbid19
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
order by t1.ID



--mbid20   同手机同银行卡过去3分钟内是否出现交易失败 *
select t1.ID, sum(t2.PAY_RESULT) as mbid20
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID
--mbid21   同手机同银行卡过去3分钟内失败交易笔数占总笔数的比例 *

--mbid22   同手机同银行卡过去1小时内是否出现交易失败 *
select t1.ID, sum(t2.PAY_RESULT) as mbid22
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID
--mbid23   同手机同银行卡过去1小时内失败交易笔数占总交易笔数的比例 *

--mbid24   同手机同银行卡过去3分钟内关联的终端号
SELECT t1.ID, count(distinct t2.GIF_TRMID) as mbid24
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
and t1.MOBILE=t2.MOBILE
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID


--mbid25   同手机同银行卡当前经纬度与上一笔经纬度的差异以及时间差异是否大于某一个阈值（时间一个阈值，经纬度一个阈值）




--合并表
select t1.ID,mbid01,mbid02,mbid03,mbid04,mbid05,mbid06,mbid09,mbid10,mbid11,mbid12,mbid13_1,
mbid14,mbid15,mbid16,mbid17,mbid18,mbid19,mbid20,mbid22,mbid24
from yeebao_y as t1 
left join mbid01_05_y on t1.ID=mbid01_05_y.ID
left join mbid06_12_y on t1.ID=mbid06_12_y.ID
left join mbid13_1_y on t1.ID=mbid13_1_y.ID
left join mbid14_15_y on t1.ID=mbid14_15_y.ID
left join mbid16_17_y on t1.ID=mbid16_17_y.ID
left join mbid18_19_y on t1.ID=mbid18_19_y.ID
left join mbid20_y on t1.ID=mbid20_y.ID
left join mbid22_y on t1.ID=mbid22_y.ID
left join mbid24_y on t1.ID=mbid24_y.ID
order by t1.ID



select t1.ID,t2.AMT,
case when t2.mbid01  is null then 0 else t2.mbid01 end as  mbid01  ,
case when t2.mbid02  is null then 0 else t2.mbid02 end as  mbid02  ,
case when t2.mbid03  is null then 0 else t2.mbid03 end as  mbid03  ,
case when t2.mbid04  is null then 0 else t2.mbid04 end as  mbid04  ,
case when t2.mbid05  is null then 0 else t2.mbid05 end as  mbid05  ,
case when t2.mbid06  is null then 0 else t2.mbid06 end as  mbid06  ,
case when t2.mbid09  is null then 0 else t2.mbid09 end as  mbid09  ,
case when t2.mbid10  is null then 0 else t2.mbid10 end as  mbid10  ,
case when t2.mbid11  is null then 0 else t2.mbid11 end as  mbid11  ,
case when t2.mbid12  is null then 0 else t2.mbid12 end as  mbid12  ,
case when t2.mbid13_1  is null then 0 else t2.mbid13_1 end as  mbid13_1,
case when t2.mbid14  is null then 0 else t2.mbid14 end as  mbid14  ,
case when t2.mbid15  is null then 0 else t2.mbid15 end as  mbid15  ,
case when t2.mbid16  is null then 0 else t2.mbid16 end as  mbid16  ,
case when t2.mbid17  is null then 0 else t2.mbid17 end as  mbid17  ,
case when t2.mbid18  is null then 0 else t2.mbid18 end as  mbid18  ,
case when t2.mbid19  is null then 0 else t2.mbid19 end as  mbid19  ,
case when t2.mbid20  is null then 0 else t2.mbid20 end as  mbid20  ,
case when t2.mbid22  is null then 0 else t2.mbid22 end as  mbid22  ,
case when t2.mbid24  is null then 0 else t2.mbid24 end as  mbid24  
from yeebao_y as t1 left join mbid as t2
on t1.ID=t2.ID
order by t1.ID

--形成特征宽表
select t1.ID,t1.mbid01,t1.mbid02,t1.mbid03,t1.mbid04,t1.mbid05,t1.mbid06,t1.mbid09,t1.mbid10,t1.mbid11, 
t1.AMT/t1.mbid12 as mbid12,
case when t1.AMT>3*mbid13_1 then 1 else 0 end as mbid13,
t1.mbid14,t1.mbid15,t1.mbid16,t1.mbid17,t1.mbid18,t1.mbid19,
case when t1.mbid20>0 then 1 else 0 end as mbid20,
t1.mbid20/t1.mbid02 as mbid21,
case when t1.mbid22>0 then 1 else 0 end as mbid22,
t1.mbid22/mbid05 as mbid23,
t1.mbid24
from mbid_yy as t1
order by t1.ID





