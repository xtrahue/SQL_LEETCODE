#Better Solution
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT employee_id, department_id
FROM Employee
WHERE employee_id NOT IN (
  SELECT employee_id
  FROM Employee
  WHERE primary_flag = 'Y'
)
ORDER BY employee_id;




#My Solution
SELECT e1.employee_id, e2.department_id
FROM Employee e1
JOIN Employee e2
ON e1.employee_id=e2.employee_id
GROUP BY e1.employee_id , e2.primary_flag 
HAVING (COUNT(e1.employee_id)=1) OR (COUNT(e1.employee_id)>1 AND e2.primary_flag='Y') ;
