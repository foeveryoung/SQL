--证件号过去3分钟的累计交易金额 id01
select t3je1.ID, sum(t3je2.AMT) AS id01
FROM yeebao_y AS t3je1 LEFT JOIN yeebao_y AS t3je2
ON t3je1.ID_NO=t3je2.ID_NO
WHERE t3je1.UTIME-t3je2.UTIME>=0
and t3je1.UTIME-t3je2.UTIME<180
GROUP BY t3je1.ID
ORDER BY t3je1.ID

--证件号过去3分钟的累计交易笔数 id02
select t3bs1.ID, count(*) AS id02
FROM yeebao_y AS t3bs1 LEFT JOIN yeebao_y AS t3bs2
ON t3bs1.ID_NO=t3bs2.ID_NO
WHERE t3bs1.UTIME-t3bs2.UTIME>=0
and t3bs1.UTIME-t3bs2.UTIME<180
GROUP BY t3bs1.ID
order by t3bs1.ID

--证件号过去3分钟的大额交易（>=70000)笔数 id03
SELECT t1.ID, count(*) as id03
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
and t2.AMT>=70000
GROUP BY t1.ID
order by t1.ID


--证件号过去1小时内的累计交易金额 id04
select t1.ID, sum(t2.AMT) AS id04
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
ORDER BY t1.ID

--证件号过去1小时内的累加交易笔数 id05
select t1.ID, count(*) AS id05
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID

--证件号过去1小时的大额（>=70000)交易笔数 id06
SELECT t1.ID, count(*) as id06
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
and t2.AMT>=70000
GROUP BY t1.ID
order by t1.ID

--证件号过去1天的累计交易金额 id07
select t1.ID, sum(t2.AMT) AS id07
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
ORDER BY t1.ID

--证件号过去1天的累计交易笔数 id08
select t1.ID, count(*) AS id08
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
order by t1.ID

--证件号过去1天的大额交易（>=70000)笔数 id09
SELECT t1.ID, count(*) as id09
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
and t2.AMT>=70000
GROUP BY t1.ID
order by t1.ID

--证件号当前交易金额占过去过去1小时内累计交易金额的比例  id10 *



--证件号当前交易金额是否大于过去1天的金额（平均值+2*标准差）id11  *   修改为1,5倍平均值
select t1.ID,avg(t2.AMT) AS id11_1
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
ORDER BY t1.ID

select t1.ID,std(t2.AMT) AS id11_2
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
ORDER BY t1.ID

--证件号过去3分钟关联的IP数 id13
SELECT t1.ID, count(distinct t2.USR_IP) as id13
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID
--证件号过去1小时关联的IP数量 id14
SELECT t1.ID, count(distinct t2.USR_IP) as id14
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
order by t1.ID
--证件号过去1天关联的IP数量 id15
SELECT t1.ID, count(distinct t2.USR_IP) as id15
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
order by t1.ID

--证件号过去3分钟内是否出现交易失败 id16 *
select t1.ID, sum(t2.PAY_RESULT) as id16
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID

--证件号过去3分钟内失败交易笔数占总笔数的比例 id17 *

--证件号过去1小时内是否出现交易失败 id18 *
select t1.ID, sum(t2.PAY_RESULT) as id18
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID
--证件号过去1小时内失败交易笔数占总交易笔数的比例  id19 *

--证件号过去3分钟内关联的终端号 id20
SELECT t1.ID, count(distinct t2.GIF_TRMID) as id20
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<180
GROUP BY t1.ID
order by t1.ID
--证件号过去1小时关联的终端号 id21
SELECT t1.ID, count(distinct t2.GIF_TRMID) as id21
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<3600
GROUP BY t1.ID
order by t1.ID
--证件号过去1天关联的终端号 id22
SELECT t1.ID, count(distinct t2.GIF_TRMID) as id22
FROM yeebao_y AS t1 LEFT JOIN yeebao_y AS t2
ON t1.ID_NO=t2.ID_NO
WHERE t1.UTIME-t2.UTIME>=0
and t1.UTIME-t2.UTIME<86400
GROUP BY t1.ID
order by t1.ID
--证件号当笔交易时间与上笔交易时间时间差
--证件号当前经纬度与上一笔经纬度的差异以及时间差异是否大于某一个阈值（时间一个阈值，经纬度一个阈值）

--合并表
select t1.ID, id01,id02,id03,id04,id05,id06,id07,id08,id09,id11_1,id11_2,id13,id14,id15,id16,id18,id20,id21,id22
from yeebao_y as t1 left join id01_y on t1.ID=id01_y.ID
left join id02_y on t1.ID=id02_y.ID
left join id03_y on t1.ID=id03_y.ID
left join id04_y on t1.ID=id04_y.ID
left join id05_y on t1.ID=id05_y.ID
left join id06_y on t1.ID=id06_y.ID
left join id07_y on t1.ID=id07_y.ID
left join id08_y on t1.ID=id08_y.ID
left join id09_y on t1.ID=id09_y.ID
left join id11_1_y on t1.ID=id11_1_y.ID
left join id11_2_y on t1.ID=id11_2_y.ID
left join id13_y on t1.ID=id13_y.ID
left join id14_y on t1.ID=id14_y.ID
left join id15_y on t1.ID=id15_y.ID
left join id16_y on t1.ID=id16_y.ID
left join id18_y on t1.ID=id18_y.ID
left join id20_y on t1.ID=id20_y.ID
left join id21_y on t1.ID=id21_y.ID
left join id22_y on t1.ID=id22_y.ID
order by t1.ID


SELECT t1.ID,t1.AMT,
CASE WHEN t2.id01 IS null THEN 0 ELSE t2.id01 END AS id01,
CASE WHEN t2.id02 IS null THEN 0 ELSE t2.id02 END AS id02,
CASE WHEN t2.id03 IS null THEN 0 ELSE t2.id03 END AS id03,
CASE WHEN t2.id04 IS null THEN 0 ELSE t2.id04 END AS id04,
CASE WHEN t2.id05 IS null THEN 0 ELSE t2.id05 END AS id05,
CASE WHEN t2.id06 IS null THEN 0 ELSE t2.id06 END AS id06,
CASE WHEN t2.id07 IS null THEN 0 ELSE t2.id07 END AS id07,
CASE WHEN t2.id08 IS null THEN 0 ELSE t2.id08 END AS id08,
CASE WHEN t2.id09 IS null THEN 0 ELSE t2.id09 END AS id09,
t2.id11_1,t2.id11_2,
CASE WHEN t2.id13 IS null THEN 0 ELSE t2.id13 END AS id13,
CASE WHEN t2.id14 IS null THEN 0 ELSE t2.id14 END AS id14,
CASE WHEN t2.id15 IS null THEN 0 ELSE t2.id15 END AS id15,
CASE WHEN t2.id16 IS null THEN 0 ELSE t2.id16 END AS id16,
CASE WHEN t2.id18 IS null THEN 0 ELSE t2.id18 END AS id18,
CASE WHEN t2.id20 IS null THEN 0 ELSE t2.id20 END AS id20,
CASE WHEN t2.id21 IS null THEN 0 ELSE t2.id21 END AS id21,
CASE WHEN t2.id22 IS null THEN 0 ELSE t2.id22 END AS id22
FROM yeebao_y as t1 LEFT JOIN id_y AS t2
ON t1.ID=t2.ID
ORDER BY t1.ID

--形成特征宽表 yeebao_id
SELECT t1.ID,t1.id01,t1.id02,t1.id03,t1.id04,t1.id05,t1.id06,t1.id07,t1.id08,t1.id09,
t1.AMT/t1.id04 as id10,
CASE WHEN t1.AMT>3*t1.id16 THEN 1 ELSE 0 END AS id11,
t1.id13,t1.id14,t1.id15,
CASE WHEN t1.id16>0 THEN 1 ELSE 0 END AS id16,
t1.id16/t1.id02 AS id17,
CASE WHEN t1.id18>0 THEN 1 ELSE 0 END AS id18,
t1.id18/t1.id05 AS id19,
t1.id20,t1.id21,t1.id22
FROM id_yy AS t1 