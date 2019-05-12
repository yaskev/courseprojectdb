set search_path to trading;

-- Показывает все транзакции на биржах
create view complex_stock_x_account_view as (
    select sxa.ticker_id,
           e.exchange_nm,
           substr(cast(a.account_no as text), 1, 1) || '**' || substr(cast(a.account_no as text), 4, 1) as Account_no,
           sxa.stock_cnt,
           sxa.transaction_dttm,
           sxa.transaction_type
    from stock_x_account sxa inner join account a on sxa.account_id = a.account_id
        inner join exchange e on sxa.exchange_id = e.exchange_id
);

-- Показывает счета, их валидные балансы, валюту и владельца (Только имя и 1 буква фамилии)
create view complex_account_view as (
    select split_part(t.trader_nm, ' ', 1) || ' ' || substr(split_part(t.trader_nm, ' ', 2), 1, 1) || '.' as Name,
           overlay(cast(a.account_no as text) placing '**' from 2 for 2) as Account_no,
           b.balance_amt,
           a.currency_nm
    from Trader t inner join Account a on a.trader_id = t.trader_id
        inner join Balance b on a.account_id = b.account_id
    where a.valid_to_dttm = timestamp'01-01-9999' and b.valid_to_dttm = timestamp'01-01-9999'
);

select * from stock_x_account_view;
select * from complex_account_view;
