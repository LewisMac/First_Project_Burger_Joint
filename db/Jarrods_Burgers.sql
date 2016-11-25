
-- DROP TABLE days;
DROP TABLE deals;
DROP TABLE burgers;
DROP TABLE prices;
DROP TABLE eateries;



-- CREATE TABLE days(
--   id SERIAL4 primary key,
--   day VARCHAR
--   );

CREATE TABLE prices(
  id SERIAL4 primary key,
  price_value INT2
  );

CREATE TABLE eateries(
  id SERIAL4 primary key,
  name VARCHAR(255)
  );

CREATE TABLE burgers(
  id SERIAL4 primary key,
  name VARCHAR(255),
  price_id INT4 references prices(id) ON DELETE CASCADE,
  eatery_id INT4 references eateries(id) ON DELETE CASCADE
  );

CREATE TABLE deals(
  id SERIAL4 primary key,
  deal_type VARCHAR(255),
  burger_id INT4 references burgers(id) ON DELETE CASCADE,
  eatery_id INT4 references eateries(id) ON DELETE CASCADE
  -- deal_price1 INT4 references prices(id) ON DELETE CASCADE,
  -- deal_price2 INT4 references prices(id) ON DELETE CASCADE
  );
