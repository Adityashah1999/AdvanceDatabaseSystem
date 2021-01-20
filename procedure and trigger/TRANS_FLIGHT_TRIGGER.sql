create or replace TRIGGER  "TRANS_CUSTOMER_TRIGGER" before insert on TRANSFORM_CUSTOMER
for each row
begin
:new.CUSTOMER_ID :=CUS_TRANS_SEQ.NEXTVAL;
end;

