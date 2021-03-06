%Oliver Crane

%1.	Retrieve the names of employees in department 5 who work more than 10 hours per week on the 'ProductX' project.

answer1(FNAME,LNAME) :- employee(FNAME,LNAME,SSN,_,_,_,_,DNO),project(PNAME,PNO,_,_),workson(SSN,PNO,HOURS),
                        PNAME = 'ProductX', DNO = 5, HOURS > 10.

%2.	For each department, retrieve the department name, and the department manager (name) who manages the department.

answer2(DNAME,FNAME,LNAME) :- department(DNAME,_,SSN,_),employee(FNAME,LNAME,SSN,_,_,_,_,_).                       

%3.	Get the names of employees who work on either project 1 or project 2.

answer3(FNAME,LNAME) :- workson(SSN,PNO,_),employee(FNAME,LNAME,SSN,_,_,_,_,_),
                        (PNO=1;PNO=2).

%4.	Get the names of employees who work on both projects 1 and  2.

answer4(FNAME,LNAME) :- workson(SSN,PNO1,_),workson(SSN,PNO2,_),employee(FNAME,LNAME,SSN,_,_,_,_,_),
                        PNO1==1,PNO2==2.

%5.	Get the names of employees who don’t work on any project

answer5a(FNAME,LNAME,SSN) :- employee(FNAME,LNAME,SSN,_,_,_,_,_),workson(SSN,_,_).

answer5b(FNAME,LNAME) :- employee(FNAME,LNAME,SSN,_,_,_,_,_),\+answer5a(FNAME,LNAME,SSN).

%6.	Find the names of employees that are directly supervised by 'Franklin Wong' 

answer6(FNAME,LNAME) :- employee(FNAME,LNAME,SSN,_,_,_,SUPERSSN,_),
                        employee(MANAGERFNAME,MANAGERLNAME,MANAGERSSN,_,_,_,_,_),
                        SUPERSSN = MANAGERSSN, MANAGERFNAME = 'Franklin', MANAGERLNAME = 'Wong'.
