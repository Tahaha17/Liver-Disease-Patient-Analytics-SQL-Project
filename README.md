
# 📊 Liver Disease Patient Analytics — SQL Project  
A complete end‑to‑end healthcare analytics project using PostgreSQL.

---

## 🧠 Project Overview  
This project analyzes **583 patient records** from the *Indian Liver Patient Dataset* to uncover patterns in liver disease, identify high‑risk patients, and explore biomarker trends.

It demonstrates real‑world SQL skills including:

- Data importing & cleaning  
- Analytical SQL queries  
- CASE logic  
- Window functions  
- Creating SQL views  
- Healthcare domain insights  

---

## 🗂️ Dataset Summary  
The dataset contains **10 medical features** + **1 class label**:

| Column | Description |
|--------|-------------|
| Age | Patient age |
| Gender | Male/Female |
| Total_Bilirubin | Liver function indicator |
| Direct_Bilirubin | Liver function indicator |
| Alkaline_Phosphotase | Enzyme level |
| Alamine_Aminotransferase | Enzyme level |
| Aspartate_Aminotransferase | Enzyme level |
| Total_Protiens | Protein level |
| Albumin | Protein level |
| Albumin_and_Globulin_Ratio | Protein ratio |
| Dataset | 1 = Liver disease, 2 = No disease |

---

## 🏗️ Project Structure  
liver-disease-sql-project/
│
├── schema.sql
├── analysis_queries.sql
├── views.sql
├── import_instructions.txt
└── README.md




---

## 🛠️ Technologies Used  
- PostgreSQL  
- SQL (CASE, GROUP BY, Window Functions, Views)  
- pgAdmin / psql  

---

## 🧱 Database Schema  
```sql
CREATE TABLE liver_patient(
    Age int,
    Gender varchar(50),
    Total_Bilirubin float,
    Direct_Bilirubin float,
    Alkaline_Phosphotase int,
    Alamine_Aminotransferase int,
    Aspartate_Aminotransferase int,
    Total_Protiens float,
    Albumin float,
    Albumin_and_Globulin_Ratio float,
    Dataset int
);
```

## 📥 Data Import  
```sql
\copy liver_patient(
    Age, Gender, Total_Bilirubin, Direct_Bilirubin,
    Alkaline_Phosphotase, Alamine_Aminotransferase,
    Aspartate_Aminotransferase, Total_Protiens,
    Albumin, Albumin_and_Globulin_Ratio, Dataset
)
FROM 'INDIAN_LIVER_PATIENTS.csv'
WITH (FORMAT csv, HEADER, DELIMITER ',', QUOTE '"');
```




## 📈 Key SQL Analyses  

### ✔️ 1. Disease Prevalence  
```sql
SELECT 
    CASE 
        WHEN dataset = 1 THEN 'Liver Disease'
        WHEN dataset = 2 THEN 'No Disease'
    END AS disease_status,
    COUNT(*) AS total_patients
FROM liver_patient
GROUP BY dataset;
```

### 2. Gender Distribution
```sql
SELECT gender, COUNT(*) AS total
FROM liver_patient
GROUP BY gender;
```

## 3. Biomarker Averages by Disease Status
```sql
SELECT 
    CASE WHEN dataset = 1 THEN 'Liver Disease'
         WHEN dataset = 2 THEN 'No Disease'
    END AS disease_status,
    AVG(total_bilirubin) AS avg_tb,
    AVG(direct_bilirubin) AS avg_db,
    AVG(alkaline_phosphotase) AS avg_ap
FROM liver_patient
GROUP BY dataset;
```

## 4. Age Group Segmentation
```sql
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        WHEN age BETWEEN 51 AND 70 THEN '51-70'
        ELSE '70+'
    END AS age_group,
    COUNT(*) AS total_patients
FROM liver_patient
GROUP BY age_group;
```



## 5. High‑Risk Patient Identification
```sql
SELECT *
FROM liver_patient
WHERE total_bilirubin > 3
   OR alkaline_phosphotase > 200
   OR alamine_aminotransferase > 100;
```

## 6. Ranking Patients by Enzyme Levels
```sql
SELECT 
    age,
    alamine_aminotransferase,
    RANK() OVER (ORDER BY alamine_aminotransferase DESC) AS enzyme_rank
FROM liver_patient;
```

## 🧾 SQL View for Dashboards
```sql
CREATE VIEW liver_summary AS
SELECT 
    dataset,
    AVG(total_bilirubin) AS avg_tb,
    AVG(alkaline_phosphotase) AS avg_ap,
    AVG(albumin) AS avg_albumin
FROM liver_patient
GROUP BY dataset;
```

## 🔍 Insights & Findings  

- Patients diagnosed with liver disease show **significantly higher bilirubin and enzyme levels**, especially Total Bilirubin and Alkaline Phosphotase.  
- The **30–50 age group** has the highest concentration of liver disease cases, indicating a key demographic risk zone.  
- Gender distribution reveals that **male patients are more frequently affected** than female patients in this dataset.  
- High‑risk patients can be identified using SQL rules based on elevated biomarkers, enabling early intervention.  
- SQL views help summarize biomarker trends efficiently, making the dataset ready for dashboards and BI tools.  
- The dataset shows clear **biomarker separation** between diseased and non‑diseased groups, supporting clinical decision‑making.  

## ✍️ Author  
**Taha Hameed**
**M.sc International Management**
