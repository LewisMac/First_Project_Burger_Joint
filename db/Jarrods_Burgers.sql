
DROP TABLE joining_set_price;
DROP TABLE joining;
DROP TABLE x_for_y_deals;
DROP TABLE deals;
DROP TABLE burgers;
DROP TABLE prices;
DROP TABLE eateries;

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
  percentage_off INT4,
  day VARCHAR(255),
  burger_id INT4 references burgers(id) ON DELETE CASCADE,
  eatery_id INT4 references eateries(id) ON DELETE CASCADE,
  price INT4
  );

CREATE TABLE x_for_y_deals(
  id SERIAL4 primary key,
  x_value INT4,
  y_value INT4,
  burger_id text,
  day VARCHAR(255),
  eatery_id INT4 references eateries(id) ON DELETE CASCADE,
  price INT4
);

CREATE TABLE joining (
  id SERIAL4 primary key,
  type VARCHAR(255),
  deal_id INT4 references x_for_y_deals(id) ON DELETE CASCADE,
  burger_id INT4 references burgers(id) ON DELETE CASCADE
);

CREATE TABLE joining_set_price (
id SERIAL4 primary key,
day VARCHAR(255),
burger_id INT4 references burgers(id) ON DELETE CASCADE,
price_id INT4 references prices(id) ON DELETE CASCADE
);

  







