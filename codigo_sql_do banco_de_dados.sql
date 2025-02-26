-- Código SQL do banco de dados gerado pelo pgAdmin 
BEGIN;


CREATE TABLE IF NOT EXISTS public.alunos
(
    id serial NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default" NOT NULL,
    data_nascimento character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT alunos_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.matriculas
(
    id serial NOT NULL,
    aluno_id integer NOT NULL,
    disciplina_id integer NOT NULL,
    data_matricula character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT matriculas_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.disciplinas
(
    id serial NOT NULL,
    nome_da_disciplina character varying(100) COLLATE pg_catalog."default" NOT NULL,
    carga_horaria character varying(100) COLLATE pg_catalog."default" NOT NULL,
    professor_id integer NOT NULL,
    CONSTRAINT disciplinas_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.professores
(
    id serial NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default" NOT NULL,
    departamento character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT professores_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.matriculas
    ADD CONSTRAINT matriculas_aluno_id_fkey FOREIGN KEY (aluno_id)
    REFERENCES public.alunos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.matriculas
    ADD CONSTRAINT matriculas_disciplina_id_fkey FOREIGN KEY (disciplina_id)
    REFERENCES public.disciplinas (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.disciplinas
    ADD CONSTRAINT disciplinas_professor_id_fkey FOREIGN KEY (professor_id)
    REFERENCES public.professores (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;