CREATE TABLE "medical-doc" (
  "id" integer PRIMARY KEY,
  "name" text,
  "position" text
);

CREATE TABLE "diagnose" (
  "id" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE "diseases" (
  "id" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE "patient-info" (
  "id" integer PRIMARY KEY,
  "name" text,
  "insurance" text,
  "phone-number" integer,
  "birth-date" integer
);

CREATE TABLE "medical-record" (
  "date" integer,
  "dr-id" integer,
  "dis-id" integer,
  "dig-id" integer,
  "prescription" text
);

CREATE TABLE "patient-list" (
  "pt-id" integer,
  "dis-id" integer,
  "dig-id" integer
);

ALTER TABLE "diseases" ADD FOREIGN KEY ("id") REFERENCES "patient-list" ("dis-id");

ALTER TABLE "diagnose" ADD FOREIGN KEY ("id") REFERENCES "patient-list" ("dig-id");

ALTER TABLE "patient-info" ADD FOREIGN KEY ("id") REFERENCES "patient-list" ("pt-id");

ALTER TABLE "medical-doc" ADD FOREIGN KEY ("id") REFERENCES "medical-record" ("dr-id");

ALTER TABLE "diseases" ADD FOREIGN KEY ("id") REFERENCES "medical-record" ("dis-id");

ALTER TABLE "diagnose" ADD FOREIGN KEY ("id") REFERENCES "medical-record" ("dig-id");
