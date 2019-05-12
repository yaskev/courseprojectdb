set search_path to trading;

-- First Trigger
create or replace function create_empty_balance()
    returns trigger as
    $empty_balance$
    begin
        insert into balance values (new.account_id, 0, now(), timestamp'01-01-9999');
        return new;
    end;
    $empty_balance$
    language plpgsql;

create trigger empty_balance
    after insert on account
    for each row
    execute procedure create_empty_balance();

-- Example
insert into account values(8, 5, 1008, 'RUR', now());
select * from complex_account_view;
delete from account where account_id = 8;

-- Second Trigger
create or replace function create_first_account()
    returns trigger as
    $first_account$
    declare
        acc_id integer;
    begin
        insert into account (trader_id, account_no, currency_nm, valid_from_dttm)
            values (new.trader_id, 1000, 'USD', now());
        acc_id = (select currval(pg_get_serial_sequence('account', 'account_id')));
        update account set account_no = 1000 + acc_id where account_id = acc_id;
        insert into balance values (acc_id, 0, now(), timestamp'01-01-9999');
        return new;
    end;
    $first_account$
    language plpgsql;

create trigger first_account
    after insert on trader
    for each row
    execute procedure create_first_account();

-- Example
insert into trader (trader_nm, address_txt, joined_dt, birth_dt)
    values('Denis Titov', 'St. Petersburg, Russia', now(), timestamp'05-12-1988');
select * from trader;
select * from complex_account_view;
delete from trader where trader_id = 17;


-- Trigger 3
create or replace function set_account_no()
    returns trigger as
    $set_no$
    declare
        acc_id integer;
    begin
        acc_id = (select currval(pg_get_serial_sequence('account', 'account_id')));
        update account set account_no = 1000 + acc_id where account_id = acc_id;
        return new;
    end;
    $set_no$
    language plpgsql;

create trigger set_no
    after insert on account
    for each row
    execute procedure set_account_no();

insert into account (trader_id, account_no, currency_nm, valid_from_dttm)
    values (3, 1000, 'USD', now());
select * from account;