DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    date_of_birth DATE
);

CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    date DATE,
    doctor_id INTEGER REFERENCES doctor(id),
    patient_id INTEGER REFERENCES patient(id)
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visit(id),
    disease_id INTEGER REFERENCES disease(id)
);