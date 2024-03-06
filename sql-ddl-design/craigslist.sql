DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE region 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE user_temp
(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    preferred_region TEXT NOT NULL
);

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    cat_name TEXT NOT NULL
);


CREATE TABLE post 
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    location TEXT NOT NULL,
    user_id INTEGER REFERENCES user_temp(id),
    region_id INTEGER REFERENCES region(id),
    category_id INTEGER REFERENCES category(id)
);