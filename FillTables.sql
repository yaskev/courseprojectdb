set search_path to trading;

insert into company values (1, 'Apple', 'Apple Campus, Cupertino, USA');
insert into company values (2, 'Google', 'Amphitheatre Parkway Mountain View, CA, USA');
insert into company values (3, 'Sberbank', '19 Vavilova St., Moscow, Russia');
insert into company values (4, 'Aeroflot', '1 Arbat St., Moscow, Russia');
insert into company values (5, 'Gazprom', '4A Novodanilovskaya nab., Moscow, Russia');
insert into company values (6, 'Facebook', '1 Hacker Way, Menlo Park, CA, USA');
insert into company values (7, 'General Electric', '3135 Easton Turnpike, Fairfield, CT, USA');

insert into broker values (1, 'Oanda', '795 Folsom St Floor 1, San Francisco, CA, USA', 5);
insert into broker values (2, 'TD Ameritrade', '1945 Irving St., San Francisco, CA, USA', 6.95);
insert into broker values (3, 'Fidelity', 'Fidelity Investments PO Box, Cincinnati, USA', 4.95);
insert into broker values (4, 'E*TRADE', 'New York, USA', 6.95);
insert into broker values (5, 'Merrill Edge', '400 El Camino Real, Burlingame, CA, USA', 6.95);

insert into trader values (1, 'John Obama', 'New York, USA', timestamp'01-22-2014', timestamp'09-25-1990');
insert into trader values (2, 'Ivan Grigoryev', 'Novosibirsk, Russia', timestamp'05-01-2016', timestamp'08-06-1975');
insert into trader values (3, 'Andrew Komarov', 'Ekaterinburg, Russia', timestamp'04-23-2013', timestamp'09-06-1999');
insert into trader values (4, 'Ivan Volkov', 'Munchen, Germany', timestamp'05-23-2017', timestamp'06-30-1988', true);
insert into trader values (5, 'Daniel Carvalho', 'Rome, Italy', timestamp'05-12-2014', timestamp'05-29-1985', true);
insert into trader values (6, 'Adil Menveed', 'Pakistan', timestamp'12-23-2013', timestamp'11-05-1977');

insert into account values (1, 1, 1001, 'USD', timestamp'05-02-2015');
insert into account values (2, 1, 1002, 'USD', timestamp'04-25-2017');
insert into account values (3, 2, 1003, 'USD', timestamp'01-12-2016');
insert into account values (4, 3, 1004, 'RUR', timestamp'04-29-2014');
insert into account values (5, 4, 1005, 'RUR', timestamp'01-01-2018', timestamp'04-29-2019');
insert into account values (6, 5, 1006, 'EUR', timestamp'04-02-2016');
insert into account values (7, 5, 1007, 'EUR', timestamp'04-02-2015');

insert into balance values (1, 0, timestamp'05-02-2015', timestamp'11-05-2015');
insert into balance values (1, 1500, timestamp'11-05-2015', timestamp'12-20-2016');
insert into balance values (1, 1200, timestamp'12-20-2016', timestamp'05-12-2017');
insert into balance values (1, 2600, timestamp'05-12-2017');
insert into balance values (2, 0, timestamp'04-25-2017', timestamp'12-26-2017');
insert into balance values (2, 2000, timestamp'12-26-2017', timestamp'08-26-2018');
insert into balance values (2, 5000, timestamp'08-26-2018');
insert into balance values (3, 0, timestamp'01-12-2016', timestamp'11-26-2016');
insert into balance values (3, 6000, timestamp'11-26-2016', timestamp'05-23-2017');
insert into balance values (3, 2000, timestamp'05-23-2017');
insert into balance values (4, 0, timestamp'04-29-2014', timestamp'05-21-2016');
insert into balance values (4, 150000, timestamp'05-21-2016');
insert into balance values (5, 0, timestamp'01-01-2018', timestamp'03-12-2018');
insert into balance values (5, 520000, timestamp'03-12-2018', timestamp'03-13-2018');
insert into balance values (5, 950000, timestamp'03-13-2018', timestamp'05-22-2018');
insert into balance values (5, 450000, timestamp'05-22-2018', timestamp'08-29-2018');
insert into balance values (5, 300000, timestamp'08-29-2018', timestamp'04-29-2019');
insert into balance values (5, 0, timestamp'04-29-2019');
insert into balance values (6, 0, timestamp'04-02-2016', timestamp'09-16-2017');
insert into balance values (6, 3000, timestamp'09-16-2017');
insert into balance values (7, 0, timestamp'04-02-2015', timestamp'07-11-2017');
insert into balance values (7, 3000, timestamp'07-11-2017');

insert into stock values ('AAPL', 1);
insert into stock values ('GOOG', 2);
insert into stock values ('SBER', 3);
insert into stock values ('AFLT', 4);
insert into stock values ('GAZP', 5);
insert into stock values ('FB', 6);
insert into stock values ('GE', 7);

insert into exchange values(1, 'New-York Stock Exchange', '11 Wall St, New York, NY, USA', 0.01);
insert into exchange values (2, 'Moscow Exchange', '4/7 Vozdvizhenka St., Moscow, Russia', 0.02);

insert into account_x_exchange values (1, 1);
insert into account_x_exchange values (2, 1);
insert into account_x_exchange values (1, 2);
insert into account_x_exchange values (2, 2);
insert into account_x_exchange values (1, 3);
insert into account_x_exchange values (2, 3);
insert into account_x_exchange values (2, 4);
insert into account_x_exchange values (2, 5);
insert into account_x_exchange values (1, 6);
insert into account_x_exchange values (2, 6);
insert into account_x_exchange values (1, 7);
insert into account_x_exchange values (2, 7);

insert into trader_x_broker values (1, 1);
insert into trader_x_broker values (1, 2);
insert into trader_x_broker values (5, 5);
insert into trader_x_broker values (5, 4);
insert into trader_x_broker values (2, 5);
insert into trader_x_broker values (3, 5);
insert into trader_x_broker values (4, 3);

insert into exchange_x_broker values (1, 1);
insert into exchange_x_broker values (2, 1);
insert into exchange_x_broker values (1, 2);
insert into exchange_x_broker values (2, 2);
insert into exchange_x_broker values (2, 3);
insert into exchange_x_broker values (1, 4);
insert into exchange_x_broker values (2, 4);
insert into exchange_x_broker values (1, 5);
insert into exchange_x_broker values (2, 5);

insert into stock_x_exchange values ('AAPL', 1, 300, timestamp'12-20-2016', timestamp'01-15-2017');
insert into stock_x_exchange values ('AAPL', 1, 310, timestamp'01-15-2017', timestamp'05-12-2017');
insert into stock_x_exchange values ('AAPL', 1, 1400, timestamp'05-12-2017', timestamp'05-03-2019');
insert into stock_x_exchange values ('GOOG', 1, 1500, timestamp'08-26-2018', timestamp'09-12-2019');
insert into stock_x_exchange values ('GE', 1, 10, timestamp'05-23-2017', timestamp'08-12-2018');
insert into stock_x_exchange values ('SBER', 2, 430, timestamp'03-13-2018', timestamp'04-25-2018');
insert into stock_x_exchange values ('AFLT', 2, 150, timestamp'05-22-2018', timestamp'12-25-2018');
insert into stock_x_exchange values ('GAZP', 2, 300, timestamp'08-29-2018', timestamp'11-24-2018');

insert into stock_x_account values ('AAPL', 1, 1, 1, timestamp'12-20-2016', 'BUY');
insert into stock_x_account values ('AAPL', 1, 1, 1, timestamp'05-12-2017', 'SELL');
insert into stock_x_account values ('GOOG', 1, 2, 2, timestamp'08-26-2018', 'SELL');
insert into stock_x_account values ('GE', 1, 3, 300, timestamp'05-23-2017', 'BUY');
insert into stock_x_account values ('SBER', 2, 5, 1000, timestamp'03-13-2018', 'SELL');
insert into stock_x_account values ('AFLT', 2, 5, 1000, timestamp'05-22-2018', 'BUY');
insert into stock_x_account values ('GAZP', 2, 5, 1000, timestamp'04-29-2019', 'BUY');
