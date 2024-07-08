--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Ubuntu 16.3-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-0ubuntu0.24.04.1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO lbrenap;

--
-- Name: experience; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.experience (
    id integer NOT NULL,
    job_title character varying(50) NOT NULL,
    company character varying(100) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    description character varying(1000) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.experience OWNER TO lbrenap;

--
-- Name: experience_highlight; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.experience_highlight (
    id integer NOT NULL,
    experience_id integer NOT NULL,
    content character varying(700) NOT NULL
);


ALTER TABLE public.experience_highlight OWNER TO lbrenap;

--
-- Name: experience_highlight_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.experience_highlight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.experience_highlight_id_seq OWNER TO lbrenap;

--
-- Name: experience_highlight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.experience_highlight_id_seq OWNED BY public.experience_highlight.id;


--
-- Name: experience_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.experience_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.experience_id_seq OWNER TO lbrenap;

--
-- Name: experience_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.experience_id_seq OWNED BY public.experience.id;


--
-- Name: experience_image; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.experience_image (
    id integer NOT NULL,
    experience_id integer NOT NULL,
    url character varying(200) NOT NULL
);


ALTER TABLE public.experience_image OWNER TO lbrenap;

--
-- Name: experience_image_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.experience_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.experience_image_id_seq OWNER TO lbrenap;

--
-- Name: experience_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.experience_image_id_seq OWNED BY public.experience_image.id;


--
-- Name: profile; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    bio character varying(256) NOT NULL,
    profile_picture character varying(256) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL
);


ALTER TABLE public.profile OWNER TO lbrenap;

--
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profile_id_seq OWNER TO lbrenap;

--
-- Name: profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.profile_id_seq OWNED BY public.profile.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.project (
    id integer NOT NULL,
    user_id integer NOT NULL,
    project_title character varying(100) NOT NULL,
    company character varying(100) NOT NULL,
    description character varying(1000) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.project OWNER TO lbrenap;

--
-- Name: project_highlight; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.project_highlight (
    id integer NOT NULL,
    project_id integer NOT NULL,
    content character varying(700) NOT NULL
);


ALTER TABLE public.project_highlight OWNER TO lbrenap;

--
-- Name: project_highlight_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.project_highlight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_highlight_id_seq OWNER TO lbrenap;

--
-- Name: project_highlight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.project_highlight_id_seq OWNED BY public.project_highlight.id;


--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_id_seq OWNER TO lbrenap;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: project_image; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.project_image (
    id integer NOT NULL,
    project_id integer NOT NULL,
    url character varying(200) NOT NULL
);


ALTER TABLE public.project_image OWNER TO lbrenap;

--
-- Name: project_image_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.project_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_image_id_seq OWNER TO lbrenap;

--
-- Name: project_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.project_image_id_seq OWNED BY public.project_image.id;


--
-- Name: skill; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.skill (
    id integer NOT NULL,
    experience_id integer NOT NULL,
    name character varying(700) NOT NULL
);


ALTER TABLE public.skill OWNER TO lbrenap;

--
-- Name: skill_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skill_id_seq OWNER TO lbrenap;

--
-- Name: skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.skill_id_seq OWNED BY public.skill.id;


--
-- Name: subscriber; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public.subscriber (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.subscriber OWNER TO lbrenap;

--
-- Name: subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.subscriber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriber_id_seq OWNER TO lbrenap;

--
-- Name: subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.subscriber_id_seq OWNED BY public.subscriber.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: lbrenap
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(256) NOT NULL
);


ALTER TABLE public."user" OWNER TO lbrenap;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: lbrenap
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO lbrenap;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbrenap
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: experience id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience ALTER COLUMN id SET DEFAULT nextval('public.experience_id_seq'::regclass);


--
-- Name: experience_highlight id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience_highlight ALTER COLUMN id SET DEFAULT nextval('public.experience_highlight_id_seq'::regclass);


--
-- Name: experience_image id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience_image ALTER COLUMN id SET DEFAULT nextval('public.experience_image_id_seq'::regclass);


--
-- Name: profile id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.profile ALTER COLUMN id SET DEFAULT nextval('public.profile_id_seq'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: project_highlight id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project_highlight ALTER COLUMN id SET DEFAULT nextval('public.project_highlight_id_seq'::regclass);


--
-- Name: project_image id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project_image ALTER COLUMN id SET DEFAULT nextval('public.project_image_id_seq'::regclass);


--
-- Name: skill id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.skill ALTER COLUMN id SET DEFAULT nextval('public.skill_id_seq'::regclass);


--
-- Name: subscriber id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.subscriber ALTER COLUMN id SET DEFAULT nextval('public.subscriber_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.alembic_version (version_num) FROM stdin;
1720230127
\.


--
-- Data for Name: experience; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.experience (id, job_title, company, start_date, end_date, description, created, user_id) FROM stdin;
1	 Hotel Manager	CHC  - Best Western Franchisee	2018-08-01 00:00:00	2023-08-01 00:00:00		2024-07-06 01:52:05.85696	1
2	Founder	Grupo Oka	2018-10-01 00:00:00	2023-08-01 00:00:00		2024-07-06 01:53:10.931797	1
\.


--
-- Data for Name: experience_highlight; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.experience_highlight (id, experience_id, content) FROM stdin;
1	1	Implemented a Revenue Management System and a feature-based quotation standard for events resulting in a 15% increase in total revenue per available room for all business units
2	1	Saw a 6% increase in Gross Margin and 10% in Net Profit Margin after the implementation of Oracle Symphony POS and Inventory Management System by the end of 2022
3	1	Supervised design and execution of a new restaurant and remodeling work in the hotel
4	1	Won a regional bid to house mining employees during the COVID-19 pandemic, which resulted in a 50% increase in revenue for 2020 and 2021
5	1	Led 24 employees in implementing a PMS, SOP 231, and 101 SOP (standard operating procedures) for front office and wait people training
6	1	Tracked, monitored, and supervised service quality, accounting, operations, and infrastructure improvements
\.


--
-- Data for Name: experience_image; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.experience_image (id, experience_id, url) FROM stdin;
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.profile (id, user_id, bio, profile_picture, email, phone) FROM stdin;
1	1	Hello, I'm Luis Brena. Here, you can check my previous projects in engineering, hospitality infrastructure, and marketing. I am passionate about my work and always strive to create solutions that benefit people	images/profile_picture.jpg	lbrenap1@jhu.edu	+1 (667) 378 1725
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.project (id, user_id, project_title, company, description, start_date, end_date, created) FROM stdin;
\.


--
-- Data for Name: project_highlight; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.project_highlight (id, project_id, content) FROM stdin;
\.


--
-- Data for Name: project_image; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.project_image (id, project_id, url) FROM stdin;
\.


--
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.skill (id, experience_id, name) FROM stdin;
\.


--
-- Data for Name: subscriber; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public.subscriber (id, email, name) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: lbrenap
--

COPY public."user" (id, username, password) FROM stdin;
1	lbrenap	edmundo3541
\.


--
-- Name: experience_highlight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.experience_highlight_id_seq', 1, false);


--
-- Name: experience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.experience_id_seq', 1, false);


--
-- Name: experience_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.experience_image_id_seq', 1, false);


--
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.profile_id_seq', 1, false);


--
-- Name: project_highlight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.project_highlight_id_seq', 1, false);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.project_id_seq', 1, false);


--
-- Name: project_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.project_image_id_seq', 1, false);


--
-- Name: skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.skill_id_seq', 1, false);


--
-- Name: subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.subscriber_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbrenap
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: experience pk_experience; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience
    ADD CONSTRAINT pk_experience PRIMARY KEY (id);


--
-- Name: experience_highlight pk_experience_highlight; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience_highlight
    ADD CONSTRAINT pk_experience_highlight PRIMARY KEY (id);


--
-- Name: experience_image pk_experience_image; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience_image
    ADD CONSTRAINT pk_experience_image PRIMARY KEY (id);


--
-- Name: profile pk_profile; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT pk_profile PRIMARY KEY (id);


--
-- Name: project pk_project; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT pk_project PRIMARY KEY (id);


--
-- Name: project_highlight pk_project_highlight; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project_highlight
    ADD CONSTRAINT pk_project_highlight PRIMARY KEY (id);


--
-- Name: project_image pk_project_image; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project_image
    ADD CONSTRAINT pk_project_image PRIMARY KEY (id);


--
-- Name: skill pk_skill; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT pk_skill PRIMARY KEY (id);


--
-- Name: subscriber pk_subscriber; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT pk_subscriber PRIMARY KEY (id);


--
-- Name: user pk_user; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- Name: user uq_user_username; Type: CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uq_user_username UNIQUE (username);


--
-- Name: experience_highlight fk_experience_highlight_experience_id_experience; Type: FK CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience_highlight
    ADD CONSTRAINT fk_experience_highlight_experience_id_experience FOREIGN KEY (experience_id) REFERENCES public.experience(id);


--
-- Name: experience_image fk_experience_image_experience_id_experience; Type: FK CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience_image
    ADD CONSTRAINT fk_experience_image_experience_id_experience FOREIGN KEY (experience_id) REFERENCES public.experience(id);


--
-- Name: experience fk_experience_user_id_user; Type: FK CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.experience
    ADD CONSTRAINT fk_experience_user_id_user FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: profile fk_profile_user_id_user; Type: FK CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fk_profile_user_id_user FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: project_highlight fk_project_highlight_project_id_project; Type: FK CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project_highlight
    ADD CONSTRAINT fk_project_highlight_project_id_project FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- Name: project_image fk_project_image_project_id_project; Type: FK CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project_image
    ADD CONSTRAINT fk_project_image_project_id_project FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- Name: project fk_project_user_id_user; Type: FK CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT fk_project_user_id_user FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: skill fk_skill_experience_id_experience; Type: FK CONSTRAINT; Schema: public; Owner: lbrenap
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT fk_skill_experience_id_experience FOREIGN KEY (experience_id) REFERENCES public.experience(id);


--
-- PostgreSQL database dump complete
--

