create or replace procedure PROC_STAG_FLIGHTS2018
as 
begin
MERGE INTO STAGING_FLIGHTS staging
 USING(select  YEAR, MONTH,DAY,TAIL_NUMBER, FLIGHT_NUMBER, ORIGIN_AIRPORT,ARRIVAL_DELAY, DESTINATION_AIRPORT,DEPARTURE_DELAY,CANCELLED, CANCELLATION_REASON from FLIGHTS_2018) source on(source.FLIGHT_NUMBER = staging.FLIGHT_NUMBER)
 when MATCHED THEN
 UPDATE SET
 staging.YEAR = source.YEAR,
 staging.MONTH =source.MONTH,
 staging.DAY=source.DAY,
 staging.TAIL_NUMBER = source.TAIL_NUMBER,
 staging.ORIGIN_AIRPORT = source.ORIGIN_AIRPORT, 
 staging.ARRIVAL_DELAY=source.ARRIVAL_DELAY,
 staging.DESTINATION_AIRPORT = source.DESTINATION_AIRPORT,
 staging.DEPARTURE_DELAY=source.DEPARTURE_DELAY,
 staging.CANCELLED = source.CANCELLED,                               
 staging.CANCELLED_REASON = source.CANCELLATION_REASON
 where staging.YEAR = source.YEAR and
 staging.MONTH =source.MONTH and
 staging.DAY=SOURCE.DAY and
 staging.TAIL_NUMBER = source.TAIL_NUMBER and
  staging.ORIGIN_AIRPORT = source.ORIGIN_AIRPORT and
  staging.ARRIVAL_DELAY=source.ARRIVAL_DELAY and
   staging.DESTINATION_AIRPORT = source.DESTINATION_AIRPORT and
staging.DEPARTURE_DELAY= source.DEPARTURE_DELAY and
 staging.CANCELLED = source.CANCELLED and                                
 staging.CANCELLED_REASON = source.CANCELLATION_REASON
 when not matched THEN
 insert values(FLIGHT_SEQ.nextval,source.YEAR,source.MONTH,SOURCE.DAY, source.TAIL_NUMBER, source.FLIGHT_NUMBER, source.ORIGIN_AIRPORT,source.ARRIVAL_DELAY, source.DESTINATION_AIRPORT,source.DEPARTURE_DELAY, source.CANCELLED,
 source.CANCELLATION_REASON, '2018');
 END;
