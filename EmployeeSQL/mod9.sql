-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_name" VARCHAR(30)  NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_Departments_dept_name" UNIQUE (
        "dept_name"
    )
);

CREATE TABLE "Employees" (
    "emp_no" VARCHAR(30)   NOT NULL,
    "title_id" VARCHAR(30)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(5)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "DepartmentEmployees" (
    "emp_no" VARCHAR(30)   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL
);

CREATE TABLE "DepartmentManager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" VARCHAR(30)   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,

    CONSTRAINT "uc_Titles_title" UNIQUE (
        "title"
    )
);

CREATE TABLE "Salaries" (
    "emp_no" VARCHAR(30)   NOT NULL,
    "salary" INT   NOT NULL
);

 



ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "Employees" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no"); 