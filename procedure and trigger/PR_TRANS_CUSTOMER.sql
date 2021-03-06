create or replace procedure PR_TRANS_CUSTOMER
as 
begin
MERGE INTO TRANSFORM_CUSTOMER T
 USING GOOD_CUSTOMER C
 ON (T.CUSTOMER_ID = C.CUSTOMER_ID )
WHEN MATCHED THEN
  UPDATE SET 
T.CUSTOMER_ZIP_CODE = C.CUSTOMER_ZIP_CODE,
T.CUSTOMER_TYPE=C.CUSTOMER_TYPE,
T.BUSINESS=C.BUSINESS
WHEN NOT MATCHED THEN
  INSERT VALUES
(CUS_TRANS_SEQ.NEXTVAL,C.CUSTOMER_ID,C.CUSTOMER_ZIP_CODE,C.CUSTOMER_TYPE,C.BUSINESS);
END;
