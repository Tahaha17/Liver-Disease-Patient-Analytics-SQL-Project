CREATE VIEW liver_summary AS
SELECT 
    dataset,
    AVG(total_bilirubin) AS avg_tb,
    AVG(alkaline_phosphotase) AS avg_ap,
    AVG(albumin) AS avg_albumin
FROM liver_patient
GROUP BY dataset;
