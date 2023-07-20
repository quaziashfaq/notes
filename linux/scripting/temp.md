/home/bob/docker_files/backup/sql_files/schema.sql


$ ssh -T bob@node01 bash "<<EOF > /tmp/init.sql
cat /home/bob/docker_files/backup/sql_files/schema.sql
EOF"

# -------------------------------------------------------------------------------


$ ssh -T bob@node01 bash "<<EOF 
cat /home/bob/docker_files/backup/sql_files/schema.sql
EOF"
CREATE DATABASE "employees";
\c employees

CREATE TABLE "employee" (
"id_employee" int PRIMARY KEY,
"first_name" varchar,
"last_name" varchar,
"area" varchar,
"job_title" varchar,
"email" varchar
);

\c employees
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('01', 'Kriti', 'Shreshtha', 'Finance', 'Financial Analyst', 'kriti shreshtha@company.com');
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('02', 'Rajasekar', 'Vasudevan', 'Finance', 'Senior Accountant', 'rajasekar.vasudevan@company.com');
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('03', 'Debbie', 'Miller', 'IT', 'Software Developer', 'debbie.miller@company.com');
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('04', 'Enrique', 'Rivera', 'Marketing', 'Marketing Specialist', 'enrique.rivera@company.com');
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('05', 'Feng', 'Lin', 'Sales', 'Sales Manager', 'feng.lin@company.com');
SELECT * FROM "employee";





# -------------------------------------------------------------------------------

[bob@student-node ~]$ ssh -T bob@node01 << EOF
sudo docker ps
sudo docker exec -i my_postgres_container bash -c "psql -U postgres -d employees << EOF
> select * from employee;
> EOF"
> EOF
CONTAINER ID   IMAGE               COMMAND                  CREATED          STATUS          PORTS                    NAMES
d97ad94704a9   my_postgres_image   "docker-entrypoint.s…"   11 minutes ago   Up 11 minutes   0.0.0.0:5432->5432/tcp   my_postgres_container
 id_employee | first_name | last_name |   area    |      job_title       |              email
-------------+------------+-----------+-----------+----------------------+---------------------------------
           1 | Kriti      | Shreshtha | Finance   | Financial Analyst    | kriti shreshtha@company.com
           2 | Rajasekar  | Vasudevan | Finance   | Senior Accountant    | rajasekar.vasudevan@company.com
           3 | Debbie     | Miller    | IT        | Software Developer   | debbie.miller@company.com
           4 | Enrique    | Rivera    | Marketing | Marketing Specialist | enrique.rivera@company.com
           5 | Feng       | Lin       | Sales     | Sales Manager        | feng.lin@company.com
(5 rows)





[bob@student-node ~]$ ssh -T bob@node01 << EOF
sudo docker exec -i my_postgres_container bash -c "psql -U postgres -d employees << EOF
\pset tuples_only on
select email from employee where first_name='Kriti';
EOF"
EOF
            email
-----------------------------
 kriti shreshtha@company.com
(1 row)
# -------------------------------------------------------------------------------








# -------------------------------------------------------------------------------
[bob@student-node ~]$ ssh -T bob@node01 <<EOF
cat /home/bob/kodekloud/abc.txt
EOF
abcd

[bob@student-node ~]$ ssh -T bob@node01 <<EOF
exec 10<> /home/bob/kodekloud/abc.txt
read -n 3 <& 10
echo "d" >& 10
exec 10>&-
cat /home/bob/kodekloud/abc.txt
EOF

abcd
# -------------------------------------------------------------------------------


[bob@student-node ~]$ ssh -T bob@node01 <<EOF
exec 20<> /home/bob/kodekloud/employee1_email.txt
read -n 5 <& 20
echo -n "." >& 20
echo 20>&-
cat /home/bob/kodekloud/employee1_email.txt
EOF

kriti.shreshtha@company.com
