DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical;

CREATE TABLE medical_doc (
  id SERIAL PRIMARY KEY,
  doc_name TEXT NOT NULL,
  position TEXT NOT NULL
);

CREATE TABLE diagnose (
  id SERIAL PRIMARY KEY,
  diag_name TEXT NOT NULL
);


CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  dis_name TEXT NOT NULL
);


CREATE TABLE patient_info (
  id SERIAL PRIMARY KEY,
  patient_name TEXT NOT NULL,
  insurance TEXT NOT NULL,
  phone TEXT NOT NULL,
  birth_date TEXT NOT NULL
);


CREATE TABLE medical_record (
  id SERIAL PRIMARY KEY,
  date INTEGER,
  dr_id INTEGER REFERENCES medical_doc ON DELETE CASCADE,
  dis_id INTEGER REFERENCES diseases ON DELETE CASCADE,
  dig_id INTEGER REFERENCES diagnose ON DELETE CASCADE,
  prescription TEXT NOT NULL
);


CREATE TABLE patient_list (
  id SERIAL PRIMARY KEY,
  pt_id INTEGER REFERENCES patient_info ON DELETE CASCADE,
  dis_id INTEGER REFERENCES diseases ON DELETE CASCADE,
  dig_id INTEGER REFERENCES diagnose ON DELETE CASCADE
);

-- ALTER TABLE "diseases" ADD FOREIGN KEY ("id") REFERENCES "patient-list" ("dis-id");

-- ALTER TABLE "diagnose" ADD FOREIGN KEY ("id") REFERENCES "patient-list" ("dig-id");

-- ALTER TABLE "patient-info" ADD FOREIGN KEY ("id") REFERENCES "patient-list" ("pt-id");

-- ALTER TABLE "medical-doc" ADD FOREIGN KEY ("id") REFERENCES "medical-record" ("dr-id");

-- ALTER TABLE "diseases" ADD FOREIGN KEY ("id") REFERENCES "medical-record" ("dis-id");

-- ALTER TABLE "diagnose" ADD FOREIGN KEY ("id") REFERENCES "medical-record" ("dig-id");

INSERT INTO medical_doc 
(doc_name,position)
VALUES
('Chang-Woo Lee','MED'),
('Janoski Maxium','CHEMO'),
('Soo-Mi Park','CV');


INSERT INTO diagnose
(diag_name)
VALUES
('Ultra Sound'),
('Blood test'),
('PET-CT');


INSERT INTO diseases
(dis_name)
VALUES
('Heart disease'),
('Cervical Cancer'),
('High blood pressuer');


INSERT INTO patient_info
(patient_name ,insurance ,phone, birth_date)
VALUES
('Kyung-Sup Shin','United','201-354-2353','5/5/81'),
('Jay Kim','WellCare','212-453-2345','4/5/81'),
('Anna Bell','United','212-324-1243','3/5/81');


INSERT INTO medical_record
(date,dr_id,dis_id,dig_id,prescription)
VALUES
(050122,3,3,2,'diet and HBP medicine'),
(110222,2,2,3,'once a week chemo'),
(04120,1,1,1,'exercise therapy');


INSERT INTO patient_list
(pt_id,dis_id,dig_id)
VALUES
(1,3,2),
(2,1,1),
(3,2,3);

select doc_name,diag_name,dis_name,
date,prescription
from medical_record
join medical_doc on medical_record.dr_id = medical_doc.id
join diseases on medical_record.dis_id = diseases.id
join diagnose on medical_record.dig_id = diagnose.id;


 
