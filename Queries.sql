set search_path to trading;

-- For each company select the turnover of its stocks for all time
with history as (
    select sa.ticker_id as t_id,
           sa.stock_cnt as s_cnt,
           se.price_amt as p_amt,
           Account.currency_nm as c_nm
    from stock_x_account sa
             inner join stock_x_exchange se on
        sa.ticker_id = se.ticker_id and sa.exchange_id = se.exchange_id
        and sa.transaction_dttm between se.valid_from_dt and se.valid_to_dt
            inner join account on sa.account_id = account.account_id
), total_amt as (
    select t_id,
           s_cnt * p_amt as total,
           c_nm
    from history
)

select t_id as Ticker,
       sum(total),
       min(c_nm) as Currency
from total_amt
group by Ticker
order by Ticker;


-- For each transaction find a broker who conducted it
select sa.ticker_id,
       sa.transaction_type,
       sa.stock_cnt,
       b.broker_nm
from stock_x_account as sa inner join Account on sa.account_id = Account.account_id
    inner join Trader on Account.trader_id = Trader.trader_id
    inner join Broker b on b.broker_id = Trader.broker_id;


-- For each trader show their aggregate account balance
select t.trader_nm as Trader,
       sum(b.balance_amt) as Aggregate,
       min(a.currency_nm) as Currency
from Trader t inner join Account a on a.trader_id = t.trader_id
    inner join
    Balance b on b.account_id = a.account_id
    where b.valid_to_dttm = timestamp'01-01-9999'
group by t.trader_id;


-- For each trader show shares they own
with history as (
    select a.trader_id,
           a.account_id,
           sa.ticker_id as t_id,
           case
               when sa.transaction_type = 'SELL' then -1 * sa.stock_cnt
                else sa.stock_cnt
            end as Amount
    from stock_x_account sa
             inner join stock_x_exchange se on
        sa.ticker_id = se.ticker_id and sa.exchange_id = se.exchange_id
        and sa.transaction_dttm between se.valid_from_dt and se.valid_to_dt
            inner join account a on sa.account_id = a.account_id
)

select min(t.trader_nm) as Trader,
       t_id as Stock,
       sum(amount) as Stock_Amount
from history inner join Trader t on history.trader_id = t.trader_id
group by history.t_id;


-- Show brokers who have VIP Clients
select distinct b.broker_nm
from Broker b inner join Trader t on b.broker_id = t.broker_id
group by b.broker_nm
having sum(case when t.is_vip_flg then 1 else 0 end) > 0;
