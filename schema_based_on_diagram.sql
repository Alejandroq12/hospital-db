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

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(50),
  name VARCHAR(50),
  PRIMARY KEY(id)
);

CREATE TABLE medical_history_treatments (
  medical_history_id INT,
  treatment_id INT,
  PRIMARY KEY (medical_history_id, treatment_id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

-- Adding foreign key index to patient_id column in medical_histories table

CREATE INDEX fk_idx_medical_histories_patient_id ON medical_histories (patient_id);

-- Adding foreign key index to medical_history_id column in invoices table

CREATE INDEX fk_idx_invoices_medical_history_id ON invoices (medical_history_id);

-- Adding foreign key indexes to invoice_id and treatment_id columns in invoice_items table

CREATE INDEX fk_idx_invoice_items_invoice_id ON invoice_items (invoice_id);
CREATE INDEX fk_idx_invoice_items_treatment_id ON invoice_items (treatment_id);
