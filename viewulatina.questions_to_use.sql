SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [ulatina].[questions_to_use]
as
with allStudents as (
	select distinct studentid from [ulatina].[EncuestaEstudiantes]
), WHO_LIVES as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Actualmente con quién vive?'
	)

), FAMILY_PAPER as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Cuál es su rol dentro del núcleo familiar?'
	)

), PERFORMANCE_INFLUENCE as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = 'Existe alguna situación que podría influir en el desempeño y avance de la carerra?'
	)

), COSTARRICENSE as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = 'Es usted Costarricense o extranjero?'
	)

), BACHILLERATO_YEAR as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = 'En qué año obtuvo su título de bachillerato'
	)

), BACHILLERATO_SCHOOL as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = 'Del área de ciencias básicas, ¿cuál materia opcional escogió cuando realizó el Bachillerato?'
	)

), SCHOOL_REPROVED as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Cuál materia reprobó?'
	)

), GRADE_RANGE as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿En qué rango de notas obtuvo su título de Bachillerato?'
	)

), HIST_CURRICULAR_ADEQUACY as (

	select distinct studentid, 
		case when upper(answer) = 'NO' then 0 else 1 end answer
	from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Tiene antecedentes de adecuación curricular?'
	)

), TYPE_CURRICULAR_ADEQUACY as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = 'Indique el tipo de adecuación curricular'
	)

), REASONS_TO_ENROLL_PROGRAM as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Que te motivó a elegir esta carrera?'
	)

), KNOWLEDGE_ABOUT_PROFESSION as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Qué tanto conoce la carrera que eligió?'
	)

), KNOWLEDGE_ABOUT_PROGRAM as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Qué tanto conoce el plan de estudios de la carrera que eligió?'
	)

), STUDIED_OTHER_PROGRAM as (

	select distinct studentid, 
		case when upper(answer) = 'NO' then 0 else 1 end answer
	from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Ha estudiado previamente otra carrera?'
	)

), TUITION_RESP as (
	
	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Quién financia sus estudios?'
	)

), HOUSEHOLD_INCOME as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Cuál es el ingreso neto aproximado mensual familiar?'
	)

), EXTRACURRICULAR_ACTIVITIES as (

	select distinct studentid, 
		case when upper(answer) = 'NO' then 0 else 1 end answer
	from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿En el colegio participaba de actividades extracurriculares?'
	)

), PARENTS_EDUC_LEVEL as (

	select distinct studentid, answer from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Podría indicar el nivel de educación de sus padres?'
	)

), LEARNING_TECHNIQUES as (

	select distinct studentid, 
		case when upper(answer) = 'NO' then 0 else 1 end answer
	from [ulatina].[EncuestaEstudiantes] where preguntacod in (
		select preguntacod from [ulatina].[Encuesta]
		where pregunta = '¿Conoce usted de técnicas de estudio aplicables como métodos de aprendizaje?'
	)
	
)


select distinct	a.studentid,
		isnull(upper(WHO_LIVES.answer),'NOT AVALIABLE') as WHO_LIVES,
		isnull(upper(FAMILY_PAPER.answer),'NOT AVALIABLE') as FAMILY_PAPER,
		isnull(upper(PERFORMANCE_INFLUENCE.answer),'NOT AVALIABLE') as PERFORMANCE_INFLUENCE,
		isnull(upper(COSTARRICENSE.answer),'NOT AVALIABLE') as COSTARRICENSE,
		isnull(upper(BACHILLERATO_YEAR.answer),'NOT AVALIABLE') as BACHILLERATO_YEAR,
		isnull(upper(BACHILLERATO_SCHOOL.answer),'NOT AVALIABLE') as BACHILLERATO_SCHOOL,
		0 BACHILLERATO_REPROVED,
		0 TWICE_REPROVED,
		isnull(upper(SCHOOL_REPROVED.answer),'NOT AVALIABLE') as SCHOOL_REPROVED,
		isnull(upper(GRADE_RANGE.answer),'NOT AVALIABLE') as GRADE_RANGE,
		isnull(HIST_CURRICULAR_ADEQUACY.answer,0) as HIST_CURRICULAR_ADEQUACY,
		isnull(upper(TYPE_CURRICULAR_ADEQUACY.answer),'NOT AVALIABLE') as TYPE_CURRICULAR_ADEQUACY,
		isnull(upper(REASONS_TO_ENROLL_PROGRAM.answer),'NOT AVALIABLE') as REASONS_TO_ENROLL_PROGRAM,
		isnull(upper(KNOWLEDGE_ABOUT_PROFESSION.answer),'NOT AVALIABLE') as KNOWLEDGE_ABOUT_PROFESSION,
		isnull(upper(KNOWLEDGE_ABOUT_PROGRAM.answer),'NOT AVALIABLE') as KNOWLEDGE_ABOUT_PROGRAM,
		isnull(STUDIED_OTHER_PROGRAM.answer,0) as STUDIED_OTHER_PROGRAM,
		isnull(upper(TUITION_RESP.answer),'NOT AVALIABLE') as TUITION_RESP,
		isnull(upper(HOUSEHOLD_INCOME.answer),'NOT AVALIABLE') as HOUSEHOLD_INCOME,
		'NOT AVALIABLE' INTERESS_INDUCCION,
		isnull(EXTRACURRICULAR_ACTIVITIES.answer,0) as EXTRACURRICULAR_ACTIVITIES,
		isnull(upper(PARENTS_EDUC_LEVEL.answer),'NOT AVALIABLE') as PARENTS_EDUC_LEVEL,
		isnull(LEARNING_TECHNIQUES.answer,0) as LEARNING_TECHNIQUES,
		1 HAS_SURVEY


from allStudents a

left join WHO_LIVES 
on a.studentid = WHO_LIVES.studentid

left join FAMILY_PAPER 
on a.studentid = FAMILY_PAPER.studentid

left join PERFORMANCE_INFLUENCE 
on a.studentid = PERFORMANCE_INFLUENCE.studentid

left join COSTARRICENSE 
on a.studentid = COSTARRICENSE.studentid

left join BACHILLERATO_YEAR 
on a.studentid = BACHILLERATO_YEAR.studentid

left join BACHILLERATO_SCHOOL 
on a.studentid = BACHILLERATO_SCHOOL.studentid

left join SCHOOL_REPROVED 
on a.studentid = SCHOOL_REPROVED.studentid

left join GRADE_RANGE 
on a.studentid = GRADE_RANGE.studentid

left join HIST_CURRICULAR_ADEQUACY
on a.studentid = HIST_CURRICULAR_ADEQUACY.studentid

left join TYPE_CURRICULAR_ADEQUACY
on a.studentid = TYPE_CURRICULAR_ADEQUACY.studentid

left join REASONS_TO_ENROLL_PROGRAM
on a.studentid = REASONS_TO_ENROLL_PROGRAM.studentid

left join KNOWLEDGE_ABOUT_PROFESSION
on a.studentid = KNOWLEDGE_ABOUT_PROFESSION.studentid

left join KNOWLEDGE_ABOUT_PROGRAM
on a.studentid = KNOWLEDGE_ABOUT_PROGRAM.studentid

left join STUDIED_OTHER_PROGRAM
on a.studentid = STUDIED_OTHER_PROGRAM.studentid

left join TUITION_RESP
on a.studentid = TUITION_RESP.studentid

left join HOUSEHOLD_INCOME
on a.studentid = HOUSEHOLD_INCOME.studentid

left join EXTRACURRICULAR_ACTIVITIES
on a.studentid = EXTRACURRICULAR_ACTIVITIES.studentid

left join PARENTS_EDUC_LEVEL
on a.studentid = PARENTS_EDUC_LEVEL.studentid

left join LEARNING_TECHNIQUES
on a.studentid = LEARNING_TECHNIQUES.studentid


GO
