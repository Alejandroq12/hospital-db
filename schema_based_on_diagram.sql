CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(50),
  PRIMARY KEY(id),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  date_of_birth DATE,
  PRIMARY KEY(id)
);