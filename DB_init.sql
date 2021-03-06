set search_path to trading;

create table Company (
    company_id serial primary key,
    company_nm varchar(50) not null,
    address_txt varchar(50)
);

create table Broker (
    broker_id serial primary key,
    broker_nm varchar(50) not null,
    address_txt varchar(50),
    commission_amt real check ( commission_amt >= 0 )
);

create table Trader (
    trader_id serial primary key,
    trader_nm varchar(25) not null,
    address_txt varchar(50),
    joined_dt timestamp not null,
    birth_dt timestamp not null,
    is_vip_flg boolean default false,
    broker_id integer references Broker(broker_id) on delete cascade
);

-- alter table account drop constraint account_trader_id_fkey;
-- alter table account add constraint constraint_fk foreign key (trader_id) references Trader(trader_id) on delete cascade;

create table Account (
    account_id serial,
    trader_id integer references Trader(trader_id) on delete cascade,
    account_no integer not null,
    currency_nm varchar(3) not null,
    valid_from_dttm timestamp not null,
    valid_to_dttm timestamp not null default timestamp'01-01-9999',
    primary key (account_id)
);

create table Balance (
    account_id integer references Account(account_id) on delete cascade,
    balance_amt real default 0.0,
    valid_from_dttm timestamp not null,
    valid_to_dttm timestamp default timestamp '01-01-9999',
    primary key (account_id, valid_from_dttm)
);

create table Stock (
    ticker_id varchar(4) primary key,
    company_id integer not null references Company(company_id)
);

create table Exchange (
    exchange_id serial primary key,
    exchange_nm varchar(50) not null,
    address_txt varchar(50),
    commission_amt real check (commission_amt >= 0)
);

create table Stock_X_Account (
    ticker_id varchar(4) references Stock(ticker_id),
    exchange_id integer references Exchange(exchange_id),
    account_id integer references Account(account_id),
    stock_cnt integer check ( stock_cnt > 0 ),
    transaction_dttm timestamp,
    transaction_type varchar(4) check ( transaction_type in ('BUY', 'SELL') ),
    primary key (ticker_id, exchange_id, account_id, transaction_dttm)
);

create table Stock_X_Exchange (
    ticker_id varchar(4) references Stock(ticker_id),
    exchange_id integer references Exchange(exchange_id),
    price_amt real check ( price_amt > 0 ),
    valid_from_dt timestamp,
    valid_to_dt timestamp,
    primary key (ticker_id, exchange_id, valid_from_dt)
);

create table Account_X_Exchange (
    exchange_id integer references Exchange(exchange_id),
    account_id integer references Account(account_id),
    primary key (exchange_id, account_id)
);

create table Exchange_X_Broker (
    exchange_id integer references Exchange(exchange_id),
    broker_id integer references Broker(broker_id),
    primary key (exchange_id, broker_id)
);

-- alter table balance drop constraint balance_account_id_fkey;
-- alter table balance add constraint constraint_fk
-- foreign key (account_id) references Account(account_id) on delete cascade;