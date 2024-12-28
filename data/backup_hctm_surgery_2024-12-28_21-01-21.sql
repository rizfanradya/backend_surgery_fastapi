--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


--
-- Name: blocked_day; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blocked_day (
    id integer NOT NULL,
    day_id integer NOT NULL,
    unit_id integer NOT NULL
);


--
-- Name: blocked_day_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blocked_day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blocked_day_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blocked_day_id_seq OWNED BY public.blocked_day.id;


--
-- Name: blocked_ot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blocked_ot (
    id integer NOT NULL,
    ot_id integer NOT NULL,
    unit_id integer NOT NULL
);


--
-- Name: blocked_ot_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blocked_ot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blocked_ot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blocked_ot_id_seq OWNED BY public.blocked_ot.id;


--
-- Name: clashing_subspecialties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clashing_subspecialties (
    id integer NOT NULL,
    sub_specialty_id integer NOT NULL,
    unit_id integer NOT NULL
);


--
-- Name: clashing_subspecialties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clashing_subspecialties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clashing_subspecialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clashing_subspecialties_id_seq OWNED BY public.clashing_subspecialties.id;


--
-- Name: day; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.day (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    week_id integer NOT NULL
);


--
-- Name: day_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: day_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.day_id_seq OWNED BY public.day.id;


--
-- Name: equipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.equipment (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    sub_specialty_id integer NOT NULL
);


--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.equipment_id_seq OWNED BY public.equipment.id;


--
-- Name: equipment_msp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.equipment_msp (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    status_id integer NOT NULL
);


--
-- Name: equipment_msp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.equipment_msp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: equipment_msp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.equipment_msp_id_seq OWNED BY public.equipment_msp.id;


--
-- Name: equipment_requirement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.equipment_requirement (
    id integer NOT NULL,
    unit_id integer NOT NULL,
    equipment_id integer NOT NULL,
    equipment_requirement_status_id integer NOT NULL
);


--
-- Name: equipment_requirement_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.equipment_requirement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: equipment_requirement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.equipment_requirement_id_seq OWNED BY public.equipment_requirement.id;


--
-- Name: equipment_requirement_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.equipment_requirement_status (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    penalty_value integer NOT NULL
);


--
-- Name: equipment_requirement_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.equipment_requirement_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: equipment_requirement_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.equipment_requirement_status_id_seq OWNED BY public.equipment_requirement_status.id;


--
-- Name: fixed_ot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fixed_ot (
    id integer NOT NULL,
    ot_id integer NOT NULL,
    unit_id integer NOT NULL
);


--
-- Name: fixed_ot_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fixed_ot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fixed_ot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fixed_ot_id_seq OWNED BY public.fixed_ot.id;


--
-- Name: masterplan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.masterplan (
    id integer NOT NULL,
    description character varying(255),
    objective_value numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    uploaded_file character varying(255),
    start_date date,
    end_date date
);


--
-- Name: masterplan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.masterplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: masterplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.masterplan_id_seq OWNED BY public.masterplan.id;


--
-- Name: objectives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.objectives (
    id integer NOT NULL,
    objectives character varying(255) NOT NULL,
    weight numeric(10,2) NOT NULL
);


--
-- Name: objectives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.objectives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: objectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.objectives_id_seq OWNED BY public.objectives.id;


--
-- Name: ot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ot (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ot_type_id integer NOT NULL,
    status_id integer NOT NULL
);


--
-- Name: ot_assignment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ot_assignment (
    id integer NOT NULL,
    mssp_id integer NOT NULL,
    mrn character varying(255) NOT NULL,
    week_id integer NOT NULL,
    ot_id integer NOT NULL,
    unit_id integer NOT NULL,
    day_id integer NOT NULL,
    is_require_anaes boolean NOT NULL,
    opening_time time without time zone NOT NULL,
    closing_time time without time zone NOT NULL
);


--
-- Name: ot_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ot_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ot_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ot_assignment_id_seq OWNED BY public.ot_assignment.id;


--
-- Name: ot_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ot_id_seq OWNED BY public.ot.id;


--
-- Name: ot_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ot_type (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);


--
-- Name: ot_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ot_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ot_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ot_type_id_seq OWNED BY public.ot_type.id;


--
-- Name: preferred_ot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.preferred_ot (
    id integer NOT NULL,
    ot_id integer NOT NULL,
    unit_id integer NOT NULL
);


--
-- Name: preferred_ot_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.preferred_ot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preferred_ot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.preferred_ot_id_seq OWNED BY public.preferred_ot.id;


--
-- Name: procedure_name; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.procedure_name (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sub_specialty_id integer NOT NULL
);


--
-- Name: procedure_name_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.procedure_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: procedure_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.procedure_name_id_seq OWNED BY public.procedure_name.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role (
    id integer NOT NULL,
    role character varying(255) NOT NULL
);


--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: schedule_resource; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schedule_resource (
    id integer NOT NULL,
    resource character varying(255) NOT NULL,
    value integer
);


--
-- Name: schedule_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.schedule_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedule_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.schedule_resource_id_seq OWNED BY public.schedule_resource.id;


--
-- Name: schedule_results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schedule_results (
    id integer NOT NULL,
    run_id character varying(255) NOT NULL,
    mrn text NOT NULL,
    age integer NOT NULL,
    week_id integer NOT NULL,
    week_day character varying(255) NOT NULL,
    surgery_date date NOT NULL,
    type_of_surgery text NOT NULL,
    sub_specialty_desc text NOT NULL,
    specialty_id text NOT NULL,
    procedure_name text NOT NULL,
    surgery_duration integer NOT NULL,
    phu_id integer NOT NULL,
    phu_start_time time without time zone NOT NULL,
    phu_end_time time without time zone NOT NULL,
    ot_id integer NOT NULL,
    ot_start_time time without time zone NOT NULL,
    ot_end_time time without time zone NOT NULL,
    surgeon_name text NOT NULL,
    post_op_id integer NOT NULL,
    post_op_start_time time without time zone NOT NULL,
    post_op_end_time time without time zone NOT NULL,
    pacu_id integer NOT NULL,
    pacu_start_time time without time zone NOT NULL,
    pacu_end_time time without time zone NOT NULL,
    icu_id integer NOT NULL,
    icu_start_time time without time zone NOT NULL,
    icu_end_time time without time zone NOT NULL
);


--
-- Name: schedule_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.schedule_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedule_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.schedule_results_id_seq OWNED BY public.schedule_results.id;


--
-- Name: specialty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.specialty (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: specialty_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: specialty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.specialty_id_seq OWNED BY public.specialty.id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.status (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);


--
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- Name: sub_specialties_ot_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sub_specialties_ot_types (
    id integer NOT NULL,
    sub_specialty_id integer NOT NULL,
    ot_type_id integer NOT NULL,
    unit_id integer NOT NULL
);


--
-- Name: sub_specialties_ot_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sub_specialties_ot_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sub_specialties_ot_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sub_specialties_ot_types_id_seq OWNED BY public.sub_specialties_ot_types.id;


--
-- Name: sub_specialty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sub_specialty (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    specialty_id integer NOT NULL,
    color_hex character varying(7) NOT NULL
);


--
-- Name: sub_specialty_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sub_specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sub_specialty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sub_specialty_id_seq OWNED BY public.sub_specialty.id;


--
-- Name: surgery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.surgery (
    id integer NOT NULL,
    mrn character varying(255) NOT NULL,
    booking_date date NOT NULL,
    estimated_duration integer NOT NULL,
    age integer NOT NULL,
    gender_code character varying(255) NOT NULL,
    surgeon character varying(255) NOT NULL,
    unit_id integer NOT NULL,
    procedure_name_id integer NOT NULL,
    mssp_id integer NOT NULL
);


--
-- Name: surgery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.surgery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: surgery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.surgery_id_seq OWNED BY public.surgery.id;


--
-- Name: unit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unit (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sub_specialty_id integer NOT NULL,
    is_require_anaes boolean NOT NULL,
    max_slot_limit integer NOT NULL,
    no_of_slots integer NOT NULL,
    resource_requirement_id integer NOT NULL,
    color_hex character varying(7) NOT NULL
);


--
-- Name: unit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unit_id_seq OWNED BY public.unit.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: week; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.week (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    status_id integer NOT NULL
);


--
-- Name: week_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.week_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: week_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.week_id_seq OWNED BY public.week.id;


--
-- Name: blocked_day id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_day ALTER COLUMN id SET DEFAULT nextval('public.blocked_day_id_seq'::regclass);


--
-- Name: blocked_ot id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_ot ALTER COLUMN id SET DEFAULT nextval('public.blocked_ot_id_seq'::regclass);


--
-- Name: clashing_subspecialties id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clashing_subspecialties ALTER COLUMN id SET DEFAULT nextval('public.clashing_subspecialties_id_seq'::regclass);


--
-- Name: day id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.day ALTER COLUMN id SET DEFAULT nextval('public.day_id_seq'::regclass);


--
-- Name: equipment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment ALTER COLUMN id SET DEFAULT nextval('public.equipment_id_seq'::regclass);


--
-- Name: equipment_msp id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_msp ALTER COLUMN id SET DEFAULT nextval('public.equipment_msp_id_seq'::regclass);


--
-- Name: equipment_requirement id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_requirement ALTER COLUMN id SET DEFAULT nextval('public.equipment_requirement_id_seq'::regclass);


--
-- Name: equipment_requirement_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_requirement_status ALTER COLUMN id SET DEFAULT nextval('public.equipment_requirement_status_id_seq'::regclass);


--
-- Name: fixed_ot id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fixed_ot ALTER COLUMN id SET DEFAULT nextval('public.fixed_ot_id_seq'::regclass);


--
-- Name: masterplan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.masterplan ALTER COLUMN id SET DEFAULT nextval('public.masterplan_id_seq'::regclass);


--
-- Name: objectives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.objectives ALTER COLUMN id SET DEFAULT nextval('public.objectives_id_seq'::regclass);


--
-- Name: ot id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot ALTER COLUMN id SET DEFAULT nextval('public.ot_id_seq'::regclass);


--
-- Name: ot_assignment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_assignment ALTER COLUMN id SET DEFAULT nextval('public.ot_assignment_id_seq'::regclass);


--
-- Name: ot_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_type ALTER COLUMN id SET DEFAULT nextval('public.ot_type_id_seq'::regclass);


--
-- Name: preferred_ot id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preferred_ot ALTER COLUMN id SET DEFAULT nextval('public.preferred_ot_id_seq'::regclass);


--
-- Name: procedure_name id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procedure_name ALTER COLUMN id SET DEFAULT nextval('public.procedure_name_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: schedule_resource id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule_resource ALTER COLUMN id SET DEFAULT nextval('public.schedule_resource_id_seq'::regclass);


--
-- Name: schedule_results id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule_results ALTER COLUMN id SET DEFAULT nextval('public.schedule_results_id_seq'::regclass);


--
-- Name: specialty id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialty ALTER COLUMN id SET DEFAULT nextval('public.specialty_id_seq'::regclass);


--
-- Name: status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- Name: sub_specialties_ot_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_specialties_ot_types ALTER COLUMN id SET DEFAULT nextval('public.sub_specialties_ot_types_id_seq'::regclass);


--
-- Name: sub_specialty id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_specialty ALTER COLUMN id SET DEFAULT nextval('public.sub_specialty_id_seq'::regclass);


--
-- Name: surgery id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surgery ALTER COLUMN id SET DEFAULT nextval('public.surgery_id_seq'::regclass);


--
-- Name: unit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit ALTER COLUMN id SET DEFAULT nextval('public.unit_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: week id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.week ALTER COLUMN id SET DEFAULT nextval('public.week_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.alembic_version (version_num) FROM stdin;
cea33c1cf117
\.


--
-- Data for Name: blocked_day; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blocked_day (id, day_id, unit_id) FROM stdin;
1	1	4
2	1	26
\.


--
-- Data for Name: blocked_ot; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blocked_ot (id, ot_id, unit_id) FROM stdin;
1	1	3
2	2	3
\.


--
-- Data for Name: clashing_subspecialties; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clashing_subspecialties (id, sub_specialty_id, unit_id) FROM stdin;
1	2	1
2	1	2
\.


--
-- Data for Name: day; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.day (id, name, week_id) FROM stdin;
1	Mon	1
2	Tue	1
3	Wed	1
4	Thu	1
5	Fri	1
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.equipment (id, name, quantity, sub_specialty_id) FROM stdin;
1	Argon Plasma Coagulator	0	23
2	Arthroscopy monitor set	0	8
3	CONSTELLATION MACHINE	1	9
4	CRYO MESIN	1	9
5	Dermatom	0	8
6	Doopler	0	1
7	Drill	0	12
8	ECP MESIN	1	9
9	Elecrosurgical Unit	0	6
10	Endoscopy System	0	15
11	Flexible Reamer	0	6
12	High speed drill	0	8
13	II Machine	0	8
14	Lap Instrument Set	0	15
15	Laparoscopic System	0	15
16	Liver Retractor	0	23
17	MESIN LASER	1	9
18	Mesin RF	0	8
19	Microscope	0	6
20	Microscope (OPHTHALMOLOGY)	0	9
21	Monitor Mobile System	0	23
22	Nerve Monitoring	0	23
23	OR 1	4	23
24	PHACO HANDPIECE	6	9
25	PHACO MACHINE	3	9
26	RFA machine	0	1
27	SCD EXPRESS	2	23
28	Saw	0	8
29	Sholder Traction	0	8
30	TABLE OT	18	9
31	Telescope	0	23
32	Tourniquet	0	6
33	Traction table	0	6
34	Ultaround	0	3
35	Ultarsound	0	15
36	Ultrasonic Machine	0	15
37	Ultrasonic machine	0	2
38	Ultrasound	0	12
39	Utrasound machine	0	1
\.


--
-- Data for Name: equipment_msp; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.equipment_msp (id, name, quantity, status_id) FROM stdin;
1	Argon Plasma Coagulator	1	1
2	Arthroscopy Monitor Set	3	1
3	Constellation Machine	1	1
4	Cryo Mesin	1	1
5	Dermatom	1	1
6	Doppler	1	1
7	Drill	3	1
8	ECP Mesin	1	1
9	Electrosurgical Unit (ESU)	16	1
10	Flexible Reamer	2	1
11	High Speed Drill	3	1
12	II Machine	4	1
13	Lap Instrument Set	5	1
14	Laparoscopic System (Mobile)	2	1
15	Laser	1	1
16	Mesin RF	1	1
17	Microscope	4	1
18	Microscope (OPHTHALMOLOGY)	2	1
19	Nerve Monitoring	1	1
20	OR 1	4	1
21	Phaco Handpiece	6	1
22	Phaco Machine	3	1
23	SCD Express	2	1
24	Shoulder Traction	2	1
25	Table OT	18	1
26	Telescope	4	1
27	Torniquet	4	1
28	Traction Table	1	1
29	Ultrasonic Machine	1	1
30	Ultrasound	1	1
\.


--
-- Data for Name: equipment_requirement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.equipment_requirement (id, unit_id, equipment_id, equipment_requirement_status_id) FROM stdin;
\.


--
-- Data for Name: equipment_requirement_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.equipment_requirement_status (id, description, penalty_value) FROM stdin;
1	Used by All Surgeries	3
2	Used by Most Surgeries	2
3	Used by Some Surgeries	1
\.


--
-- Data for Name: fixed_ot; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fixed_ot (id, ot_id, unit_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	12	1
5	13	1
6	1	2
7	2	2
8	4	11
9	9	11
10	3	12
11	4	12
\.


--
-- Data for Name: masterplan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.masterplan (id, description, objective_value, created_at, uploaded_file, start_date, end_date) FROM stdin;
1	MSSP: 1 generated at 2024-12-28 20:46:25	-729.00	2024-12-28 20:46:25.101077	1.xlsx	2024-12-30	2025-01-03
\.


--
-- Data for Name: objectives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.objectives (id, objectives, weight) FROM stdin;
1	Preferred Slots Reward	100.00
2	Shared Equipment Penalty	100.00
3	Extra Equipment Quantity Reward	100.00
4	Same OT Reward	100.00
5	Consecutive Days Reward	100.00
6	Same Weekly Slot Reward	100.00
8	Exceed Parallel Slot Penalty	100.00
9	Exceed Parallel Heavy Slot Penalty	100.00
10	Reserve Ultra Clean OT Reward	100.00
7	Clashing Subspecialties Penalty	10.00
\.


--
-- Data for Name: ot; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ot (id, name, ot_type_id, status_id) FROM stdin;
1	1	1	1
2	2	1	1
3	3	1	1
4	4	1	1
5	5	1	1
9	9	1	1
10	10	1	1
11	11	1	1
12	12	3	1
13	13	3	1
6	6	2	1
7	7	2	1
8	8	2	1
\.


--
-- Data for Name: ot_assignment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ot_assignment (id, mssp_id, mrn, week_id, ot_id, unit_id, day_id, is_require_anaes, opening_time, closing_time) FROM stdin;
1	1	N699447	1	4	11	1	t	09:00:00	16:00:00
2	1	N779285	1	13	11	1	f	09:00:00	16:00:00
3	1	N413780	1	9	11	1	t	09:00:00	16:00:00
4	1	N867837	1	4	11	2	f	09:00:00	16:00:00
5	1	M150902	1	13	11	2	f	09:00:00	16:00:00
6	1	M846636	1	6	27	1	t	09:00:00	16:00:00
7	1	N648171	1	1	26	2	t	09:00:00	16:00:00
8	1	M887682	1	9	11	2	f	09:00:00	16:00:00
9	1	N811125	1	4	11	3	t	09:00:00	16:00:00
10	1	N269647	1	13	11	3	f	09:00:00	16:00:00
11	1	M914338	1	9	11	3	f	09:00:00	16:00:00
12	1	N037365	1	4	11	4	f	09:00:00	16:00:00
13	1	N722489	1	2	26	2	t	09:00:00	16:00:00
14	1	N722489	1	3	26	2	t	09:00:00	16:00:00
15	1	N796205	1	1	26	3	t	09:00:00	16:00:00
16	1	N884188	1	13	11	4	t	09:00:00	16:00:00
17	1	N258402	1	6	4	2	t	09:00:00	16:00:00
18	1	N573081	1	7	4	2	t	09:00:00	16:00:00
19	1	N793985	1	8	4	2	t	09:00:00	16:00:00
20	1	N874502	1	1	22	1	t	09:00:00	16:00:00
21	1	N291140	1	2	1	1	t	09:00:00	16:00:00
22	1	N883745	1	3	1	1	t	09:00:00	16:00:00
23	1	N728042	1	5	5	1	t	09:00:00	16:00:00
24	1	N775239	1	9	11	4	f	09:00:00	16:00:00
25	1	N832037	1	10	22	1	t	09:00:00	16:00:00
26	1	N634885	1	11	22	1	t	09:00:00	16:00:00
27	1	M658549	1	7	27	1	t	09:00:00	16:00:00
28	1	M985227	1	2	26	3	f	09:00:00	16:00:00
29	1	N877459	1	3	26	3	t	09:00:00	16:00:00
30	1	N877481	1	1	26	4	t	09:00:00	16:00:00
31	1	M817304	1	4	11	5	f	09:00:00	16:00:00
32	1	N290987	1	8	10	1	t	09:00:00	16:00:00
33	1	N881851	1	13	11	5	f	09:00:00	16:00:00
34	1	M492764	1	9	11	5	f	09:00:00	16:00:00
35	1	M842099	2	4	11	1	f	09:00:00	16:00:00
36	1	N200016	2	13	11	1	f	09:00:00	16:00:00
37	1	N510481	2	9	11	1	f	09:00:00	16:00:00
38	1	N807717	1	5	9	2	t	09:00:00	16:00:00
39	1	N382012	2	4	11	2	f	09:00:00	16:00:00
40	1	M287458	2	13	11	2	f	09:00:00	16:00:00
41	1	N150907	1	12	2	1	t	09:00:00	16:00:00
42	1	N714604	1	12	2	2	t	09:00:00	16:00:00
43	1	N848334	1	12	2	3	t	09:00:00	16:00:00
44	1	N862643	1	6	10	3	t	09:00:00	16:00:00
45	1	N880194	1	2	26	4	t	09:00:00	16:00:00
46	1	N880194	1	3	26	4	t	09:00:00	16:00:00
47	1	N884435	1	12	1	4	t	09:00:00	16:00:00
48	1	M879656	1	1	26	5	f	09:00:00	16:00:00
49	1	M857647	2	9	11	2	f	09:00:00	16:00:00
50	1	N739054	2	4	11	3	f	09:00:00	16:00:00
51	1	N876334	2	13	11	3	f	09:00:00	16:00:00
52	1	N879380	2	9	11	3	f	09:00:00	16:00:00
53	1	M652820	2	4	11	4	t	09:00:00	16:00:00
54	1	N880127	1	2	26	5	t	09:00:00	16:00:00
55	1	N205560	1	3	26	5	t	09:00:00	16:00:00
56	1	N877791	2	1	26	2	t	09:00:00	16:00:00
57	1	N823060	2	2	26	2	t	09:00:00	16:00:00
58	1	N808351	2	3	26	2	f	09:00:00	16:00:00
59	1	N851545	2	13	11	4	t	09:00:00	16:00:00
60	1	N851545	2	9	11	4	t	09:00:00	16:00:00
61	1	N670108	2	1	26	3	f	09:00:00	16:00:00
62	1	N877575	2	4	11	5	f	09:00:00	16:00:00
63	1	N866935	2	13	11	5	f	09:00:00	16:00:00
64	1	N866950	2	2	26	3	t	09:00:00	16:00:00
65	1	N866950	2	3	26	3	t	09:00:00	16:00:00
66	1	M163501	2	9	11	5	f	09:00:00	16:00:00
67	1	M505988	1	10	5	2	t	09:00:00	16:00:00
68	1	M622138	3	4	11	1	f	09:00:00	16:00:00
69	1	M981012	1	11	30	2	f	09:00:00	16:00:00
70	1	N064734	3	13	11	1	f	09:00:00	16:00:00
71	1	N847680	2	1	26	4	t	09:00:00	16:00:00
72	1	N701489	2	2	26	4	t	09:00:00	16:00:00
73	1	M791216	3	9	11	1	f	09:00:00	16:00:00
74	1	N784698	1	7	14	3	f	09:00:00	16:00:00
75	1	N250270	3	4	11	2	f	09:00:00	16:00:00
76	1	N178442	1	8	10	3	t	09:00:00	16:00:00
77	1	N182136	1	6	10	4	t	09:00:00	16:00:00
78	1	N810557	1	7	10	4	f	09:00:00	16:00:00
79	1	N825256	1	8	10	4	f	09:00:00	16:00:00
80	1	N883077	1	6	10	5	f	09:00:00	16:00:00
81	1	M739182	3	13	11	2	f	09:00:00	16:00:00
82	1	N226629	1	5	30	3	f	09:00:00	16:00:00
83	1	N873073	1	10	30	3	f	09:00:00	16:00:00
84	1	N880615	1	11	7	3	t	09:00:00	16:00:00
85	1	N660135	1	7	10	5	f	09:00:00	16:00:00
86	1	N881851	3	9	11	2	f	09:00:00	16:00:00
87	1	N884168	2	3	26	4	t	09:00:00	16:00:00
88	1	N827134	2	1	26	5	t	09:00:00	16:00:00
89	1	M702861	2	2	26	5	f	09:00:00	16:00:00
90	1	N877131	2	3	26	5	t	09:00:00	16:00:00
91	1	N858313	3	4	11	3	f	09:00:00	16:00:00
92	1	N856487	3	1	26	2	t	09:00:00	16:00:00
93	1	M689951	3	13	11	3	f	09:00:00	16:00:00
94	1	M166416	3	9	11	3	f	09:00:00	16:00:00
95	1	N531732	3	4	11	4	f	09:00:00	16:00:00
96	1	N879935	1	5	7	4	f	09:00:00	16:00:00
97	1	N267396	1	10	7	4	f	09:00:00	16:00:00
98	1	M881026	1	11	13	4	t	09:00:00	16:00:00
99	1	N421262	1	5	7	5	f	09:00:00	16:00:00
100	1	N873182	1	10	13	5	t	09:00:00	16:00:00
101	1	N234485	1	11	30	5	t	09:00:00	16:00:00
102	1	N241308	3	13	11	4	f	09:00:00	16:00:00
103	1	N835995	3	9	11	4	f	09:00:00	16:00:00
104	1	N373477	3	4	11	5	f	09:00:00	16:00:00
105	1	N630977	1	8	8	5	t	09:00:00	16:00:00
106	1	N880112	3	13	11	5	f	09:00:00	16:00:00
107	1	M953552	2	1	5	1	t	09:00:00	16:00:00
108	1	N255870	2	2	17	1	t	09:00:00	16:00:00
109	1	N813205	3	2	26	2	t	09:00:00	16:00:00
110	1	N813205	3	3	26	2	t	09:00:00	16:00:00
111	1	N862695	3	1	26	3	t	09:00:00	16:00:00
112	1	N862695	3	2	26	3	t	09:00:00	16:00:00
113	1	N862695	3	3	26	3	t	09:00:00	16:00:00
114	1	N883972	3	1	26	4	t	09:00:00	16:00:00
115	1	N883972	3	2	26	4	t	09:00:00	16:00:00
116	1	N788863	3	3	26	4	f	09:00:00	16:00:00
117	1	M600815	3	9	11	5	f	09:00:00	16:00:00
118	1	M747909	4	4	11	1	f	09:00:00	16:00:00
119	1	N134571	4	13	11	1	f	09:00:00	16:00:00
120	1	N763388	4	9	11	1	f	09:00:00	16:00:00
121	1	N800909	4	4	11	2	f	09:00:00	16:00:00
122	1	N871972	4	13	11	2	f	09:00:00	16:00:00
123	1	N856400	3	1	26	5	t	09:00:00	16:00:00
124	1	N884188	4	9	11	2	t	09:00:00	16:00:00
125	1	N732036	1	12	1	5	t	09:00:00	16:00:00
126	1	N834902	2	6	27	1	t	09:00:00	16:00:00
127	1	M735200	4	4	11	3	f	09:00:00	16:00:00
128	1	M834107	2	3	22	1	t	09:00:00	16:00:00
129	1	M486672	2	6	4	2	t	09:00:00	16:00:00
130	1	N572721	4	13	11	3	f	09:00:00	16:00:00
131	1	N877224	2	7	4	2	t	09:00:00	16:00:00
132	1	N877224	2	8	4	2	t	09:00:00	16:00:00
133	1	N243415	2	12	1	1	t	09:00:00	16:00:00
134	1	N881798	2	5	5	1	t	09:00:00	16:00:00
135	1	N881840	2	10	22	1	t	09:00:00	16:00:00
136	1	N218629	2	6	4	3	t	09:00:00	16:00:00
137	1	N052038	3	2	26	5	t	09:00:00	16:00:00
138	1	N660579	2	7	14	1	f	09:00:00	16:00:00
139	1	M155991	3	3	26	5	t	09:00:00	16:00:00
140	1	N878927	4	1	26	2	t	09:00:00	16:00:00
141	1	N878927	4	2	26	2	t	09:00:00	16:00:00
142	1	N821769	4	9	11	3	f	09:00:00	16:00:00
143	1	M524904	2	12	2	2	t	09:00:00	16:00:00
144	1	N568947	4	4	11	4	f	09:00:00	16:00:00
145	1	M113495	4	13	11	4	f	09:00:00	16:00:00
146	1	N856170	2	12	2	3	t	09:00:00	16:00:00
147	1	N193494	2	11	7	1	t	09:00:00	16:00:00
148	1	N193494	2	5	7	2	t	09:00:00	16:00:00
149	1	N754982	4	9	11	4	f	09:00:00	16:00:00
150	1	N861072	2	10	7	2	t	09:00:00	16:00:00
151	1	N861072	2	11	7	2	t	09:00:00	16:00:00
152	1	N870458	4	4	11	5	f	09:00:00	16:00:00
153	1	N880279	2	5	7	3	t	09:00:00	16:00:00
154	1	N880279	2	10	7	3	t	09:00:00	16:00:00
155	1	N883187	4	3	26	2	t	09:00:00	16:00:00
156	1	M854820	2	11	9	3	t	09:00:00	16:00:00
157	1	N827430	2	5	9	4	t	09:00:00	16:00:00
158	1	N862691	2	12	1	4	t	09:00:00	16:00:00
159	1	N872735	2	10	9	4	t	09:00:00	16:00:00
160	1	N883143	4	1	26	3	f	09:00:00	16:00:00
161	1	N413186	2	12	1	5	t	09:00:00	16:00:00
162	1	N750477	4	2	26	3	t	09:00:00	16:00:00
163	1	N750477	4	3	26	3	t	09:00:00	16:00:00
164	1	M007162	4	13	11	5	f	09:00:00	16:00:00
165	1	N879403	4	9	11	5	f	09:00:00	16:00:00
166	1	N876476	4	1	26	4	t	09:00:00	16:00:00
167	1	M695973	5	4	11	1	f	09:00:00	16:00:00
168	1	N846518	4	2	26	4	t	09:00:00	16:00:00
169	1	N752719	5	13	11	1	t	09:00:00	16:00:00
170	1	N780069	5	9	11	1	f	09:00:00	16:00:00
171	1	M612813	5	4	11	2	f	09:00:00	16:00:00
172	1	M056731	5	13	11	2	f	09:00:00	16:00:00
173	1	N872513	2	11	30	4	f	09:00:00	16:00:00
174	1	M331518	4	3	26	4	f	09:00:00	16:00:00
175	1	M331518	4	1	26	5	f	09:00:00	16:00:00
176	1	N619115	2	8	6	1	t	09:00:00	16:00:00
177	1	N813210	2	5	5	5	t	09:00:00	16:00:00
178	1	M252353	2	7	14	3	f	09:00:00	16:00:00
179	1	N881990	4	2	26	5	t	09:00:00	16:00:00
180	1	N882948	4	3	26	5	t	09:00:00	16:00:00
181	1	N306946	2	8	14	3	f	09:00:00	16:00:00
182	1	N883544	5	1	26	2	t	09:00:00	16:00:00
183	1	M659312	2	10	13	5	t	09:00:00	16:00:00
184	1	M659312	2	11	13	5	t	09:00:00	16:00:00
185	1	M659312	3	1	13	1	t	09:00:00	16:00:00
186	1	N814703	2	6	10	4	t	09:00:00	16:00:00
187	1	N557221	5	9	11	2	f	09:00:00	16:00:00
188	1	M699512	5	4	11	3	f	09:00:00	16:00:00
189	1	N850534	3	2	30	1	f	09:00:00	16:00:00
190	1	M234285	3	3	30	1	f	09:00:00	16:00:00
191	1	N314435	2	7	23	4	t	09:00:00	16:00:00
192	1	N866701	2	8	23	4	t	09:00:00	16:00:00
193	1	N596532	5	2	26	2	t	09:00:00	16:00:00
194	1	N885471	5	3	26	2	t	09:00:00	16:00:00
195	1	M000599	5	1	26	3	t	09:00:00	16:00:00
196	1	N688994	5	2	26	3	t	09:00:00	16:00:00
197	1	M634787	5	13	11	3	f	09:00:00	16:00:00
198	1	N857438	5	9	11	3	f	09:00:00	16:00:00
199	1	N065507	5	4	11	4	f	09:00:00	16:00:00
200	1	M709387	5	13	11	4	f	09:00:00	16:00:00
201	1	M770373	5	9	11	4	f	09:00:00	16:00:00
202	1	N290391	5	3	26	3	t	09:00:00	16:00:00
203	1	N290391	5	1	26	4	t	09:00:00	16:00:00
204	1	N785462	5	4	11	5	f	09:00:00	16:00:00
205	1	N712721	5	2	26	4	t	09:00:00	16:00:00
206	1	M292017	3	5	7	1	f	09:00:00	16:00:00
207	1	N884947	5	3	26	4	t	09:00:00	16:00:00
208	1	M875419	5	13	11	5	f	09:00:00	16:00:00
209	1	N762654	5	9	11	5	f	09:00:00	16:00:00
210	1	M601655	6	4	11	1	f	09:00:00	16:00:00
211	1	M728606	5	1	26	5	t	09:00:00	16:00:00
212	1	N883090	3	10	30	1	t	09:00:00	16:00:00
213	1	N622209	3	11	13	1	t	09:00:00	16:00:00
214	1	N644789	3	5	5	2	t	09:00:00	16:00:00
215	1	N644789	3	10	5	2	t	09:00:00	16:00:00
216	1	N879008	2	6	8	5	t	09:00:00	16:00:00
217	1	N884830	5	2	26	5	f	09:00:00	16:00:00
218	1	N884830	5	3	26	5	f	09:00:00	16:00:00
219	1	N884830	6	1	26	2	f	09:00:00	16:00:00
220	1	N564708	6	13	11	1	t	09:00:00	16:00:00
221	1	N254557	6	9	11	1	f	09:00:00	16:00:00
222	1	N829090	6	4	11	2	t	09:00:00	16:00:00
223	1	N069943	6	13	11	2	f	09:00:00	16:00:00
224	1	M637071	6	9	11	2	f	09:00:00	16:00:00
225	1	N659828	2	7	27	5	t	09:00:00	16:00:00
226	1	M774308	6	2	26	2	t	09:00:00	16:00:00
227	1	N881244	6	3	26	2	t	09:00:00	16:00:00
228	1	N866906	6	4	11	3	f	09:00:00	16:00:00
229	1	M727969	6	13	11	3	f	09:00:00	16:00:00
230	1	N883625	6	1	26	3	t	09:00:00	16:00:00
231	1	N880111	6	2	26	3	t	09:00:00	16:00:00
232	1	M924372	6	9	11	3	f	09:00:00	16:00:00
233	1	N871434	3	12	1	1	t	09:00:00	16:00:00
234	1	N616983	6	4	11	4	f	09:00:00	16:00:00
235	1	M264227	2	8	4	5	t	09:00:00	16:00:00
236	1	N278468	6	13	11	4	f	09:00:00	16:00:00
237	1	N818241	3	6	4	2	t	09:00:00	16:00:00
238	1	N523373	3	12	1	2	t	09:00:00	16:00:00
239	1	N873369	3	6	27	1	t	09:00:00	16:00:00
240	1	N878774	3	11	22	2	t	09:00:00	16:00:00
241	1	N676874	6	3	26	3	f	09:00:00	16:00:00
242	1	N688691	3	12	1	3	t	09:00:00	16:00:00
243	1	N795404	3	5	22	3	t	09:00:00	16:00:00
244	1	M953645	6	9	11	4	f	09:00:00	16:00:00
245	1	N216204	6	1	26	4	t	09:00:00	16:00:00
246	1	N792875	6	2	26	4	t	09:00:00	16:00:00
247	1	N883344	6	3	26	4	t	09:00:00	16:00:00
248	1	N883344	6	1	26	5	t	09:00:00	16:00:00
249	1	N768939	3	10	9	3	t	09:00:00	16:00:00
250	1	M876708	6	4	11	5	f	09:00:00	16:00:00
251	1	M762254	6	13	11	5	f	09:00:00	16:00:00
252	1	N231075	6	9	11	5	f	09:00:00	16:00:00
253	1	N024665	7	4	11	1	f	09:00:00	16:00:00
254	1	N655700	7	13	11	1	f	09:00:00	16:00:00
255	1	N730002	3	12	1	4	t	09:00:00	16:00:00
256	1	N730002	3	12	1	5	t	09:00:00	16:00:00
257	1	N206077	4	2	2	1	t	09:00:00	16:00:00
258	1	N316939	4	1	2	1	t	09:00:00	16:00:00
259	1	N885935	6	2	26	5	t	09:00:00	16:00:00
260	1	M003393	7	9	11	1	f	09:00:00	16:00:00
261	1	M233201	7	4	11	2	t	09:00:00	16:00:00
262	1	N777920	7	13	11	2	f	09:00:00	16:00:00
263	1	N201375	7	9	11	2	f	09:00:00	16:00:00
264	1	N735795	6	3	26	5	t	09:00:00	16:00:00
265	1	N880684	7	1	26	2	t	09:00:00	16:00:00
266	1	M813749	7	4	11	3	f	09:00:00	16:00:00
267	1	N836454	7	2	26	2	t	09:00:00	16:00:00
268	1	N883656	7	3	26	2	t	09:00:00	16:00:00
269	1	M944774	7	13	11	3	f	09:00:00	16:00:00
270	1	N885469	7	9	11	3	f	09:00:00	16:00:00
271	1	N883747	7	1	26	3	t	09:00:00	16:00:00
272	1	N863998	7	4	11	4	f	09:00:00	16:00:00
273	1	N883100	7	13	11	4	f	09:00:00	16:00:00
274	1	M902990	7	2	26	3	f	09:00:00	16:00:00
275	1	N877557	7	3	26	3	t	09:00:00	16:00:00
276	1	N885725	7	1	26	4	t	09:00:00	16:00:00
277	1	N882105	7	2	26	4	t	09:00:00	16:00:00
278	1	N795726	7	3	26	4	t	09:00:00	16:00:00
279	1	N835551	3	11	7	3	t	09:00:00	16:00:00
280	1	N659259	3	7	10	1	t	09:00:00	16:00:00
281	1	N145297	7	9	11	4	f	09:00:00	16:00:00
282	1	N855738	7	1	26	5	t	09:00:00	16:00:00
283	1	M619496	3	5	30	4	f	09:00:00	16:00:00
284	1	N882083	7	4	11	5	f	09:00:00	16:00:00
285	1	M807153	3	8	23	1	t	09:00:00	16:00:00
286	1	N805009	3	7	10	2	f	09:00:00	16:00:00
287	1	N857414	7	2	26	5	t	09:00:00	16:00:00
288	1	N868168	7	3	26	5	t	09:00:00	16:00:00
289	1	M689985	7	13	11	5	f	09:00:00	16:00:00
290	1	N734524	8	1	26	2	t	09:00:00	16:00:00
291	1	M730124	7	9	11	5	f	09:00:00	16:00:00
292	1	N233087	8	4	11	1	f	09:00:00	16:00:00
293	1	M477336	8	13	11	1	f	09:00:00	16:00:00
294	1	N819034	4	12	2	1	t	09:00:00	16:00:00
295	1	N873030	4	12	2	2	t	09:00:00	16:00:00
296	1	M109871	8	9	11	1	f	09:00:00	16:00:00
297	1	M645975	8	4	11	2	f	09:00:00	16:00:00
298	1	N789901	8	13	11	2	f	09:00:00	16:00:00
299	1	M119141	4	3	1	1	t	09:00:00	16:00:00
300	1	N342133	3	10	9	4	t	09:00:00	16:00:00
301	1	N751927	3	11	7	4	t	09:00:00	16:00:00
302	1	N880545	3	5	9	5	t	09:00:00	16:00:00
303	1	N885824	4	12	1	3	t	09:00:00	16:00:00
304	1	M992360	8	2	26	2	t	09:00:00	16:00:00
305	1	M009668	8	9	11	2	f	09:00:00	16:00:00
306	1	N716712	8	4	11	3	f	09:00:00	16:00:00
307	1	N868303	8	13	11	3	t	09:00:00	16:00:00
308	1	N881761	8	9	11	3	f	09:00:00	16:00:00
309	1	N548339	8	4	11	4	f	09:00:00	16:00:00
310	1	N861299	8	3	26	2	t	09:00:00	16:00:00
311	1	N861299	8	1	26	3	t	09:00:00	16:00:00
312	1	N849814	8	2	26	3	f	09:00:00	16:00:00
313	1	N826901	8	3	26	3	t	09:00:00	16:00:00
314	1	N171556	3	8	6	2	t	09:00:00	16:00:00
315	1	N882410	8	13	11	4	t	09:00:00	16:00:00
316	1	N882410	8	9	11	4	t	09:00:00	16:00:00
317	1	N551272	8	1	26	4	t	09:00:00	16:00:00
318	1	N883188	8	4	11	5	f	09:00:00	16:00:00
319	1	M672299	3	6	6	3	t	09:00:00	16:00:00
320	1	N119690	8	13	11	5	f	09:00:00	16:00:00
321	1	N776130	8	9	11	5	f	09:00:00	16:00:00
322	1	M765722	3	10	30	5	f	09:00:00	16:00:00
323	1	N885955	3	11	5	5	t	09:00:00	16:00:00
324	1	N884786	8	2	26	4	t	09:00:00	16:00:00
325	1	N884786	8	3	26	4	t	09:00:00	16:00:00
326	1	N839477	9	4	11	1	t	09:00:00	16:00:00
327	1	N827718	8	1	26	5	t	09:00:00	16:00:00
328	1	N827718	8	2	26	5	t	09:00:00	16:00:00
329	1	N827718	8	3	26	5	t	09:00:00	16:00:00
330	1	N827718	9	1	26	2	t	09:00:00	16:00:00
331	1	N827718	9	2	26	2	t	09:00:00	16:00:00
332	1	N876459	3	7	10	3	t	09:00:00	16:00:00
333	1	M624524	9	13	11	1	f	09:00:00	16:00:00
334	1	N794172	9	3	26	2	f	09:00:00	16:00:00
335	1	N844693	9	9	11	1	f	09:00:00	16:00:00
336	1	N849740	3	8	14	3	f	09:00:00	16:00:00
337	1	N849740	3	6	14	4	f	09:00:00	16:00:00
338	1	N885561	9	1	26	3	t	09:00:00	16:00:00
339	1	M802427	4	5	7	1	t	09:00:00	16:00:00
340	1	M013482	9	2	26	3	f	09:00:00	16:00:00
341	1	N199135	4	10	9	1	t	09:00:00	16:00:00
342	1	N381559	4	11	9	1	t	09:00:00	16:00:00
343	1	M621604	4	5	13	2	t	09:00:00	16:00:00
344	1	N517949	4	10	30	2	f	09:00:00	16:00:00
345	1	N383847	4	11	30	2	f	09:00:00	16:00:00
346	1	N378118	4	5	7	3	t	09:00:00	16:00:00
347	1	N820811	4	10	30	3	f	09:00:00	16:00:00
348	1	N793019	3	7	23	4	t	09:00:00	16:00:00
349	1	N850903	9	3	26	3	t	09:00:00	16:00:00
350	1	N886660	3	8	10	4	t	09:00:00	16:00:00
351	1	M139357	9	4	11	2	f	09:00:00	16:00:00
352	1	M751403	9	13	11	2	f	09:00:00	16:00:00
353	1	M758124	9	9	11	2	f	09:00:00	16:00:00
354	1	N883627	9	1	26	4	t	09:00:00	16:00:00
355	1	N882570	9	2	26	4	t	09:00:00	16:00:00
356	1	M752515	4	11	13	3	f	09:00:00	16:00:00
357	1	N782733	9	4	11	3	f	09:00:00	16:00:00
358	1	N873245	9	13	11	3	f	09:00:00	16:00:00
359	1	N886135	9	9	11	3	f	09:00:00	16:00:00
360	1	N886135	9	4	11	4	f	09:00:00	16:00:00
361	1	N181414	3	6	8	5	t	09:00:00	16:00:00
362	1	N788305	4	5	17	4	t	09:00:00	16:00:00
363	1	N788305	4	10	17	4	t	09:00:00	16:00:00
364	1	N857542	4	11	17	4	t	09:00:00	16:00:00
365	1	M872571	4	5	13	5	f	09:00:00	16:00:00
366	1	N874332	4	10	30	5	t	09:00:00	16:00:00
367	1	N632395	3	7	8	5	t	09:00:00	16:00:00
368	1	N188742	9	3	26	4	f	09:00:00	16:00:00
369	1	N886564	9	1	26	5	f	09:00:00	16:00:00
370	1	N000113	9	13	11	4	f	09:00:00	16:00:00
371	1	M052971	9	9	11	4	f	09:00:00	16:00:00
372	1	M926909	9	4	11	5	f	09:00:00	16:00:00
373	1	N081554	9	13	11	5	f	09:00:00	16:00:00
374	1	N782887	9	9	11	5	f	09:00:00	16:00:00
375	1	N647833	9	2	26	5	t	09:00:00	16:00:00
376	1	N812571	9	3	26	5	f	09:00:00	16:00:00
377	1	M655270	10	4	11	1	f	09:00:00	16:00:00
378	1	N874035	4	12	1	4	t	09:00:00	16:00:00
379	1	N881331	4	12	1	5	t	09:00:00	16:00:00
380	1	N881331	5	2	1	1	t	09:00:00	16:00:00
381	1	N843798	10	13	11	1	f	09:00:00	16:00:00
382	1	M112343	10	9	11	1	f	09:00:00	16:00:00
383	1	N611615	10	4	11	2	f	09:00:00	16:00:00
384	1	N876883	10	13	11	2	f	09:00:00	16:00:00
385	1	N175343	10	1	26	2	t	09:00:00	16:00:00
386	1	M895617	10	9	11	2	t	09:00:00	16:00:00
387	1	N379931	10	4	11	3	t	09:00:00	16:00:00
388	1	N251736	3	8	27	5	f	09:00:00	16:00:00
389	1	N874589	10	13	11	3	f	09:00:00	16:00:00
390	1	N761695	4	11	22	5	t	09:00:00	16:00:00
391	1	N886331	10	2	26	2	t	09:00:00	16:00:00
392	1	N227018	5	3	1	1	t	09:00:00	16:00:00
393	1	N539901	4	6	14	1	f	09:00:00	16:00:00
394	1	N648871	4	7	14	1	f	09:00:00	16:00:00
395	1	N885677	4	8	14	1	f	09:00:00	16:00:00
396	1	N830313	4	6	27	2	t	09:00:00	16:00:00
397	1	N829137	5	1	5	1	t	09:00:00	16:00:00
398	1	N885678	10	3	26	2	f	09:00:00	16:00:00
399	1	M969242	10	9	11	3	f	09:00:00	16:00:00
400	1	M337700	10	4	11	4	f	09:00:00	16:00:00
401	1	N728356	10	13	11	4	f	09:00:00	16:00:00
402	1	N182614	10	9	11	4	f	09:00:00	16:00:00
403	1	N881212	10	1	26	3	t	09:00:00	16:00:00
404	1	M913225	10	4	11	5	f	09:00:00	16:00:00
405	1	N400856	10	13	11	5	f	09:00:00	16:00:00
406	1	M909848	4	7	6	2	t	09:00:00	16:00:00
407	1	M909848	4	8	6	2	t	09:00:00	16:00:00
408	1	N117344	5	5	30	1	f	09:00:00	16:00:00
409	1	N885504	10	2	26	3	t	09:00:00	16:00:00
410	1	N780373	10	9	11	5	f	09:00:00	16:00:00
411	1	N739651	10	3	26	3	t	09:00:00	16:00:00
412	1	N394779	11	4	11	1	f	09:00:00	16:00:00
413	1	M685886	11	13	11	1	f	09:00:00	16:00:00
414	1	N231663	11	9	11	1	f	09:00:00	16:00:00
415	1	N866890	11	4	11	2	f	09:00:00	16:00:00
416	1	N886561	5	10	30	1	f	09:00:00	16:00:00
417	1	N883386	10	1	26	4	t	09:00:00	16:00:00
418	1	N340763	11	13	11	2	f	09:00:00	16:00:00
419	1	N863535	10	2	26	4	t	09:00:00	16:00:00
420	1	N558938	10	3	26	4	t	09:00:00	16:00:00
421	1	M512650	10	1	26	5	t	09:00:00	16:00:00
422	1	N878206	4	6	10	3	t	09:00:00	16:00:00
423	1	N886833	5	11	7	1	t	09:00:00	16:00:00
424	1	M449736	5	5	30	2	f	09:00:00	16:00:00
425	1	N118633	5	10	7	2	t	09:00:00	16:00:00
426	1	N317198	5	11	30	2	f	09:00:00	16:00:00
427	1	M477770	4	7	23	3	t	09:00:00	16:00:00
428	1	N203678	5	5	13	3	f	09:00:00	16:00:00
429	1	N886459	10	2	26	5	f	09:00:00	16:00:00
430	1	N887024	10	3	26	5	t	09:00:00	16:00:00
431	1	M672299	4	8	10	3	f	09:00:00	16:00:00
432	1	M879879	11	1	26	2	t	09:00:00	16:00:00
433	1	M889737	5	10	13	3	t	09:00:00	16:00:00
434	1	N686330	11	2	26	2	t	09:00:00	16:00:00
435	1	N686330	11	3	26	2	t	09:00:00	16:00:00
436	1	N690686	5	11	30	3	f	09:00:00	16:00:00
437	1	N885988	11	1	26	3	t	09:00:00	16:00:00
438	1	N885988	11	2	26	3	t	09:00:00	16:00:00
439	1	N887037	4	6	14	4	f	09:00:00	16:00:00
440	1	N886564	11	3	26	3	t	09:00:00	16:00:00
441	1	N886564	11	1	26	4	t	09:00:00	16:00:00
442	1	M615889	11	9	11	2	f	09:00:00	16:00:00
443	1	M463881	11	4	11	3	f	09:00:00	16:00:00
444	1	N018967	11	13	11	3	f	09:00:00	16:00:00
445	1	N777814	11	9	11	3	t	09:00:00	16:00:00
446	1	N884188	11	4	11	4	t	09:00:00	16:00:00
447	1	N826891	11	13	11	4	f	09:00:00	16:00:00
448	1	N826891	11	9	11	4	f	09:00:00	16:00:00
449	1	N878210	11	2	26	4	t	09:00:00	16:00:00
450	1	N885532	11	3	26	4	t	09:00:00	16:00:00
451	1	M825434	11	4	11	5	f	09:00:00	16:00:00
452	1	N649889	5	5	22	4	t	09:00:00	16:00:00
453	1	N373168	4	7	4	4	t	09:00:00	16:00:00
454	1	N851693	4	8	4	4	t	09:00:00	16:00:00
455	1	N851693	4	6	4	5	t	09:00:00	16:00:00
456	1	N001791	4	7	27	5	f	09:00:00	16:00:00
457	1	N108791	11	13	11	5	f	09:00:00	16:00:00
458	1	N721660	11	1	26	5	t	09:00:00	16:00:00
459	1	M352158	11	9	11	5	f	09:00:00	16:00:00
460	1	M449966	12	4	11	1	f	09:00:00	16:00:00
461	1	N270211	5	10	9	4	t	09:00:00	16:00:00
462	1	N824728	5	11	22	4	t	09:00:00	16:00:00
463	1	N793587	4	8	14	5	f	09:00:00	16:00:00
464	1	N858892	12	13	11	1	f	09:00:00	16:00:00
465	1	N864316	5	5	9	5	t	09:00:00	16:00:00
466	1	M503446	5	10	9	5	t	09:00:00	16:00:00
467	1	N101608	5	11	5	5	t	09:00:00	16:00:00
468	1	N101608	6	1	5	1	t	09:00:00	16:00:00
469	1	N101608	6	2	5	1	t	09:00:00	16:00:00
470	1	M438459	12	9	11	1	f	09:00:00	16:00:00
471	1	N625110	12	4	11	2	f	09:00:00	16:00:00
472	1	N860989	11	2	26	5	t	09:00:00	16:00:00
473	1	M945692	11	3	26	5	f	09:00:00	16:00:00
474	1	N313267	12	13	11	2	f	09:00:00	16:00:00
475	1	N542473	12	9	11	2	f	09:00:00	16:00:00
476	1	N609786	12	1	26	2	f	09:00:00	16:00:00
477	1	N878173	12	4	11	3	f	09:00:00	16:00:00
478	1	N802139	12	2	26	2	t	09:00:00	16:00:00
479	1	M748017	12	3	26	2	f	09:00:00	16:00:00
480	1	M942864	12	13	11	3	f	09:00:00	16:00:00
481	1	M942864	12	9	11	3	f	09:00:00	16:00:00
482	1	M198710	5	12	2	1	t	09:00:00	16:00:00
483	1	M944441	5	12	2	2	t	09:00:00	16:00:00
484	1	N212286	6	3	3	1	t	09:00:00	16:00:00
485	1	N212286	6	5	3	1	t	09:00:00	16:00:00
486	1	N041210	5	6	10	1	t	09:00:00	16:00:00
487	1	M372600	5	12	1	3	t	09:00:00	16:00:00
488	1	M372600	5	12	1	4	t	09:00:00	16:00:00
489	1	N885679	12	4	11	4	f	09:00:00	16:00:00
490	1	M606708	12	13	11	4	f	09:00:00	16:00:00
491	1	N861916	12	1	26	3	f	09:00:00	16:00:00
492	1	N861916	12	2	26	3	f	09:00:00	16:00:00
493	1	N876022	12	3	26	3	t	09:00:00	16:00:00
494	1	N848828	12	1	26	4	f	09:00:00	16:00:00
495	1	N870448	12	9	11	4	f	09:00:00	16:00:00
496	1	M614625	12	4	11	5	f	09:00:00	16:00:00
497	1	M709820	12	2	26	4	f	09:00:00	16:00:00
498	1	N842753	12	13	11	5	f	09:00:00	16:00:00
499	1	N595604	12	9	11	5	f	09:00:00	16:00:00
500	1	N783872	5	7	6	1	t	09:00:00	16:00:00
501	1	N040287	13	4	11	1	f	09:00:00	16:00:00
502	1	N870728	13	13	11	1	f	09:00:00	16:00:00
503	1	N880001	12	3	26	4	t	09:00:00	16:00:00
504	1	N225098	13	9	11	1	f	09:00:00	16:00:00
505	1	N175280	6	10	30	1	f	09:00:00	16:00:00
506	1	N887321	12	1	26	5	t	09:00:00	16:00:00
507	1	N877954	12	2	26	5	t	09:00:00	16:00:00
508	1	N686838	12	3	26	5	f	09:00:00	16:00:00
509	1	N879907	13	1	26	2	t	09:00:00	16:00:00
510	1	N842507	13	4	11	2	f	09:00:00	16:00:00
511	1	N281905	5	8	10	1	t	09:00:00	16:00:00
512	1	M817866	6	11	7	1	t	09:00:00	16:00:00
513	1	N738406	13	13	11	2	f	09:00:00	16:00:00
514	1	N886115	6	5	9	2	t	09:00:00	16:00:00
515	1	M963081	6	10	9	2	t	09:00:00	16:00:00
516	1	N876781	6	11	9	2	t	09:00:00	16:00:00
517	1	N885276	6	5	13	3	t	09:00:00	16:00:00
518	1	N179344	6	10	30	3	f	09:00:00	16:00:00
519	1	N222276	5	6	23	2	t	09:00:00	16:00:00
520	1	N818968	6	11	30	3	f	09:00:00	16:00:00
521	1	N884636	5	7	10	2	t	09:00:00	16:00:00
522	1	N004653	13	9	11	2	f	09:00:00	16:00:00
523	1	N505778	13	2	26	2	t	09:00:00	16:00:00
524	1	N505778	13	3	26	2	t	09:00:00	16:00:00
525	1	N822130	6	5	13	4	t	09:00:00	16:00:00
526	1	N845948	13	4	11	3	f	09:00:00	16:00:00
527	1	M854225	13	13	11	3	f	09:00:00	16:00:00
528	1	M832717	13	9	11	3	f	09:00:00	16:00:00
529	1	M957747	13	4	11	4	f	09:00:00	16:00:00
530	1	N853182	13	13	11	4	f	09:00:00	16:00:00
531	1	M817569	13	9	11	4	f	09:00:00	16:00:00
532	1	N759967	13	4	11	5	f	09:00:00	16:00:00
533	1	M286949	13	13	11	5	f	09:00:00	16:00:00
534	1	N871438	13	1	26	3	t	09:00:00	16:00:00
535	1	N421657	13	2	26	3	t	09:00:00	16:00:00
536	1	N112629	13	9	11	5	f	09:00:00	16:00:00
537	1	N885673	13	3	26	3	t	09:00:00	16:00:00
538	1	N885673	13	1	26	4	t	09:00:00	16:00:00
539	1	N886815	13	2	26	4	t	09:00:00	16:00:00
540	1	N876183	6	10	5	4	t	09:00:00	16:00:00
541	1	N886339	6	11	5	4	t	09:00:00	16:00:00
542	1	N019198	14	4	11	1	f	09:00:00	16:00:00
543	1	N371434	14	13	11	1	f	09:00:00	16:00:00
544	1	N803999	14	9	11	1	f	09:00:00	16:00:00
545	1	N538946	14	4	11	2	f	09:00:00	16:00:00
546	1	N875860	13	3	26	4	t	09:00:00	16:00:00
547	1	M627740	14	13	11	2	f	09:00:00	16:00:00
548	1	N784674	14	9	11	2	f	09:00:00	16:00:00
549	1	N038285	13	1	26	5	t	09:00:00	16:00:00
550	1	N690722	14	4	11	3	f	09:00:00	16:00:00
551	1	N877142	14	13	11	3	f	09:00:00	16:00:00
552	1	N885345	14	9	11	3	f	09:00:00	16:00:00
553	1	N885481	13	2	26	5	t	09:00:00	16:00:00
554	1	N875064	14	4	11	4	f	09:00:00	16:00:00
555	1	N198176	13	3	26	5	t	09:00:00	16:00:00
556	1	N825171	14	13	11	4	f	09:00:00	16:00:00
557	1	M001545	14	9	11	4	f	09:00:00	16:00:00
558	1	N877571	14	4	11	5	f	09:00:00	16:00:00
559	1	N188737	5	8	14	2	f	09:00:00	16:00:00
560	1	N647236	5	6	14	3	f	09:00:00	16:00:00
561	1	M259684	5	7	14	3	f	09:00:00	16:00:00
562	1	N110034	14	1	26	2	t	09:00:00	16:00:00
563	1	N865292	14	2	26	2	t	09:00:00	16:00:00
564	1	N888040	14	3	26	2	t	09:00:00	16:00:00
565	1	N876420	14	1	26	3	t	09:00:00	16:00:00
566	1	M727065	14	13	11	5	f	09:00:00	16:00:00
567	1	M461703	14	9	11	5	f	09:00:00	16:00:00
568	1	N070662	15	4	11	1	f	09:00:00	16:00:00
569	1	M634156	15	13	11	1	f	09:00:00	16:00:00
570	1	M706829	15	9	11	1	f	09:00:00	16:00:00
571	1	M026662	15	4	11	2	f	09:00:00	16:00:00
572	1	M965049	15	13	11	2	f	09:00:00	16:00:00
573	1	N555456	14	2	26	3	f	09:00:00	16:00:00
574	1	N627045	14	3	26	3	f	09:00:00	16:00:00
575	1	N887430	14	1	26	4	t	09:00:00	16:00:00
576	1	N888233	14	2	26	4	t	09:00:00	16:00:00
577	1	N887056	14	3	26	4	t	09:00:00	16:00:00
578	1	N887056	14	1	26	5	t	09:00:00	16:00:00
579	1	M640876	15	9	11	2	f	09:00:00	16:00:00
580	1	N112673	15	4	11	3	f	09:00:00	16:00:00
581	1	N879345	15	13	11	3	f	09:00:00	16:00:00
582	1	M841490	15	9	11	3	f	09:00:00	16:00:00
583	1	N884937	14	2	26	5	t	09:00:00	16:00:00
584	1	N805029	15	4	11	4	f	09:00:00	16:00:00
585	1	N881258	14	3	26	5	t	09:00:00	16:00:00
586	1	N875655	15	1	26	2	t	09:00:00	16:00:00
587	1	N886017	15	13	11	4	f	09:00:00	16:00:00
588	1	N847982	15	9	11	4	f	09:00:00	16:00:00
589	1	M944774	15	4	11	5	f	09:00:00	16:00:00
590	1	N858315	15	13	11	5	f	09:00:00	16:00:00
591	1	N882404	15	9	11	5	f	09:00:00	16:00:00
592	1	M974075	6	5	5	5	t	09:00:00	16:00:00
593	1	N876872	15	2	26	2	t	09:00:00	16:00:00
594	1	N870447	15	3	26	2	t	09:00:00	16:00:00
595	1	N870447	15	1	26	3	t	09:00:00	16:00:00
596	1	N886564	15	2	26	3	t	09:00:00	16:00:00
597	1	N886564	15	3	26	3	t	09:00:00	16:00:00
598	1	N886564	15	1	26	4	t	09:00:00	16:00:00
599	1	N403122	15	2	26	4	f	09:00:00	16:00:00
600	1	N883525	5	8	14	3	f	09:00:00	16:00:00
601	1	M864901	15	3	26	4	f	09:00:00	16:00:00
602	1	N305418	15	1	26	5	t	09:00:00	16:00:00
603	1	N723229	15	2	26	5	f	09:00:00	16:00:00
604	1	N885864	15	3	26	5	t	09:00:00	16:00:00
605	1	N886063	6	10	5	5	t	09:00:00	16:00:00
606	1	M284278	6	11	5	5	t	09:00:00	16:00:00
607	1	M905090	7	1	5	1	t	09:00:00	16:00:00
608	1	N404547	7	2	13	1	t	09:00:00	16:00:00
609	1	N381559	7	3	9	1	t	09:00:00	16:00:00
610	1	N880545	7	5	9	1	t	09:00:00	16:00:00
611	1	N847732	5	6	23	4	t	09:00:00	16:00:00
612	1	N888360	5	7	23	4	t	09:00:00	16:00:00
613	1	M295852	7	10	30	1	f	09:00:00	16:00:00
614	1	M727969	7	11	30	1	f	09:00:00	16:00:00
615	1	N174787	7	5	30	2	f	09:00:00	16:00:00
616	1	N218034	7	10	30	2	f	09:00:00	16:00:00
617	1	N695778	7	11	30	2	f	09:00:00	16:00:00
618	1	N883963	7	5	30	3	f	09:00:00	16:00:00
619	1	N884246	7	10	13	3	t	09:00:00	16:00:00
620	1	N888550	7	11	9	3	t	09:00:00	16:00:00
621	1	N838724	5	8	8	4	t	09:00:00	16:00:00
622	1	N850715	7	5	13	4	t	09:00:00	16:00:00
623	1	N885391	7	10	13	4	t	09:00:00	16:00:00
624	1	N852835	7	11	30	4	t	09:00:00	16:00:00
625	1	M169330	5	6	8	5	t	09:00:00	16:00:00
626	1	M169330	5	7	8	5	t	09:00:00	16:00:00
627	1	N879494	7	5	30	5	t	09:00:00	16:00:00
628	1	N856127	7	10	30	5	t	09:00:00	16:00:00
629	1	N887725	7	11	30	5	t	09:00:00	16:00:00
630	1	N888755	8	1	17	1	t	09:00:00	16:00:00
631	1	N561008	8	2	30	1	t	09:00:00	16:00:00
632	1	N883367	5	8	4	5	t	09:00:00	16:00:00
633	1	N655828	6	6	4	2	t	09:00:00	16:00:00
634	1	N824908	6	7	4	2	t	09:00:00	16:00:00
635	1	N824908	6	8	4	2	t	09:00:00	16:00:00
636	1	N824908	6	6	4	3	t	09:00:00	16:00:00
637	1	N849886	8	3	22	1	t	09:00:00	16:00:00
638	1	N802398	6	6	27	1	t	09:00:00	16:00:00
639	1	N739667	8	5	9	1	t	09:00:00	16:00:00
640	1	M810264	6	7	27	1	t	09:00:00	16:00:00
641	1	N889379	8	10	22	1	t	09:00:00	16:00:00
642	1	N859308	6	8	10	1	t	09:00:00	16:00:00
643	1	N015851	5	12	2	5	t	09:00:00	16:00:00
644	1	N855210	6	12	2	1	t	09:00:00	16:00:00
645	1	M621729	8	11	3	1	t	09:00:00	16:00:00
646	1	M621729	8	5	3	2	t	09:00:00	16:00:00
647	1	M621729	8	10	3	2	t	09:00:00	16:00:00
648	1	N885275	8	11	3	2	t	09:00:00	16:00:00
649	1	N885275	8	5	3	3	t	09:00:00	16:00:00
650	1	N885275	8	10	3	3	t	09:00:00	16:00:00
651	1	M695205	6	12	1	2	t	09:00:00	16:00:00
652	1	M811114	6	12	1	3	t	09:00:00	16:00:00
653	1	N336530	6	7	6	3	t	09:00:00	16:00:00
654	1	N336530	6	8	6	3	t	09:00:00	16:00:00
655	1	N883956	6	6	6	4	t	09:00:00	16:00:00
656	1	N877912	8	11	5	3	t	09:00:00	16:00:00
657	1	N889813	8	5	30	4	f	09:00:00	16:00:00
658	1	N685787	8	10	30	4	f	09:00:00	16:00:00
659	1	M014406	6	7	14	4	f	09:00:00	16:00:00
660	1	N527406	6	8	10	4	t	09:00:00	16:00:00
661	1	N873399	8	11	9	4	t	09:00:00	16:00:00
662	1	M221027	6	6	14	5	f	09:00:00	16:00:00
663	1	N564885	6	7	23	5	t	09:00:00	16:00:00
664	1	N226629	8	5	30	5	f	09:00:00	16:00:00
665	1	N611642	8	10	7	5	t	09:00:00	16:00:00
666	1	N885695	8	11	30	5	f	09:00:00	16:00:00
667	1	N872735	9	1	9	1	t	09:00:00	16:00:00
668	1	N889975	9	2	13	1	t	09:00:00	16:00:00
669	1	N332349	6	8	8	5	t	09:00:00	16:00:00
670	1	M261090	7	6	8	1	t	09:00:00	16:00:00
671	1	N760821	9	3	30	1	f	09:00:00	16:00:00
672	1	N888362	9	5	30	1	t	09:00:00	16:00:00
673	1	N889451	7	6	4	2	t	09:00:00	16:00:00
674	1	M369752	7	7	27	1	t	09:00:00	16:00:00
675	1	M369752	7	8	27	1	t	09:00:00	16:00:00
676	1	M992979	7	7	27	2	f	09:00:00	16:00:00
677	1	N831603	9	10	9	1	t	09:00:00	16:00:00
678	1	M008438	9	11	5	1	t	09:00:00	16:00:00
679	1	N884386	9	5	22	2	t	09:00:00	16:00:00
680	1	N003358	9	10	22	2	t	09:00:00	16:00:00
681	1	N289538	7	8	10	2	t	09:00:00	16:00:00
682	1	N350973	7	6	10	3	t	09:00:00	16:00:00
683	1	N560753	9	11	3	2	t	09:00:00	16:00:00
684	1	N560753	9	5	3	3	t	09:00:00	16:00:00
685	1	N560753	9	10	3	3	t	09:00:00	16:00:00
686	1	N560753	9	11	3	3	t	09:00:00	16:00:00
687	1	N871505	9	5	3	4	t	09:00:00	16:00:00
688	1	N871505	9	10	3	4	t	09:00:00	16:00:00
689	1	N346533	6	12	2	4	t	09:00:00	16:00:00
690	1	N864297	6	12	2	5	t	09:00:00	16:00:00
691	1	N890204	7	12	1	1	t	09:00:00	16:00:00
692	1	N850246	7	12	1	2	t	09:00:00	16:00:00
693	1	N275596	9	11	30	4	f	09:00:00	16:00:00
694	1	N856395	9	5	30	5	f	09:00:00	16:00:00
695	1	N809603	7	7	14	3	f	09:00:00	16:00:00
696	1	M373699	9	10	13	5	t	09:00:00	16:00:00
697	1	M604785	7	8	14	3	f	09:00:00	16:00:00
698	1	M487251	7	6	14	4	f	09:00:00	16:00:00
699	1	N348086	7	7	14	4	f	09:00:00	16:00:00
700	1	N564340	9	11	9	5	t	09:00:00	16:00:00
701	1	N564340	10	1	9	1	t	09:00:00	16:00:00
702	1	N641425	10	2	9	1	t	09:00:00	16:00:00
703	1	N641425	10	3	9	1	t	09:00:00	16:00:00
704	1	M939765	10	5	9	2	t	09:00:00	16:00:00
705	1	M603326	7	8	10	4	t	09:00:00	16:00:00
706	1	M762588	7	6	10	5	t	09:00:00	16:00:00
707	1	N613301	10	5	30	1	f	09:00:00	16:00:00
708	1	N868305	7	7	23	5	t	09:00:00	16:00:00
709	1	N881483	10	10	30	1	f	09:00:00	16:00:00
710	1	N890423	7	8	14	5	f	09:00:00	16:00:00
711	1	N663727	10	11	13	1	t	09:00:00	16:00:00
712	1	M462224	10	10	13	2	t	09:00:00	16:00:00
713	1	N862761	10	11	30	2	t	09:00:00	16:00:00
714	1	N692997	10	5	30	3	t	09:00:00	16:00:00
715	1	N890427	8	6	8	1	t	09:00:00	16:00:00
716	1	N884567	8	7	14	1	f	09:00:00	16:00:00
717	1	N810154	8	8	27	1	t	09:00:00	16:00:00
718	1	N098900	8	6	27	2	t	09:00:00	16:00:00
719	1	N782020	8	7	14	2	f	09:00:00	16:00:00
720	1	M869599	8	8	4	2	t	09:00:00	16:00:00
721	1	M869599	8	6	4	3	t	09:00:00	16:00:00
722	1	N209162	8	7	4	3	t	09:00:00	16:00:00
723	1	N559567	10	10	9	3	t	09:00:00	16:00:00
724	1	N580367	10	11	9	3	t	09:00:00	16:00:00
725	1	N127881	10	5	22	4	t	09:00:00	16:00:00
726	1	N339165	10	10	22	4	t	09:00:00	16:00:00
727	1	N842406	8	8	10	3	t	09:00:00	16:00:00
728	1	N842406	8	6	10	4	t	09:00:00	16:00:00
729	1	N842406	8	7	10	4	t	09:00:00	16:00:00
730	1	N842406	8	8	10	4	t	09:00:00	16:00:00
731	1	N873695	10	11	3	4	t	09:00:00	16:00:00
732	1	N873695	10	5	3	5	t	09:00:00	16:00:00
733	1	N873695	10	10	3	5	t	09:00:00	16:00:00
734	1	M139022	7	12	2	3	t	09:00:00	16:00:00
735	1	N883644	7	12	2	4	t	09:00:00	16:00:00
736	1	N889414	7	12	1	5	t	09:00:00	16:00:00
737	1	N890505	8	12	1	1	t	09:00:00	16:00:00
738	1	M173888	8	12	2	2	t	09:00:00	16:00:00
739	1	N784698	8	6	14	5	f	09:00:00	16:00:00
740	1	N126212	8	7	10	5	t	09:00:00	16:00:00
741	1	N356662	8	8	14	5	f	09:00:00	16:00:00
742	1	M659312	10	11	9	5	t	09:00:00	16:00:00
743	1	M659312	11	1	9	1	t	09:00:00	16:00:00
744	1	M659312	11	2	9	1	t	09:00:00	16:00:00
745	1	N014874	11	3	9	1	t	09:00:00	16:00:00
746	1	N889819	11	5	13	1	t	09:00:00	16:00:00
747	1	N141902	11	10	13	1	t	09:00:00	16:00:00
748	1	N737904	11	11	30	1	t	09:00:00	16:00:00
749	1	N833668	11	5	30	2	f	09:00:00	16:00:00
750	1	N859350	11	10	30	2	f	09:00:00	16:00:00
751	1	N539524	11	11	5	2	t	09:00:00	16:00:00
752	1	N796765	9	6	8	1	t	09:00:00	16:00:00
753	1	N796765	9	7	8	1	t	09:00:00	16:00:00
754	1	N796765	9	8	8	1	t	09:00:00	16:00:00
755	1	N881153	11	5	13	3	t	09:00:00	16:00:00
756	1	N891238	11	10	13	3	t	09:00:00	16:00:00
757	1	N758405	9	6	8	2	t	09:00:00	16:00:00
758	1	N657783	11	11	30	3	t	09:00:00	16:00:00
759	1	N881378	9	7	4	2	t	09:00:00	16:00:00
760	1	N881378	9	8	4	2	t	09:00:00	16:00:00
761	1	N787164	9	6	4	3	t	09:00:00	16:00:00
762	1	M916338	9	7	27	3	t	09:00:00	16:00:00
763	1	N824353	11	5	5	4	t	09:00:00	16:00:00
764	1	N516953	11	10	22	4	t	09:00:00	16:00:00
765	1	N881113	11	11	9	4	t	09:00:00	16:00:00
766	1	N283466	9	8	10	3	t	09:00:00	16:00:00
767	1	N283466	9	6	10	4	t	09:00:00	16:00:00
768	1	N843409	9	7	10	4	t	09:00:00	16:00:00
769	1	N843409	9	8	10	4	t	09:00:00	16:00:00
770	1	M146828	11	5	3	5	t	09:00:00	16:00:00
771	1	M898656	8	12	2	3	t	09:00:00	16:00:00
772	1	N205385	8	12	2	4	t	09:00:00	16:00:00
773	1	M125130	8	12	1	5	t	09:00:00	16:00:00
774	1	N884158	9	6	6	5	t	09:00:00	16:00:00
775	1	N720778	9	7	6	5	t	09:00:00	16:00:00
776	1	N825170	11	10	5	5	t	09:00:00	16:00:00
777	1	M125990	11	11	30	5	f	09:00:00	16:00:00
778	1	N883186	9	8	10	5	t	09:00:00	16:00:00
779	1	N187709	12	1	9	1	t	09:00:00	16:00:00
780	1	N238721	12	2	9	1	t	09:00:00	16:00:00
781	1	N828258	12	3	13	1	t	09:00:00	16:00:00
782	1	M166416	12	5	9	1	t	09:00:00	16:00:00
783	1	N879348	12	10	30	1	f	09:00:00	16:00:00
784	1	N252722	10	6	23	1	t	09:00:00	16:00:00
785	1	N860483	10	7	23	1	t	09:00:00	16:00:00
786	1	M696969	12	11	7	1	f	09:00:00	16:00:00
787	1	M918545	12	5	5	2	t	09:00:00	16:00:00
788	1	N787610	12	10	30	2	t	09:00:00	16:00:00
789	1	N718113	10	8	8	1	t	09:00:00	16:00:00
790	1	N771501	10	6	4	2	t	09:00:00	16:00:00
791	1	N771501	10	7	4	2	t	09:00:00	16:00:00
792	1	N890121	10	8	4	2	t	09:00:00	16:00:00
793	1	M740032	10	6	27	3	t	09:00:00	16:00:00
794	1	N860411	12	11	9	2	t	09:00:00	16:00:00
795	1	N865851	10	7	27	3	t	09:00:00	16:00:00
796	1	N891798	12	5	22	3	t	09:00:00	16:00:00
797	1	N134009	10	8	10	3	t	09:00:00	16:00:00
798	1	M463585	12	10	3	3	t	09:00:00	16:00:00
799	1	M463585	12	11	3	3	t	09:00:00	16:00:00
800	1	N824225	9	12	1	1	t	09:00:00	16:00:00
801	1	N824225	9	12	1	2	t	09:00:00	16:00:00
802	1	M790457	9	12	2	3	t	09:00:00	16:00:00
803	1	N796051	9	12	2	4	t	09:00:00	16:00:00
804	1	N022348	12	5	3	4	t	09:00:00	16:00:00
805	1	N022348	12	10	3	4	t	09:00:00	16:00:00
806	1	N891476	9	12	1	5	t	09:00:00	16:00:00
807	1	M811980	10	12	2	1	t	09:00:00	16:00:00
808	1	M619151	10	6	14	4	f	09:00:00	16:00:00
809	1	N790990	10	7	14	4	f	09:00:00	16:00:00
810	1	M832480	12	11	9	4	t	09:00:00	16:00:00
811	1	N042960	12	5	9	5	t	09:00:00	16:00:00
812	1	N876926	12	10	9	5	t	09:00:00	16:00:00
813	1	M650531	10	8	14	4	f	09:00:00	16:00:00
814	1	N872220	10	6	10	5	t	09:00:00	16:00:00
815	1	M845243	12	11	30	5	f	09:00:00	16:00:00
816	1	N888429	13	1	13	1	t	09:00:00	16:00:00
817	1	N883246	13	2	5	1	t	09:00:00	16:00:00
818	1	N223722	10	7	14	5	f	09:00:00	16:00:00
819	1	N597189	10	8	14	5	f	09:00:00	16:00:00
820	1	N887375	13	3	30	1	f	09:00:00	16:00:00
821	1	N006982	11	6	14	1	f	09:00:00	16:00:00
822	1	M262755	13	5	5	1	t	09:00:00	16:00:00
823	1	N865831	11	7	14	1	f	09:00:00	16:00:00
824	1	N890764	11	8	14	1	f	09:00:00	16:00:00
825	1	M057878	13	10	5	1	t	09:00:00	16:00:00
826	1	M894050	13	11	30	1	f	09:00:00	16:00:00
827	1	N208730	13	5	30	2	f	09:00:00	16:00:00
828	1	N853425	13	10	30	2	f	09:00:00	16:00:00
829	1	N892957	11	6	14	2	f	09:00:00	16:00:00
830	1	N876903	13	11	30	2	f	09:00:00	16:00:00
831	1	N893665	13	5	13	3	t	09:00:00	16:00:00
832	1	M832057	11	7	8	2	t	09:00:00	16:00:00
833	1	M385259	13	10	30	3	t	09:00:00	16:00:00
834	1	N846393	13	11	30	3	f	09:00:00	16:00:00
835	1	N893031	13	5	5	4	f	09:00:00	16:00:00
836	1	N893965	13	10	13	4	t	09:00:00	16:00:00
837	1	N871678	11	8	27	2	t	09:00:00	16:00:00
838	1	N879913	11	6	27	3	t	09:00:00	16:00:00
839	1	N141161	11	7	4	3	t	09:00:00	16:00:00
840	1	N693922	13	11	9	4	t	09:00:00	16:00:00
841	1	N872831	11	8	4	3	t	09:00:00	16:00:00
842	1	N869554	11	6	14	4	t	09:00:00	16:00:00
843	1	N871461	11	7	4	4	t	09:00:00	16:00:00
844	1	N871461	11	8	4	4	t	09:00:00	16:00:00
845	1	N786777	11	6	10	5	t	09:00:00	16:00:00
846	1	M843589	11	7	10	5	t	09:00:00	16:00:00
847	1	N657534	13	5	3	5	t	09:00:00	16:00:00
848	1	N783196	10	12	1	2	t	09:00:00	16:00:00
849	1	N893295	10	12	1	3	t	09:00:00	16:00:00
850	1	N893295	10	12	1	4	t	09:00:00	16:00:00
851	1	N893295	10	12	1	5	t	09:00:00	16:00:00
852	1	N894113	11	12	1	1	t	09:00:00	16:00:00
853	1	N565690	11	8	6	5	t	09:00:00	16:00:00
854	1	N565690	12	6	6	1	t	09:00:00	16:00:00
855	1	N823940	13	10	30	5	f	09:00:00	16:00:00
856	1	N254053	13	11	30	5	f	09:00:00	16:00:00
857	1	N886153	14	1	30	1	f	09:00:00	16:00:00
858	1	N876735	12	7	27	1	t	09:00:00	16:00:00
859	1	N894041	14	2	9	1	t	09:00:00	16:00:00
860	1	M242612	12	6	4	2	t	09:00:00	16:00:00
861	1	N118436	14	3	9	1	t	09:00:00	16:00:00
862	1	N118436	14	5	9	1	t	09:00:00	16:00:00
863	1	N879940	12	7	4	2	t	09:00:00	16:00:00
864	1	N892521	12	8	10	1	t	09:00:00	16:00:00
865	1	M463585	14	10	3	1	t	09:00:00	16:00:00
866	1	M881375	14	11	3	1	t	09:00:00	16:00:00
867	1	M881375	14	5	3	2	t	09:00:00	16:00:00
868	1	M686623	12	8	10	2	t	09:00:00	16:00:00
869	1	N848478	12	6	6	3	t	09:00:00	16:00:00
870	1	N884158	12	7	6	3	t	09:00:00	16:00:00
871	1	N884152	12	8	6	3	t	09:00:00	16:00:00
872	1	M849823	12	6	6	4	t	09:00:00	16:00:00
873	1	N200033	12	7	6	4	t	09:00:00	16:00:00
874	1	N796826	12	8	6	4	t	09:00:00	16:00:00
875	1	N801989	12	6	6	5	t	09:00:00	16:00:00
876	1	N846393	14	10	30	2	f	09:00:00	16:00:00
877	1	N894604	14	11	5	2	t	09:00:00	16:00:00
878	1	N728147	14	5	13	3	t	09:00:00	16:00:00
879	1	N339964	12	7	10	5	f	09:00:00	16:00:00
880	1	N892585	14	10	9	3	t	09:00:00	16:00:00
881	1	M892176	14	11	13	3	t	09:00:00	16:00:00
882	1	N400153	12	8	23	5	t	09:00:00	16:00:00
883	1	N627036	13	6	23	1	t	09:00:00	16:00:00
884	1	N894266	14	5	22	4	t	09:00:00	16:00:00
885	1	N894266	14	10	22	4	t	09:00:00	16:00:00
886	1	N398040	14	11	5	4	t	09:00:00	16:00:00
887	1	N808938	14	5	22	5	t	09:00:00	16:00:00
888	1	N856458	14	10	9	5	t	09:00:00	16:00:00
889	1	N882741	14	11	22	5	t	09:00:00	16:00:00
890	1	N317458	13	6	4	2	t	09:00:00	16:00:00
891	1	N882299	13	7	4	2	t	09:00:00	16:00:00
892	1	M902579	13	7	27	1	t	09:00:00	16:00:00
893	1	N879550	13	8	10	1	t	09:00:00	16:00:00
894	1	N893577	13	8	10	2	t	09:00:00	16:00:00
895	1	M872372	15	3	3	1	t	09:00:00	16:00:00
896	1	M872372	15	5	3	1	t	09:00:00	16:00:00
897	1	M872372	15	10	3	1	t	09:00:00	16:00:00
898	1	N706438	11	12	2	2	t	09:00:00	16:00:00
899	1	N856125	11	12	2	3	t	09:00:00	16:00:00
900	1	N887488	15	5	3	2	t	09:00:00	16:00:00
901	1	N887488	15	10	3	2	t	09:00:00	16:00:00
902	1	N887488	15	11	3	2	t	09:00:00	16:00:00
903	1	M891988	11	12	1	4	t	09:00:00	16:00:00
904	1	N691524	11	12	1	5	t	09:00:00	16:00:00
905	1	N782718	15	5	3	3	t	09:00:00	16:00:00
906	1	M914313	15	1	13	1	t	09:00:00	16:00:00
907	1	N893527	13	6	10	3	t	09:00:00	16:00:00
908	1	M687683	15	2	7	1	t	09:00:00	16:00:00
909	1	N697031	15	11	9	1	t	09:00:00	16:00:00
910	1	M784468	15	10	30	3	f	09:00:00	16:00:00
911	1	N584001	15	11	30	3	f	09:00:00	16:00:00
912	1	N885340	13	7	23	3	t	09:00:00	16:00:00
913	1	N891001	15	5	5	4	t	09:00:00	16:00:00
914	1	N891001	15	10	5	4	t	09:00:00	16:00:00
915	1	N891001	15	11	5	4	t	09:00:00	16:00:00
916	1	N890764	13	8	14	3	f	09:00:00	16:00:00
917	1	N893855	13	6	14	4	f	09:00:00	16:00:00
918	1	N579756	15	5	5	5	t	09:00:00	16:00:00
919	1	M902016	13	7	14	4	f	09:00:00	16:00:00
920	1	N803399	15	10	5	5	t	09:00:00	16:00:00
921	1	N786972	15	11	5	5	t	09:00:00	16:00:00
922	1	M108514	13	8	14	4	f	09:00:00	16:00:00
923	1	N760560	13	6	14	5	f	09:00:00	16:00:00
924	1	N896034	13	7	14	5	f	09:00:00	16:00:00
925	1	N888539	13	8	8	5	t	09:00:00	16:00:00
926	1	N126311	14	6	8	1	t	09:00:00	16:00:00
927	1	N051774	14	7	27	1	t	09:00:00	16:00:00
928	1	N868146	14	8	27	1	t	09:00:00	16:00:00
929	1	N883576	14	6	4	2	t	09:00:00	16:00:00
930	1	N883576	14	7	4	2	t	09:00:00	16:00:00
931	1	N885913	14	8	4	2	t	09:00:00	16:00:00
932	1	N885913	14	6	4	3	t	09:00:00	16:00:00
933	1	N894166	14	7	27	3	t	09:00:00	16:00:00
934	1	N845565	14	8	10	3	t	09:00:00	16:00:00
935	1	N289754	12	12	1	1	t	09:00:00	16:00:00
936	1	N877934	12	12	2	2	t	09:00:00	16:00:00
937	1	N046816	12	12	1	3	t	09:00:00	16:00:00
938	1	M969855	14	6	6	4	t	09:00:00	16:00:00
939	1	N177910	14	7	6	4	t	09:00:00	16:00:00
940	1	N640856	14	8	6	4	t	09:00:00	16:00:00
941	1	M051404	14	6	10	5	t	09:00:00	16:00:00
942	1	N832153	14	7	14	5	f	09:00:00	16:00:00
943	1	N896690	14	8	14	5	f	09:00:00	16:00:00
944	1	M974377	15	6	23	1	t	09:00:00	16:00:00
945	1	N785194	15	7	23	1	t	09:00:00	16:00:00
946	1	M343035	15	8	8	1	t	09:00:00	16:00:00
947	1	M886946	15	6	8	2	t	09:00:00	16:00:00
948	1	N751585	15	7	8	2	t	09:00:00	16:00:00
949	1	N737927	15	8	27	2	t	09:00:00	16:00:00
950	1	N219829	15	6	27	3	t	09:00:00	16:00:00
951	1	N775907	12	12	2	4	t	09:00:00	16:00:00
952	1	N566744	12	12	2	5	t	09:00:00	16:00:00
953	1	N881734	15	7	10	3	t	09:00:00	16:00:00
954	1	N881734	15	8	10	3	t	09:00:00	16:00:00
955	1	N533918	15	6	10	4	t	09:00:00	16:00:00
956	1	N888644	15	7	6	4	t	09:00:00	16:00:00
957	1	N305293	15	8	10	4	t	09:00:00	16:00:00
958	1	N323747	15	6	23	5	t	09:00:00	16:00:00
959	1	N769399	15	7	10	5	t	09:00:00	16:00:00
960	1	N579886	15	8	27	5	t	09:00:00	16:00:00
961	1	M699594	13	12	2	1	t	09:00:00	16:00:00
962	1	N234512	13	12	2	2	t	09:00:00	16:00:00
963	1	N859234	13	12	2	3	t	09:00:00	16:00:00
964	1	N897585	13	12	1	4	t	09:00:00	16:00:00
965	1	M797251	13	12	2	5	t	09:00:00	16:00:00
966	1	M797251	14	12	2	1	t	09:00:00	16:00:00
967	1	N788122	14	12	2	2	t	09:00:00	16:00:00
968	1	M678194	14	12	1	3	t	09:00:00	16:00:00
969	1	N898512	14	12	1	4	t	09:00:00	16:00:00
970	1	M203578	14	12	2	5	t	09:00:00	16:00:00
971	1	N828852	15	12	2	1	t	09:00:00	16:00:00
972	1	N899128	15	12	1	2	t	09:00:00	16:00:00
973	1	N574627	15	12	1	3	t	09:00:00	16:00:00
974	1	N834147	15	12	2	4	t	09:00:00	16:00:00
975	1	N884465	15	12	2	5	t	09:00:00	16:00:00
\.


--
-- Data for Name: ot_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ot_type (id, description) FROM stdin;
1	General
3	Fixed
2	UltraClean
\.


--
-- Data for Name: preferred_ot; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.preferred_ot (id, ot_id, unit_id) FROM stdin;
\.


--
-- Data for Name: procedure_name; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.procedure_name (id, name, sub_specialty_id) FROM stdin;
1	PROCEDURE - ADVANCE TRAUMA	1
2	PROCEDURE - ARTHOPLASTY	2
3	PROCEDURE - BREAST	3
4	PROCEDURE - BREAST & ENDOCRINE	4
5	PROCEDURE - CARDIOTHORASIC	5
6	PROCEDURE - COLORECTAL	6
7	PROCEDURE - HANDS & MICROSURGERY	7
8	PROCEDURE - HEPATOBILIARY	8
9	PROCEDURE - MAXILOFACIAL	9
10	PROCEDURE - NEUROSURGERY	10
11	PROCEDURE - OPHTHALMOLOGY	11
12	PROCEDURE - ORTHO-ONCOLOGY	12
13	PROCEDURE - ORTHOPEDIC	13
14	PROCEDURE - OTORHINOLARINGOLOGY	14
15	PROCEDURE - PAEDIATRIC ORTHOPEDIC	15
16	PROCEDURE - PAEDIATRIC SURGERY	16
17	PROCEDURE - PLASTIC	17
18	PROCEDURE - SPINAL	18
19	PROCEDURE - SPORT	19
20	PROCEDURE - SURGERY	20
21	PROCEDURE - TRAUMA	21
22	PROCEDURE - UKMSC	22
23	PROCEDURE - UPPER GI MINIMALLY INVASIVE	23
24	PROCEDURE - UROLOGY	24
25	PROCEDURE - VASCULAR	25
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.role (id, role) FROM stdin;
1	admin
\.


--
-- Data for Name: schedule_resource; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schedule_resource (id, resource, value) FROM stdin;
3	ICU bed	4
2	PACU bed	3
1	PHU bed	3
\.


--
-- Data for Name: schedule_results; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schedule_results (id, run_id, mrn, age, week_id, week_day, surgery_date, type_of_surgery, sub_specialty_desc, specialty_id, procedure_name, surgery_duration, phu_id, phu_start_time, phu_end_time, ot_id, ot_start_time, ot_end_time, surgeon_name, post_op_id, post_op_start_time, post_op_end_time, pacu_id, pacu_start_time, pacu_end_time, icu_id, icu_start_time, icu_end_time) FROM stdin;
\.


--
-- Data for Name: specialty; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.specialty (id, name) FROM stdin;
1	JENT
2	JMAX
3	JOFT
4	JORT
5	JSUR
6	UKMSC
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.status (id, description) FROM stdin;
1	Available
2	Unavailable
\.


--
-- Data for Name: sub_specialties_ot_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sub_specialties_ot_types (id, sub_specialty_id, ot_type_id, unit_id) FROM stdin;
1	1	3	1
2	2	3	2
3	3	1	3
4	4	2	4
5	5	1	5
6	6	2	6
7	7	1	7
8	8	2	8
9	9	1	9
10	10	2	10
11	11	3	11
12	11	3	12
13	12	1	13
14	13	2	14
15	14	1	15
16	14	2	15
17	14	1	16
18	14	2	16
19	15	1	17
20	16	1	18
21	16	2	18
22	16	1	19
23	16	2	19
24	17	1	20
25	17	2	20
26	17	1	21
27	17	2	21
28	18	1	22
29	19	2	23
30	20	1	24
31	21	2	25
32	22	1	26
33	23	2	27
34	24	1	28
35	24	2	28
36	24	1	29
37	24	2	29
38	25	1	30
\.


--
-- Data for Name: sub_specialty; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sub_specialty (id, description, specialty_id, color_hex) FROM stdin;
1	ADVANCE TRAUMA	4	#FF0000
2	ARTHOPLASTY	4	#0000FF
3	BREAST	5	#FFC0CB
4	BREAST & ENDOCRINE	5	#FFB6C1
5	CARDIOTHORASIC	5	#8B0000
6	COLORECTAL	5	#008000
7	HANDS & MICROSURGERY	4	#90EE90
8	HEPATOBILIARY	5	#FFFF00
9	MAXILOFACIAL	2	#FFA500
10	NEUROSURGERY	5	#800080
11	OPHTHALMOLOGY	3	#ADD8E6
12	ORTHO-ONCOLOGY	4	#00008B
13	ORTHOPEDIC	4	#006400
14	OTORHINOLARINGOLOGY	1	#A52A2A
15	PAEDIATRIC ORTHOPEDIC	4	#FFFFE0
16	PAEDIATRIC SURGERY	5	#D8BFD8
17	PLASTIC	5	#00FFFF
18	SPINAL	4	#E0FFFF
19	SPORT	4	#FF00FF
20	SURGERY	5	#D3D3D3
21	TRAUMA	4	#A9A9A9
22	UKMSC	6	#D2B48C
23	UPPER GI MINIMALLY INVASIVE	5	#808000
24	UROLOGY	5	#008080
25	VASCULAR	5	#000080
\.


--
-- Data for Name: surgery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.surgery (id, mrn, booking_date, estimated_duration, age, gender_code, surgeon, unit_id, procedure_name_id, mssp_id) FROM stdin;
1	N699447	2022-09-08	205	52	P	OTHMALIZA BINTI OTHMAN	11	1	1
2	N779285	2022-10-13	50	68	P	CHENG TECK CHEE	11	15	1
3	N413780	2022-10-27	40	69	L	CHENG TECK CHEE	11	21	1
4	N867837	2022-10-27	17	68	P	CHENG TECK CHEE	11	16	1
5	M150902	2022-11-02	12	60	P	CHENG TECK CHEE	11	23	1
6	M846636	2022-11-21	210	67	P	GUHAN A/L MUTHKUMARAN	27	19	1
7	N648171	2022-11-24	250	10	L	GOH BEE SEE	26	21	1
8	M887682	2022-11-30	45	67	P	CHENG TECK CHEE	11	14	1
9	N811125	2022-12-19	140	13	P	OTHMALIZA BINTI OTHMAN	11	18	1
10	N269647	2022-12-21	25	78	P	CHENG TECK CHEE	11	24	1
11	M914338	2022-12-22	55	63	P	CHENG TECK CHEE	11	21	1
12	N037365	2022-12-22	30	78	L	CHENG TECK CHEE	11	7	1
13	N722489	2022-12-23	140	31	L	LOKMAN SAIM	26	9	1
14	N722489	2022-12-23	140	31	L	LOKMAN SAIM	26	25	1
15	N796205	2022-12-27	150	32	L	AHMAD FARIHAN BIN MOHD DON	26	12	1
16	N884188	2022-12-27	100	2	P	SAFINAZ BINTI MOHD KHIALDIN	11	1	1
17	N258402	2022-12-28	335	34	P	NANI HARLINA BT MD. LATAR	4	6	1
18	N573081	2022-12-28	25	68	P	SHAHRUN NIZA BIN ABDULLAH SUHAIMI	4	24	1
19	N793985	2022-12-28	415	70	L	SHAHRUN NIZA BIN ABDULLAH SUHAIMI	4	2	1
20	N874502	2022-12-28	30	79	L	MOHD HISAM BIN MOHD ARIFFIN	22	2	1
21	N291140	2022-12-29	230	76	P	MOHD YAZID BIN BAJURI	1	19	1
22	N883745	2022-12-29	435	35	L	MOHD YAZID BIN BAJURI	1	13	1
23	N728042	2022-12-30	136	29	P	NURAYUB MD ALI	5	23	1
24	N775239	2022-12-30	140	67	P	OTHMALIZA BINTI OTHMAN	11	12	1
25	N832037	2022-12-30	130	54	L	MOHD HISAM BIN MOHD ARIFFIN	22	8	1
26	N634885	2022-12-31	100	77	P	NIK KAMARUL ARIF BIN NIK KAMRULZAMAN	22	17	1
27	M658549	2023-01-01	430	49	P	GUHAN A/L MUTHKUMARAN	27	18	1
28	M985227	2022-10-03	30	79	L	JEMAIMA BTE CHE HAMZAH	26	2	1
29	N877459	2022-11-01	230	27	L	SALINA HUSAIN	26	18	1
30	N877481	2022-11-01	130	39	P	SALINA HUSAIN	26	13	1
31	M817304	2022-12-01	30	85	P	RONA ASNIDA NASARUDDIN	11	17	1
32	N290987	2022-12-13	450	22	P	KAMALANATHAN A/L PALANIANDY	10	2	1
33	N881851	2022-12-15	45	56	L	RONA ASNIDA NASARUDDIN	11	7	1
34	M492764	2022-12-22	17	75	P	JEMAIMA BTE CHE HAMZAH	11	17	1
35	M842099	2022-12-22	20	83	L	JEMAIMA BTE CHE HAMZAH	11	2	1
36	N200016	2022-12-22	30	84	L	RUPINI YOGESVARAN	11	13	1
37	N510481	2022-12-22	35	66	L	JEMAIMA BTE CHE HAMZAH	11	2	1
38	N807717	2022-12-22	430	20	P	RAMA KRSNA A/L RAJANDRAM	9	7	1
39	N382012	2022-12-23	50	59	P	RUPINI YOGESVARAN	11	7	1
40	M287458	2022-12-27	35	79	P	RUPINI YOGESVARAN	11	13	1
41	N150907	2022-12-28	115	73	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	14	1
42	N714604	2022-12-28	149	64	P	RIZAL BIN ABDUL RANI	2	21	1
43	N848334	2022-12-29	145	72	P	RIZAL BIN ABDUL RANI	2	11	1
44	N862643	2023-01-02	200	1	L	AZIZI BIN ABU BAKAR	10	15	1
45	N880194	2023-01-03	650	60	L	MARINA BT MAT BAKI	26	11	1
46	N880194	2023-01-03	650	60	L	MARINA BT MAT BAKI	26	3	1
47	N884435	2023-01-03	130	52	L	AHMAD FAZLY BIN ABD RASID	1	23	1
48	M879656	2023-01-04	35	47	P	WAN HASLINA BT WAN ABDUL HALIM	26	24	1
49	M857647	2022-10-18	27	66	L	YONG MENG HSIEN	11	10	1
50	N739054	2022-11-01	50	63	P	YONG MENG HSIEN	11	6	1
51	N876334	2022-11-01	101	63	P	YONG MENG HSIEN	11	11	1
52	N879380	2022-11-01	35	53	L	YONG MENG HSIEN	11	21	1
53	M652820	2022-11-07	43	57	L	YONG MENG HSIEN	11	3	1
54	N880127	2022-11-10	100	40	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	1	1
55	N205560	2022-11-14	500	32	L	MOHD YAZID BIN BAJURI	26	13	1
56	N877791	2022-11-16	100	40	L	NIK RITZA KOSAI BIN NIK MAHMOOD	26	2	1
57	N823060	2022-11-24	100	42	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	8	1
58	N808351	2022-11-30	29	62	L	MAE-LYNN CATHERINE BASTION	26	1	1
59	N851545	2022-12-06	35	20	L	MAE-LYNN CATHERINE BASTION	11	5	1
60	N851545	2022-12-06	35	20	L	MAE-LYNN CATHERINE BASTION	11	13	1
61	N670108	2022-12-09	55	70	L	MAE-LYNN CATHERINE BASTION	26	25	1
62	N877575	2022-12-14	55	72	L	MAE-LYNN CATHERINE BASTION	11	6	1
63	N866935	2022-12-16	20	61	L	MAE-LYNN CATHERINE BASTION	11	5	1
64	N866950	2022-12-19	340	32	L	SHALIMAR BT ABDULLAH	26	17	1
65	N866950	2022-12-19	340	32	L	SHALIMAR BT ABDULLAH	26	8	1
66	M163501	2022-12-28	239	75	L	MAE-LYNN CATHERINE BASTION	11	25	1
67	M505988	2022-12-30	550	66	L	NURAYUB MD ALI	5	7	1
68	M622138	2023-01-03	4	78	P	WAN HASLINA BT WAN ABDUL HALIM	11	1	1
69	M981012	2023-01-03	135	66	L	LENNY SURIANI SAFRI	30	8	1
70	N064734	2023-01-04	25	86	L	MAE-LYNN CATHERINE BASTION	11	17	1
71	N847680	2022-11-24	310	36	P	ISMAIL BIN SAGAP	26	7	1
72	N701489	2022-11-30	115	10	P	ABDUL HALIM BIN ABD RASHID	26	13	1
73	M791216	2022-12-15	105	69	P	LAM CHENSHEN	11	13	1
74	N784698	2022-12-19	30	63	P	JUZAILY FEKRY LEONG	14	24	1
75	N250270	2022-12-20	50	67	L	NORSHAMSIAH MD DIN	11	6	1
76	N178442	2022-12-28	115	37	P	AZIZI BIN ABU BAKAR	10	23	1
77	N182136	2022-12-28	30	37	P	FARIZAL BIN FADZIL	10	11	1
78	N810557	2022-12-28	30	64	P	KAMALANATHAN A/L PALANIANDY	10	24	1
79	N825256	2022-12-28	20	52	P	KAMALANATHAN A/L PALANIANDY	10	17	1
80	N883077	2022-12-28	21	61	P	KAMALANATHAN A/L PALANIANDY	10	14	1
81	M739182	2022-12-29	120	61	P	LAM CHENSHEN	11	2	1
82	N226629	2023-01-03	50	62	L	LENNY SURIANI SAFRI	30	9	1
83	N873073	2023-01-03	41	34	P	LENNY SURIANI SAFRI	30	15	1
84	N880615	2023-01-03	125	64	P	ELAINE SOH ZI FAN	7	16	1
85	N660135	2023-01-05	550	56	P	KAMALANATHAN A/L PALANIANDY	10	19	1
86	N881851	2023-01-05	10	56	L	RONA ASNIDA NASARUDDIN	11	12	1
87	N884168	2023-01-05	135	34	P	SALINA HUSAIN	26	23	1
88	N827134	2023-01-06	150	43	P	NUR AFDZILLAH ABDUL RAHMAN	26	12	1
89	M702861	2023-01-06	20	31	P	TAN JIN AUN	26	20	1
90	N877131	2023-01-07	35	44	L	ISMAIL BIN SAGAP	26	25	1
91	N858313	2022-07-14	30	67	P	RUPINI YOGESVARAN	11	11	1
92	N856487	2022-09-15	40	39	P	AZLANUDIN BIN AZMAN	26	9	1
93	M689951	2022-10-11	25	73	L	LAM CHENSHEN	11	14	1
94	M166416	2022-12-08	35	71	L	AYESHA BINTI MOHD ZAIN	11	19	1
95	N531732	2022-12-12	26	66	P	AYESHA BINTI MOHD ZAIN	11	9	1
96	N879935	2022-12-12	50	36	P	NORLIA BT. ABDULLAH	7	10	1
97	N267396	2022-12-21	20	42	P	BOO HAN SIN	7	2	1
98	M881026	2022-12-29	155	72	P	NOR HAZLA BINTI MOHAMED HAFLAH	13	7	1
99	N421262	2022-12-29	20	37	P	GUHAN A/L MUTHKUMARAN	7	24	1
100	N873182	2022-12-29	150	71	P	NOR HAZLA BINTI MOHAMED HAFLAH	13	6	1
101	N234485	2023-01-04	110	63	L	MOHAMAD AZIM BIN MD IDRIS	30	13	1
102	N241308	2023-01-04	100	64	L	SAFINAZ BINTI MOHD KHIALDIN	11	14	1
103	N835995	2023-01-04	40	77	P	SAFINAZ BINTI MOHD KHIALDIN	11	21	1
104	N373477	2023-01-05	50	63	L	SAFINAZ BINTI MOHD KHIALDIN	11	19	1
105	N630977	2023-01-05	145	71	L	BOO HAN SIN	8	3	1
106	N880112	2023-01-05	20	73	L	LAM CHENSHEN	11	23	1
107	M953552	2023-01-06	600	72	L	HAIRULFAIZI BIN HARON	5	24	1
108	N255870	2023-01-06	200	17	L	MUHD KAMAL MUHD ABDUL JAMIL	17	18	1
109	N813205	2023-01-08	100	61	P	AZLANUDIN BIN AZMAN	26	9	1
110	N813205	2023-01-08	100	61	P	AZLANUDIN BIN AZMAN	26	1	1
111	N862695	2023-01-08	45	15	L	MARINA BT MAT BAKI	26	13	1
112	N862695	2023-01-08	45	15	L	MARINA BT MAT BAKI	26	8	1
113	N862695	2023-01-08	45	15	L	MARINA BT MAT BAKI	26	12	1
114	N883972	2023-01-08	130	31	L	MARINA BT MAT BAKI	26	18	1
115	N883972	2023-01-08	130	31	L	MARINA BT MAT BAKI	26	25	1
116	N788863	2022-10-04	120	27	P	ASMA BINTI ABDULLAH	26	25	1
117	M600815	2022-10-18	40	71	L	OTHMALIZA BINTI OTHMAN	11	15	1
118	M747909	2022-10-20	25	77	L	CHENG TECK CHEE	11	12	1
119	N134571	2022-10-20	110	77	L	AYESHA BINTI MOHD ZAIN	11	2	1
120	N763388	2022-11-02	29	75	L	AYESHA BINTI MOHD ZAIN	11	21	1
121	N800909	2022-11-03	30	76	L	CHENG TECK CHEE	11	24	1
122	N871972	2022-11-23	40	72	P	OTHMALIZA BINTI OTHMAN	11	9	1
123	N856400	2022-11-24	200	31	L	ISMAIL BIN SAGAP	26	12	1
124	N884188	2022-12-27	330	2	P	SAFINAZ BINTI MOHD KHIALDIN	11	18	1
125	N732036	2023-01-03	215	56	P	NIK ALIF AZRIQ B NIK ABDULLAH	1	21	1
126	N834902	2023-01-03	225	36	L	GUHAN A/L MUTHKUMARAN	27	1	1
127	M735200	2023-01-04	110	96	P	OTHMALIZA BINTI OTHMAN	11	14	1
128	M834107	2023-01-04	350	71	P	AZMI BIN BAHARUDIN	22	1	1
129	M486672	2023-01-05	50	50	P	NORLIA BT. ABDULLAH	4	14	1
130	N572721	2023-01-05	130	32	P	OTHMALIZA BINTI OTHMAN	11	19	1
131	N877224	2023-01-05	200	70	P	ROHAIZAK BIN MUHAMMAD	4	24	1
132	N877224	2023-01-05	200	70	P	ROHAIZAK BIN MUHAMMAD	4	5	1
133	N243415	2023-01-06	350	19	L	MOHD YAZID BIN BAJURI	1	13	1
134	N881798	2023-01-06	520	60	L	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	3	1
135	N881840	2023-01-06	150	69	L	MOHD HISAM BIN MOHD ARIFFIN	22	10	1
136	N218629	2023-01-07	55	69	P	ROHAIZAK BIN MUHAMMAD	4	14	1
137	N052038	2023-01-09	155	47	P	SALINA HUSAIN	26	16	1
138	N660579	2023-01-09	22	66	L	NIK ALIF AZRIQ B NIK ABDULLAH	14	3	1
139	M155991	2023-01-10	25	67	P	NUR AFDZILLAH ABDUL RAHMAN	26	5	1
140	N878927	2022-11-30	150	82	L	MARINA BT MAT BAKI	26	3	1
141	N878927	2022-11-30	150	82	L	MARINA BT MAT BAKI	26	22	1
142	N821769	2022-12-08	45	72	L	RONA ASNIDA NASARUDDIN	11	13	1
143	M524904	2022-12-19	340	55	L	RIZAL BIN ABDUL RANI	2	14	1
144	N568947	2022-12-29	25	61	L	RUPINI YOGESVARAN	11	24	1
145	M113495	2022-12-30	55	66	P	RUPINI YOGESVARAN	11	3	1
146	N856170	2023-01-03	151	75	P	RIZAL BIN ABDUL RANI	2	17	1
147	N193494	2023-01-05	125	46	P	NORLIA BT. ABDULLAH	7	18	1
148	N193494	2023-01-05	125	46	P	NORLIA BT. ABDULLAH	7	18	1
149	N754982	2023-01-05	50	69	P	RUPINI YOGESVARAN	11	25	1
150	N861072	2023-01-05	245	39	P	NORLIA BT. ABDULLAH	7	21	1
151	N861072	2023-01-05	245	39	P	NORLIA BT. ABDULLAH	7	15	1
152	N870458	2023-01-05	40	74	P	RONA ASNIDA NASARUDDIN	11	4	1
153	N880279	2023-01-05	255	62	P	NANI HARLINA BT MD. LATAR	7	20	1
154	N880279	2023-01-05	255	62	P	NANI HARLINA BT MD. LATAR	7	19	1
155	N883187	2023-01-06	34	11	P	WAN HASLINA BT WAN ABDUL HALIM	26	7	1
156	M854820	2023-01-09	230	21	P	RIFQAH BINTI NORDIN	9	10	1
157	N827430	2023-01-09	55	28	P	RIFQAH BINTI NORDIN	9	4	1
158	N862691	2023-01-09	200	24	L	NIK KAMARUL ARIF BIN NIK KAMRULZAMAN	1	24	1
159	N872735	2023-01-09	200	49	L	RIFQAH BINTI NORDIN	9	13	1
160	N883143	2023-01-09	140	62	L	WAN HASLINA BT WAN ABDUL HALIM	26	21	1
161	N413186	2023-01-10	255	39	P	TAN JIN AUN	1	5	1
162	N750477	2023-01-10	200	67	L	MARINA BT MAT BAKI	26	21	1
163	N750477	2023-01-10	200	67	L	MARINA BT MAT BAKI	26	18	1
164	M007162	2022-08-22	25	79	L	MAE-LYNN CATHERINE BASTION	11	23	1
165	N879403	2022-11-01	15	59	L	LAM CHENSHEN	11	10	1
166	N876476	2022-11-14	100	7	L	ASMA BINTI ABDULLAH	26	2	1
167	M695973	2022-11-30	135	72	L	YONG MENG HSIEN	11	7	1
168	N846518	2022-12-07	233	57	P	MOHD YAZID BIN BAJURI	26	20	1
169	N752719	2022-12-12	230	56	L	YONG MENG HSIEN	11	11	1
170	N780069	2022-12-12	20	60	P	LAM CHENSHEN	11	23	1
171	M612813	2022-12-28	315	79	L	MAE-LYNN CATHERINE BASTION	11	20	1
172	M056731	2023-01-05	10	72	P	YONG MENG HSIEN	11	8	1
173	N872513	2023-01-09	125	61	L	LENNY SURIANI SAFRI	30	3	1
174	M331518	2023-01-11	100	59	L	NIK RITZA KOSAI BIN NIK MAHMOOD	26	12	1
175	M331518	2023-01-11	100	59	L	NIK RITZA KOSAI BIN NIK MAHMOOD	26	22	1
176	N619115	2023-01-11	250	61	L	ZAIRUL AZWAN BIN MOHD AZMAN	6	14	1
177	N813210	2023-01-11	125	4	L	AZIZI BIN ABU BAKAR	5	22	1
178	M252353	2022-11-01	15	70	L	SHALIMAR BT ABDULLAH	14	2	1
179	N881990	2022-12-01	35	44	P	AZLANUDIN BIN AZMAN	26	2	1
180	N882948	2022-12-12	130	39	L	ROHAIZAK BIN MUHAMMAD	26	14	1
181	N306946	2022-12-13	30	50	P	SHALIMAR BT ABDULLAH	14	23	1
182	N883544	2022-12-19	225	51	L	ISMAIL BIN SAGAP	26	8	1
183	M659312	2022-12-20	945	62	L	SYED NABIL BIN SYED OMAR	13	1	1
184	M659312	2022-12-20	945	62	L	SYED NABIL BIN SYED OMAR	13	14	1
185	M659312	2022-12-20	945	62	L	SYED NABIL BIN SYED OMAR	13	23	1
186	N814703	2022-12-22	305	24	P	AZIZI BIN ABU BAKAR	10	10	1
187	N557221	2023-01-03	45	79	L	CHENG TECK CHEE	11	12	1
188	M699512	2023-01-09	105	78	P	CHENG TECK CHEE	11	22	1
189	N850534	2023-01-09	45	55	P	LENNY SURIANI SAFRI	30	6	1
190	M234285	2023-01-10	100	54	P	LENNY SURIANI SAFRI	30	3	1
191	N314435	2023-01-10	300	36	L	BADRUL AKMAL HISHAM B. MD. YUSOFF	23	2	1
192	N866701	2023-01-10	440	22	L	AHMAD FARIHAN BIN MOHD DON	23	14	1
193	N596532	2023-01-12	200	77	P	AHMAD FARIHAN BIN MOHD DON	26	12	1
194	N885471	2023-01-13	146	42	P	NUR AFDZILLAH ABDUL RAHMAN	26	1	1
195	M000599	2023-01-13	200	77	P	NOR HAMDAN BIN MOHAMAD YAHAYA	26	16	1
196	N688994	2023-01-13	240	50	P	AZIZI BIN ABU BAKAR	26	10	1
197	M634787	2022-10-11	40	84	L	LAM CHENSHEN	11	1	1
198	N857438	2022-10-11	25	75	L	LAM CHENSHEN	11	5	1
199	N065507	2022-10-25	40	80	P	LAM CHENSHEN	11	8	1
200	M709387	2022-10-26	25	72	L	LAM CHENSHEN	11	8	1
201	M770373	2022-10-26	45	67	L	SAFINAZ BINTI MOHD KHIALDIN	11	11	1
202	N290391	2022-11-09	145	60	P	MAWADDAH BINTI AZMAN	26	7	1
203	N290391	2022-11-09	145	60	P	MAWADDAH BINTI AZMAN	26	24	1
204	N785462	2022-11-22	30	65	L	LAM CHENSHEN	11	6	1
205	N712721	2022-12-12	40	50	P	ROHAIZAK BIN MUHAMMAD	26	22	1
206	M292017	2022-12-14	130	72	L	HARLINA BINTI MOHD RAZALI	7	16	1
207	N884947	2023-01-05	30	53	L	AZLANUDIN BIN AZMAN	26	9	1
208	M875419	2023-01-09	40	61	P	SAFINAZ BINTI MOHD KHIALDIN	11	1	1
209	N762654	2023-01-09	30	87	L	LAM CHENSHEN	11	5	1
210	M601655	2023-01-10	30	69	P	LAM CHENSHEN	11	17	1
211	M728606	2023-01-11	40	55	P	ROHAIZAK BIN MUHAMMAD	26	18	1
212	N883090	2023-01-12	155	63	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	2	1
213	N622209	2023-01-13	150	72	P	MOHAMED HAFIZUDIN ABDULLAH SANI	13	13	1
214	N644789	2023-01-13	55	74	L	KHOO HAU CHUN	5	21	1
215	N644789	2023-01-13	55	74	L	KHOO HAU CHUN	5	4	1
216	N879008	2023-01-13	155	30	P	AZLANUDIN BIN AZMAN	8	20	1
217	N884830	2023-01-15	330	51	L	MARINA BT MAT BAKI	26	4	1
218	N884830	2023-01-15	330	51	L	MARINA BT MAT BAKI	26	10	1
219	N884830	2023-01-15	330	51	L	MARINA BT MAT BAKI	26	22	1
220	N564708	2022-09-19	240	67	L	OTHMALIZA BINTI OTHMAN	11	12	1
221	N254557	2022-11-03	18	65	L	CHENG TECK CHEE	11	6	1
222	N829090	2022-11-03	50	2	L	SAFINAZ BINTI MOHD KHIALDIN	11	22	1
223	N069943	2022-11-04	40	72	P	CHENG TECK CHEE	11	25	1
224	M637071	2022-11-21	34	58	P	CHENG TECK CHEE	11	11	1
225	N659828	2022-11-21	340	49	P	GUHAN A/L MUTHKUMARAN	27	3	1
226	M774308	2022-11-23	130	48	P	ROHAIZAK BIN MUHAMMAD	26	11	1
227	N881244	2022-11-23	200	46	P	ROHAIZAK BIN MUHAMMAD	26	23	1
228	N866906	2022-12-05	35	67	L	CHENG TECK CHEE	11	9	1
229	M727969	2022-12-15	105	63	L	CHENG TECK CHEE	11	24	1
230	N883625	2022-12-20	15	69	P	LIM PEI SHAN	26	8	1
231	N880111	2022-12-21	125	54	L	NIK RITZA KOSAI BIN NIK MAHMOOD	26	4	1
232	M924372	2022-12-29	25	85	P	OTHMALIZA BINTI OTHMAN	11	23	1
233	N871434	2022-12-29	30	15	L	MOHD YAZID BIN BAJURI	1	6	1
234	N616983	2023-01-04	30	78	L	OTHMALIZA BINTI OTHMAN	11	15	1
235	M264227	2023-01-09	130	66	L	NANI HARLINA BT MD. LATAR	4	21	1
236	N278468	2023-01-09	17	75	P	CHENG TECK CHEE	11	14	1
237	N818241	2023-01-09	230	58	P	NANI HARLINA BT MD. LATAR	4	18	1
238	N523373	2023-01-11	200	54	P	MOHD YAZID BIN BAJURI	1	20	1
239	N873369	2023-01-12	135	38	P	GUHAN A/L MUTHKUMARAN	27	24	1
240	N878774	2023-01-13	130	67	L	MOHD HISAM BIN MOHD ARIFFIN	22	11	1
241	N676874	2023-01-16	35	76	L	WAN HASLINA BT WAN ABDUL HALIM	26	17	1
242	N688691	2023-01-16	200	46	L	NIK ALIF AZRIQ B NIK ABDULLAH	1	18	1
243	N795404	2023-01-16	30	6	P	NG BING WUI	22	23	1
244	M953645	2022-11-24	27	64	L	JEMAIMA BTE CHE HAMZAH	11	7	1
245	N216204	2022-11-30	145	85	P	WAN HASLINA BT WAN ABDUL HALIM	26	24	1
246	N792875	2022-12-14	200	40	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	2	1
247	N883344	2022-12-22	100	54	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	5	1
248	N883344	2022-12-22	100	54	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	15	1
249	N768939	2022-12-23	610	30	P	SITI SALMIAH MOHD YUNUS	9	19	1
250	M876708	2023-01-05	40	82	L	RUPINI YOGESVARAN	11	17	1
251	M762254	2023-01-06	25	70	L	RUPINI YOGESVARAN	11	17	1
252	N231075	2023-01-06	40	76	L	RUPINI YOGESVARAN	11	13	1
253	N024665	2023-01-10	30	74	L	RUPINI YOGESVARAN	11	14	1
254	N655700	2023-01-10	25	67	P	RUPINI YOGESVARAN	11	9	1
255	N730002	2023-01-12	330	48	L	AHMAD FAIZ MOHAMED KHALIL	1	25	1
256	N730002	2023-01-12	330	48	L	AHMAD FAIZ MOHAMED KHALIL	1	3	1
257	N206077	2023-01-13	600	71	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	20	1
258	N316939	2023-01-13	210	64	P	RIZAL BIN ABDUL RANI	2	15	1
259	N885935	2023-01-17	130	51	L	TAN JIN AUN	26	25	1
260	M003393	2022-10-25	30	73	P	WAN HASLINA BT WAN ABDUL HALIM	11	14	1
261	M233201	2022-11-02	40	74	P	NUR SHAHIRAH BINTI AMIR HAMZAH	11	23	1
262	N777920	2022-11-23	30	63	L	WAN HASLINA BT WAN ABDUL HALIM	11	21	1
263	N201375	2022-11-29	35	73	L	WAN HASLINA BT WAN ABDUL HALIM	11	15	1
264	N735795	2022-12-06	125	67	P	NOR HAMDAN BIN MOHAMAD YAHAYA	26	11	1
265	N880684	2022-12-07	30	56	P	JAMARI BIN SAPUAN	26	9	1
266	M813749	2022-12-20	34	82	L	WAN HASLINA BT WAN ABDUL HALIM	11	18	1
267	N836454	2023-01-05	100	36	L	NIK RITZA KOSAI BIN NIK MAHMOOD	26	24	1
268	N883656	2023-01-06	100	33	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	20	1
269	M944774	2023-01-11	400	47	L	MAE-LYNN CATHERINE BASTION	11	17	1
270	N885469	2023-01-11	330	58	L	MAE-LYNN CATHERINE BASTION	11	25	1
271	N883747	2023-01-16	100	42	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	11	1
272	N863998	2023-01-17	158	56	P	WAN HASLINA BT WAN ABDUL HALIM	11	4	1
273	N883100	2023-01-17	50	69	P	WAN HASLINA BT WAN ABDUL HALIM	11	24	1
274	M902990	2023-01-18	30	73	P	MOHD YAZID BIN BAJURI	26	22	1
275	N877557	2023-01-19	115	47	L	MOHD YAZID BIN BAJURI	26	20	1
276	N885725	2023-01-19	200	46	P	MOHD YAZID BIN BAJURI	26	10	1
277	N882105	2022-12-02	100	14	P	SYED NABIL BIN SYED OMAR	26	7	1
278	N795726	2022-12-14	210	19	L	KAMALANATHAN A/L PALANIANDY	26	10	1
279	N835551	2022-12-27	110	3	L	SHALIMAR BT ABDULLAH	7	22	1
280	N659259	2023-01-05	530	61	P	JEGAN A/L THANABALAN	10	15	1
281	N145297	2023-01-10	100	67	L	NUR SHAHIRAH BINTI AMIR HAMZAH	11	14	1
282	N855738	2023-01-16	200	36	P	SHALIMAR BT ABDULLAH	26	8	1
283	M619496	2023-01-17	140	76	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	3	1
284	N882083	2023-01-17	105	70	L	NUR SHAHIRAH BINTI AMIR HAMZAH	11	22	1
285	M807153	2023-01-18	350	31	L	BADRUL AKMAL HISHAM B. MD. YUSOFF	23	1	1
286	N805009	2023-01-19	40	68	L	FARIZAL BIN FADZIL	10	3	1
287	N857414	2022-11-30	115	58	L	SYED NABIL BIN SYED OMAR	26	14	1
288	N868168	2022-12-15	100	54	P	MARINA BT MAT BAKI	26	20	1
289	M689985	2023-01-05	100	70	L	RONA ASNIDA NASARUDDIN	11	6	1
290	N734524	2023-01-05	100	39	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	19	1
291	M730124	2023-01-06	30	73	P	JEMAIMA BTE CHE HAMZAH	11	18	1
292	N233087	2023-01-06	20	76	L	JEMAIMA BTE CHE HAMZAH	11	23	1
293	M477336	2023-01-10	45	67	P	RUPINI YOGESVARAN	11	4	1
294	N819034	2023-01-16	135	56	P	RIZAL BIN ABDUL RANI	2	1	1
295	N873030	2023-01-16	140	74	L	NOR HAMDAN BIN MOHAMAD YAHAYA	2	21	1
296	M109871	2023-01-17	105	76	L	JEMAIMA BTE CHE HAMZAH	11	9	1
297	M645975	2023-01-17	30	59	L	JEMAIMA BTE CHE HAMZAH	11	16	1
298	N789901	2023-01-17	25	49	L	RUPINI YOGESVARAN	11	24	1
299	M119141	2023-01-19	200	73	P	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	2	1
300	N342133	2023-01-19	240	12	L	RIFQAH BINTI NORDIN	9	4	1
301	N751927	2023-01-19	159	64	P	NORLIA BT. ABDULLAH	7	15	1
302	N880545	2023-01-19	155	13	P	SYED NABIL BIN SYED OMAR	9	17	1
303	N885824	2023-01-19	135	74	P	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	2	1
304	M992360	2023-01-25	40	32	P	MARINA BT MAT BAKI	26	17	1
305	M009668	2022-11-22	15	74	L	LAM CHENSHEN	11	19	1
306	N716712	2022-11-30	30	73	P	NUR SHAHIRAH BINTI AMIR HAMZAH	11	1	1
307	N868303	2022-11-30	22	52	P	LAM CHENSHEN	11	23	1
308	N881761	2022-11-30	114	80	P	WAN HASLINA BT WAN ABDUL HALIM	11	2	1
309	N548339	2022-12-07	117	64	L	LAM CHENSHEN	11	23	1
310	N861299	2022-12-20	45	43	L	ISMAIL BIN SAGAP	26	19	1
311	N861299	2022-12-20	45	43	L	ISMAIL BIN SAGAP	26	15	1
312	N849814	2022-12-21	100	44	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	25	1
313	N826901	2022-12-22	100	32	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	18	1
314	N171556	2023-01-03	30	44	L	NABIL BIN MOHAMMAD AZMI	6	13	1
315	N882410	2023-01-09	320	34	P	MAE-LYNN CATHERINE BASTION	11	22	1
316	N882410	2023-01-09	320	34	P	MAE-LYNN CATHERINE BASTION	11	23	1
317	N551272	2023-01-11	210	69	P	MAE-LYNN CATHERINE BASTION	26	16	1
318	N883188	2023-01-13	215	73	P	MAE-LYNN CATHERINE BASTION	11	14	1
319	M672299	2023-01-17	100	69	P	NABIL BIN MOHAMMAD AZMI	6	7	1
320	N119690	2023-01-17	13	56	P	LAM CHENSHEN	11	8	1
321	N776130	2023-01-17	50	65	P	LAM CHENSHEN	11	14	1
322	M765722	2023-01-20	115	59	L	LENNY SURIANI SAFRI	30	15	1
323	N885955	2023-01-20	445	31	L	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	19	1
324	N884786	2023-01-25	315	55	P	MOHD RAZIF BIN MOHAMAD YUNUS	26	10	1
325	N884786	2023-01-25	315	55	P	MOHD RAZIF BIN MOHAMAD YUNUS	26	4	1
326	N839477	2023-01-26	50	41	L	MAE-LYNN CATHERINE BASTION	11	23	1
327	N827718	2022-12-13	210	44	P	SALINA HUSAIN	26	15	1
328	N827718	2022-12-13	210	44	P	SALINA HUSAIN	26	8	1
329	N827718	2022-12-13	210	44	P	SALINA HUSAIN	26	12	1
330	N827718	2022-12-13	210	44	P	SALINA HUSAIN	26	7	1
331	N827718	2022-12-13	210	44	P	SALINA HUSAIN	26	22	1
332	N876459	2022-12-22	600	54	L	KAMALANATHAN A/L PALANIANDY	10	4	1
333	M624524	2022-12-30	40	62	P	RUPINI YOGESVARAN	11	3	1
334	N794172	2023-01-05	25	64	L	OTHMALIZA BINTI OTHMAN	26	3	1
335	N844693	2023-01-12	30	75	L	RUPINI YOGESVARAN	11	24	1
336	N849740	2023-01-12	30	80	P	MUHAMMAD FATHI BIN HAYYUN	14	1	1
337	N849740	2023-01-12	30	80	P	MUHAMMAD FATHI BIN HAYYUN	14	24	1
338	N885561	2023-01-12	34	39	L	AZLANUDIN BIN AZMAN	26	18	1
339	M802427	2023-01-16	220	42	P	SHALIMAR BT ABDULLAH	7	4	1
340	M013482	2023-01-18	30	72	L	MAE-LYNN CATHERINE BASTION	26	20	1
341	N199135	2023-01-19	115	19	L	BENJIE LAW ZI YUAN	9	17	1
342	N381559	2023-01-19	230	11	P	RIFQAH BINTI NORDIN	9	13	1
343	M621604	2023-01-20	520	69	P	AZLANUDIN BIN AZMAN	13	6	1
344	N517949	2023-01-20	145	73	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	1	1
345	N383847	2023-01-21	25	63	L	LENNY SURIANI SAFRI	30	14	1
346	N378118	2023-01-25	255	83	L	AHMAD FAIZ MOHAMED KHALIL	7	16	1
347	N820811	2023-01-25	30	18	L	AHMAD TARMIZI BIN MOHAMMAD	30	23	1
348	N793019	2023-01-26	240	24	L	BADRUL AKMAL HISHAM B. MD. YUSOFF	23	5	1
349	N850903	2023-01-26	310	13	P	ASMA BINTI ABDULLAH	26	10	1
350	N886660	2023-01-26	240	8	P	AZIZI BIN ABU BAKAR	10	16	1
351	M139357	2022-10-18	20	72	P	LAM CHENSHEN	11	8	1
352	M751403	2022-11-01	40	71	L	LAM CHENSHEN	11	1	1
353	M758124	2022-11-01	45	71	P	LAM CHENSHEN	11	22	1
354	N883627	2022-12-21	210	35	P	AZIZI BIN ABU BAKAR	26	16	1
355	N882570	2023-01-05	100	41	L	NIK RITZA KOSAI BIN NIK MAHMOOD	26	18	1
356	M752515	2023-01-11	100	72	L	NOR HAZLA BINTI MOHAMED HAFLAH	13	25	1
357	N782733	2023-01-13	40	69	L	LAM CHENSHEN	11	5	1
358	N873245	2023-01-13	310	46	L	MAE-LYNN CATHERINE BASTION	11	5	1
359	N886135	2023-01-18	105	64	L	MAE-LYNN CATHERINE BASTION	11	21	1
360	N886135	2023-01-18	105	64	L	MAE-LYNN CATHERINE BASTION	11	12	1
361	N181414	2023-01-24	200	33	P	BOO HAN SIN	8	4	1
362	N788305	2023-01-25	45	11	L	MUHD KAMAL MUHD ABDUL JAMIL	17	15	1
363	N788305	2023-01-25	45	11	L	MUHD KAMAL MUHD ABDUL JAMIL	17	17	1
364	N857542	2023-01-25	440	8	P	ABDUL HALIM BIN ABD RASHID	17	10	1
365	M872571	2023-01-26	450	41	P	NOR HAZLA BINTI MOHAMED HAFLAH	13	8	1
366	N874332	2023-01-26	240	53	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	18	1
367	N632395	2023-01-29	335	44	P	BOO HAN SIN	8	13	1
368	N188742	2023-01-30	30	47	P	SHALIMAR BT ABDULLAH	26	14	1
369	N886564	2023-01-30	106	26	P	WAN HASLINA BT WAN ABDUL HALIM	26	12	1
370	N000113	2022-11-03	30	74	P	CHENG TECK CHEE	11	3	1
371	M052971	2022-11-16	30	82	P	CHENG TECK CHEE	11	11	1
372	M926909	2022-11-16	35	83	P	CHENG TECK CHEE	11	5	1
373	N081554	2022-11-16	43	68	P	CHENG TECK CHEE	11	1	1
374	N782887	2022-11-16	100	69	L	CHENG TECK CHEE	11	11	1
375	N647833	2022-12-08	55	7	L	GOH BEE SEE	26	20	1
376	N812571	2022-12-13	20	3	L	GOH BEE SEE	26	16	1
377	M655270	2022-12-15	25	55	P	CHENG TECK CHEE	11	6	1
378	N874035	2022-12-16	330	36	L	MOHD YAZID BIN BAJURI	1	9	1
379	N881331	2022-12-30	849	33	L	MOHD YAZID BIN BAJURI	1	1	1
380	N881331	2022-12-30	849	33	L	MOHD YAZID BIN BAJURI	1	9	1
381	N843798	2023-01-03	40	60	P	OTHMALIZA BINTI OTHMAN	11	8	1
382	M112343	2023-01-05	19	69	P	CHENG TECK CHEE	11	15	1
383	N611615	2023-01-06	25	75	P	CHENG TECK CHEE	11	7	1
384	N876883	2023-01-06	41	75	L	CHENG TECK CHEE	11	11	1
385	N175343	2023-01-11	100	40	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	22	1
386	M895617	2023-01-13	150	40	P	OTHMALIZA BINTI OTHMAN	11	7	1
387	N379931	2023-01-13	120	61	P	OTHMALIZA BINTI OTHMAN	11	20	1
388	N251736	2023-01-16	215	49	L	GUHAN A/L MUTHKUMARAN	27	3	1
389	N874589	2023-01-17	45	69	L	CHENG TECK CHEE	11	16	1
390	N761695	2023-01-25	415	26	L	MOHD HISAM BIN MOHD ARIFFIN	22	12	1
391	N886331	2023-01-25	100	30	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	5	1
392	N227018	2023-01-27	200	65	L	NIK ALIF AZRIQ B NIK ABDULLAH	1	20	1
393	N539901	2023-01-27	50	36	P	NIK ALIF AZRIQ B NIK ABDULLAH	14	25	1
394	N648871	2023-01-27	20	57	P	MOHD YAZID BIN BAJURI	14	8	1
395	N885677	2023-01-27	200	68	L	DANIAL FA-IZ BIN IBRAHIM	14	17	1
396	N830313	2023-01-29	200	28	L	GUHAN A/L MUTHKUMARAN	27	3	1
397	N829137	2023-01-30	525	50	P	HAIRULFAIZI BIN HARON	5	21	1
398	N885678	2023-01-31	30	34	P	TAN JIN AUN	26	16	1
399	M969242	2022-08-08	30	71	P	NUR SHAHIRAH BINTI AMIR HAMZAH	11	3	1
400	M337700	2022-11-01	18	68	P	LAM CHENSHEN	11	17	1
401	N728356	2022-11-18	25	73	P	NUR SHAHIRAH BINTI AMIR HAMZAH	11	3	1
402	N182614	2022-12-06	20	87	L	LAM CHENSHEN	11	8	1
403	N881212	2022-12-06	210	61	P	NOR HAMDAN BIN MOHAMAD YAHAYA	26	9	1
404	M913225	2022-12-27	26	73	P	LAM CHENSHEN	11	15	1
405	N400856	2022-12-27	45	69	P	LAM CHENSHEN	11	22	1
406	M909848	2023-01-03	925	20	P	NUR AFDZILLAH ABDUL RAHMAN	6	15	1
407	M909848	2023-01-03	925	20	P	NUR AFDZILLAH ABDUL RAHMAN	6	5	1
408	N117344	2023-01-09	45	76	P	LENNY SURIANI SAFRI	30	5	1
409	N885504	2023-01-11	200	27	P	MOHD RAZIF BIN MOHAMAD YUNUS	26	13	1
410	N780373	2023-01-12	120	73	P	NUR SHAHIRAH BINTI AMIR HAMZAH	11	4	1
411	N739651	2023-01-18	230	45	L	MOHD YAZID BIN BAJURI	26	15	1
412	N394779	2023-01-19	30	69	P	NUR SHAHIRAH BINTI AMIR HAMZAH	11	2	1
413	M685886	2023-01-27	35	51	P	MAE-LYNN CATHERINE BASTION	11	13	1
414	N231663	2023-01-27	30	67	L	WAN HASLINA BT WAN ABDUL HALIM	11	17	1
415	N866890	2023-01-27	217	73	L	LAM CHENSHEN	11	17	1
416	N886561	2023-01-30	25	38	P	LENNY SURIANI SAFRI	30	15	1
417	N883386	2022-12-20	40	9	L	SYED NABIL BIN SYED OMAR	26	9	1
418	N340763	2022-12-22	45	78	P	CHENG TECK CHEE	11	2	1
419	N863535	2022-12-22	155	57	L	ISMAIL BIN SAGAP	26	7	1
420	N558938	2023-01-09	115	67	P	JAMARI BIN SAPUAN	26	20	1
421	M512650	2023-01-26	25	47	P	NORLIA BT. ABDULLAH	26	9	1
422	N878206	2023-01-27	454	73	P	JEGAN A/L THANABALAN	10	19	1
423	N886833	2023-01-27	130	66	P	SHALIMAR BT ABDULLAH	7	17	1
424	M449736	2023-01-30	125	67	L	LENNY SURIANI SAFRI	30	8	1
425	N118633	2023-01-30	245	20	L	ELAINE SOH ZI FAN	7	14	1
426	N317198	2023-01-30	50	55	L	LENNY SURIANI SAFRI	30	16	1
427	M477770	2023-01-31	520	27	L	AHMAD FARIHAN BIN MOHD DON	23	20	1
428	N203678	2023-01-31	20	72	L	SUZLIZA SHUKOR	13	6	1
429	N886459	2023-01-31	130	26	L	SHALIMAR BT ABDULLAH	26	15	1
430	N887024	2023-01-31	130	59	P	SHALIMAR BT ABDULLAH	26	1	1
431	M672299	2023-02-02	20	69	P	FARIZAL BIN FADZIL	10	21	1
432	M879879	2023-02-02	25	21	P	SALINA HUSAIN	26	8	1
433	M889737	2023-02-02	8	68	P	SUZLIZA SHUKOR	13	13	1
434	N686330	2023-02-02	220	37	L	SALINA HUSAIN	26	12	1
435	N686330	2023-02-02	220	37	L	SALINA HUSAIN	26	25	1
436	N690686	2023-02-02	50	67	P	LENNY SURIANI SAFRI	30	13	1
437	N885988	2023-02-02	200	55	L	SALINA HUSAIN	26	15	1
438	N885988	2023-02-02	200	55	L	SALINA HUSAIN	26	16	1
439	N887037	2023-02-02	30	65	P	MUHAMMAD FATHI BIN HAYYUN	14	21	1
440	N886564	2023-02-03	145	26	P	WAN HASLINA BT WAN ABDUL HALIM	26	13	1
441	N886564	2023-02-03	145	26	P	WAN HASLINA BT WAN ABDUL HALIM	26	4	1
442	M615889	2022-11-01	50	74	L	OTHMALIZA BINTI OTHMAN	11	9	1
443	M463881	2022-11-23	17	77	P	CHENG TECK CHEE	11	5	1
444	N018967	2022-11-23	30	72	P	CHENG TECK CHEE	11	19	1
445	N777814	2022-12-28	25	6	P	OTHMALIZA BINTI OTHMAN	11	12	1
446	N884188	2023-01-06	40	2	P	SAFINAZ BINTI MOHD KHIALDIN	11	17	1
447	N826891	2023-01-11	45	62	L	CHENG TECK CHEE	11	3	1
448	N826891	2023-01-11	45	62	L	CHENG TECK CHEE	11	9	1
449	N878210	2023-01-11	100	36	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	12	1
450	N885532	2023-01-11	100	45	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	17	1
451	M825434	2023-01-18	120	70	L	OTHMALIZA BINTI OTHMAN	11	23	1
452	N649889	2023-01-25	150	27	P	MOHD HISAM BIN MOHD ARIFFIN	22	2	1
453	N373168	2023-01-26	215	73	P	NANI HARLINA BT MD. LATAR	4	22	1
454	N851693	2023-01-26	250	71	P	SHAHRUN NIZA BIN ABDULLAH SUHAIMI	4	20	1
455	N851693	2023-01-26	250	71	P	SHAHRUN NIZA BIN ABDULLAH SUHAIMI	4	13	1
456	N001791	2023-01-30	325	49	P	GUHAN A/L MUTHKUMARAN	27	6	1
457	N108791	2023-01-30	25	58	P	CHENG TECK CHEE	11	25	1
458	N721660	2023-01-31	100	5	L	AZIZI BIN ABU BAKAR	26	22	1
459	M352158	2023-02-02	43	71	P	CHENG TECK CHEE	11	23	1
460	M449966	2023-02-02	125	75	P	CHENG TECK CHEE	11	4	1
461	N270211	2023-02-02	145	35	L	BENJIE LAW ZI YUAN	9	3	1
462	N824728	2023-02-02	200	19	P	MOHD HISAM BIN MOHD ARIFFIN	22	16	1
463	N793587	2023-02-03	140	31	P	NIK ALIF AZRIQ B NIK ABDULLAH	14	16	1
464	N858892	2023-02-03	130	67	L	OTHMALIZA BINTI OTHMAN	11	7	1
465	N864316	2023-02-04	120	21	L	BENJIE LAW ZI YUAN	9	15	1
466	M503446	2023-02-05	130	36	P	BENJIE LAW ZI YUAN	9	14	1
467	N101608	2023-02-05	920	56	P	HAIRULFAIZI BIN HARON	5	20	1
468	N101608	2023-02-05	920	56	P	HAIRULFAIZI BIN HARON	5	8	1
469	N101608	2023-02-05	920	56	P	HAIRULFAIZI BIN HARON	5	9	1
470	M438459	2023-02-07	36	65	P	CHENG TECK CHEE	11	10	1
471	N625110	2022-12-01	25	81	L	RUPINI YOGESVARAN	11	25	1
472	N860989	2022-12-08	130	73	P	MARINA BT MAT BAKI	26	15	1
473	M945692	2022-12-28	20	52	L	JEMAIMA BTE CHE HAMZAH	26	10	1
474	N313267	2023-01-05	25	69	P	RUPINI YOGESVARAN	11	19	1
475	N542473	2023-01-05	25	62	L	RUPINI YOGESVARAN	11	9	1
476	N609786	2023-01-11	130	78	P	WAN HASLINA BT WAN ABDUL HALIM	26	3	1
477	N878173	2023-01-12	27	52	P	RUPINI YOGESVARAN	11	21	1
478	N802139	2023-01-13	200	35	L	NIK RITZA KOSAI BIN NIK MAHMOOD	26	14	1
479	M748017	2023-01-16	25	63	P	WAN HASLINA BT WAN ABDUL HALIM	26	11	1
480	M942864	2023-01-26	115	58	L	JEMAIMA BTE CHE HAMZAH	11	10	1
481	M942864	2023-01-26	115	58	L	JEMAIMA BTE CHE HAMZAH	11	14	1
482	M198710	2023-01-30	255	73	P	RIZAL BIN ABDUL RANI	2	9	1
483	M944441	2023-01-30	215	70	P	RIZAL BIN ABDUL RANI	2	17	1
484	N212286	2023-02-01	135	64	P	ADI SYAZNI BIN MUHAMMED	3	10	1
485	N212286	2023-02-01	135	64	P	ADI SYAZNI BIN MUHAMMED	3	12	1
486	N041210	2023-02-02	330	28	L	AZIZI BIN ABU BAKAR	10	16	1
487	M372600	2023-02-03	310	60	L	SYED MUHAMMAD SYAFIQ ALJUNID	1	6	1
488	M372600	2023-02-03	310	60	L	SYED MUHAMMAD SYAFIQ ALJUNID	1	5	1
489	N885679	2023-02-03	105	67	P	RUPINI YOGESVARAN	11	23	1
490	M606708	2022-08-22	105	72	P	MAE-LYNN CATHERINE BASTION	11	24	1
491	N861916	2022-12-27	500	64	L	NANI HARLINA BT MD. LATAR	26	11	1
492	N861916	2022-12-27	500	64	L	NANI HARLINA BT MD. LATAR	26	24	1
493	N876022	2023-01-05	45	78	L	AZLANUDIN BIN AZMAN	26	24	1
494	N848828	2023-01-25	120	46	L	WAN HASLINA BT WAN ABDUL HALIM	26	6	1
495	N870448	2023-01-25	255	65	L	MAE-LYNN CATHERINE BASTION	11	8	1
496	M614625	2023-01-27	200	74	P	YONG MENG HSIEN	11	9	1
497	M709820	2023-01-27	315	73	L	WAN HASLINA BT WAN ABDUL HALIM	26	3	1
498	N842753	2023-01-27	211	70	L	WAN HASLINA BT WAN ABDUL HALIM	11	22	1
499	N595604	2023-01-30	25	30	P	YONG MENG HSIEN	11	21	1
500	N783872	2023-01-31	110	66	L	NABIL BIN MOHAMMAD AZMI	6	8	1
501	N040287	2023-02-02	135	73	L	MAE-LYNN CATHERINE BASTION	11	24	1
502	N870728	2023-02-02	220	71	P	WAN HASLINA BT WAN ABDUL HALIM	11	7	1
503	N880001	2023-02-02	220	46	L	BADRUL AKMAL HISHAM B. MD. YUSOFF	26	15	1
504	N225098	2023-02-03	230	57	P	MAE-LYNN CATHERINE BASTION	11	10	1
505	N175280	2023-02-08	240	74	L	LENNY SURIANI SAFRI	30	21	1
506	N887321	2023-02-08	245	50	P	ISMAIL BIN SAGAP	26	17	1
507	N877954	2022-10-17	25	1	L	MARJMIN BINTI OSMAN	26	12	1
508	N686838	2022-12-19	25	46	P	SHALIMAR BT ABDULLAH	26	23	1
509	N879907	2023-01-17	257	25	P	SHALIMAR BT ABDULLAH	26	6	1
510	N842507	2023-01-19	45	62	L	OTHMALIZA BINTI OTHMAN	11	14	1
511	N281905	2023-01-27	200	54	L	AZIZI BIN ABU BAKAR	10	16	1
512	M817866	2023-01-31	220	56	L	SHALIMAR BT ABDULLAH	7	23	1
513	N738406	2023-02-02	120	63	L	CHENG TECK CHEE	11	16	1
514	N886115	2023-02-06	130	67	P	MOHD NAZIMI BIN ABD JABAR	9	12	1
515	M963081	2023-02-07	200	40	P	JOTHI RAAMAHLINGAM A/L RAJARAN	9	3	1
516	N876781	2023-02-07	130	31	P	JOTHI RAAMAHLINGAM A/L RAJARAN	9	17	1
517	N885276	2023-02-07	305	38	L	AZLANUDIN BIN AZMAN	13	5	1
518	N179344	2023-02-08	300	51	L	LENNY SURIANI SAFRI	30	23	1
519	N222276	2023-02-08	405	63	L	BADRUL AKMAL HISHAM B. MD. YUSOFF	23	13	1
520	N818968	2023-02-08	210	60	L	LENNY SURIANI SAFRI	30	3	1
521	N884636	2023-02-08	320	14	P	AZIZI BIN ABU BAKAR	10	7	1
522	N004653	2023-02-09	25	64	L	NUR SHAHIRAH BINTI AMIR HAMZAH	11	5	1
523	N505778	2023-02-09	200	84	P	NORLIA BT. ABDULLAH	26	20	1
524	N505778	2023-02-09	200	84	P	NORLIA BT. ABDULLAH	26	19	1
525	N822130	2023-02-09	30	64	L	SUZLIZA SHUKOR	13	14	1
526	N845948	2023-02-09	30	50	P	MAE-LYNN CATHERINE BASTION	11	7	1
527	M854225	2022-10-14	30	72	P	LAM CHENSHEN	11	3	1
528	M832717	2022-10-18	50	78	L	LAM CHENSHEN	11	20	1
529	M957747	2022-10-18	30	67	P	LAM CHENSHEN	11	11	1
530	N853182	2022-10-27	35	73	P	LAM CHENSHEN	11	17	1
531	M817569	2022-11-03	30	76	L	LAM CHENSHEN	11	12	1
532	N759967	2022-11-08	35	74	L	LAM CHENSHEN	11	20	1
533	M286949	2022-11-10	32	76	P	LAM CHENSHEN	11	11	1
534	N871438	2022-12-08	334	51	L	ISMAIL BIN SAGAP	26	4	1
535	N421657	2022-12-21	100	11	L	ABDUL HALIM BIN ABD RASHID	26	10	1
536	N112629	2023-01-05	100	81	P	SAFINAZ BINTI MOHD KHIALDIN	11	24	1
537	N885673	2023-01-20	100	56	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	17	1
538	N885673	2023-01-20	100	56	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	8	1
539	N886815	2023-01-31	100	34	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	9	1
540	N876183	2023-02-03	150	42	L	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	12	1
541	N886339	2023-02-10	50	50	P	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	5	1
542	N019198	2022-11-23	33	76	L	CHENG TECK CHEE	11	18	1
543	N371434	2022-11-24	27	71	L	CHENG TECK CHEE	11	6	1
544	N803999	2022-11-24	40	70	P	CHENG TECK CHEE	11	6	1
545	N538946	2022-11-30	23	87	L	CHENG TECK CHEE	11	10	1
546	N875860	2022-12-16	257	36	L	AZLANUDIN BIN AZMAN	26	14	1
547	M627740	2022-12-22	100	71	P	CHENG TECK CHEE	11	5	1
548	N784674	2022-12-29	35	63	L	CHENG TECK CHEE	11	12	1
549	N038285	2023-01-04	245	37	L	MOHD RAZIF BIN MOHAMAD YUNUS	26	19	1
550	N690722	2023-01-09	35	59	L	OTHMALIZA BINTI OTHMAN	11	7	1
551	N877142	2023-01-10	130	53	P	OTHMALIZA BINTI OTHMAN	11	18	1
552	N885345	2023-01-11	38	71	L	CHENG TECK CHEE	11	25	1
553	N885481	2023-01-11	130	41	L	ROHAIZAK BIN MUHAMMAD	26	20	1
554	N875064	2023-01-18	35	68	P	OTHMALIZA BINTI OTHMAN	11	7	1
555	N198176	2023-01-31	430	15	P	AZIZI BIN ABU BAKAR	26	6	1
556	N825171	2023-02-02	30	78	P	CHENG TECK CHEE	11	1	1
557	M001545	2023-02-08	105	62	L	OTHMALIZA BINTI OTHMAN	11	9	1
558	N877571	2023-02-08	40	72	P	CHENG TECK CHEE	11	11	1
559	N188737	2023-02-10	40	37	L	MOHD YAZID BIN BAJURI	14	4	1
560	N647236	2023-02-12	125	72	P	MOHD YAZID BIN BAJURI	14	16	1
561	M259684	2023-02-13	100	60	L	MOHD YAZID BIN BAJURI	14	18	1
562	N110034	2023-02-13	627	41	P	MOHD YAZID BIN BAJURI	26	15	1
563	N865292	2023-02-13	205	25	P	SALINA HUSAIN	26	22	1
564	N888040	2023-02-13	615	36	L	ISMAIL BIN SAGAP	26	20	1
565	N876420	2022-12-29	155	26	L	SALINA HUSAIN	26	17	1
566	M727065	2023-01-03	43	87	L	RUPINI YOGESVARAN	11	18	1
567	M461703	2023-01-10	25	79	P	RUPINI YOGESVARAN	11	17	1
568	N070662	2023-01-10	30	74	L	RUPINI YOGESVARAN	11	3	1
569	M634156	2023-01-12	125	65	L	JEMAIMA BTE CHE HAMZAH	11	10	1
570	M706829	2023-01-12	45	57	L	RUPINI YOGESVARAN	11	2	1
571	M026662	2023-01-17	22	72	P	RUPINI YOGESVARAN	11	20	1
572	M965049	2023-01-17	110	73	P	RUPINI YOGESVARAN	11	10	1
573	N555456	2023-01-30	15	48	L	JEMAIMA BTE CHE HAMZAH	26	18	1
574	N627045	2023-02-10	38	70	P	TAN JIN AUN	26	7	1
575	N887430	2023-02-14	410	52	L	MOHD RAZIF BIN MOHAMAD YUNUS	26	22	1
576	N888233	2023-02-14	248	70	L	ISMAIL BIN SAGAP	26	5	1
577	N887056	2023-02-15	440	28	L	ROHAIZAK BIN MUHAMMAD	26	1	1
578	N887056	2023-02-15	440	28	L	ROHAIZAK BIN MUHAMMAD	26	8	1
579	M640876	2022-08-15	30	77	P	NUR SHAHIRAH BINTI AMIR HAMZAH	11	25	1
580	N112673	2022-11-01	25	80	P	LAM CHENSHEN	11	9	1
581	N879345	2022-11-04	29	74	L	WAN HASLINA BT WAN ABDUL HALIM	11	12	1
582	M841490	2023-01-05	30	80	L	MAE-LYNN CATHERINE BASTION	11	10	1
583	N884937	2023-01-05	100	48	P	AZLANUDIN BIN AZMAN	26	6	1
584	N805029	2023-01-10	45	68	P	WAN HASLINA BT WAN ABDUL HALIM	11	9	1
585	N881258	2023-01-11	100	43	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	17	1
586	N875655	2023-01-16	100	28	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	22	1
587	N886017	2023-01-17	20	68	P	LAM CHENSHEN	11	24	1
588	N847982	2023-01-30	30	34	P	LAM CHENSHEN	11	20	1
589	M944774	2023-02-08	20	47	L	MAE-LYNN CATHERINE BASTION	11	2	1
590	N858315	2023-02-13	25	77	L	WAN HASLINA BT WAN ABDUL HALIM	11	5	1
591	N882404	2023-02-13	44	58	L	LAM CHENSHEN	11	21	1
592	M974075	2023-02-14	555	63	L	NURAYUB MD ALI	5	3	1
593	N876872	2023-02-14	310	62	L	MAE-LYNN CATHERINE BASTION	26	1	1
594	N870447	2023-02-15	100	41	P	ROHAIZAK BIN MUHAMMAD	26	21	1
595	N870447	2023-02-15	100	41	P	ROHAIZAK BIN MUHAMMAD	26	22	1
596	N886564	2023-02-16	150	26	P	WAN HASLINA BT WAN ABDUL HALIM	26	24	1
597	N886564	2023-02-16	150	26	P	WAN HASLINA BT WAN ABDUL HALIM	26	23	1
598	N886564	2023-02-16	150	26	P	WAN HASLINA BT WAN ABDUL HALIM	26	4	1
599	N403122	2022-12-28	30	66	P	MAE-LYNN CATHERINE BASTION	26	5	1
600	N883525	2023-02-07	20	66	P	NIK KAMARUL ARIF BIN NIK KAMRULZAMAN	14	5	1
601	M864901	2023-02-10	145	50	P	OTHMALIZA BINTI OTHMAN	26	11	1
602	N305418	2022-11-21	135	22	L	BADRUL AKMAL HISHAM B. MD. YUSOFF	26	11	1
603	N723229	2023-01-18	20	42	P	JAMARI BIN SAPUAN	26	4	1
604	N885864	2023-01-18	100	53	P	NIK RITZA KOSAI BIN NIK MAHMOOD	26	7	1
605	N886063	2023-02-19	345	70	L	FARIZAL BIN FADZIL	5	11	1
606	M284278	2023-02-17	30	54	L	KHOO HAU CHUN	5	17	1
607	M905090	2023-02-20	700	54	L	HAIRULFAIZI BIN HARON	5	6	1
608	N404547	2023-02-02	45	71	L	SUZLIZA SHUKOR	13	4	1
609	N381559	2023-02-20	100	11	P	RIFQAH BINTI NORDIN	9	7	1
610	N880545	2023-02-20	45	13	P	RIFQAH BINTI NORDIN	9	24	1
611	N847732	2023-02-22	440	30	L	BADRUL AKMAL HISHAM B. MD. YUSOFF	23	5	1
612	N888360	2023-02-22	123	67	P	AHMAD FARIHAN BIN MOHD DON	23	13	1
613	M295852	2023-02-23	125	73	P	MOHAMAD AZIM BIN MD IDRIS	30	6	1
614	M727969	2023-02-23	130	63	L	MOHAMAD AZIM BIN MD IDRIS	30	21	1
615	N174787	2023-02-23	228	58	P	MOHAMAD AZIM BIN MD IDRIS	30	16	1
616	N218034	2023-02-23	145	31	P	MOHAMAD AZIM BIN MD IDRIS	30	18	1
617	N695778	2023-02-23	130	31	L	MOHAMAD AZIM BIN MD IDRIS	30	6	1
618	N883963	2023-02-23	140	70	P	MOHAMAD AZIM BIN MD IDRIS	30	23	1
619	N884246	2023-02-23	220	48	L	AZLANUDIN BIN AZMAN	13	1	1
620	N888550	2023-02-23	220	5	L	MOHD NAZIMI BIN ABD JABAR	9	24	1
621	N838724	2021-10-12	105	33	P	AZLANUDIN BIN AZMAN	8	6	1
622	N850715	2023-02-09	40	14	P	MOHAMED HAFIZUDIN ABDULLAH SANI	13	15	1
623	N885391	2023-02-09	520	15	L	NOR HAZLA BINTI MOHAMED HAFLAH	13	1	1
624	N852835	2023-02-15	135	68	P	LENNY SURIANI SAFRI	30	14	1
625	M169330	2023-02-17	140	64	P	AZLANUDIN BIN AZMAN	8	17	1
626	M169330	2023-02-17	140	64	P	AZLANUDIN BIN AZMAN	8	11	1
627	N879494	2023-02-17	320	51	L	LENNY SURIANI SAFRI	30	6	1
628	N856127	2023-02-20	120	73	L	LENNY SURIANI SAFRI	30	1	1
629	N887725	2023-02-20	100	65	P	LENNY SURIANI SAFRI	30	16	1
630	N888755	2023-02-21	130	50	L	ELAINE SOH ZI FAN	17	17	1
631	N561008	2023-02-22	230	48	L	LENNY SURIANI SAFRI	30	8	1
632	N883367	2023-02-01	220	23	P	NANI HARLINA BT MD. LATAR	4	9	1
633	N655828	2023-02-21	150	55	L	NANI HARLINA BT MD. LATAR	4	13	1
634	N824908	2023-02-21	414	44	P	NANI HARLINA BT MD. LATAR	4	1	1
635	N824908	2023-02-21	414	44	P	NANI HARLINA BT MD. LATAR	4	12	1
636	N824908	2023-02-21	414	44	P	NANI HARLINA BT MD. LATAR	4	13	1
637	N849886	2023-02-23	200	19	L	MOHD HISAM BIN MOHD ARIFFIN	22	1	1
638	N802398	2023-02-24	150	36	P	GUHAN A/L MUTHKUMARAN	27	22	1
639	N739667	2023-02-25	410	22	P	RAMA KRSNA A/L RAJANDRAM	9	9	1
640	M810264	2023-02-26	215	42	P	GUHAN A/L MUTHKUMARAN	27	21	1
641	N889379	2023-02-27	220	62	L	MOHD HISAM BIN MOHD ARIFFIN	22	17	1
642	N859308	2023-02-17	340	14	L	AZIZI BIN ABU BAKAR	10	5	1
643	N015851	2023-02-20	145	70	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	4	1
644	N855210	2023-02-20	215	77	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	5	1
645	M621729	2023-02-21	145	49	P	NORLIA BT. ABDULLAH	3	20	1
646	M621729	2023-02-21	145	49	P	NORLIA BT. ABDULLAH	3	7	1
647	M621729	2023-02-21	145	49	P	NORLIA BT. ABDULLAH	3	11	1
648	N885275	2023-02-21	200	62	P	NORLIA BT. ABDULLAH	3	23	1
649	N885275	2023-02-21	200	62	P	NORLIA BT. ABDULLAH	3	19	1
650	N885275	2023-02-21	200	62	P	NORLIA BT. ABDULLAH	3	25	1
651	M695205	2023-02-27	110	88	L	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	20	1
652	M811114	2023-02-27	221	90	P	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	1	1
653	N336530	2023-02-23	35	72	L	FAM XENG INN	6	1	1
654	N336530	2023-02-23	35	72	L	FAM XENG INN	6	17	1
655	N883956	2023-02-23	405	40	L	KHOO HAU CHUN	6	21	1
656	N877912	2023-02-27	515	59	L	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	4	1
657	N889813	2023-03-01	20	67	L	LENNY SURIANI SAFRI	30	9	1
658	N685787	2023-02-08	40	69	L	MOHAMAD AZIM BIN MD IDRIS	30	22	1
659	M014406	2023-02-14	50	80	L	MUHAMMAD ILYAAS BIN MUHAMMED ALI NOOR	14	10	1
660	N527406	2023-02-17	445	11	P	AZIZI BIN ABU BAKAR	10	14	1
661	N873399	2023-02-22	110	16	P	BENJIE LAW ZI YUAN	9	16	1
662	M221027	2023-02-27	20	54	P	SHALIMAR BT ABDULLAH	14	12	1
663	N564885	2023-02-27	440	70	P	AHMAD FARIHAN BIN MOHD DON	23	18	1
664	N226629	2023-03-01	200	62	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	23	1
665	N611642	2023-03-01	45	37	P	ELAINE SOH ZI FAN	7	18	1
666	N885695	2023-03-01	125	69	L	LENNY SURIANI SAFRI	30	2	1
667	N872735	2023-03-02	130	49	L	RIFQAH BINTI NORDIN	9	4	1
668	N889975	2023-03-02	330	77	L	BOO HAN SIN	13	6	1
669	N332349	2023-03-01	140	46	P	BOO HAN SIN	8	2	1
670	M261090	2023-03-02	250	62	L	BOO HAN SIN	8	13	1
671	N760821	2023-03-02	100	55	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	3	1
672	N888362	2023-03-02	300	44	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	3	1
673	N889451	2023-02-26	320	62	P	NANI HARLINA BT MD. LATAR	4	25	1
674	M369752	2023-03-01	115	70	L	GUHAN A/L MUTHKUMARAN	27	25	1
675	M369752	2023-03-01	115	70	L	GUHAN A/L MUTHKUMARAN	27	14	1
676	M992979	2023-03-01	125	42	L	GUHAN A/L MUTHKUMARAN	27	25	1
677	N831603	2023-03-02	430	25	P	SYED NABIL BIN SYED OMAR	9	17	1
678	M008438	2023-03-04	550	67	P	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	9	1
679	N884386	2023-03-04	400	61	L	TAN JIN AUN	22	8	1
680	N003358	2023-03-06	330	55	L	AZMI BIN BAHARUDIN	22	9	1
681	N289538	2023-02-17	325	14	L	AZIZI BIN ABU BAKAR	10	7	1
682	N350973	2023-02-17	240	12	P	AZIZI BIN ABU BAKAR	10	6	1
683	N560753	2023-02-28	115	77	P	GILLIAN MARIE CAUNTER	3	9	1
684	N560753	2023-02-28	115	77	P	GILLIAN MARIE CAUNTER	3	16	1
685	N560753	2023-02-28	115	77	P	GILLIAN MARIE CAUNTER	3	22	1
686	N560753	2023-02-28	115	77	P	GILLIAN MARIE CAUNTER	3	21	1
687	N871505	2023-02-28	200	56	P	GILLIAN MARIE CAUNTER	3	19	1
688	N871505	2023-02-28	200	56	P	GILLIAN MARIE CAUNTER	3	21	1
689	N346533	2023-03-03	145	72	L	NOR HAMDAN BIN MOHAMAD YAHAYA	2	13	1
690	N864297	2023-03-03	320	79	L	NOR HAMDAN BIN MOHAMAD YAHAYA	2	18	1
691	N890204	2023-03-06	439	69	P	SYED MUHAMMAD SYAFIQ ALJUNID	1	15	1
692	N850246	2023-03-07	120	76	P	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	1	1
693	N275596	2023-03-07	105	42	L	LENNY SURIANI SAFRI	30	23	1
694	N856395	2023-03-07	50	55	P	LENNY SURIANI SAFRI	30	9	1
695	N809603	2023-02-14	30	34	P	ELAINE SOH ZI FAN	14	25	1
696	M373699	2023-02-20	625	57	P	NUR AFDZILLAH ABDUL RAHMAN	13	6	1
697	M604785	2023-02-22	55	50	P	MUHAMMAD ILYAAS BIN MUHAMMED ALI NOOR	14	15	1
698	M487251	2023-02-28	45	60	P	ELAINE SOH ZI FAN	14	13	1
699	N348086	2023-02-28	30	79	P	ELAINE SOH ZI FAN	14	14	1
700	N564340	2023-03-05	30	9	L	MARJMIN BINTI OSMAN	9	16	1
701	N564340	2023-03-05	30	9	L	MARJMIN BINTI OSMAN	9	22	1
702	N641425	2023-03-05	30	7	L	MARJMIN BINTI OSMAN	9	18	1
703	N641425	2023-03-05	30	7	L	MARJMIN BINTI OSMAN	9	7	1
704	M939765	2023-03-06	300	22	P	SYED NABIL BIN SYED OMAR	9	9	1
705	M603326	2023-03-07	345	53	P	AZIZI BIN ABU BAKAR	10	15	1
706	M762588	2023-03-07	205	67	P	AZIZI BIN ABU BAKAR	10	11	1
707	N613301	2023-03-07	210	72	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	16	1
708	N868305	2023-03-07	230	20	L	AHMAD FARIHAN BIN MOHD DON	23	15	1
709	N881483	2023-03-07	115	46	P	LENNY SURIANI SAFRI	30	15	1
710	N890423	2023-03-07	135	72	P	ELAINE SOH ZI FAN	14	22	1
711	N663727	2023-03-07	105	55	L	MOHAMED HAFIZUDIN ABDULLAH SANI	13	1	1
712	M462224	2023-03-09	215	79	P	NOR HAZLA BINTI MOHAMED HAFLAH	13	22	1
713	N862761	2023-03-09	100	59	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	24	1
714	N692997	2023-03-10	515	69	P	MOHAMAD AZIM BIN MD IDRIS	30	17	1
715	N890427	2023-03-11	700	62	P	RAZMAN BIN JARMIN	8	7	1
716	N884567	2023-03-03	115	69	P	MOHD YAZID BIN BAJURI	14	5	1
717	N810154	2023-03-06	230	39	L	GUHAN A/L MUTHKUMARAN	27	2	1
718	N098900	2023-03-08	150	76	L	GUHAN A/L MUTHKUMARAN	27	24	1
719	N782020	2023-03-08	125	28	L	MOHD YAZID BIN BAJURI	14	20	1
720	M869599	2023-03-09	145	46	P	GILLIAN MARIE CAUNTER	4	8	1
721	M869599	2023-03-09	145	46	P	GILLIAN MARIE CAUNTER	4	16	1
722	N209162	2023-03-09	123	41	P	GILLIAN MARIE CAUNTER	4	4	1
723	N559567	2023-03-09	130	9	P	RIFQAH BINTI NORDIN	9	6	1
724	N580367	2023-03-09	205	9	L	RIFQAH BINTI NORDIN	9	20	1
725	N127881	2023-03-10	115	74	L	MOHD HISAM BIN MOHD ARIFFIN	22	23	1
726	N339165	2023-03-12	110	75	L	MOHD HISAM BIN MOHD ARIFFIN	22	16	1
727	N842406	2023-02-17	100	27	P	AZIZI BIN ABU BAKAR	10	25	1
728	N842406	2023-02-17	450	27	P	AZIZI BIN ABU BAKAR	10	17	1
729	N842406	2023-02-17	100	27	P	AZIZI BIN ABU BAKAR	10	25	1
730	N842406	2023-02-17	450	27	P	AZIZI BIN ABU BAKAR	10	23	1
731	N873695	2023-02-28	140	56	P	NORLIA BT. ABDULLAH	3	23	1
732	N873695	2023-02-28	140	56	P	NORLIA BT. ABDULLAH	3	12	1
733	N873695	2023-02-28	140	56	P	NORLIA BT. ABDULLAH	3	9	1
734	M139022	2023-03-08	205	65	L	NOR HAMDAN BIN MOHAMAD YAHAYA	2	5	1
735	N883644	2023-03-08	155	60	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	25	1
736	N889414	2023-03-10	420	35	L	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	20	1
737	N890505	2023-03-10	155	50	L	SYED MUHAMMAD SYAFIQ ALJUNID	1	14	1
738	M173888	2023-03-13	120	84	L	NOR HAMDAN BIN MOHAMAD YAHAYA	2	16	1
739	N784698	2023-01-30	16	63	P	JUZAILY FEKRY LEONG	14	5	1
740	N126212	2023-02-17	300	70	P	AZIZI BIN ABU BAKAR	10	13	1
741	N356662	2023-03-09	15	12	P	SHALIMAR BT ABDULLAH	14	23	1
742	M659312	2023-03-11	430	62	L	SYED NABIL BIN SYED OMAR	9	12	1
743	M659312	2023-03-11	430	62	L	SYED NABIL BIN SYED OMAR	9	21	1
744	M659312	2023-03-11	430	62	L	SYED NABIL BIN SYED OMAR	9	21	1
745	N014874	2023-03-11	50	19	P	BENJIE LAW ZI YUAN	9	9	1
746	N889819	2023-03-11	650	84	L	RAZMAN BIN JARMIN	13	10	1
747	N141902	2023-03-14	115	73	L	BOO HAN SIN	13	25	1
748	N737904	2023-03-14	300	58	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	20	1
749	N833668	2023-03-14	105	65	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	20	1
750	N859350	2023-03-14	40	47	P	LENNY SURIANI SAFRI	30	6	1
751	N539524	2023-03-13	630	52	L	NURAYUB MD ALI	5	14	1
752	N796765	2023-03-17	550	80	L	AZLANUDIN BIN AZMAN	8	9	1
753	N796765	2023-03-17	550	80	L	AZLANUDIN BIN AZMAN	8	18	1
754	N796765	2023-03-17	550	80	L	AZLANUDIN BIN AZMAN	8	3	1
755	N881153	2023-03-17	200	29	L	NOR HAZLA BINTI MOHAMED HAFLAH	13	16	1
756	N891238	2023-03-17	100	67	P	NOR HAZLA BINTI MOHAMED HAFLAH	13	14	1
757	N758405	2023-03-18	425	62	P	BOO HAN SIN	8	17	1
758	N657783	2023-03-20	49	53	P	LENNY SURIANI SAFRI	30	10	1
759	N881378	2023-02-21	245	50	L	NANI HARLINA BT MD. LATAR	4	24	1
760	N881378	2023-02-21	245	50	L	NANI HARLINA BT MD. LATAR	4	7	1
761	N787164	2023-03-09	125	61	L	SHAHRUN NIZA BIN ABDULLAH SUHAIMI	4	11	1
762	M916338	2023-03-13	210	49	L	GUHAN A/L MUTHKUMARAN	27	16	1
763	N824353	2023-03-15	335	25	L	HAIRULFAIZI BIN HARON	5	10	1
764	N516953	2023-03-20	450	68	L	MOHD HISAM BIN MOHD ARIFFIN	22	17	1
765	N881113	2023-03-20	615	20	P	RAMA KRSNA A/L RAJANDRAM	9	3	1
766	N283466	2023-02-17	210	79	L	JEGAN A/L THANABALAN	10	5	1
767	N283466	2023-02-17	210	79	L	JEGAN A/L THANABALAN	10	14	1
768	N843409	2023-02-17	205	63	L	FARIZAL BIN FADZIL	10	6	1
769	N843409	2023-02-17	205	63	L	FARIZAL BIN FADZIL	10	20	1
770	M146828	2023-02-28	200	72	P	GILLIAN MARIE CAUNTER	3	10	1
771	M898656	2023-03-20	205	65	L	MUHAMMAD FATHI BIN HAYYUN	2	8	1
772	N205385	2023-03-20	220	61	P	RIZAL BIN ABDUL RANI	2	25	1
773	M125130	2023-03-21	400	67	L	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	6	1
774	N884158	2023-01-31	15	23	L	NUR AFDZILLAH ABDUL RAHMAN	6	14	1
775	N720778	2023-02-08	20	30	L	NUR AFDZILLAH ABDUL RAHMAN	6	24	1
776	N825170	2023-03-13	630	50	P	HAIRULFAIZI BIN HARON	5	3	1
777	M125990	2023-03-21	155	69	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	18	1
778	N883186	2023-02-17	218	47	P	AZIZI BIN ABU BAKAR	10	24	1
779	N187709	2023-03-09	125	46	P	MOHD NAZIMI BIN ABD JABAR	9	21	1
780	N238721	2023-03-09	115	39	P	MOHD NAZIMI BIN ABD JABAR	9	21	1
781	N828258	2023-03-14	1230	60	L	ADZIM POH YUEN WEN	13	16	1
782	M166416	2023-03-19	100	71	L	MOHD NAZIMI BIN ABD JABAR	9	5	1
783	N879348	2023-03-21	100	67	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	10	1
784	N252722	2023-03-22	240	41	P	AHMAD FARIHAN BIN MOHD DON	23	3	1
785	N860483	2023-03-22	1355	30	L	MUHAMMAD ILYAAS BIN MUHAMMED ALI NOOR	23	10	1
786	M696969	2023-03-21	30	65	L	ADZIM POH YUEN WEN	7	3	1
787	M918545	2023-03-22	600	53	P	NURAYUB MD ALI	5	8	1
788	N787610	2023-03-22	110	72	P	LENNY SURIANI SAFRI	30	21	1
789	N718113	2023-03-23	405	40	P	BOO HAN SIN	8	4	1
790	N771501	2023-03-09	445	57	L	SHAHRUN NIZA BIN ABDULLAH SUHAIMI	4	9	1
791	N771501	2023-03-09	445	57	L	SHAHRUN NIZA BIN ABDULLAH SUHAIMI	4	8	1
792	N890121	2023-03-09	45	14	L	NANI HARLINA BT MD. LATAR	4	8	1
793	M740032	2023-03-13	459	47	P	GUHAN A/L MUTHKUMARAN	27	24	1
794	N860411	2023-03-20	550	30	L	JOTHI RAAMAHLINGAM A/L RAJARAN	9	7	1
795	N865851	2023-03-22	217	32	P	GUHAN A/L MUTHKUMARAN	27	24	1
796	N891798	2023-03-27	135	50	L	MOHD HISAM BIN MOHD ARIFFIN	22	8	1
797	N134009	2023-02-17	415	16	P	JEGAN A/L THANABALAN	10	14	1
798	M463585	2023-02-28	120	59	P	NORLIA BT. ABDULLAH	3	8	1
799	M463585	2023-02-28	120	59	P	NORLIA BT. ABDULLAH	3	7	1
800	N824225	2023-03-21	500	22	L	RIZAL BIN ABDUL RANI	1	19	1
801	N824225	2023-03-21	500	22	L	RIZAL BIN ABDUL RANI	1	24	1
802	M790457	2023-03-23	120	59	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	10	1
803	N796051	2023-03-23	145	81	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	3	1
804	N022348	2023-03-24	135	47	P	ADI SYAZNI BIN MUHAMMED	3	24	1
805	N022348	2023-03-24	135	47	P	ADI SYAZNI BIN MUHAMMED	3	17	1
806	N891476	2023-03-24	105	75	L	SYED MUHAMMAD SYAFIQ ALJUNID	1	16	1
807	M811980	2023-03-27	130	83	P	RIZAL BIN ABDUL RANI	2	12	1
808	M619151	2023-03-21	20	74	L	MUHAMMAD FATHI BIN HAYYUN	14	19	1
809	N790990	2023-03-21	125	35	P	SHALIMAR BT ABDULLAH	14	25	1
810	M832480	2023-03-22	50	22	P	SYED NABIL BIN SYED OMAR	9	18	1
811	N042960	2023-03-28	130	38	L	RIFQAH BINTI NORDIN	9	12	1
812	N876926	2023-03-28	220	63	P	SYED NABIL BIN SYED OMAR	9	21	1
813	M650531	2023-03-29	15	45	L	MUHAMAD KARBELA REZA BIN RAMLAN	14	25	1
814	N872220	2023-03-29	400	2	P	AZIZI BIN ABU BAKAR	10	19	1
815	M845243	2023-03-30	230	63	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	21	1
816	N888429	2023-03-30	610	57	P	NUR AFDZILLAH ABDUL RAHMAN	13	19	1
817	N883246	2023-03-28	430	59	P	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	6	1
818	N223722	2023-03-31	110	69	P	NIK ALIF AZRIQ B NIK ABDULLAH	14	24	1
819	N597189	2023-03-20	25	37	P	SHALIMAR BT ABDULLAH	14	11	1
820	N887375	2023-04-05	145	62	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	7	1
821	N006982	2023-04-06	35	18	L	SHALIMAR BT ABDULLAH	14	25	1
822	M262755	2023-04-05	650	48	P	HAIRULFAIZI BIN HARON	5	21	1
823	N865831	2023-04-10	115	28	L	MOHD YAZID BIN BAJURI	14	6	1
824	N890764	2023-04-10	300	44	L	MOHD YAZID BIN BAJURI	14	14	1
825	M057878	2023-04-05	320	73	P	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	3	1
826	M894050	2023-04-12	200	67	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	21	1
827	N208730	2023-04-12	124	54	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	1	1
828	N853425	2023-04-12	100	33	P	MOHAMAD AZIM BIN MD IDRIS	30	16	1
829	N892957	2023-04-11	100	35	L	SHALIMAR BT ABDULLAH	14	4	1
830	N876903	2023-04-13	113	66	L	LENNY SURIANI SAFRI	30	8	1
831	N893665	2023-04-12	58	17	P	NOR HAZLA BINTI MOHAMED HAFLAH	13	10	1
832	M832057	2023-04-14	820	69	P	AZLANUDIN BIN AZMAN	8	14	1
833	M385259	2023-04-15	600	72	L	MOHAMAD AZIM BIN MD IDRIS	30	18	1
834	N846393	2023-04-15	115	63	P	MOHAMAD AZIM BIN MD IDRIS	30	1	1
835	N893031	2023-04-16	230	22	L	HAIRULFAIZI BIN HARON	5	20	1
836	N893965	2023-04-16	155	71	P	MOHAMED HAFIZUDIN ABDULLAH SANI	13	12	1
837	N871678	2023-03-30	425	57	L	NIK RITZA KOSAI BIN NIK MAHMOOD	27	7	1
838	N879913	2023-03-30	300	50	P	GUHAN A/L MUTHKUMARAN	27	14	1
839	N141161	2023-04-12	145	63	P	NANI HARLINA BT MD. LATAR	4	14	1
840	N693922	2023-04-12	630	25	P	RAMA KRSNA A/L RAJANDRAM	9	18	1
841	N872831	2023-04-12	145	19	P	NANI HARLINA BT MD. LATAR	4	22	1
842	N869554	2023-04-17	120	63	L	NORLIYANA BINTI MAZLI	14	2	1
843	N871461	2023-04-17	125	49	P	LEE CHANG HAUR	4	10	1
844	N871461	2023-04-17	125	49	P	LEE CHANG HAUR	4	4	1
845	N786777	2023-03-22	210	20	L	FARIZAL BIN FADZIL	10	7	1
846	M843589	2023-04-12	250	74	P	SANMUGARAJAH A/L PARAMASVARAN	10	19	1
847	N657534	2023-04-12	600	47	P	NORLIA BT. ABDULLAH	3	25	1
848	N783196	2023-04-17	230	32	L	AHMAD FAIZ MOHAMED KHALIL	1	6	1
849	N893295	2023-04-17	130	16	L	NIK KAMARUL ARIF BIN NIK KAMRULZAMAN	1	2	1
850	N893295	2023-04-17	130	16	L	NIK KAMARUL ARIF BIN NIK KAMRULZAMAN	1	17	1
851	N893295	2023-04-17	130	16	L	NIK KAMARUL ARIF BIN NIK KAMRULZAMAN	1	10	1
852	N894113	2023-04-18	140	28	L	TAN JIN AUN	1	13	1
853	N565690	2023-04-07	310	81	L	MOHD HADY SHUKRI BIN ABDUL SATAR	6	24	1
854	N565690	2023-04-07	310	81	L	MOHD HADY SHUKRI BIN ABDUL SATAR	6	3	1
855	N823940	2023-04-18	145	63	P	MOHAMAD AZIM BIN MD IDRIS	30	10	1
856	N254053	2023-04-19	145	78	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	20	1
857	N886153	2023-04-19	109	58	P	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	20	1
858	N876735	2023-03-30	215	43	P	GUHAN A/L MUTHKUMARAN	27	3	1
859	N894041	2023-04-19	40	29	P	BENJIE LAW ZI YUAN	9	22	1
860	M242612	2023-04-20	210	48	L	GILLIAN MARIE CAUNTER	4	5	1
861	N118436	2023-04-20	100	22	L	BENJIE LAW ZI YUAN	9	7	1
862	N118436	2023-04-20	100	22	L	BENJIE LAW ZI YUAN	9	18	1
863	N879940	2023-04-20	105	31	P	LEE CHANG HAUR	4	2	1
864	N892521	2023-04-06	400	55	P	KAMALANATHAN A/L PALANIANDY	10	9	1
865	M463585	2023-04-20	55	59	P	GILLIAN MARIE CAUNTER	3	20	1
866	M881375	2023-04-20	135	50	P	GILLIAN MARIE CAUNTER	3	11	1
867	M881375	2023-04-20	135	50	P	GILLIAN MARIE CAUNTER	3	21	1
868	M686623	2023-04-25	210	25	L	FARIZAL BIN FADZIL	10	16	1
869	N848478	2023-02-28	6	43	P	NUR AFDZILLAH ABDUL RAHMAN	6	4	1
870	N884158	2023-03-24	20	23	L	NUR AFDZILLAH ABDUL RAHMAN	6	2	1
871	N884152	2023-03-28	35	38	L	NUR AFDZILLAH ABDUL RAHMAN	6	19	1
872	M849823	2023-04-04	15	42	L	NUR AFDZILLAH ABDUL RAHMAN	6	23	1
873	N200033	2023-04-04	15	56	P	NUR AFDZILLAH ABDUL RAHMAN	6	10	1
874	N796826	2023-04-04	15	54	P	NUR AFDZILLAH ABDUL RAHMAN	6	3	1
875	N801989	2023-04-17	15	47	L	MOHD HADY SHUKRI BIN ABDUL SATAR	6	16	1
876	N846393	2023-04-26	50	63	P	MOHAMAD AZIM BIN MD IDRIS	30	25	1
877	N894604	2023-04-26	130	59	P	RAMESH KUMAR	5	12	1
878	N728147	2023-03-19	30	61	L	LIM LI YI	13	6	1
879	N339964	2023-04-20	200	48	P	JEGAN A/L THANABALAN	10	7	1
880	N892585	2023-04-20	730	22	L	RAMA KRSNA A/L RAJANDRAM	9	7	1
881	M892176	2023-04-25	825	58	P	RAZMAN BIN JARMIN	13	12	1
882	N400153	2023-04-27	210	18	L	BADRUL AKMAL HISHAM B. MD. YUSOFF	23	8	1
883	N627036	2023-04-27	140	32	L	AHMAD FARIHAN BIN MOHD DON	23	10	1
884	N894266	2023-04-19	30	31	P	MOHD HISAM BIN MOHD ARIFFIN	22	22	1
885	N894266	2023-04-19	30	31	P	MOHD HISAM BIN MOHD ARIFFIN	22	16	1
886	N398040	2023-04-26	502	76	L	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	18	1
887	N808938	2023-04-27	153	18	P	MOHD HISAM BIN MOHD ARIFFIN	22	2	1
888	N856458	2023-04-27	225	23	L	SYED NABIL BIN SYED OMAR	9	21	1
889	N882741	2023-04-27	145	18	P	MOHD HISAM BIN MOHD ARIFFIN	22	21	1
890	N317458	2023-04-28	30	58	P	WAN SURIZA BINTI WAN AB RAHMAN	4	4	1
891	N882299	2023-04-28	225	65	P	ROHAIZAK BIN MUHAMMAD	4	25	1
892	M902579	2023-05-01	125	43	L	GUHAN A/L MUTHKUMARAN	27	2	1
893	N879550	2023-04-26	103	9	P	AZIZI BIN ABU BAKAR	10	14	1
894	N893577	2023-04-26	227	75	P	AZIZI BIN ABU BAKAR	10	7	1
895	M872372	2023-04-28	135	50	P	WAN SURIZA BINTI WAN AB RAHMAN	3	10	1
896	M872372	2023-04-28	135	50	P	WAN SURIZA BINTI WAN AB RAHMAN	3	24	1
897	M872372	2023-04-28	135	50	P	WAN SURIZA BINTI WAN AB RAHMAN	3	24	1
898	N706438	2023-04-28	145	68	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	14	1
899	N856125	2023-04-28	200	68	L	NOR HAMDAN BIN MOHAMAD YAHAYA	2	1	1
900	N887488	2023-04-28	145	41	P	NORLIA BT. ABDULLAH	3	17	1
901	N887488	2023-04-28	145	41	P	NORLIA BT. ABDULLAH	3	6	1
902	N887488	2023-04-28	145	41	P	NORLIA BT. ABDULLAH	3	10	1
903	M891988	2023-05-02	115	83	P	SYED MUHAMMAD SYAFIQ ALJUNID	1	10	1
904	N691524	2023-05-02	40	94	P	AHMAD FAIZ MOHAMED KHALIL	1	9	1
905	N782718	2023-05-02	33	38	P	HARLINA BINTI MOHD RAZALI	3	10	1
906	M914313	2023-04-05	10	77	L	SUZLIZA SHUKOR	13	17	1
907	N893527	2023-04-26	415	81	P	SANMUGARAJAH A/L PARAMASVARAN	10	13	1
908	M687683	2023-05-02	245	43	L	SHALIMAR BT ABDULLAH	7	7	1
909	N697031	2023-05-02	610	27	P	JOTHI RAAMAHLINGAM A/L RAJARAN	9	13	1
910	M784468	2023-05-03	100	64	P	MOHAMAD AZIM BIN MD IDRIS	30	21	1
911	N584001	2023-05-03	100	63	L	HISHAM ARSHAD BIN HABEEBULLAH KHAN	30	16	1
912	N885340	2023-05-03	330	25	L	MUHAMMAD ILYAAS BIN MUHAMMED ALI NOOR	23	9	1
913	N891001	2023-05-03	600	33	P	HAIRULFAIZI BIN HARON	5	8	1
914	N891001	2023-05-03	600	33	P	HAIRULFAIZI BIN HARON	5	1	1
915	N891001	2023-05-03	600	33	P	HAIRULFAIZI BIN HARON	5	23	1
916	N890764	2023-05-08	130	44	L	MOHD YAZID BIN BAJURI	14	8	1
917	N893855	2023-05-08	140	47	L	MOHD YAZID BIN BAJURI	14	5	1
918	N579756	2023-05-08	200	37	P	GUHAN A/L MUTHKUMARAN	5	17	1
919	M902016	2023-03-21	15	39	P	SHALIMAR BT ABDULLAH	14	19	1
920	N803399	2023-05-03	834	34	P	HAIRULFAIZI BIN HARON	5	16	1
921	N786972	2023-03-29	630	52	L	DATO' SRI DR MOHD RAMZISHAM BIN ABDUL RAHMAN	5	16	1
922	M108514	2023-05-15	20	89	L	MUHAMMAD FATHI BIN HAYYUN	14	1	1
923	N760560	2023-05-15	15	77	P	MUHAMMAD FATHI BIN HAYYUN	14	16	1
924	N896034	2023-05-16	30	22	P	ELAINE SOH ZI FAN	14	12	1
925	N888539	2023-05-09	35	75	P	NUR AFDZILLAH ABDUL RAHMAN	8	7	1
926	N126311	2023-05-16	240	73	L	MOHD HADY SHUKRI BIN ABDUL SATAR	8	1	1
927	N051774	2023-05-09	155	44	L	GUHAN A/L MUTHKUMARAN	27	17	1
928	N868146	2023-05-09	215	38	P	GUHAN A/L MUTHKUMARAN	27	15	1
929	N883576	2023-05-15	45	45	P	NORLIA BT. ABDULLAH	4	24	1
930	N883576	2023-05-15	45	45	P	NORLIA BT. ABDULLAH	4	2	1
931	N885913	2023-05-17	145	58	P	LEE CHANG HAUR	4	18	1
932	N885913	2023-05-17	145	58	P	LEE CHANG HAUR	4	19	1
933	N894166	2023-05-17	100	72	L	GUHAN A/L MUTHKUMARAN	27	10	1
934	N845565	2023-04-26	855	45	P	JEGAN A/L THANABALAN	10	16	1
935	N289754	2023-05-18	315	54	L	AHMAD FAIZ MOHAMED KHALIL	1	22	1
936	N877934	2023-05-19	200	69	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	20	1
937	N046816	2023-05-21	140	38	L	NIK KAMARUL ARIF BIN NIK KAMRULZAMAN	1	10	1
938	M969855	2023-05-23	135	34	P	BOO HAN SIN	6	4	1
939	N177910	2023-05-23	135	68	P	BOO HAN SIN	6	25	1
940	N640856	2023-05-23	225	50	P	BOO HAN SIN	6	19	1
941	M051404	2023-04-26	455	69	L	JEGAN A/L THANABALAN	10	14	1
942	N832153	2023-05-16	36	60	P	PARMINDER SINGH GILL A/L NARIN SINGH	14	13	1
943	N896690	2023-05-22	45	50	P	JAMARI BIN SAPUAN	14	6	1
944	M974377	2023-05-23	215	47	L	AHMAD FARIHAN BIN MOHD DON	23	16	1
945	N785194	2023-05-23	140	47	L	AHMAD FARIHAN BIN MOHD DON	23	2	1
946	M343035	2023-05-26	245	40	L	BOO HAN SIN	8	6	1
947	M886946	2023-05-26	55	43	P	BOO HAN SIN	8	10	1
948	N751585	2023-05-26	205	46	L	BOO HAN SIN	8	19	1
949	N737927	2023-05-09	410	41	P	GUHAN A/L MUTHKUMARAN	27	1	1
950	N219829	2023-05-19	150	38	P	GUHAN A/L MUTHKUMARAN	27	22	1
951	N775907	2023-05-26	315	66	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	21	1
952	N566744	2023-05-29	230	63	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	8	1
953	N881734	2023-05-29	220	62	L	JEGAN A/L THANABALAN	10	14	1
954	N881734	2023-05-29	220	62	L	JEGAN A/L THANABALAN	10	23	1
955	N533918	2023-05-30	425	39	P	NANI HARLINA BT MD. LATAR	10	7	1
956	N888644	2023-05-22	550	79	P	ZAIRUL AZWAN BIN MOHD AZMAN	6	8	1
957	N305293	2023-05-22	517	73	P	JEGAN A/L THANABALAN	10	18	1
958	N323747	2023-05-31	255	29	L	AHMAD FARIHAN BIN MOHD DON	23	1	1
959	N769399	2023-06-01	130	62	L	RAMESH KUMAR	10	21	1
960	N579886	2023-05-24	215	35	P	GUHAN A/L MUTHKUMARAN	27	12	1
961	M699594	2023-06-02	255	69	L	RIZAL BIN ABDUL RANI	2	2	1
962	N234512	2023-06-02	150	69	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	22	1
963	N859234	2023-06-02	200	64	L	NOR HAMDAN BIN MOHAMAD YAHAYA	2	8	1
964	N897585	2023-06-06	635	50	L	SYED MUHAMMAD SYAFIQ ALJUNID	1	1	1
965	M797251	2023-06-10	227	62	P	RIZAL BIN ABDUL RANI	2	23	1
966	M797251	2023-06-10	227	62	P	RIZAL BIN ABDUL RANI	2	21	1
967	N788122	2023-06-10	145	64	P	RIZAL BIN ABDUL RANI	2	9	1
968	M678194	2023-06-12	150	42	L	SYED MUHAMMAD SYAFIQ ALJUNID	1	7	1
969	N898512	2023-06-13	200	20	L	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	4	1
970	M203578	2023-01-30	220	56	P	RIZAL BIN ABDUL RANI	2	13	1
971	N828852	2023-06-16	215	73	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	6	1
972	N899128	2023-06-20	135	85	P	JUZAILY FEKRY LEONG	1	7	1
973	N574627	2023-06-20	230	44	L	NIK KAMARUL ARIF BIN NIK KAMARULZAMAN	1	4	1
974	N834147	2023-06-26	220	62	L	RIZAL BIN ABDUL RANI	2	25	1
975	N884465	2023-06-26	145	76	P	NOR HAMDAN BIN MOHAMAD YAHAYA	2	18	1
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unit (id, name, sub_specialty_id, is_require_anaes, max_slot_limit, no_of_slots, resource_requirement_id, color_hex) FROM stdin;
1	ADVANCE TRAUMA	1	t	3	2	1	#2F4F4F
2	ARTHOPLASTY	2	t	3	2	1	#00CED1
3	BREAST	3	t	3	1	1	#FFC0CB
4	BREAST & ENDOCRINE	4	t	3	1	1	#FF69B4
5	CARDIOTHORASIC	5	t	3	1	1	#DC143C
6	COLORECTAL	6	t	3	1	1	#FFD700
7	HANDS & MICROSURGERY	7	t	3	1	1	#8A2BE2
8	HEPATOBILIARY	8	t	3	1	1	#A52A2A
9	MAXILOFACIAL	9	t	3	1	1	#5F9EA0
10	NEUROSURGERY	10	t	3	1	1	#7FFF00
11	OPHTHALMOLOGY (LA)	11	f	3	1	2	#D2691E
12	OPHTHALMOLOGY (GA)	11	t	3	1	1	#FF7F50
13	ORTHO-ONCOLOGY	12	t	3	1	1	#6495ED
14	ORTHOPEDIC	13	t	3	1	1	#FFF8DC
15	OTORHINOLARINGOLOGY	14	t	3	1	1	#DC143C
16	DC OTORHINOLARINGOLOGY (LA)	14	f	3	1	2	#00FFFF
17	PAEDIATRIC ORTHOPEDIC	15	t	3	1	1	#00008B
18	PAEDIATRIC SURGERY	16	t	3	1	1	#008B8B
19	DC PAEDIATRIC SURGERY (LA)	16	f	3	1	2	#B8860B
20	PLASTIC	17	t	3	1	1	#A9A9A9
21	DC PLASTIC (LA)	17	f	3	1	2	#006400
22	SPINAL	18	t	3	1	1	#BDB76B
23	SPORT	19	t	3	1	1	#8B008B
24	SURGERY	20	t	3	1	1	#556B2F
25	TRAUMA	21	t	3	1	1	#FF8C00
26	UKMSC	22	t	3	1	1	#9932CC
27	UPPER GI MINIMALLY INVASIVE	23	t	3	1	1	#8B0000
28	UROLOGY	24	t	3	1	1	#E9967A
29	DC UROLOGY (LA)	24	f	3	1	2	#8FBC8F
30	VASCULAR	25	t	3	1	1	#483D8B
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" (id, email, password, first_name, last_name, is_active, role_id) FROM stdin;
1	admin@gmail.com	$2b$12$EgYkwtpRA02wzlTzgNguQ.xlDs.q8kHwnJwiJ2/Znxs9bLnIdyY.q	admin	01	t	1
\.


--
-- Data for Name: week; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.week (id, name, status_id) FROM stdin;
1	Week 1	1
2	Week 2	1
3	Week 3	1
4	Week 4	1
5	Week 5	1
6	Week 6	1
7	Week 7	1
8	Week 8	1
9	Week 9	1
10	Week 10	1
11	Week 11	1
12	Week 12	1
13	Week 13	1
14	Week 14	1
15	Week 15	1
\.


--
-- Name: blocked_day_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blocked_day_id_seq', 2, true);


--
-- Name: blocked_ot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blocked_ot_id_seq', 2, true);


--
-- Name: clashing_subspecialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clashing_subspecialties_id_seq', 2, true);


--
-- Name: day_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.day_id_seq', 5, true);


--
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.equipment_id_seq', 1, false);


--
-- Name: equipment_msp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.equipment_msp_id_seq', 1, false);


--
-- Name: equipment_requirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.equipment_requirement_id_seq', 1, false);


--
-- Name: equipment_requirement_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.equipment_requirement_status_id_seq', 1, false);


--
-- Name: fixed_ot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fixed_ot_id_seq', 11, true);


--
-- Name: masterplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.masterplan_id_seq', 2, true);


--
-- Name: objectives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.objectives_id_seq', 1, false);


--
-- Name: ot_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ot_assignment_id_seq', 975, true);


--
-- Name: ot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ot_id_seq', 1, false);


--
-- Name: ot_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ot_type_id_seq', 1, false);


--
-- Name: preferred_ot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.preferred_ot_id_seq', 1, false);


--
-- Name: procedure_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.procedure_name_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.role_id_seq', 1, true);


--
-- Name: schedule_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.schedule_resource_id_seq', 5, true);


--
-- Name: schedule_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.schedule_results_id_seq', 1, false);


--
-- Name: specialty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.specialty_id_seq', 6, true);


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.status_id_seq', 1, false);


--
-- Name: sub_specialties_ot_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sub_specialties_ot_types_id_seq', 39, true);


--
-- Name: sub_specialty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sub_specialty_id_seq', 2, true);


--
-- Name: surgery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.surgery_id_seq', 975, true);


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unit_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: week_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.week_id_seq', 15, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: blocked_day blocked_day_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_day
    ADD CONSTRAINT blocked_day_pkey PRIMARY KEY (id);


--
-- Name: blocked_ot blocked_ot_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_ot
    ADD CONSTRAINT blocked_ot_pkey PRIMARY KEY (id);


--
-- Name: clashing_subspecialties clashing_subspecialties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clashing_subspecialties
    ADD CONSTRAINT clashing_subspecialties_pkey PRIMARY KEY (id);


--
-- Name: day day_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.day
    ADD CONSTRAINT day_pkey PRIMARY KEY (id);


--
-- Name: equipment_msp equipment_msp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_msp
    ADD CONSTRAINT equipment_msp_pkey PRIMARY KEY (id);


--
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: equipment_requirement equipment_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_requirement
    ADD CONSTRAINT equipment_requirement_pkey PRIMARY KEY (id);


--
-- Name: equipment_requirement_status equipment_requirement_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_requirement_status
    ADD CONSTRAINT equipment_requirement_status_pkey PRIMARY KEY (id);


--
-- Name: fixed_ot fixed_ot_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fixed_ot
    ADD CONSTRAINT fixed_ot_pkey PRIMARY KEY (id);


--
-- Name: masterplan masterplan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.masterplan
    ADD CONSTRAINT masterplan_pkey PRIMARY KEY (id);


--
-- Name: objectives objectives_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.objectives
    ADD CONSTRAINT objectives_pkey PRIMARY KEY (id);


--
-- Name: ot_assignment ot_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_pkey PRIMARY KEY (id);


--
-- Name: ot ot_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot
    ADD CONSTRAINT ot_pkey PRIMARY KEY (id);


--
-- Name: ot_type ot_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_type
    ADD CONSTRAINT ot_type_pkey PRIMARY KEY (id);


--
-- Name: preferred_ot preferred_ot_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preferred_ot
    ADD CONSTRAINT preferred_ot_pkey PRIMARY KEY (id);


--
-- Name: procedure_name procedure_name_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procedure_name
    ADD CONSTRAINT procedure_name_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: role role_role_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_role_key UNIQUE (role);


--
-- Name: schedule_resource schedule_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule_resource
    ADD CONSTRAINT schedule_resource_pkey PRIMARY KEY (id);


--
-- Name: schedule_results schedule_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule_results
    ADD CONSTRAINT schedule_results_pkey PRIMARY KEY (id);


--
-- Name: specialty specialty_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_pkey PRIMARY KEY (id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: sub_specialties_ot_types sub_specialties_ot_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_specialties_ot_types
    ADD CONSTRAINT sub_specialties_ot_types_pkey PRIMARY KEY (id);


--
-- Name: sub_specialty sub_specialty_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_specialty
    ADD CONSTRAINT sub_specialty_pkey PRIMARY KEY (id);


--
-- Name: surgery surgery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surgery
    ADD CONSTRAINT surgery_pkey PRIMARY KEY (id);


--
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: week week_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.week
    ADD CONSTRAINT week_pkey PRIMARY KEY (id);


--
-- Name: ix_blocked_day_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_blocked_day_id ON public.blocked_day USING btree (id);


--
-- Name: ix_blocked_ot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_blocked_ot_id ON public.blocked_ot USING btree (id);


--
-- Name: ix_clashing_subspecialties_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_clashing_subspecialties_id ON public.clashing_subspecialties USING btree (id);


--
-- Name: ix_day_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_day_id ON public.day USING btree (id);


--
-- Name: ix_equipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_equipment_id ON public.equipment USING btree (id);


--
-- Name: ix_equipment_msp_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_equipment_msp_id ON public.equipment_msp USING btree (id);


--
-- Name: ix_equipment_requirement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_equipment_requirement_id ON public.equipment_requirement USING btree (id);


--
-- Name: ix_equipment_requirement_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_equipment_requirement_status_id ON public.equipment_requirement_status USING btree (id);


--
-- Name: ix_fixed_ot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_fixed_ot_id ON public.fixed_ot USING btree (id);


--
-- Name: ix_masterplan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_masterplan_id ON public.masterplan USING btree (id);


--
-- Name: ix_objectives_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_objectives_id ON public.objectives USING btree (id);


--
-- Name: ix_ot_assignment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ot_assignment_id ON public.ot_assignment USING btree (id);


--
-- Name: ix_ot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ot_id ON public.ot USING btree (id);


--
-- Name: ix_ot_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ot_type_id ON public.ot_type USING btree (id);


--
-- Name: ix_preferred_ot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_preferred_ot_id ON public.preferred_ot USING btree (id);


--
-- Name: ix_procedure_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_procedure_name_id ON public.procedure_name USING btree (id);


--
-- Name: ix_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_role_id ON public.role USING btree (id);


--
-- Name: ix_schedule_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_schedule_resource_id ON public.schedule_resource USING btree (id);


--
-- Name: ix_schedule_results_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_schedule_results_id ON public.schedule_results USING btree (id);


--
-- Name: ix_specialty_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_specialty_id ON public.specialty USING btree (id);


--
-- Name: ix_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_status_id ON public.status USING btree (id);


--
-- Name: ix_sub_specialties_ot_types_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_sub_specialties_ot_types_id ON public.sub_specialties_ot_types USING btree (id);


--
-- Name: ix_sub_specialty_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_sub_specialty_id ON public.sub_specialty USING btree (id);


--
-- Name: ix_surgery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_surgery_id ON public.surgery USING btree (id);


--
-- Name: ix_unit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_unit_id ON public.unit USING btree (id);


--
-- Name: ix_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_user_id ON public."user" USING btree (id);


--
-- Name: ix_week_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_week_id ON public.week USING btree (id);


--
-- Name: blocked_day blocked_day_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_day
    ADD CONSTRAINT blocked_day_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.day(id);


--
-- Name: blocked_day blocked_day_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_day
    ADD CONSTRAINT blocked_day_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: blocked_ot blocked_ot_ot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_ot
    ADD CONSTRAINT blocked_ot_ot_id_fkey FOREIGN KEY (ot_id) REFERENCES public.ot(id);


--
-- Name: blocked_ot blocked_ot_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_ot
    ADD CONSTRAINT blocked_ot_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: clashing_subspecialties clashing_subspecialties_sub_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clashing_subspecialties
    ADD CONSTRAINT clashing_subspecialties_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);


--
-- Name: clashing_subspecialties clashing_subspecialties_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clashing_subspecialties
    ADD CONSTRAINT clashing_subspecialties_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: day day_week_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.day
    ADD CONSTRAINT day_week_id_fkey FOREIGN KEY (week_id) REFERENCES public.week(id);


--
-- Name: equipment_msp equipment_msp_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_msp
    ADD CONSTRAINT equipment_msp_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);


--
-- Name: equipment_requirement equipment_requirement_equipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_requirement
    ADD CONSTRAINT equipment_requirement_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(id);


--
-- Name: equipment_requirement equipment_requirement_equipment_requirement_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_requirement
    ADD CONSTRAINT equipment_requirement_equipment_requirement_status_id_fkey FOREIGN KEY (equipment_requirement_status_id) REFERENCES public.equipment_requirement_status(id);


--
-- Name: equipment_requirement equipment_requirement_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment_requirement
    ADD CONSTRAINT equipment_requirement_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: equipment equipment_sub_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);


--
-- Name: fixed_ot fixed_ot_ot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fixed_ot
    ADD CONSTRAINT fixed_ot_ot_id_fkey FOREIGN KEY (ot_id) REFERENCES public.ot(id);


--
-- Name: fixed_ot fixed_ot_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fixed_ot
    ADD CONSTRAINT fixed_ot_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: ot_assignment ot_assignment_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.day(id);


--
-- Name: ot_assignment ot_assignment_mssp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_mssp_id_fkey FOREIGN KEY (mssp_id) REFERENCES public.masterplan(id);


--
-- Name: ot_assignment ot_assignment_ot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_ot_id_fkey FOREIGN KEY (ot_id) REFERENCES public.ot(id);


--
-- Name: ot_assignment ot_assignment_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: ot_assignment ot_assignment_week_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_week_id_fkey FOREIGN KEY (week_id) REFERENCES public.week(id);


--
-- Name: ot ot_ot_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot
    ADD CONSTRAINT ot_ot_type_id_fkey FOREIGN KEY (ot_type_id) REFERENCES public.ot_type(id);


--
-- Name: ot ot_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ot
    ADD CONSTRAINT ot_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);


--
-- Name: preferred_ot preferred_ot_ot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preferred_ot
    ADD CONSTRAINT preferred_ot_ot_id_fkey FOREIGN KEY (ot_id) REFERENCES public.ot(id);


--
-- Name: preferred_ot preferred_ot_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preferred_ot
    ADD CONSTRAINT preferred_ot_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: procedure_name procedure_name_sub_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procedure_name
    ADD CONSTRAINT procedure_name_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);


--
-- Name: sub_specialties_ot_types sub_specialties_ot_types_ot_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_specialties_ot_types
    ADD CONSTRAINT sub_specialties_ot_types_ot_type_id_fkey FOREIGN KEY (ot_type_id) REFERENCES public.ot_type(id);


--
-- Name: sub_specialties_ot_types sub_specialties_ot_types_sub_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_specialties_ot_types
    ADD CONSTRAINT sub_specialties_ot_types_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);


--
-- Name: sub_specialties_ot_types sub_specialties_ot_types_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_specialties_ot_types
    ADD CONSTRAINT sub_specialties_ot_types_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: sub_specialty sub_specialty_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_specialty
    ADD CONSTRAINT sub_specialty_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES public.specialty(id);


--
-- Name: surgery surgery_mssp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surgery
    ADD CONSTRAINT surgery_mssp_id_fkey FOREIGN KEY (mssp_id) REFERENCES public.masterplan(id);


--
-- Name: surgery surgery_procedure_name_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surgery
    ADD CONSTRAINT surgery_procedure_name_id_fkey FOREIGN KEY (procedure_name_id) REFERENCES public.procedure_name(id);


--
-- Name: surgery surgery_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surgery
    ADD CONSTRAINT surgery_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: unit unit_sub_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);


--
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: week week_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.week
    ADD CONSTRAINT week_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);


--
-- PostgreSQL database dump complete
--

