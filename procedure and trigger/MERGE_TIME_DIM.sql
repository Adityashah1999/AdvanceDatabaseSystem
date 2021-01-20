create or replace procedure merge_time_dim
as

    BEGIN
       
        MERGE INTO time_DIM dt
        USING (SELECT  YEAR, MONTH , DAY
               FROM TRANSFORM_COMPLAINT) TC
        ON (dt.YEAR = tc.YEAR
           AND dt.MONTH = tc.MONTH AND dt.DAY=tc.DAY
           )
        WHEN NOT MATCHED THEN
            INSERT (TIME_ID, MONTH, YEAR, DAY)
            VALUES (sequence_time_id.nextval,Tc.MONTH, Tc.YEAR,TC.DAY);
        end;
