create or replace TRIGGER TRIG_dim_cust BEFORE INSERT ON CUSTOMER_DIM FOR EACH ROW
BEGIN

:new.customer_key :=seq_dim_cust_key.NEXTVAL;

END;

