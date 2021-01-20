create or replace procedure bad_customer_generate_procedure
as 
begin
	
	update STAGING_CUSTOMER set CUSTOMER_TYPE=null where customer_id in (105,10,106);
	update STAGING_CUSTOMER set BUSINESS='#$$' where customer_id=10;
end;
