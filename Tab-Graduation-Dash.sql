SELECT c.student_id,
       e.academic_year_code,
       e.academic_year_desc,
       b.graduated_term_id,
       b.graduation_date,
       b.level_id,
       b.degree_id,
       CASE b.primary_major_college_desc
                  WHEN 'Mathematics' THEN 'Sci, Engr & Tech'
                  WHEN '* Natural Sciences' THEN 'Sci, Engr & Tech'
                  WHEN '*Education/Family Studies/PE' THEN 'Education'
                  WHEN 'Humanities & Social Sciences' THEN 'Humanities/Soc Sci'
                  WHEN 'History/Political Science' THEN 'Humanities/Soc Sci'
                  WHEN 'Computer Information Tech' THEN 'Sci, Engr & Tech'
                  WHEN 'Technologies' THEN 'Sci, Engr & Tech'
                  WHEN 'Nursing' THEN 'Health Sciences'
                  WHEN 'College of Health Sciences' THEN 'Health Sciences'
                  WHEN 'College of Business' THEN 'Business'
                  WHEN 'College of Education' THEN 'Education'
                  WHEN 'College of the Arts' THEN 'Fine Arts'
                  WHEN 'Coll of Sci, Engr & Tech' THEN 'Sci, Engr & Tech'
                  WHEN 'Coll of Humanities/Soc Sci' THEN 'Humanities/Soc Sci'
                  ELSE b.primary_major_college_desc
                END AS College,
       b.primary_major_desc,
       d.athlete_activity_desc,
       d.residency_code,
       d.residency_code_desc,
       c.is_veteran,
       c.birth_date,
       c.gender_code,
       CASE
                 -- International students
                WHEN c.is_international = TRUE THEN 'International student'
                WHEN c.us_citizenship_code = '2' THEN 'Non-resident alien'
                 -- IPEDS says Hispanic trumps other race/ethnicity.
                WHEN c.is_hispanic_latino_ethnicity = TRUE THEN 'Hispanic'
                 -- No particular order.
                WHEN c.is_multi_racial = TRUE THEN 'Multiracial'
                WHEN c.is_hawaiian_pacific_islander = TRUE THEN 'Hawaiian/Pacific Islander'
                WHEN c.is_black = TRUE THEN 'Black/African American'
                WHEN c.is_american_indian_alaskan = TRUE THEN 'American Indian/Alaskan'
                WHEN c.is_asian = TRUE THEN 'Asian'
                WHEN c.is_white = TRUE THEN 'White'
                ELSE 'Unspecified'
                END AS Ethnicity
       FROM degrees_awarded b
  LEFT JOIN student c
         ON b.student_id = c.student_id
        AND c.primary_level_id = b.level_id
  LEFT JOIN student_term_level d
         ON c.student_id = d.student_id
        AND b.graduated_term_id = d.term_id
  LEFT JOIN term e
         ON b. graduated_term_id = e.term_id
      WHERE b. is_graduated = TRUE