# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#select 'Employee.create(empno: ' || empno || ', ename: ''' || ename || ''', job: ''' || job || ''', mgr: ' || 
#        mgr || ', hiredate: ''' || to_char(hiredate, 'MM-DD-YYYY') || ''', sal: ' || sal || ', comm: ' || comm || ' , deptno: ' || deptno || ' )' 
#  from emp;

Employee.delete_all
Department.delete_all
Department.create(id: 10, dname: 'ACCOUNTING', loc:'NEW YORK')
Department.create(id: 20, dname: 'RESEARCH', loc:'DALLAS')
Department.create(id: 30, dname: 'SALES', loc:'CHICAGO')
Department.create(id: 40, dname: 'OPERATIONS', loc:'BOSTON')
#Department.create(id: 50, dname: 'OPERATIONS-C', loc:'AUSTIN')
#Department.create(id: 60, dname: 'OPERATIONS-S', loc:'SAN DIEGO')
#Department.create(id: 70, dname: 'OPERATIONS-W', loc:'SEATTLE')
#Department.create(id: 80, dname: 'OPERATIONS-E', loc:'MUNICH')
#Department.create(id: 90, dname: 'OPERATIONS-A', loc:'TOKIO')
#Department.create(id: 100, dname: 'G20', loc:'HMBURG')

Employee.create(empno: 7839, ename: 'KING', job: 'PRESIDENT', mgr: nil, hiredate: '11-17-1981', sal: 5000, comm:  nil, department_id: 10 )
Employee.create(empno: 7698, ename: 'BLAKE', job: 'MANAGER', mgr: 7839, hiredate: '05-01-1981', sal: 2850, comm:  nil, department_id: 30 )
Employee.create(empno: 7782, ename: 'CLARK', job: 'MANAGER', mgr: 7839, hiredate: '06-09-1981', sal: 2450, comm:  nil, department_id: 10 )
Employee.create(empno: 7566, ename: 'JONES', job: 'MANAGER', mgr: 7839, hiredate: '04-02-1981', sal: 2975, comm:  nil, department_id: 20 )
Employee.create(empno: 7788, ename: 'SCOTT', job: 'ANALYST', mgr: 7566, hiredate: '04-19-1987', sal: 3000, comm:  nil, department_id: 20 )
Employee.create(empno: 7902, ename: 'FORD', job: 'ANALYST', mgr: 7566, hiredate: '12-03-1981', sal: 3000, comm:  nil, department_id: 20 )
Employee.create(empno: 7369, ename: 'SMITH', job: 'CLERK', mgr: 7902, hiredate: '12-17-1980', sal: 800, comm:  nil, department_id: 20 )
Employee.create(empno: 7499, ename: 'ALLEN', job: 'SALESMAN', mgr: 7698, hiredate: '02-20-1981', sal: 1600, comm: 300 , department_id: 30 )
Employee.create(empno: 7521, ename: 'WARD', job: 'SALESMAN', mgr: 7698, hiredate: '02-22-1981', sal: 1250, comm: 500 , department_id: 30 )
Employee.create(empno: 7654, ename: 'MARTIN', job: 'SALESMAN', mgr: 7698, hiredate: '09-28-1981', sal: 1250, comm: 1400 , department_id: 30 )
Employee.create(empno: 7844, ename: 'TURNER', job: 'SALESMAN', mgr: 7698, hiredate: '09-08-1981', sal: 1500, comm: 0 , department_id: 30 )
Employee.create(empno: 7876, ename: 'ADAMS', job: 'CLERK', mgr: 7788, hiredate: '05-23-1987', sal: 1100, comm:  nil, department_id: 20 )
Employee.create(empno: 7900, ename: 'JAMES', job: 'CLERK', mgr: 7698, hiredate: '12-03-1981', sal: 950, comm:  nil, department_id: 30 )
Employee.create(empno: 7934, ename: 'MILLER', job: 'CLERK', mgr: 7782, hiredate: '01-23-1982', sal: 1300, comm:  nil, department_id: 10 )
