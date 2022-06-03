% employee(fname,lname,ssn,address,sex,salary,superssn,dno) 
employee('John','Smith',123456789,'731 F, Houston, TX','M',30000,333445555,5).
employee('Franklin','Wong',333445555,'638 Voss, Houston, TX','M',40000,999887777,5).
employee('Alicia','Zelaya',999887777,'123 Wisconsin Ave, Milwaukee, WI','F',25000,987654321,4).
employee('jennifer','Wallace',987654321,'900 F, Houston, TX','F',43000,888556787,1).

% department(dname,dnumber,mgrssn)
department('Research',5,333445555).
department('Administration',4,987654321).
department('Headquarters',1,123456789).

%names of employees whose salary is greater than 30000
emp_sal_gt30000(First,Last,Salary) :- employee(First,Last,_,_,_,Salary,_,_), Salary > 30000.

% Get the name of employee who manages Research department.
%research_dept_mgr(First,Last,ManagingDName) :- department(ManagingDName,_,MgrSSN),employee(First,Last,MgrSSN,_,_,_,_,_), ManagingDName is 'Research'.

research_dept_mgr(First,Last) :- department('Research',_,MgrSSN),employee(First,Last,MgrSSN,_,_,_,_,_).

%Get the names of employees who work for Research department

%emp_research_names(First,Last) :- employee(First,Last,_,_,_,_,_,DNo), DNo == 5.

emp_research_names(First,Last) :- employee(First,Last,_,_,_,_,_,DNo), department('Research',DNo,_).