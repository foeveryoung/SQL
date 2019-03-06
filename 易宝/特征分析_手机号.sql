--crd01  银行卡号过去3分钟的累计交易金额
--crd02  银行卡号过去3分钟的累计交易笔数
--crd03  银行卡号过去3分钟内是否出现交易失败
select t1.ID, sum(t2.AMT) AS crd01,count(*) as crd02, sum(t2.PAY_RESULT) as crd03
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
ORDER BY t1.ID

--crd04  银行卡号过去1小时内的累计交易金额
--crd05  银行卡号号过去1小时内的累加交易笔数
--crd06  银行卡号过去1小时内是否出现交易失败
select t1.ID, sum(t2.AMT) AS crd04,count(*) as crd05, sum(t2.PAY_RESULT) as crd06
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
ORDER BY t1.ID


--crd07  银行卡号过去1天的累计交易金额
--crd08  银行卡号过去1天的累计交易笔数
select t1.ID, sum(t2.AMT) AS crd07,count(*) as crd08
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
ORDER BY t1.ID

--crd09  银行卡号过去3分钟的大额交易（>70000)笔数
--crd10  银行卡号过去1小时的大额（>70000)交易笔数
--crd11  银行卡号过去1天的大额交易（>70000)笔数
select t1.ID,count(*) as crd09
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
and t2.AMT>=7000
GROUP BY t1.ID
ORDER BY t1.ID

select t1.ID,count(*) as crd10
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
and t2.AMT>=7000
GROUP BY t1.ID
ORDER BY t1.ID

select t1.ID,count(*) as crd11
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
and t2.AMT>=7000
GROUP BY t1.ID
ORDER BY t1.ID

--crd12  银行卡号过去3分钟关联的IP数
--crd13  银行卡号过去3分钟内关联的终端号
select t1.ID,count(distinct t2.USR_IP) as crd12,count(distinct t2.GIF_TRMID) as crd13
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
ORDER BY t1.ID
--crd14  银行卡号过去1小时关联的IP数量
--crd15  银行卡号过去1小时关联的终端号
select t1.ID,count(distinct t2.USR_IP) as crd14,count(distinct t2.GIF_TRMID) as crd15
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
ORDER BY t1.ID
--crd16  银行卡号过去1天关联的IP数量
--crd17  银行卡号过去1天关联的终端号
select t1.ID,count(distinct t2.USR_IP) as crd16,count(distinct t2.GIF_TRMID) as crd17
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
ORDER BY t1.ID

--crd18  银行卡号当前交易金额占过去过去1小时内累计交易金额的比例 *

--crd19  银行卡号过去3分钟内失败交易笔数占总笔数的比例 *
select t1.ID, sum(t2.PAY_RESULT) as crd19
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID
--crd20  银行卡号过去1小时内失败交易笔数占总交易笔数的比例 *
select t1.ID, sum(t2.PAY_RESULT) as crd20
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
order by t1.ID
--crd21  银行卡号当前交易金额是否大于过去1天的金额（3*平均值）  *
select t1.ID, sum(t2.AMT) as crd21
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.CRD_NO=t2.CRD_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
order by t1.ID


--crd  银行卡号当前经纬度与上一笔经纬度的差异以及时间差异是否大于某一个阈值（时间一个阈值，经纬度一个阈值）
--crd  银行卡号过去1小时是否连续五笔以上的交易金额连续递增
--crd  银行卡号过去3分钟是否连续三笔以上的交易金额连续递增


--合并表
select t1.ID,t1.AMT,crd01,crd02,crd03,crd04,crd05,crd06,crd07,crd08,crd09,crd10,
crd11,crd12,crd13,crd14,crd15,crd16,crd17,crd19,crd20,crd21
from yeebao_y as t1
left join crd01_03_y on t1.ID=crd01_03_y.ID
left join crd04_06_y on t1.ID=crd04_06_y.ID
left join crd07_08_y on t1.ID=crd07_08_y.ID
left join crd09_y on t1.ID=crd09_y.ID
left join crd10_y on t1.ID=crd10_y.ID
left join crd11_y on t1.ID=crd11_y.ID
left join crd12_13_y on t1.ID=crd12_13_y.ID
left join crd14_15_y on t1.ID=crd14_15_y.ID
left join crd16_17_y on t1.ID=crd16_17_y.ID
left join crd19_y on t1.ID=crd19_y.ID
left join crd20_y on t1.ID=crd20_y.ID
left join crd21_y on t1.ID=crd21_y.ID
order by t1.ID


select t1.ID,t1.AMT,
case when t1.crd01  is null then 0 else t1.crd01  end as crd01 ,
case when t1.crd02  is null then 0 else t1.crd02  end as crd02 ,
case when t1.crd03  is null then 0 else t1.crd03  end as crd03 ,
case when t1.crd04  is null then 0 else t1.crd04  end as crd04 ,
case when t1.crd05  is null then 0 else t1.crd05  end as crd05 ,
case when t1.crd06  is null then 0 else t1.crd06  end as crd06 ,
case when t1.crd07  is null then 0 else t1.crd07  end as crd07 ,
case when t1.crd08  is null then 0 else t1.crd08  end as crd08 ,
case when t1.crd09  is null then 0 else t1.crd09  end as crd09 ,
case when t1.crd10  is null then 0 else t1.crd10  end as crd10 ,
case when t1.crd11  is null then 0 else t1.crd11  end as crd11 ,
case when t1.crd12  is null then 0 else t1.crd12  end as crd12 ,
case when t1.crd13  is null then 0 else t1.crd13  end as crd13 ,
case when t1.crd14  is null then 0 else t1.crd14  end as crd14 ,
case when t1.crd15  is null then 0 else t1.crd15  end as crd15 ,
case when t1.crd16  is null then 0 else t1.crd16  end as crd16 ,
case when t1.crd17  is null then 0 else t1.crd17  end as crd17 ,
case when t1.crd19  is null then 0 else t1.crd19  end as crd19 ,
case when t1.crd20  is null then 0 else t1.crd20  end as crd20 ,
case when t1.crd21  is null then 0 else t1.crd21  end as crd21 
from crd as t1
order by t1.ID

--特征宽表
select t1.ID,crd01,crd02,crd03,crd04,crd05,crd06,crd07,crd08,crd09,crd10,
crd11,crd12,crd13,crd14,crd15,crd16,crd17,
t1.AMT/crd04 as crd18,
t1.crd19/crd02 as crd19,
t1.crd20/crd05 as crd20,
case when t1.AMT>3*crd21 then 1 else 0 end as crd21
from crd_yy as t1
order by t1.ID






