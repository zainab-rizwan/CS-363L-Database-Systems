#----------------------------QUESTION NO 1----------------------------
"""
SELECT o.provider_name,SUM(total_inpatients) AS in_patients,out_patients
FROM (SELECT DISTINCT(provider_name),SUM(total_discharges) AS TOTAL_inpatients FROM `bigquery-public-data.cms_medicare.inpatient_charges_2011`
GROUP BY provider_name
UNION DISTINCT
SELECT DISTINCT(provider_name),SUM(total_discharges) AS TOTAL_inpatients FROM `bigquery-public-data.cms_medicare.inpatient_charges_2012`
GROUP BY provider_name
UNION DISTINCT
SELECT DISTINCT(provider_name),SUM(total_discharges) AS TOTAL_inpatients FROM `bigquery-public-data.cms_medicare.inpatient_charges_2013`
GROUP BY provider_name
UNION DISTINCT
SELECT DISTINCT(provider_name),SUM(total_discharges) AS TOTAL_inpatients FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
GROUP BY provider_name
) AS i JOIN 
(SELECT provider_name,SUM(total_outpatients) AS out_patients FROM 
(SELECT DISTINCT(provider_name),COUNT(*) AS TOTAL_outpatients FROM `bigquery-public-data.cms_medicare.outpatient_charges_2011`
GROUP BY provider_name
UNION DISTINCT
SELECT DISTINCT(provider_name),COUNT(*) AS TOTAL_outpatients FROM `bigquery-public-data.cms_medicare.outpatient_charges_2012`
GROUP BY provider_name
UNION DISTINCT
SELECT DISTINCT(provider_name),COUNT(*) AS TOTAL_outpatients FROM `bigquery-public-data.cms_medicare.outpatient_charges_2013`
GROUP BY provider_name
UNION DISTINCT
SELECT DISTINCT(provider_name),COUNT(*) AS TOTAL_outpatients FROM `bigquery-public-data.cms_medicare.outpatient_charges_2014`
GROUP BY provider_name)
GROUP BY provider_name
ORDER BY provider_name) AS o
ON i.provider_name=o.provider_name
GROUP BY provider_name,out_patients
ORDER BY provider_name
"""

#----------------------------QUESTION NO 2----------------------------
"""SELECT nppes_provider_state, SUM(total_claim_count) as total_insurance_claim FROM `bigquery-public-data.medicare.part_d_prescriber_2014` 
GROUP BY nppes_provider_state 
ORDER BY total_insurance_claim
DESC LIMIT 5
"""

#----------------------------QUESTION NO 3----------------------------
"""
SELECT drg_definition AS common_diagnosis FROM 
((SELECT DISTINCT drg_definition, SUM(total_discharges) as inpatients FROM `bigquery-public-data.medicare.inpatient_charges_2011` 
GROUP BY drg_definition)
UNION DISTINCT
(SELECT DISTINCT drg_definition, SUM(total_discharges) as inpatients FROM `bigquery-public-data.medicare.inpatient_charges_2012` 
GROUP BY drg_definition)
UNION DISTINCT
(SELECT DISTINCT drg_definition, SUM(total_discharges) as inpatients FROM `bigquery-public-data.medicare.inpatient_charges_2013` 
GROUP BY drg_definition)
UNION DISTINCT 
(SELECT DISTINCT drg_definition, SUM(total_discharges) as inpatients FROM `bigquery-public-data.medicare.inpatient_charges_2014` 
GROUP BY drg_definition))
GROUP BY drg_definition
ORDER BY SUM(inpatients) 
DESC LIMIT 1
"""

#----------------------------QUESTION NO 5i----------------------------
"""
SELECT SUM(patients_with_renal_failure) as inpatients_with_renal_failure
FROM (SELECT SUM(total_discharges) as patients_with_renal_failure FROM `bigquery-public-data.medicare.inpatient_charges_2011` 
WHERE drg_definition LIKE '%RENAL FAILURE%'  
GROUP BY drg_definition
UNION DISTINCT
SELECT SUM(total_discharges) as patients_with_renal_failure FROM `bigquery-public-data.medicare.inpatient_charges_2012` 
WHERE drg_definition LIKE '%RENAL FAILURE%' 
GROUP BY drg_definition
UNION DISTINCT
SELECT SUM(total_discharges) as patients_with_renal_failure FROM `bigquery-public-data.medicare.inpatient_charges_2013` 
WHERE drg_definition LIKE '%RENAL FAILURE%' 
GROUP BY drg_definition
UNION DISTINCT
SELECT SUM(total_discharges) as patients_with_renal_failure FROM `bigquery-public-data.medicare.inpatient_charges_2014` 
WHERE drg_definition LIKE '%RENAL FAILURE%'
GROUP BY drg_definition)
"""

#----------------------------QUESTION NO 5ii----------------------------
"""
SELECT IFNULL(SUM(patients_with_renal_failure),0) AS total_outpatients_with_renal_failure
FROM (SELECT SUM(outpatient_services) as patients_with_renal_failure FROM `bigquery-public-data.medicare.outpatient_charges_2011` 
WHERE apc LIKE '%RENAL FAILURE%'  
GROUP BY apc
UNION DISTINCT
SELECT SUM(outpatient_services) as patients_with_renal_failure FROM `bigquery-public-data.medicare.outpatient_charges_2012` 
WHERE apc LIKE '%RENAL FAILURE%' 
GROUP BY apc
UNION DISTINCT
SELECT SUM(outpatient_services) as patients_with_renal_failure FROM `bigquery-public-data.medicare.outpatient_charges_2013` 
WHERE apc LIKE '%RENAL FAILURE%' 
GROUP BY apc
UNION DISTINCT
SELECT SUM(outpatient_services) as patients_with_renal_failure FROM `bigquery-public-data.medicare.outpatient_charges_2014` 
WHERE apc LIKE '%RENAL FAILURE%'
GROUP BY apc)
"""

#----------------------------QUESTION NO 5iii----------------------------
"""
SELECT SUM(patients_with_renal_failure) as inpatients_with_renal_failure, SUM(amount_paid) as total_average_amount
FROM (SELECT SUM(total_discharges) as patients_with_renal_failure, SUM(average_medicare_payments) as amount_paid FROM `bigquery-public-data.medicare.inpatient_charges_2011` 
WHERE drg_definition LIKE '%RENAL FAILURE%'  
GROUP BY drg_definition, provider_name
UNION DISTINCT
SELECT SUM(total_discharges) as patients_with_renal_failure, SUM(average_medicare_payments) as amount_paid FROM `bigquery-public-data.medicare.inpatient_charges_2012` 
WHERE drg_definition LIKE '%RENAL FAILURE%' 
GROUP BY drg_definition, provider_name
UNION DISTINCT
SELECT SUM(total_discharges) as patients_with_renal_failure, SUM(average_medicare_payments) as amount_paid FROM `bigquery-public-data.medicare.inpatient_charges_2013` 
WHERE drg_definition LIKE '%RENAL FAILURE%' 
GROUP BY drg_definition, provider_name
UNION DISTINCT
SELECT SUM(total_discharges) as patients_with_renal_failure, SUM(average_medicare_payments) as amount_paid  FROM `bigquery-public-data.medicare.inpatient_charges_2014` 
WHERE drg_definition LIKE '%RENAL FAILURE%'
GROUP BY drg_definition, provider_name)
"""

#----------------------------QUESTION NO 5iv----------------------------
"""
SELECT IFNULL(SUM(patients_with_renal_failure),0) AS total_outpatients_with_renal_failure, IFNULL(SUM(amount_paid),0) as total_average_amount
FROM (SELECT SUM(outpatient_services) as patients_with_renal_failure, IFNULL(SUM(average_total_payments),0) as amount_paid FROM `bigquery-public-data.medicare.outpatient_charges_2011` 
WHERE apc LIKE '%RENAL FAILURE%'  
GROUP BY apc
UNION DISTINCT
SELECT SUM(outpatient_services) as patients_with_renal_failure, IFNULL(SUM(average_total_payments),0) as amount_paid FROM `bigquery-public-data.medicare.outpatient_charges_2012` 
WHERE apc LIKE '%RENAL FAILURE%' 
GROUP BY apc
UNION DISTINCT
SELECT SUM(outpatient_services) as patients_with_renal_failure, IFNULL(SUM(average_total_payments),0) as amount_paid FROM `bigquery-public-data.medicare.outpatient_charges_2013` 
WHERE apc LIKE '%RENAL FAILURE%' 
GROUP BY apc
UNION DISTINCT
SELECT SUM(outpatient_services) as patients_with_renal_failure, IFNULL(SUM(average_total_payments),0) as amount_paid FROM `bigquery-public-data.medicare.outpatient_charges_2014` 
WHERE apc LIKE '%RENAL FAILURE%'
GROUP BY apc)
"""

#----------------------------QUESTION NO 5v----------------------------
"""
SELECT total_charges
    FROM (SELECT SUM(average_covered_charges) as total_charges FROM `bigquery-public-data.medicare.inpatient_charges_2011` 
    UNION DISTINCT
    SELECT SUM(average_covered_charges) as total_charges FROM `bigquery-public-data.medicare.inpatient_charges_2012` 
    UNION DISTINCT
    SELECT SUM(average_covered_charges) as total_charges FROM `bigquery-public-data.medicare.inpatient_charges_2013` 
    UNION DISTINCT
    SELECT SUM(average_covered_charges) as total_charges FROM `bigquery-public-data.medicare.inpatient_charges_2014`)
"""