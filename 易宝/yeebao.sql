SELECT ID,(CASE
WHEN MOBILE_AREA=='河北' THEN 12
WHEN MOBILE_AREA=='山西' THEN 13 
WHEN MOBILE_AREA=='广西' THEN 14
WHEN MOBILE_AREA=='广东' THEN 15
ELSE 16
END)MOBILE_AREA_OH
FROM yeebao AS MOBILE_AREA_OH


--转时间戳
SELECT unix_timestamp(OCC_TM,"yyyy/MM/dd HH:mm:ss") AS dtime FROM yeebao limit 100

SELECT a1.ID, count(*) as hh
from yeebao as a1 LEFT JOIN yeebao as a2
ON a1.USR_IP =a2.USR_IP
WHERE unix_timestamp(a1.OCC_TM,"yyyy/MM/dd HH:mm:ss")-unix_timestamp(a2.OCC_TM,"yyyy/MM/dd HH:mm:ss")>0
and unix_timestamp(a1.OCC_TM,"yyyy/MM/dd HH:mm:ss")-unix_timestamp(a2.OCC_TM,"yyyy/MM/dd HH:mm:ss")<600
group by a1.ID
LIMIT 10

GOODS_CD,CRD_TYP,BNK_ID,USE_TOOL,USR_TYP,CRD_AREA,IDNO_AREA,TRM_TYP,USR_IP_AREA,MOBILE_AREA,FIRST_PAY,GOODS_NM,PROD,OCC_TM,AMT,PAY_RESULT,COMP_TM,DOORGOD_RETCODE,SUB_SYS,GIF_LATIT,GIF_LOGIT,BIZ,ORDER_TYPE,ID,pay_id,USR_ID,BID_CD_ID,CRD_NO,ID_NO,USR_IP,BIZ_ORD,RID,REQ_ID,SEQ_ID,GIF_TRMID

--支付结果与欺诈透视表
SELECT PAY_RESULT, sum( CASE when FRAUD=0 THEN 1 ELSE 0 END) as fraud_0, sum(CASE when FRAUD=1 THEN 1 ELSE 0 END) AS fraud_1
FROM yeebao 
GROUP BY PAY_RESULT

--去空值
SELECT ID,GOODS_CD,CRD_TYP,BNK_ID,USE_TOOL,USR_TYP,IDNO_AREA,USR_IP_AREA,MOBILE_AREA,FIRST_PAY,GOODS_NM,PROD,OCC_TM,AMT,PAY_RESULT,COMP_TM,DOORGOD_RETCODE,SUB_SYS,GIF_LATIT,GIF_LOGIT,BIZ,pay_id,USR_ID,BID_CD_ID,CRD_NO,ID_NO,USR_IP,BIZ_ORD,RID,REQ_ID,SEQ_ID,GIF_TRMID
FROM yeebao 
WHERE 
(GOODS_CD is not null) and
(CRD_TYP is not null) and
(BNK_ID is not null) and
(USE_TOOL is not null) and
(USR_IP_AREA is not null) and
(MOBILE_AREA is not null) and
(GOODS_NM is not null) and
(PAY_RESULT is not null) and
(COMP_TM is not null) and
(GIF_LATIT is not null) and
(GIF_LOGIT is not null) and
(BIZ is not null) and
(PAY_ID is not null) and
(USR_ID is not null) and
(BID_CD_ID is not null) and
(CRD_NO is not null) and
(ID_NO is not null) and
(USR_IP is not null) and
(BIZ_ORD  is not null) and
(RID is not null) and
(SEQ_ID is not null) and
(REQ_ID  is not null) and
(GIF_TRMID  is not null)