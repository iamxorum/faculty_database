-- ########## Afisare tabele prezente in DataBase
SELECT * FROM Student
SELECT * FROM Curs
-- SELECT * FROM Profesor
SELECT * FROM Grupa
SELECT * FROM Nota
-- SELECT * FROM Inscriere
-- SELECT * FROM Titular
-- ##############################################

-- Setare medie a studentilor
/*UPDATE Student
SET media_generala = 0

UPDATE Student
SET media_generala = (
  SELECT AVG(nota) 
  FROM Nota 
  WHERE Nota.cod_student = Student.cod_student
)*/
----------------------------------------------------

-- Interogare "J" din tema {media notelor obţinute la un anumit curs de către toţi studenţii grupei}
SELECT Student.cod_student, Student.nume, Student.prenume, Curs.cod_curs, Curs.descriere, Grupa.denumire, AVG(Nota.nota) AS media
FROM Student
INNER JOIN Grupa ON Student.cod_grupa = Grupa.cod_grupa
INNER JOIN Nota ON Student.cod_student = Nota.cod_student
INNER JOIN Curs ON Nota.cod_curs = Curs.cod_curs
WHERE Curs.cod_curs = 'C002'
  AND Grupa.denumire = 'Grupa 201'
GROUP BY Student.cod_student, Student.nume, Student.prenume, Curs.cod_curs, Curs.descriere, Grupa.denumire;
----------------------------------------------------------------------------------------------------

-- Interogare "I" din tema {media notelor obţinute la examenele şi colocviile dintr-o sesiune de către un student}
/*SELECT Student.cod_student, Student.nume, Student.prenume, AVG(Nota.nota) AS medie
FROM Student
INNER JOIN Nota ON Student.cod_student = Nota.cod_student
WHERE Nota.sesiune = 'S1'
GROUP BY Student.cod_student, Student.nume, Student.prenume;*/
------------------------------------------------------------------------------------------------------------------



-- Interogare "H" din tema {numărul de credite obţinute de un anumit student la examenele/colocviile promovate într-o sesiune}
/*SELECT Student.cod_student, Student.nume, Student.prenume, SUM(Nota.numar_credite) AS total_credite
FROM Student
INNER JOIN Nota ON Student.cod_student = Nota.cod_student
WHERE Student.cod_student = 'S001'
  AND Nota.examinare = 'Colocviu'
  AND Nota.sesiune = 'S1'
GROUP BY Student.cod_student, Student.nume, Student.prenume;*/
------------------------------------------------------------------------

-- Interogare "G" din tema {cursurile la care studenţii sunt restanţieri}
/*SELECT Curs.cod_curs, Curs.descriere, COUNT(*) AS numar_restantieri
FROM Curs
INNER JOIN Nota ON Curs.cod_curs = Nota.cod_curs
WHERE Nota.nota < 5
GROUP BY Curs.cod_curs, Curs.descriere;*/
-----------------------------------------------------------------------------------------------------------------------------

-- Interogare "F" din tema {studenţii restanţieri şi nr. de restanţe la toate cursurile la care au participat într-o sesiune}
/*SELECT S.cod_student, S.nume, S.prenume, COUNT(*) AS numar_restante, C.descriere AS nume_curs
FROM Student S
INNER JOIN Nota N ON S.cod_student = N.cod_student
INNER JOIN Curs C ON N.cod_curs = C.cod_curs
WHERE N.nota < 5 -- Considerăm că restanța este notată cu o notă mai mică decât 5
    AND N.sesiune = 'S1' -- Sesiunea specificată
GROUP BY S.cod_student, S.nume, S.prenume, C.descriere;*/
------------------------------------------------------------------------------------------------------------------------------

-- Interogare "E" din tema {studenţii restanţieri la un anumit curs}
/*SELECT Student.cod_student, Student.nume, Student.prenume, Curs.cod_curs, Curs.descriere
FROM Student
INNER JOIN Nota ON Student.cod_student = Nota.cod_student
INNER JOIN Curs ON Nota.cod_curs = Curs.cod_curs
WHERE Curs.cod_curs = 'C002' AND Nota.nota < 5;*/
-------------------------------------------------------------------------------------------------------


-- Interogare "D.2" din tema {notele obţinute de studenţi la un anumit curs funcţie de anumite criterii(ex.: în ordinea
-- alfabetică a numelor, în ordinea crescătoare/descrescătoare a notelor ş.a.)}
/*SELECT Student.cod_student, Student.nume, Student.prenume, Nota.nota
FROM Student
INNER JOIN Nota ON Student.cod_student = Nota.cod_student
WHERE Nota.cod_curs = 'C002'
ORDER BY Nota.nota DESC;*/
--------------------------------------------------------------------------------------------------------------------

-- Interogare "D.1" din tema {notele obţinute de studenţi la un anumit curs funcţie de anumite criterii(ex.: în ordinea
-- alfabetică a numelor, în ordinea crescătoare/descrescătoare a notelor ş.a.)}
/*SELECT Student.cod_student, Student.nume, Student.prenume, Nota.nota
FROM Student
INNER JOIN Nota ON Student.cod_student = Nota.cod_student
WHERE Nota.cod_curs = 'C002'
ORDER BY Student.nume ASC, Student.prenume ASC;*/
--------------------------------------------------------------------------------------------------------------------

-- Interogare "C" din tema {cod grupe de studiu, numele şefului de grupă şi al profesorului îndrumător}
/*SELECT Grupa.cod_grupa, Student.nume AS nume_sef_grupa, Profesor.nume AS nume_profesor_indrumator
FROM Grupa
INNER JOIN Student ON Grupa.cod_student_sef = Student.cod_student
INNER JOIN Profesor ON Grupa.cod_profesor = Profesor.cod_profesor;*/
-------------------------------------------------------------------------------------------------------


-- Interogare "B" din tema {numele cursurilor şi al profesorilor titulari}
/*SELECT Curs.descriere AS Nume_Curs, Profesor.nume AS Nume_Profesor, Profesor.prenume AS Prenume_Profesor
FROM Curs
INNER JOIN Titular ON Curs.cod_curs = Titular.cod_curs
INNER JOIN Profesor ON Titular.cod_profesor = Profesor.cod_profesor;*/
-------------------------------------------------------------------------


-- Interogare "A" din tema {studenţii care s-au înscris la un anumit curs}
/*SELECT Student.cod_student, Student.nume, Student.prenume, Curs.cod_curs, Curs.descriere
FROM Student
INNER JOIN Inscriere I ON Student.cod_student = I.cod_student
INNER JOIN Curs ON I.cod_curs = Curs.cod_curs
WHERE Curs.cod_curs = 'C002';*/
--------------------------------------------------------------------------