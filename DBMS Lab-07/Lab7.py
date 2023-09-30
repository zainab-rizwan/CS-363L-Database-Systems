from google.cloud import bigquery
from google.oauth2 import service_account

from reportlab.pdfgen import canvas
from reportlab.lib.styles import ParagraphStyle
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages

credentials = service_account.Credentials.from_service_account_file("C:/Users/ZAINA/Downloads/DBMS Lab-7/thematic-caster-338508-6395d85b082b.json")

project_id = 'thematic-caster-338508'
client = bigquery.Client(credentials= credentials,project=project_id)



if __name__ == "__main__":
    #----------------------------QUESTION NO 5i----------------------------
    Q5i=client.query("""
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
    """)
    result_5i= Q5i.result()

    #----------------------------QUESTION NO 5ii----------------------------
    Q5ii=client.query("""
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
    """)
    result_5ii= Q5ii.result()

    #----------------------------QUESTION NO 5iii----------------------------
    Q5iii=client.query("""
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
    """)
    result_5iii= Q5iii.result()

    #----------------------------QUESTION NO 5iv----------------------------
    Q5iv=client.query("""
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
    """)
    result_5iv= Q5iv.result()

    #----------------------------QUESTION NO 5v----------------------------
    Q5v=client.query("""
    SELECT total_charges
    FROM (SELECT SUM(average_covered_charges) as total_charges FROM `bigquery-public-data.medicare.inpatient_charges_2011` 
    UNION DISTINCT
    SELECT SUM(average_covered_charges) as total_charges FROM `bigquery-public-data.medicare.inpatient_charges_2012` 
    UNION DISTINCT
    SELECT SUM(average_covered_charges) as total_charges FROM `bigquery-public-data.medicare.inpatient_charges_2013` 
    UNION DISTINCT
    SELECT SUM(average_covered_charges) as total_charges FROM `bigquery-public-data.medicare.inpatient_charges_2014`)
    """)
    result_5v= Q5v.result()

    a = canvas.Canvas("DBLab7_PatientInfo_2019_CE_36.pdf")
    a.rect(40, 660, 520, 130, stroke=1, fill=0)
    a.setFont("Times-Bold", 25)
    a.drawString(120, 735, "Payment Details for Patients with")
    a.drawString(220, 700, "RenalFailure")
    a.setFont("Times-Roman", 14)
    
    a.rect(40, 200, 520, 430, stroke=1, fill=0)

    a.rect(65, 525, 220, 80, stroke=1, fill=0)
    a.rect(65, 425, 220, 80, stroke=1, fill=0)
    a.rect(65, 325, 220, 80, stroke=1, fill=0)
    a.rect(65, 225, 220, 80, stroke=1, fill=0)

    a.rect(315, 525, 220, 80, stroke=1, fill=0)
    a.rect(315, 425, 220, 80, stroke=1, fill=0)
    a.rect(315, 325, 220, 80, stroke=1, fill=0)
    a.rect(315, 225, 220, 80, stroke=1, fill=0)

    a.drawString(80, 570, "Total number of in-patients in")
    a.drawString(80, 550, "all medical centers")
    a.drawString(80, 470, "Total number of outpatients in")
    a.drawString(80, 450, "all medical centers")
    a.drawString(80, 370, "Total average amount paid to")
    a.drawString(80, 350, "inpatients")
    a.drawString(80, 270, "Total average paid to outpatients")


    for row in result_5i:
        a.drawString(400, 560, str(row.inpatients_with_renal_failure))

    for row in result_5ii:
        a.drawString(420, 460, str(row.total_outpatients_with_renal_failure))

    for row in result_5iii:
        a.drawString(350, 360, str(row.total_average_amount))
    
    for row in result_5iv:
        a.drawString(410, 260, str(row.total_average_amount))

    payments = list()
    
    for i in result_5v:
        payments.append(int(i.total_charges))
    with PdfPages('DBLab7_Graphs_2019_CE_36.pdf') as export_pdf:
            label = ["2011","2012","2013","2014"]
            plt.bar(label,payments,width=1,color=['Blue','orange','grey','yellow'])
            export_pdf.savefig()
            plt.close()

    
    a.save()



    
   

   

