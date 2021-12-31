--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: superiorkid
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO superiorkid;

--
-- Name: todo; Type: TABLE; Schema: public; Owner: superiorkid
--

CREATE TABLE public.todo (
    id integer NOT NULL,
    tasks character varying(120),
    complete boolean,
    created_date timestamp without time zone
);


ALTER TABLE public.todo OWNER TO superiorkid;

--
-- Name: todo_id_seq; Type: SEQUENCE; Schema: public; Owner: superiorkid
--

CREATE SEQUENCE public.todo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.todo_id_seq OWNER TO superiorkid;

--
-- Name: todo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superiorkid
--

ALTER SEQUENCE public.todo_id_seq OWNED BY public.todo.id;


--
-- Name: todo id; Type: DEFAULT; Schema: public; Owner: superiorkid
--

ALTER TABLE ONLY public.todo ALTER COLUMN id SET DEFAULT nextval('public.todo_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: superiorkid
--

COPY public.alembic_version (version_num) FROM stdin;
8ea0bef261e8
\.


--
-- Data for Name: todo; Type: TABLE DATA; Schema: public; Owner: superiorkid
--

COPY public.todo (id, tasks, complete, created_date) FROM stdin;
\.


--
-- Name: todo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superiorkid
--

SELECT pg_catalog.setval('public.todo_id_seq', 73, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: superiorkid
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: todo todo_pkey; Type: CONSTRAINT; Schema: public; Owner: superiorkid
--

ALTER TABLE ONLY public.todo
    ADD CONSTRAINT todo_pkey PRIMARY KEY (id);


--
-- Name: ix_todo_tasks; Type: INDEX; Schema: public; Owner: superiorkid
--

CREATE UNIQUE INDEX ix_todo_tasks ON public.todo USING btree (tasks);


--
-- PostgreSQL database dump complete
--

