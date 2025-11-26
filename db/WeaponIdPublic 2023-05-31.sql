--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-05-31 11:13:04

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

--
-- TOC entry 840 (class 1247 OID 66417)
-- Name: approval_part; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.approval_part AS ENUM (
    'person',
    'weapon'
);


ALTER TYPE public.approval_part OWNER TO postgres;

--
-- TOC entry 843 (class 1247 OID 66422)
-- Name: approval_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.approval_role AS ENUM (
    'Prime_mimister',
    'Minister'
);


ALTER TYPE public.approval_role OWNER TO postgres;

--
-- TOC entry 846 (class 1247 OID 66428)
-- Name: gender_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender_type AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.gender_type OWNER TO postgres;

--
-- TOC entry 849 (class 1247 OID 66434)
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status AS ENUM (
    'PENDING',
    'APPROVED',
    'DECLINED'
);


ALTER TYPE public.status OWNER TO postgres;

--
-- TOC entry 852 (class 1247 OID 66442)
-- Name: user_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_type AS ENUM (
    'identification_managment',
    'approval_destination'
);


ALTER TYPE public.user_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 66447)
-- Name: approval_destination; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_destination (
    id integer NOT NULL,
    destination text NOT NULL,
    role_type smallint NOT NULL,
    approval_part smallint
);


ALTER TABLE public.approval_destination OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN approval_destination.role_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.approval_destination.role_type IS '0 none -> userType = 1,
1 accept suspense -> userType = 2, 
2 accept reject userType = 2,
3 supervisor userType = 2';


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN approval_destination.approval_part; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.approval_destination.approval_part IS '1-person
2-weapon';


--
-- TOC entry 210 (class 1259 OID 66452)
-- Name: app_person_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_person_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_person_type_id_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 210
-- Name: app_person_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_person_type_id_seq OWNED BY public.approval_destination.id;


--
-- TOC entry 211 (class 1259 OID 66453)
-- Name: approvals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approvals (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    req_details_id uuid NOT NULL,
    approval_dest_id integer,
    approval_part smallint NOT NULL,
    status smallint,
    reason text,
    booknum text,
    bookdate timestamp with time zone,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    audit bit(1),
    audit_updated timestamp with time zone
);


ALTER TABLE public.approvals OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 66460)
-- Name: biometric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biometric (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pict text,
    iris text,
    fing_right text NOT NULL,
    fing_left text NOT NULL,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.biometric OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 66467)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    cat text NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 66472)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 215 (class 1259 OID 66473)
-- Name: identification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identification (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    req_det_id uuid NOT NULL,
    printtime date NOT NULL,
    idnum integer NOT NULL,
    expdate timestamp with time zone NOT NULL,
    permdate timestamp with time zone,
    note text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    is_print boolean DEFAULT false
);


ALTER TABLE public.identification OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 66481)
-- Name: license_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.license_type (
    id integer NOT NULL,
    license text NOT NULL
);


ALTER TABLE public.license_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 66486)
-- Name: license_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.license_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.license_type_id_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 217
-- Name: license_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.license_type_id_seq OWNED BY public.license_type.id;


--
-- TOC entry 218 (class 1259 OID 66487)
-- Name: province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.province (
    id integer NOT NULL,
    pro_name text NOT NULL
);


ALTER TABLE public.province OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 66492)
-- Name: province_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.province_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.province_id_seq OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 219
-- Name: province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.province_id_seq OWNED BY public.province.id;


--
-- TOC entry 220 (class 1259 OID 66493)
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name1 text NOT NULL,
    name2 text NOT NULL,
    name3 text NOT NULL,
    name4 text NOT NULL,
    surname text,
    profession text NOT NULL,
    birdate timestamp with time zone NOT NULL,
    gender_type smallint NOT NULL,
    cat_id integer NOT NULL,
    monam1 text NOT NULL,
    monam2 text NOT NULL,
    monam3 text NOT NULL,
    idnum text NOT NULL,
    pro_id integer NOT NULL,
    addresses text NOT NULL,
    phone text NOT NULL,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    approv_num text,
    approv_date date
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN requests.gender_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests.gender_type IS '1- male
2- female';


--
-- TOC entry 221 (class 1259 OID 66500)
-- Name: requests_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests_details (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    req_id uuid NOT NULL,
    license_id integer NOT NULL,
    approval_role smallint,
    name1 text NOT NULL,
    name2 text NOT NULL,
    name3 text NOT NULL,
    name4 text NOT NULL,
    surname text,
    gender_type smallint,
    cat_id integer NOT NULL,
    birdate timestamp with time zone NOT NULL,
    monam1 text NOT NULL,
    monam2 text NOT NULL,
    monam3 text NOT NULL,
    idnum text NOT NULL,
    iss_1 text NOT NULL,
    issdat1 date NOT NULL,
    natnum text NOT NULL,
    iss_2 text NOT NULL,
    issdat2 timestamp with time zone NOT NULL,
    pro_id integer NOT NULL,
    addresses text NOT NULL,
    nearplace text NOT NULL,
    mahala text NOT NULL,
    zuqaq text NOT NULL,
    dar text NOT NULL,
    djp text,
    numdet text,
    datedet timestamp with time zone,
    phone text NOT NULL,
    weapname_id integer NOT NULL,
    weapnum text NOT NULL,
    wea_hold_per text NOT NULL,
    margin_app text NOT NULL,
    completed smallint,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    prev_weapn text,
    archive_num text,
    biometric_id uuid
);


ALTER TABLE public.requests_details OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN requests_details.approval_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.approval_role IS '1- Prime_minister
2- Minister';


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN requests_details.gender_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.gender_type IS '1- male
2- female';


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN requests_details.completed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.completed IS '0- decline
1- approval
2- pending';


--
-- TOC entry 227 (class 1259 OID 66593)
-- Name: subidentity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subidentity (
    sudid smallint NOT NULL,
    sudname text,
    sudrultype smallint
);


ALTER TABLE public.subidentity OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN subidentity.sudid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudid IS 'التسلسل';


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN subidentity.sudname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudname IS 'اسم الجهة التابعة الى مديرية الهويات';


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN subidentity.sudrultype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudrultype IS 'الصلاحية الخاصة بالجهة 
-غير مؤثر
-رفض
-وغيرها';


--
-- TOC entry 226 (class 1259 OID 66592)
-- Name: subidentity_sudid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.subidentity ALTER COLUMN sudid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.subidentity_sudid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 66507)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    approval_det_id integer NOT NULL,
    name text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    user_type smallint,
    roles json,
    activation boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    first_enter boolean DEFAULT true,
    sudid smallint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN users.user_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.user_type IS '1- iditification_managment
2- approvals_managment
3- minister office';


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN users.sudid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.sudid IS 'حقل الارتباط مع جدول الجهات الفرعية للهويات ويكون بدون قيمة رقمية الا في حالة كان نوع المستخدم (1)';


--
-- TOC entry 223 (class 1259 OID 66515)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 66516)
-- Name: weapon_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapon_name (
    id integer NOT NULL,
    weapon_name text NOT NULL,
    weapon_size text NOT NULL
);


ALTER TABLE public.weapon_name OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 66521)
-- Name: weapon_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weapon_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weapon_name_id_seq OWNER TO postgres;

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 225
-- Name: weapon_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapon_name_id_seq OWNED BY public.weapon_name.id;


--
-- TOC entry 3229 (class 2604 OID 66522)
-- Name: approval_destination id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approval_destination ALTER COLUMN id SET DEFAULT nextval('public.app_person_type_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 66523)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 66524)
-- Name: license_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type ALTER COLUMN id SET DEFAULT nextval('public.license_type_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 66525)
-- Name: province id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 66526)
-- Name: weapon_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name ALTER COLUMN id SET DEFAULT nextval('public.weapon_name_id_seq'::regclass);


--
-- TOC entry 3423 (class 0 OID 66447)
-- Dependencies: 209
-- Data for Name: approval_destination; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_destination (id, destination, role_type, approval_part) FROM stdin;
2	الاستخبارات	1	1
3	البنى التحتية	1	1
4	مدير هويات	3	2
5	مدقق هويات	2	1
6	ادارة هويات	0	2
\.


--
-- TOC entry 3425 (class 0 OID 66453)
-- Dependencies: 211
-- Data for Name: approvals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated) FROM stdin;
a7dc140e-a737-44fd-87b7-c9fabcea6bda	04d005a2-7c78-4a2d-9b26-72d32112b22e	3	0	1	1212	1212	2023-05-15 00:00:00+03		2023-05-15 14:18:19.384197+03	2	\N	1	1	\N
0c3b7a98-05f9-450c-be3d-8ac12ea9b1f0	04d005a2-7c78-4a2d-9b26-72d32112b22e	2	1	1	مخالفة	12121	2023-05-24 00:00:00+03	خارج الضوابط	2023-05-24 10:42:01.763295+03	2	\N	1	\N	\N
174ca451-ee26-468e-8713-e52b2108f14d	f47305ef-f74b-423d-86dd-285a00466464	2	1	1	عع	22	2023-05-29 00:00:00+03	ننىنى	2023-05-29 12:36:21.148519+03	2	\N	1	1	\N
eb29edf8-e9d7-4a8c-975b-4dbf629cd73b	f47305ef-f74b-423d-86dd-285a00466464	2	1	1	2213	22	2023-05-29 00:00:00+03	klmmknln	2023-05-29 12:38:22.501975+03	2	\N	1	\N	\N
5f4ae6c9-8f31-4866-83ff-270c6c303c2b	f47305ef-f74b-423d-86dd-285a00466464	2	0	1	2323	232	2023-05-25 00:00:00+03	kjjljl	2023-05-29 12:39:12.132372+03	2	\N	1	\N	\N
b0909657-c25e-4cdc-8cb7-71de625bc5e7	f47305ef-f74b-423d-86dd-285a00466464	2	0	1	lkjlkj	13232	2023-05-05 00:00:00+03	354	2023-05-29 12:39:35.899421+03	2	\N	1	\N	\N
57d037c7-8e6f-45b3-bd8b-bf70f952fb3f	c7a2a04c-baa6-4a54-a290-7ab513dcf549	2	1	1	asdads	33	2023-05-19 00:00:00+03	sdf	2023-05-30 12:48:34.476165+03	2	\N	1	\N	\N
\.


--
-- TOC entry 3426 (class 0 OID 66460)
-- Dependencies: 212
-- Data for Name: biometric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biometric (id, pict, iris, fing_right, fing_left, note, created_at, created_by, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3427 (class 0 OID 66467)
-- Dependencies: 213
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, cat) FROM stdin;
1	محامي
2	طبيب
3	رجل اعمال
\.


--
-- TOC entry 3429 (class 0 OID 66473)
-- Dependencies: 215
-- Data for Name: identification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identification (id, req_det_id, printtime, idnum, expdate, permdate, note, created_at, created_by, updated_at, updated_by, is_print) FROM stdin;
\.


--
-- TOC entry 3430 (class 0 OID 66481)
-- Dependencies: 216
-- Data for Name: license_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.license_type (id, license) FROM stdin;
1	اصدار جديد
2	تجديد الهوية
\.


--
-- TOC entry 3432 (class 0 OID 66487)
-- Dependencies: 218
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.province (id, pro_name) FROM stdin;
1	بغداد
2	اربيل
3	البصرة
4	النجف الاشرف
\.


--
-- TOC entry 3434 (class 0 OID 66493)
-- Dependencies: 220
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gender_type, cat_id, monam1, monam2, monam3, idnum, pro_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, approv_num, approv_date) FROM stdin;
7c74cd68-f710-44f0-a0c3-89376bb5d118	A	B	C	D	E	F	1988-01-01 00:00:00+03	1	1	A	A	A	9999	2	Baagdhad	07701234	not exists	2023-05-30 11:06:26.062866+03	\N	\N	\N	2	2023-05-10
3d14be86-1cc4-4b70-acb7-d02a7d0cf01d	qqqqqqqqqqqqqqq	B	C	D	E	F	1988-01-01 00:00:00+03	2	2	A	A	A	9999	2	Baagdhad	07701234	ddddddddddd	2023-05-30 11:05:12.535077+03	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3435 (class 0 OID 66500)
-- Dependencies: 221
-- Data for Name: requests_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests_details (id, req_id, license_id, approval_role, name1, name2, name3, name4, surname, gender_type, cat_id, birdate, monam1, monam2, monam3, idnum, iss_1, issdat1, natnum, iss_2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, wea_hold_per, margin_app, completed, note, created_at, created_by, updated_at, updated_by, prev_weapn, archive_num, biometric_id) FROM stdin;
c7a2a04c-baa6-4a54-a290-7ab513dcf549	7c74cd68-f710-44f0-a0c3-89376bb5d118	1	1	n1	n2	n3	n4	n5	1	1	1998-01-01 00:00:00+03	m1\n	m2	m3	12	1	2023-05-24	bnv	1	2022-01-01 00:00:00+03	1	rrr	22w	dkjdf	frfe	eef	wdwf	wdwd	\N	wdw	1	fe	sf	sfsf	\N	null	2023-05-30 11:06:26.108115+03	1	\N	\N	\N	\N	\N
2af79f8b-ea30-4d4f-9695-88c61806732f	3d14be86-1cc4-4b70-acb7-d02a7d0cf01d	1	1	mm	mm	mm	mm	mm	1	1	1970-01-01 00:00:00+03	hh	hh	hh	100	1	2023-05-24	hh	1	2023-05-24 00:00:00+03	1	hh	hhhh	hhh	hhh	hhh	hhhh	hhh	\N	5465456	1	fghfhg	ghfgh	fghfh	\N	fghfhgfgh	2023-05-30 13:42:52.150042+03	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3441 (class 0 OID 66593)
-- Dependencies: 227
-- Data for Name: subidentity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subidentity (sudid, sudname, sudrultype) FROM stdin;
\.


--
-- TOC entry 3436 (class 0 OID 66507)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) FROM stdin;
8	4	Admin user1	admin1	$2a$10$CTTPW4BH1Xn5C0QcYS9WMuh39vRdR1V3QvayoqKyjMW5qtkZmuBn.	1	{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}	t	2023-05-24 09:27:28.590498+03	f	\N
7	3	Ayham Akeel	admin3	$2a$10$euahTAFyTI2hUUxdmU6zZOZEXoBMMIYGlEHCiJuufTiXboezylNve	3	{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}	t	2023-05-08 14:09:25.945852+03	f	\N
9	5	Admin user2	admin2	$2a$10$TUZEvqbeuvMD6XHuheXNCuQ71cD7ikRugkbKIOkbINvXAJPmhBcDC	2	{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}	t	2023-05-24 09:28:45.710406+03	f	\N
10	5	Audit	admin4	$2a$10$95O5pzQjBqmVAmwDXyxpWea7NGwkLERprMSVDln0Shq8FcI3O9z32	2	{"admin":true,"create":true,"update":true,"delete":true,"print":true,"report":false}	t	2023-05-28 09:25:30.264926+03	f	\N
11	2	استخبارات	admin5	$2a$10$T2pjHmwDv3FZ9CtfrPulZ..nrP8s776EahzNfpe737Dn5G2au042G	2	{"admin":true,"create":true,"update":false,"delete":false,"print":true,"report":false}	t	2023-05-28 09:25:50.596505+03	f	\N
12	3	البنى التحتية	admin6	$2a$10$98y3WCGrbyrC6.u88O6NnuUbbOmb6JUYiobmj0vkAyr0FWu6WqlcW	2	{"admin":true,"create":true,"update":true,"delete":false,"print":false,"report":false}	t	2023-05-28 13:13:13.158523+03	f	\N
\.


--
-- TOC entry 3438 (class 0 OID 66516)
-- Dependencies: 224
-- Data for Name: weapon_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapon_name (id, weapon_name, weapon_size) FROM stdin;
1	p1	9mm
\.


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 210
-- Name: app_person_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_person_type_id_seq', 7, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 217
-- Name: license_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.license_type_id_seq', 2, true);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 219
-- Name: province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.province_id_seq', 4, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 226
-- Name: subidentity_sudid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subidentity_sudid_seq', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 225
-- Name: weapon_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapon_name_id_seq', 1, true);


--
-- TOC entry 3249 (class 2606 OID 66528)
-- Name: approval_destination app_person_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approval_destination
    ADD CONSTRAINT app_person_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 74596)
-- Name: biometric biometric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT biometric_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 66530)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 66532)
-- Name: identification identification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT identification_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 66534)
-- Name: license_type license_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type
    ADD CONSTRAINT license_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 66536)
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 66538)
-- Name: requests_details requests_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 66540)
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 66599)
-- Name: subidentity subidentity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subidentity
    ADD CONSTRAINT subidentity_pkey PRIMARY KEY (sudid);


--
-- TOC entry 3267 (class 2606 OID 66542)
-- Name: users users_namen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_namen_key UNIQUE (name);


--
-- TOC entry 3269 (class 2606 OID 66544)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 66546)
-- Name: users users_usernamen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_usernamen_key UNIQUE (username);


--
-- TOC entry 3251 (class 2606 OID 66548)
-- Name: approvals weapon_approvalsn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approvals
    ADD CONSTRAINT weapon_approvalsn_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 66550)
-- Name: weapon_name weapon_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name
    ADD CONSTRAINT weapon_name_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 66551)
-- Name: requests requests_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3278 (class 2606 OID 66556)
-- Name: requests_details requests_details_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3279 (class 2606 OID 66561)
-- Name: requests_details requests_details_license_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_license_id_fkey FOREIGN KEY (license_id) REFERENCES public.license_type(id);


--
-- TOC entry 3280 (class 2606 OID 66566)
-- Name: requests_details requests_details_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


--
-- TOC entry 3281 (class 2606 OID 66571)
-- Name: requests_details requests_details_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_req_id_fkey FOREIGN KEY (req_id) REFERENCES public.requests(id);


--
-- TOC entry 3282 (class 2606 OID 66576)
-- Name: requests_details requests_details_weapname_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_weapname_id_fkey FOREIGN KEY (weapname_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3277 (class 2606 OID 66581)
-- Name: requests requests_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


--
-- TOC entry 3283 (class 2606 OID 66586)
-- Name: users users_approval_det; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_approval_det FOREIGN KEY (approval_det_id) REFERENCES public.approval_destination(id);


-- Completed on 2023-05-31 11:13:04

--
-- PostgreSQL database dump complete
--

