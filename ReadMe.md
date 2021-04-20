# SQL Graduation/Credentials Awarded EDH

> This script is the source of truth for the Tableau Graduation/Credentials Awarded dashboard.

<p style="color:#8c8c8c;font-size:small">
This SQL query (Postgres) pulls all relevant information needed to build the executive dashboard in Tableau. Relevant tables from EDH provide data to visualize credentials awarded by academic term, season, college, major, degree, gender, ethnicity, athletics, veteran status, and student leve.
</p>

--- 

### Tableau Workbook Visualizations

- Total credentials by college and academic year/season
- Credentials awarded by major
- Credentials awarded by degree
- Ethnicity
- Ethnicity, gender, athletics and veterans.

<br><br>

### Table description
<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 15% />
<col style="width: 70%" />

</colgroup>
<thead>
<tr class="header">
<th>Field</th>
<th>Source</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>student_id </td>
<td>student</td>
<td>Student id for headcount</td>
</tr>
<tr class="even">
<td>academic_year_code</td>
<td>term</td>
<td>Term description EX: 2020</td>
</tr>
<tr class="odd">
<td>academic_year_term</td>
<td>term</td>
<td>Academic year describption EX: 2019-2020.</td>
</tr>
<tr class="even">
<td>graduation_date</td>
<td>degrees_awardedc</td>
<td>Actual graduation date/credential awarded EX 2018-05-05</td>
</tr>
<tr class="odd">
<td>level_id</td>
<td>degrees_awarded</td>
<td>Student level EX: UG</td>
</tr>
<tr class="even">
<td>degree_id</td>
<td>degrees_awarded</td>
<td>Degree identifier. EX: BS, AAS.</td>
</tr>
<tr class="odd">
<td>pirmary_major_college_desc</td>
<td>degrees_awarded</td>
<td>Primary major college description. EX: Health Sciences</td>
</tr>
<tr class="even">
<td>primary_major_desc</td>
<td>degrees_awarded</td>
<td>Primary major description EX: Registered Nurse</td>
</tr>
<tr class="odd">
<td>athletet_activity_desc</td>
<td>student_term_level</td>
<td>Description of athletic sport if applicable. Otherwise null.</td>
</tr>
<tr class="even">
<td>is_veteran</td>
<td>student</td>
<td>Student is a veteran Y/N</td>
</tr>
<tr class="odd">
<td>gender_code</td>
<td>student
</tr>Gender M/F</td>
</tr>
</tr>
</tbody>
</table>