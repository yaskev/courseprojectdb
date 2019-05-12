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
    begin
        insert into account values()
    end;
    $first_account$
    language plpgsql;