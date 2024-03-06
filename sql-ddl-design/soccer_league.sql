DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE team
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_location TEXT NOT NULL
);

CREATE TABLE player
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES team(id)
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE referee 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE match
(
    id SERIAL PRIMARY KEY,
    location TEXT NOT NULL,
    play_date DATE NOT NULL,
    away_team INTEGER REFERENCES team(id),
    home_team INTEGER REFERENCES team(id),
    referee_id INTEGER REFERENCES referee(id),
    season_id INTEGER REFERENCES season(id)
);

CREATE TABLE standing
(
    match_id INTEGER REFERENCES match(id),
    team_id INTEGER REFERENCES team(id),
    win_loss VARCHAR(1)
);

CREATE TABLE lineup
(
    match_id INTEGER REFERENCES match(id),
    player_id INTEGER REFERENCES player(id),
    team_id INTEGER REFERENCES team(id)
);

CREATE TABLE goal
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES player(id),
    match_id INTEGER REFERENCES match(id)
);