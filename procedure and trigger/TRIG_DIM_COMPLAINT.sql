create or replace TRIGGER TRIG_dim_complaint BEFORE INSERT ON COMPLAINT_DIM FOR EACH ROW
BEGIN

:new.COMPLAINT_key:=seq_dim_complaint_id.NEXTVAL;

END;

