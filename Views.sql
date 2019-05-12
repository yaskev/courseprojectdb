set search_path to trading;

create view company_view as (
    select company_nm,
           address_txt
    from company
);

create view stock_view as (
    select distinct comp.company_nm,
           st.ticker_id,
           ex.exchange_nm
    from Stock st inner join Company comp on st.company_id = comp.company_id
        inner join stock_x_exchange sxe on st.ticker_id = sxe.ticker_id
        inner join exchange ex on sxe.exchange_id = ex.exchange_id
);

create view exchange_view as (
    select exchange_nm,
           address_txt,
           commission_amt
    from exchange
);

create view broker_view as (
    select broker_nm,
           address_txt,
           commission_amt
    from Broker
);

create view trader_view as (
    select split_part(t.trader_nm, ' ', 1) || ' ' || substr(split_part(t.trader_nm, ' ', 2), 1, 1) || '.' as Name,
           t.address_txt,
           t.joined_dt,
           t.is_vip_flg,
           b.broker_nm
    from Trader t left join Broker b on t.broker_id = b.broker_id
);

create view account_view as (
    select t.trader_nm,
           substr(cast(a.account_no as text), 1, 1) || '**' || substr(cast(a.account_no as text), 4, 1) as Account_no,
           b.balance_amt,
           a.currency_nm,
           b.valid_from_dttm,
           b.valid_to_dttm
    from Trader t inner join Account a on a.trader_id = t.trader_id
        inner join Balance b on a.account_id = b.account_id
);

create view balance_view as (
    select account_id,
           balance_amt
    from Balance where valid_to_dttm = timestamp'01-01-9999'
);

create view stock_x_account_view as (
    select sxa.ticker_id,
           substr(cast(a.account_no as text), 1, 1) || '**' || substr(cast(a.account_no as text), 4, 1) as Account_no,
           sxa.stock_cnt,
           sxa.transaction_dttm,
           sxa.transaction_type
    from stock_x_account sxa inner join account a on sxa.account_id = a.account_id
);

create view exchange_x_broker_view as (
    select e.exchange_nm,
           b.broker_nm
    from exchange_x_broker exb inner join Exchange e on exb.exchange_id = e.exchange_id
        inner join Broker b on exb.broker_id = b.broker_id
);

create view account_x_exchange_view as (
    select overlay(cast(a.account_no as text) placing '**' from 2 for 2) as Account_no,
           e.exchange_nm
    from account_x_exchange axe inner join account a on axe.account_id = a.account_id
        inner join Exchange e on e.exchange_id = axe.exchange_id
);

create view stock_x_exchange_view as (
    select sxe.ticker_id,
           e.exchange_nm,
           sxe.price_amt
    from stock_x_exchange sxe inner join exchange e on sxe.exchange_id = e.exchange_id
    where sxe.valid_to_dt = timestamp'01-01-9999'
);


select * from account_view;
select * from account_x_exchange_view;
select * from balance_view;
select * from broker_view;
select * from company_view;
select * from exchange_view;
select * from exchange_x_broker_view;
select * from stock_view;
select * from stock_x_account_view;
select * from stock_x_exchange_view;
select * from trader_view;
