Select oakstd.stdId,oakstd.stdFirstName,oakstd.stdLastName,oec.emrFirstName + ' ' + oec.emrLastName as 'Emergency Contact', oec.emrHomeNumber,oakstd.stdDOB,oakstd.stdGrade,oakstd.sex,oakstd.expAttendance, oakstdmed.medConditions,oakstdmed.medications,oakstdmed.foodAllergy,oakstdmed.drugAllergy,oakstdmed.SignsSymptons,oakstdmed.responseDescp,oakstdmed.preventionDescp,oakstdmed.comments, oakstdmed.severity
FROM [Oaks.Student] oakstd, [Oaks.StudentMedical] oakstdmed, [Oaks.EmergencyContact] oec
WHERE oakstd.stdId = oakstdmed.stdId
AND oakstd.expAttendance < '80%'
AND oakstd.stdId = oec.stdId;