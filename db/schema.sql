CREATE TABLE "user" (
  "id" integer PRIMARY KEY,
  "first_name" varchar(15),
  "last_name" varchar(15),
  "email" varchar(30) UNIQUE,
  "phone" varchar(10),
  "dob" date,
  "username" varchar(15) UNIQUE,
  "password" varchar(30),
  "profile_image" varchar(100),
  "address" varchar(100),
  "is_active" boolean,
  "company_id" integer,
  "meta" jsonb(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "vendor" (
  "id" integer PRIMARY KEY,
  "name" varchar(30),
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "account" (
  "id" integer PRIMARY KEY,
  "name" varchar(30),
  "account_number" integer UNIQUE,
  "routing_number" integer,
  "bank_id" integer,
  "type" integer,
  "country_id" boolean,
  "company_id" integer,
  "postable" boolean,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "bank" (
  "id" integer PRIMARY KEY,
  "name" varchar(15) UNIQUE,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "company" (
  "id" integer PRIMARY KEY,
  "name" varchar(30) UNIQUE,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "production" (
  "id" integer PRIMARY KEY,
  "name" varchar(30) UNIQUE,
  "company_id" integer,
  "default_set_id" integer,
  "default_location_id" integer,
  "default_series_id" integer,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "series" (
  "id" integer PRIMARY KEY,
  "name" varchar(30) UNIQUE,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "location" (
  "id" integer PRIMARY KEY,
  "name" varchar(30) UNIQUE,
  "state_id" integer,
  "country_id" integer,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "set" (
  "id" integer PRIMARY KEY,
  "name" varchar(30) UNIQUE,
  "location_id" integer,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "currency" (
  "id" integer PRIMARY KEY,
  "name" string(15) UNIQUE,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "budget" (
  "id" integer PRIMARY KEY,
  "name" varchar(30) UNIQUE,
  "amount" decimal,
  "currency_id" integer,
  "production_id" integer,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "state" (
  "id" integer PRIMARY KEY,
  "name" varchar(30) UNIQUE,
  "contry_id" integer,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "country" (
  "id" integer PRIMARY KEY,
  "name" varchar(30) UNIQUE,
  "is_active" boolean,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "permission" (
  "id" integer PRIMARY KEY,
  "name" string(30) UNIQUE,
  "permission_type" integer,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "permission_type" (
  "id" integer PRIMARY KEY,
  "permission_type" string(30) UNIQUE,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "user_permission" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "permission_id" integer,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "bill" (
  "id" integer PRIMARY KEY,
  "date" date,
  "amount" decimal,
  "currency" string(15),
  "vendor" integer,
  "particulars" text(100),
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "payment" (
  "id" integer PRIMARY KEY,
  "date" date,
  "payment_type" string(15),
  "bill_id" integer,
  "payroll_id" integer,
  "amount" decimal,
  "currency" string(15),
  "account_id" integer,
  "budget_id" integer,
  "location_id" integer,
  "reconciliation_status" integer,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "payment_type" (
  "id" integer PRIMARY KEY,
  "type" string(15) UNIQUE,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "payroll" (
  "id" integer PRIMARY KEY,
  "payment_type" string(10),
  "employee_first_name" integer,
  "employee_last_name" integer,
  "employee_id" integer,
  "amount" decimal,
  "currency_id" integer,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "journal" (
  "id" integer PRIMARY KEY,
  "date" date,
  "entry_type" boolean,
  "payment_id" integer,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "tenant" (
  "id" integer PRIMARY KEY,
  "name" integer UNIQUE,
  "company_id" integer,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "petty_cash" (
  "id" integer PRIMARY KEY,
  "payment_type" string(15),
  "amount" decimal,
  "currency" string,
  "account_id" integer,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "purchase_order" (
  "id" integer PRIMARY KEY,
  "po_number" integer,
  "po_date" date,
  "amount" decimal,
  "currency" string(15),
  "production_id" integer,
  "approver1_id" integer,
  "approver1_date" timestamp(100),
  "approver1_comments" text,
  "approver2_id" integer,
  "approver2_date" timestamp(100),
  "approver2_comments" text,
  "approver3_id" integer,
  "approver3_date" timestamp(100),
  "approver3_comments" text,
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "account_payable" (
  "id" integer PRIMARY KEY,
  "po_number" date,
  "vendor" integer,
  "amount" decimal,
  "currency" string(15),
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

CREATE TABLE "account_receivable" (
  "id" integer PRIMARY KEY,
  "amount" decimal,
  "currency" string(15),
  "meta" text(100),
  "created_by" integer,
  "created_at" timestamp DEFAULT (now()),
  "modified_by" integer,
  "modified_at" timestamp
);

ALTER TABLE "user" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id");

ALTER TABLE "user" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "user" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "vendor" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "vendor" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "account" ADD FOREIGN KEY ("bank_id") REFERENCES "bank" ("id");

ALTER TABLE "account" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("id");

ALTER TABLE "account" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id");

ALTER TABLE "account" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "account" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "bank" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "bank" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "company" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "company" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "production" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id");

ALTER TABLE "production" ADD FOREIGN KEY ("default_set_id") REFERENCES "set" ("id");

ALTER TABLE "production" ADD FOREIGN KEY ("default_location_id") REFERENCES "location" ("id");

ALTER TABLE "production" ADD FOREIGN KEY ("default_series_id") REFERENCES "series" ("id");

ALTER TABLE "production" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "production" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "series" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "series" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "location" ADD FOREIGN KEY ("state_id") REFERENCES "state" ("id");

ALTER TABLE "location" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("id");

ALTER TABLE "location" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "location" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "set" ADD FOREIGN KEY ("location_id") REFERENCES "location" ("id");

ALTER TABLE "set" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "set" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "currency" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "currency" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "budget" ADD FOREIGN KEY ("currency_id") REFERENCES "currency" ("id");

ALTER TABLE "budget" ADD FOREIGN KEY ("production_id") REFERENCES "production" ("id");

ALTER TABLE "budget" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "budget" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "state" ADD FOREIGN KEY ("contry_id") REFERENCES "country" ("id");

ALTER TABLE "state" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "state" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "country" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "country" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "permission" ADD FOREIGN KEY ("permission_type") REFERENCES "permission_type" ("id");

ALTER TABLE "permission" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "permission" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "permission_type" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "permission_type" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "user_permission" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_permission" ADD FOREIGN KEY ("permission_id") REFERENCES "permission" ("id");

ALTER TABLE "user_permission" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "user_permission" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "bill" ADD FOREIGN KEY ("currency") REFERENCES "currency" ("name");

ALTER TABLE "bill" ADD FOREIGN KEY ("vendor") REFERENCES "vendor" ("id");

ALTER TABLE "bill" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "bill" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("payment_type") REFERENCES "payment_type" ("type");

ALTER TABLE "payment" ADD FOREIGN KEY ("bill_id") REFERENCES "bill" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("payroll_id") REFERENCES "payroll" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("currency") REFERENCES "currency" ("name");

ALTER TABLE "payment" ADD FOREIGN KEY ("account_id") REFERENCES "account" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("budget_id") REFERENCES "budget" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("location_id") REFERENCES "location" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "payment_type" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "payment_type" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "payroll" ADD FOREIGN KEY ("payment_type") REFERENCES "payment_type" ("type");

ALTER TABLE "payroll" ADD FOREIGN KEY ("currency_id") REFERENCES "currency" ("id");

ALTER TABLE "payroll" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "payroll" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "journal" ADD FOREIGN KEY ("payment_id") REFERENCES "payment" ("id");

ALTER TABLE "journal" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "journal" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "tenant" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id");

ALTER TABLE "tenant" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "tenant" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "petty_cash" ADD FOREIGN KEY ("payment_type") REFERENCES "payment_type" ("type");

ALTER TABLE "petty_cash" ADD FOREIGN KEY ("currency") REFERENCES "currency" ("name");

ALTER TABLE "petty_cash" ADD FOREIGN KEY ("account_id") REFERENCES "account" ("id");

ALTER TABLE "petty_cash" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "petty_cash" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "purchase_order" ADD FOREIGN KEY ("currency") REFERENCES "currency" ("name");

ALTER TABLE "purchase_order" ADD FOREIGN KEY ("production_id") REFERENCES "production" ("id");

ALTER TABLE "purchase_order" ADD FOREIGN KEY ("approver1_id") REFERENCES "user" ("id");

ALTER TABLE "purchase_order" ADD FOREIGN KEY ("approver2_id") REFERENCES "user" ("id");

ALTER TABLE "purchase_order" ADD FOREIGN KEY ("approver3_id") REFERENCES "user" ("id");

ALTER TABLE "purchase_order" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "purchase_order" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "account_payable" ADD FOREIGN KEY ("po_number") REFERENCES "purchase_order" ("id");

ALTER TABLE "account_payable" ADD FOREIGN KEY ("vendor") REFERENCES "vendor" ("name");

ALTER TABLE "account_payable" ADD FOREIGN KEY ("currency") REFERENCES "currency" ("name");

ALTER TABLE "account_payable" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "account_payable" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");

ALTER TABLE "account_receivable" ADD FOREIGN KEY ("currency") REFERENCES "currency" ("name");

ALTER TABLE "account_receivable" ADD FOREIGN KEY ("created_by") REFERENCES "user" ("id");

ALTER TABLE "account_receivable" ADD FOREIGN KEY ("modified_by") REFERENCES "user" ("id");