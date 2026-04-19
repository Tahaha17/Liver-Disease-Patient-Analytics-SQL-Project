--Count liver disease vs non‑disease patients
select 
	case 
		when dataset = 1 then 'liver disease'
		when dataset = 2 then 'no liver disease'
	end as liver_disearse_status,
	count(*) as total_patient 
from liver_patient
group by dataset;


--Gender distribution
select gender, count(*) as total 
from liver_patient
group by gender


--Average biomarker levels by disease status

SELECT 
	case
		when dataset = 1 then 'Liver disease'
		when dataset = 2 then 'no liver disease'
	end as disease_status,
       AVG(total_bilirubin) AS avg_tb,
       AVG(direct_bilirubin) AS avg_db,
       AVG(alkaline_phosphotase) AS avg_ap
FROM liver_patient
GROUP BY dataset;


--Age group analysis

select 
	case 
		when age < 30 then 'under 30'
		when age between 30 and 50 then '30-50'
		when age between 51 and 70 then '51-70'
		else '70+'
	end as age_group,
	 count (*) as total_patient
FROM liver_patient
GROUP BY age_group;


--high‑risk patients
SELECT *
FROM liver_patient
WHERE total_bilirubin > 3
   OR alkaline_phosphotase > 200
   OR alamine_aminotransferase > 100;


--Rank patients by enzyme levels
SELECT 
    age,
    alamine_aminotransferase,
    RANK() OVER (ORDER BY alamine_aminotransferase DESC) AS enzyme_rank
FROM liver_patient;