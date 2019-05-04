set search_path to trading;

-- Table account
insert into account values (8, 5, 1008, 'USD', timestamp'05-04-2019');
select * from account;
update account set currency_nm = 'EUR' where account_no = 1008;
delete from account where account_no = 1008;

-- Table trader
insert into trader values (7, 'Mickael Lewees', 'France', timestamp'05-04-2019', timestamp'11-05-1987');
update trader set broker_id = 5 where trader_id = 7;
select * from trader;
delete from trader where trader_id = 7;