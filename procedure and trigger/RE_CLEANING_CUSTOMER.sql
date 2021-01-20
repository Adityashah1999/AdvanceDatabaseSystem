create or replace procedure RE_CLEANING_customer
as
begin
update bad_customer set error_description='missing values' where error_description is null;
null;
END;
