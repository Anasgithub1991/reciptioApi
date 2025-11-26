--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-06-13 09:17:48

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
-- TOC entry 209 (class 1259 OID 27323)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    cat text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 27329)
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
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 210
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 211 (class 1259 OID 27330)
-- Name: gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gender (
    id integer NOT NULL,
    gen text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.gender OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 27336)
-- Name: gender_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gender_id_seq OWNER TO postgres;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 212
-- Name: gender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gender_id_seq OWNED BY public.gender.id;


--
-- TOC entry 213 (class 1259 OID 27337)
-- Name: issuer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issuer (
    id integer NOT NULL,
    iss text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.issuer OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 27343)
-- Name: issuer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issuer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issuer_id_seq OWNER TO postgres;

--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 214
-- Name: issuer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issuer_id_seq OWNED BY public.issuer.id;


--
-- TOC entry 215 (class 1259 OID 27344)
-- Name: issuer_nat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issuer_nat (
    id integer NOT NULL,
    iss text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.issuer_nat OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 27350)
-- Name: issuer_nat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issuer_nat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issuer_nat_id_seq OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 216
-- Name: issuer_nat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issuer_nat_id_seq OWNED BY public.issuer_nat.id;


--
-- TOC entry 217 (class 1259 OID 27351)
-- Name: license_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.license_type (
    id integer NOT NULL,
    license text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.license_type OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 27357)
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
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 218
-- Name: license_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.license_type_id_seq OWNED BY public.license_type.id;


--
-- TOC entry 219 (class 1259 OID 27358)
-- Name: prev_weapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prev_weapons (
    id integer NOT NULL,
    req_det_id uuid NOT NULL,
    weapname_prev_id integer NOT NULL,
    weapnum_prev text NOT NULL,
    weapsize_prev_id integer NOT NULL,
    ident_prev_num integer NOT NULL,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.prev_weapons OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 27364)
-- Name: prev_weapons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prev_weapons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prev_weapons_id_seq OWNER TO postgres;

--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 220
-- Name: prev_weapons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prev_weapons_id_seq OWNED BY public.prev_weapons.id;


--
-- TOC entry 221 (class 1259 OID 27365)
-- Name: province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.province (
    id integer NOT NULL,
    pro text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.province OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 27371)
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
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 222
-- Name: province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.province_id_seq OWNED BY public.province.id;


--
-- TOC entry 223 (class 1259 OID 27372)
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name1 text NOT NULL,
    name2 text,
    name3 text,
    name4 text,
    surname text,
    profession text,
    birdate timestamp with time zone,
    gen_id integer,
    monam1 text,
    monam2 text,
    monam3 text,
    cat_id integer,
    idnum text,
    iss_id1 integer,
    issdat1 date,
    natnum text,
    iss_id2 integer,
    issdat2 timestamp with time zone,
    pro_id integer,
    addresses text,
    nearplace text,
    mahala text,
    zuqaq text,
    dar text,
    djp text,
    numdet text,
    datedet timestamp with time zone,
    phone text,
    note text,
    created_at timestamp with time zone DEFAULT now(),
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    downloaded boolean DEFAULT false,
    nanoid character(10),
    org text
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN requests.downloaded; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests.downloaded IS 'يؤشر حالة القيد هل تم تحويله الى قاعدة البيانات او لا وياخذ قيمتان (true,false)';


--
-- TOC entry 224 (class 1259 OID 27380)
-- Name: requests_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests_details (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    req_id uuid NOT NULL,
    license_id integer,
    name1 text,
    name2 text,
    name3 text,
    name4 text,
    surname text,
    cat_id integer,
    birdate timestamp with time zone,
    gen_id integer,
    monam1 text,
    monam2 text,
    monam3 text,
    idnum text,
    iss_id1 integer,
    issdat1 date,
    natnum text,
    iss_id2 integer,
    issdat2 timestamp with time zone,
    pro_id integer,
    addresses text,
    nearplace text,
    mahala text,
    zuqaq text,
    dar text,
    djp text,
    numdet text,
    datedet timestamp with time zone,
    phone text,
    weapname_id integer,
    weapnum text,
    apptype_id integer,
    appnum text,
    appdate text,
    wea_hold_per text,
    margin_app text,
    note text,
    created_at timestamp with time zone DEFAULT now(),
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    completed smallint
);


ALTER TABLE public.requests_details OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 27387)
-- Name: weapon_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapon_name (
    id integer NOT NULL,
    weapon_name text NOT NULL,
    weapon_size text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer
);


ALTER TABLE public.weapon_name OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 27393)
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
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 226
-- Name: weapon_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapon_name_id_seq OWNED BY public.weapon_name.id;


--
-- TOC entry 3208 (class 2604 OID 27394)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 27395)
-- Name: gender id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender ALTER COLUMN id SET DEFAULT nextval('public.gender_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 27396)
-- Name: issuer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer ALTER COLUMN id SET DEFAULT nextval('public.issuer_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 27397)
-- Name: issuer_nat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer_nat ALTER COLUMN id SET DEFAULT nextval('public.issuer_nat_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 27398)
-- Name: license_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type ALTER COLUMN id SET DEFAULT nextval('public.license_type_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 27399)
-- Name: prev_weapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons ALTER COLUMN id SET DEFAULT nextval('public.prev_weapons_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 27400)
-- Name: province id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 27401)
-- Name: weapon_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name ALTER COLUMN id SET DEFAULT nextval('public.weapon_name_id_seq'::regclass);


--
-- TOC entry 3401 (class 0 OID 27323)
-- Dependencies: 209
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, cat, created_at, created_by, updated_at, updated_by) FROM stdin;
1	طبيب	2023-05-10 11:21:18.913318+03	\N	\N	\N
2	محامي	2023-05-10 11:21:18.913318+03	\N	\N	\N
3	رجل اعمال	2023-05-10 11:21:18.913318+03	\N	\N	\N
\.


--
-- TOC entry 3403 (class 0 OID 27330)
-- Dependencies: 211
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gender (id, gen, created_at, created_by, updated_at, updated_by) FROM stdin;
1	ذكر	2023-05-10 11:07:30.465484+03	\N	\N	\N
2	انثى	2023-05-10 11:07:30.465484+03	\N	\N	\N
\.


--
-- TOC entry 3405 (class 0 OID 27337)
-- Dependencies: 213
-- Data for Name: issuer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issuer (id, iss, created_at, created_by, updated_at, updated_by) FROM stdin;
1	مكتب معبومات بغداد	2023-05-10 11:14:16.214813+03	\N	\N	\N
\.


--
-- TOC entry 3407 (class 0 OID 27344)
-- Dependencies: 215
-- Data for Name: issuer_nat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issuer_nat (id, iss, created_at, created_by, updated_at, updated_by) FROM stdin;
1	مكتب معلومات الرصافة	2023-05-24 15:26:55.081312+03	\N	\N	\N
\.


--
-- TOC entry 3409 (class 0 OID 27351)
-- Dependencies: 217
-- Data for Name: license_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.license_type (id, license, created_at, created_by, updated_at, updated_by) FROM stdin;
1	اصدار جديد	2023-05-10 11:15:29.716554+03	\N	\N	\N
2	تجديد	2023-05-10 11:15:29.716554+03	\N	\N	\N
3	فقدان	2023-06-11 11:36:09.560417+03	\N	\N	\N
\.


--
-- TOC entry 3411 (class 0 OID 27358)
-- Dependencies: 219
-- Data for Name: prev_weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prev_weapons (id, req_det_id, weapname_prev_id, weapnum_prev, weapsize_prev_id, ident_prev_num, note, created_at, created_by, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3413 (class 0 OID 27365)
-- Dependencies: 221
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.province (id, pro, created_at, created_by, updated_at, updated_by) FROM stdin;
1	بغداد	2023-05-10 11:11:23.280333+03	\N	\N	\N
2	اربيل	2023-05-10 11:11:23.280333+03	\N	\N	\N
3	بابل	2023-05-10 11:11:23.280333+03	\N	\N	\N
4	النجف الاشرف	2023-05-10 11:11:23.280333+03	\N	\N	\N
\.


--
-- TOC entry 3415 (class 0 OID 27372)
-- Dependencies: 223
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, cat_id, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, note, created_at, created_by, updated_at, updated_by, downloaded, nanoid, org) FROM stdin;
9c0d0a81-5c15-46be-a726-5f2fdc0ce4f0	mmmmm	B	C	D	E	F	1988-01-01 00:00:00+03	1	A	A	A	2	9999	\N	\N	\N	\N	\N	1	Baagdhad	\N	\N	\N	\N	\N	\N	\N	07701234	ddddddddddd	2023-05-24 11:11:35.33552+03	\N	\N	\N	t	\N	\N
1e203947-57b5-489c-ab2b-4a4f744a0daa	mmmmm	B	C	D	E	F	1988-01-01 00:00:00+03	1	A	A	A	1	9999	\N	\N	\N	\N	\N	1	Baagdhad	\N	\N	\N	\N	\N	\N	\N	07701234	ddddddddddd	2023-05-24 12:32:35.046176+03	\N	\N	\N	f	\N	\N
3d14be86-1cc4-4b70-acb7-d02a7d0cf01d	qqqqqqqqqqqqqqq	B	C	D	E	F	1988-01-01 00:00:00+03	2	A	A	A	1	9999	\N	\N	\N	\N	\N	2	Baagdhad	\N	\N	\N	\N	\N	\N	\N	07701234	ddddddddddd	2023-05-24 12:33:15.180433+03	\N	\N	\N	t	\N	\N
e0e3c23b-4fbd-4e52-924d-060b2c28664f	test	test	test	test	test	test	2023-05-22 00:00:00+03	2	test	test	test	1	99	\N	\N	\N	\N	\N	1	بغداد	\N	\N	\N	\N	\N	\N	\N	0780123	لاتوجد ملاحظات	2023-01-05 00:00:00+03	1	\N	1	t	\N	\N
7c74cd68-f710-44f0-a0c3-89376bb5d118	احمد	غانم	حميد	حسين	الشمري	F	1988-01-01 00:00:00+03	2	A	A	A	1	9999	\N	\N	\N	\N	\N	1	شارع 20, قرب التقاطع	\N	\N	\N	\N	\N	\N	\N	07701234	not exists	2023-05-24 11:15:20.322096+03	\N	\N	\N	f	\N	\N
b4a46ab5-08ec-4cd0-a4fb-7b2b02a8fa91	u	u	u	u	u	ee	2023-06-07 00:00:00+03	1	u	u	u	\N	e	\N	\N	\N	\N	\N	1	e	\N	\N	\N	\N	\N	\N	\N	9		2023-06-06 14:40:33.412028+03	\N	\N	\N	f	ee2789b777	\N
a2e33096-ae2c-4b11-bb01-274ab890f6ba	mahmooood						2023-06-27 00:00:00+03	\N				\N		\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2023-06-06 14:47:34.062148+03	\N	\N	\N	f	b532a57933	\N
6f716492-bc0d-4135-8202-acdd751cdb8f	alii						2023-06-01 00:00:00+03	\N				\N		\N	\N	\N	\N	\N	4	asAa	\N	\N	\N	\N	\N	\N	\N	98		2023-06-06 20:38:41.094335+03	\N	\N	\N	f	72e16ca612	\N
57c66740-2c64-42ce-bda2-7b824040afc1	hks						2023-06-27 00:00:00+03	\N				\N		\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2023-06-06 20:46:57.68379+03	\N	\N	\N	f	3f00cbfb81	\N
b00b882a-60c0-45fb-8b79-5f9bf744cb82	hks						2023-06-28 00:00:00+03	1				\N		\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2023-06-06 20:59:22.827173+03	\N	\N	\N	f	9de41cdcc6	\N
a9495eb6-4d30-4c74-9778-00b2b5f2e12d	23						2023-06-01 00:00:00+03	1				\N		\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2023-06-06 21:02:53.78385+03	\N	\N	\N	f	366a5a52a2	\N
8ccab32d-1a39-4c9e-b767-b951e9663094	jabar	9	9	9	9		2023-06-01 00:00:00+03	2	9	9	9	1		1	2023-06-29	234	1	2023-06-22 00:00:00+03	1	123	123	1	1	1	\N	\N	\N	123		2023-06-06 21:25:05.178956+03	\N	\N	\N	\N	fe774f64ef	\N
adf19ceb-4433-45a8-bd7e-ec11f3619ca3	haider	hh	hh	hh	hh		2023-06-07 00:00:00+03	1	m	m	m	1	4444	1	2023-06-27	asAa	1	2023-06-28 00:00:00+03	2	asAa	asAa	asAa	asAa	asAa	\N	\N	\N	1234567		2023-06-06 21:47:43.848647+03	\N	\N	\N	\N	7652e20459	\N
4c4ccac6-f3e5-4ec4-8131-b4ba06c6f64d	انس555	hks	rter44444	hh	hh		2023-06-27 00:00:00+03	1	hh	hh	hh	1	11	1	2023-06-20	سامر	1	2023-06-28 00:00:00+03	2	qq	yy	yy	yy	yy	\N	\N	\N	123		2023-06-06 23:23:33.938967+03	\N	\N	\N	\N	86d7055085	\N
276f8186-5d34-472c-934f-20bfeca960fb	ooo	ooo	ooo	ooo	ooo		2023-06-28 00:00:00+03	1	ooo	ooo	ooo	1	oo	1	2023-06-29	oo	1	2023-06-23 00:00:00+03	2	oo	oo	oo	oo	oo	\N	\N	\N	11		2023-06-06 23:40:54.617002+03	\N	\N	\N	\N	9df5ec6e99	\N
86004386-f9f2-4c61-9217-21050be51aa0	9	999	999	999	999		2023-06-28 00:00:00+03	1	999	9999	9999	2	999	1	2023-06-28	999	1	2023-06-30 00:00:00+03	3	asAa	999	999	9999	99	\N	\N	\N	999		2023-06-07 00:02:34.986701+03	\N	\N	\N	\N	f379cdf908	\N
9154caa5-e7c8-4417-9745-388d15ee34b1	ahmed	kareem	m	m	m		2023-06-21 00:00:00+03	1	m	m	m	3	11	1	2023-06-20	alii	1	2023-06-28 00:00:00+03	1	mansor	samad	1	1	1	\N	\N	\N	0770		2023-06-11 09:00:40.071017+03	\N	\N	\N	\N	b492a1b411	\N
95801a94-5ce1-4d90-9001-53a5f9dc1f64	fdrd	rdtjr	rdjtr	jrdtjr	jrr		2023-06-14 00:00:00+03	2	jrtjr	jrdjtr	jrjtr	2		1	2023-06-14		\N	\N	1	سامر	ktfy	7	7		\N	\N	\N	111222		2023-06-12 08:46:34.079051+03	\N	\N	\N	\N	e33b3c5127	\N
94e851fa-3c14-4107-985c-58d0bc60e714	انس	tt	tt	tt	tt		2023-06-08 00:00:00+03	1	tt	tt	tt	2	انس	1	2023-06-13	hks	1	\N	1	انس	asAa	1	1	1	\N	\N	\N	123		2023-06-12 09:16:34.305057+03	\N	\N	\N	\N	4b17b9c41d	\N
3ed56bff-2079-4262-b856-742ffd8ba165	انس						2023-05-31 00:00:00+03	1	2			2	1	1	2023-06-14		\N	\N	2	11	1	1	1	1	\N	\N	\N	12		2023-06-12 09:59:51.816415+03	\N	\N	\N	\N	fe1bc28bce	\N
dc99be42-9d2f-4b27-b435-1f1e497162fe	kkk	kkk	kkk	kk	kk		2023-06-21 00:00:00+03	1	kk	kk	kk	1	89	1	2023-06-21		\N	\N	1	سامر	uu	uu	uu	uu	\N	\N	\N	123		2023-06-12 10:25:42.696361+03	\N	\N	\N	\N	038f4c62af	\N
f3004717-a973-4f11-8951-0fce0b9e91ce	try1						2023-06-13 00:00:00+03	1				1		1	2023-06-21		\N	\N	1						\N	\N	\N			2023-06-12 10:34:45.0607+03	\N	\N	\N	\N	7f7a372d08	\N
43a93d4d-fcdd-4d18-acf8-41deedd8d1ad	noor						2023-07-05 00:00:00+03	2	n			1	1	1	2023-06-15		\N	\N	2						\N	\N	\N			2023-06-12 11:43:27.757365+03	\N	\N	\N	\N	31ee411d21	\N
053fa116-61d4-43e8-bc15-8f2c2dad0c1a	asraa						2023-06-08 00:00:00+03	2				2	1	1	2023-06-14		\N	\N	1						\N	\N	\N	1		2023-06-12 12:24:51.530776+03	\N	\N	\N	\N	d8f482b621	\N
f53a93bf-592b-47d6-97b6-d68d1005c921	aliia						2023-06-08 00:00:00+03	1				2	123	1	2023-06-14		\N	\N	2						\N	\N	\N			2023-06-12 13:06:06.850931+03	\N	\N	\N	\N	81fa53ed50	\N
0efb4235-0b24-4705-94a6-8a639ba5b382	anass						2023-06-14 00:00:00+03	1				2	456	1	2023-07-05		\N	\N	3						\N	\N	\N	1		2023-06-12 13:15:50.123063+03	\N	\N	\N	\N	6f3b71ec4a	\N
c05281d7-a718-4c2a-bec6-c52a4b7456ed	kahlan						2023-06-14 00:00:00+03	1				2	123	1	2023-06-29		\N	\N	2						\N	\N	\N	qwe		2023-06-12 13:27:58.605253+03	\N	\N	\N	\N	63c973550d	\N
4121d900-d076-4d08-a02b-e4d214ea2920	o9o						2023-06-13 00:00:00+03	1				2	aliia	1	2023-06-22		\N	\N	2						\N	\N	\N			2023-06-12 13:30:31.518458+03	\N	\N	\N	\N	9c1a10c970	\N
dce52e4a-3523-4974-9b11-76b87345e657	;4;						2023-06-08 00:00:00+03	1	aliia			2	888	1	2023-06-22		\N	\N	2						\N	\N	\N			2023-06-12 13:33:40.139893+03	\N	\N	\N	\N	f72b0c7280	\N
8997048a-9e10-4c34-989d-ff8f7f332e0d	ll						2023-06-14 00:00:00+03	1				2	qaz	1	2023-06-29		\N	\N	1						\N	\N	\N			2023-06-12 13:38:27.906706+03	\N	\N	\N	\N	96876d01fc	\N
8934004b-a1ab-4470-b6f5-cfdce5b61ef2	opo						2023-06-02 00:00:00+03	1				\N	123	1	2023-06-06		\N	\N	2	kahlan					\N	\N	\N			2023-06-12 13:42:48.395061+03	\N	\N	\N	\N	5e8f08bf31	\N
59dcd60f-2702-4e43-98df-ee899f01e7b5	88988						2023-06-13 00:00:00+03	2				1	89	1	2023-06-21		\N	\N	2						\N	\N	\N			2023-06-12 13:51:19.449476+03	\N	\N	\N	\N	b520d58d45	\N
b01a4106-5344-4e50-b818-791ab40a395d	iuyuy						2023-06-14 00:00:00+03	1				1	33	1	2023-06-15		\N	\N	2						\N	\N	\N	2333		2023-06-12 21:24:21.339159+03	\N	\N	\N	\N	52769ea7ca	\N
6b265c0a-f23f-4347-873a-ce4fc5eaf955	انس						2023-06-08 00:00:00+03	1				2	alii	1	2023-06-21		1	2023-06-30 00:00:00+03	1						\N	\N	\N			2023-06-12 21:56:35.155312+03	\N	\N	\N	\N	8b7bf1ad36	\N
ac3031b2-72a0-41a1-b0d3-6a2623b30b77	محمد	علي	اسلام 	جاسم	الياسري		2023-06-14 00:00:00+03	1	سس	d		2	12345	1	2023-06-29		\N	\N	2						\N	\N	\N	07800121212		2023-06-12 23:41:31.633051+03	\N	\N	\N	\N	b394ee76ba	\N
bed49de0-8845-4b69-8b65-07e67fa463dd	محمد	كمال	عبد العباس 	كريم	الموسوي		2023-06-14 00:00:00+03	1	ة	ة	ة	1	123	1	2023-06-14		\N	\N	1	hks					\N	\N	\N	07700121212		2023-06-13 02:09:29.698765+03	\N	\N	\N	\N	c091a23a44	وزارة التربية
37ed4a6d-e4cc-4087-b60a-c4c6b28d2067	محجوم						2023-06-08 00:00:00+03	1				2	123	1	2023-06-14		\N	\N	\N						\N	\N	\N	111		2023-06-13 02:18:34.491953+03	\N	\N	\N	\N	d13c0d694c	
f8174dd0-82d3-4425-bb6b-7486c0ce3a6c	ly	lyl	uyu	yluy	luy		2023-06-07 00:00:00+03	2	tluy	tluy	luyluyt	1	qq	1	2023-06-28		\N	\N	2	سامر	q	q		q	\N	\N	\N	11		2023-06-13 02:55:29.300964+03	\N	\N	\N	\N	574a4c5a27	null
\.


--
-- TOC entry 3416 (class 0 OID 27380)
-- Dependencies: 224
-- Data for Name: requests_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) FROM stdin;
71e694fe-9030-43cc-a314-77e723c9e7a9	7c74cd68-f710-44f0-a0c3-89376bb5d118	1	n1	n2	n3	n4	n5	1	1998-01-01 00:00:00+03	1	m1\n	m2	m3	12	1	2023-05-24	bnv	1	2022-01-01 00:00:00+03	1	rrr	22w	dkjdf	frfe	eef	wdwf	wdwd	\N	wdw	1	fe	1	1	2023-05-24	sf	sfsf	\N	2023-05-24 15:27:00.790022+03	1	\N	\N	0
024f3715-28a9-46a2-a0fe-4ae33f85662d	b4a46ab5-08ec-4cd0-a4fb-7b2b02a8fa91	1	u	u	u	u	u	1	2023-06-07 00:00:00+03	1	u	u	u	e	1	2023-06-20	سامر	1	2023-06-29 00:00:00+03	1	e	q	q	q	q	\N	\N	\N	9	1	انس	\N	\N	\N	\N	\N	\N	2023-06-06 14:40:33.449674+03	\N	\N	\N	\N
791977b0-9a8c-4e9b-b0c5-eb40a28717e3	a2e33096-ae2c-4b11-bb01-274ab890f6ba	1	q	q	q	q	q	1	2023-06-19 00:00:00+03	1	q	q	q	rter44444	1	2023-06-21	3	1	2023-06-22 00:00:00+03	1	q	q	q	q	q	\N	\N	\N	انس	1	1	\N	\N	\N	\N	\N	\N	2023-06-06 14:47:34.094394+03	\N	\N	\N	\N
319833b7-ffb5-4b94-8e1f-3492921a8e25	6f716492-bc0d-4135-8202-acdd751cdb8f	1	l	l	l	l	l	1	2023-06-27 00:00:00+03	1	l	l	l	انس	1	2023-06-01	rter44444	1	2023-06-15 00:00:00+03	2	1	1	1	1	1	\N	\N	\N	1	1	سامر	\N	\N	\N	\N	\N	\N	2023-06-06 20:38:41.132315+03	\N	\N	\N	\N
85e3aed0-1cec-4bf3-b374-a696232cf92a	adf19ceb-4433-45a8-bd7e-ec11f3619ca3	1	haider	hh	hh	hh	hh	2	2023-06-07 00:00:00+03	1	m	m	m	4444	1	2023-06-28	سامر	1	2023-06-22 00:00:00+03	2	asAa	qq	qq	qq	qq	\N	\N	\N	1234567	1	انس	\N	\N	\N	\N	\N	\N	2023-06-06 21:47:43.888432+03	\N	\N	\N	\N
423e291c-0531-4708-a46c-b23c91c90101	86004386-f9f2-4c61-9217-21050be51aa0	2	9	999	999	999	999	2	2023-06-28 00:00:00+03	1	999	9999	9999	999	1	2023-06-28	999	1	2023-06-30 00:00:00+03	3	asAa	999	999	9999	99	\N	\N	\N	999	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-07 00:02:35.032015+03	\N	\N	\N	\N
62fc4d8e-2e2e-4994-8fdd-d2682ff55a68	9154caa5-e7c8-4417-9745-388d15ee34b1	1	ahmed	kareem	m	m	m	3	2023-06-21 00:00:00+03	1	m	m	m	11	1	2023-06-20	alii	1	2023-06-28 00:00:00+03	1	mansor	samad	1	1	1	\N	\N	\N	0770	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-11 09:00:40.2433+03	\N	\N	\N	\N
fe73716e-ed37-4893-842c-ad9d5d467424	9154caa5-e7c8-4417-9745-388d15ee34b1	2	ali	kareem	m	m	m	1	2023-06-21 00:00:00+03	1	n	n	n	11	1	2023-06-20	alii	1	2023-06-28 00:00:00+03	1	mansor	samad	1	1	1	\N	\N	\N	0770	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-11 09:00:40.75291+03	\N	\N	\N	\N
44eea29b-5600-40f7-bc85-002872e0e39e	94e851fa-3c14-4107-985c-58d0bc60e714	1	ooo	oo	oo	oo	oo	3	2023-05-31 00:00:00+03	2	oo	oo	oo	11	1	2023-06-29	سامر	1	\N	2	انس	hks	1	1	1	\N	\N	\N	222	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-12 09:16:34.357001+03	\N	\N	\N	\N
dca01703-7d18-4417-b748-3dca9eb4583b	43a93d4d-fcdd-4d18-acf8-41deedd8d1ad	1	noor					1	2023-07-26 00:00:00+03	2	n			1	1	2023-06-15	2	1	\N	2						\N	\N	\N	123	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-12 11:43:27.842854+03	\N	\N	\N	\N
f7f46772-9a71-450c-9417-e45846a6fcfa	8997048a-9e10-4c34-989d-ff8f7f332e0d	2	ll					2	2023-06-14 00:00:00+03	1				qaz	1	2023-06-29	78	\N	\N	1						\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	2023-06-12 13:38:27.968178+03	\N	\N	\N	\N
05b1cf6f-d815-4f17-b15c-28eeb79ae0ec	59dcd60f-2702-4e43-98df-ee899f01e7b5	1	88988					1	2023-06-13 00:00:00+03	2				89	1	2023-06-21	null	\N	\N	2						\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	2023-06-12 13:51:19.511285+03	\N	\N	\N	\N
1e3d3484-43a8-4f11-a5ea-7cae4e63a29b	b01a4106-5344-4e50-b818-791ab40a395d	2	iuyuy					1	2023-06-14 00:00:00+03	1				33	1	2023-06-15	null	\N	\N	2						\N	\N	\N	2333	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-12 21:24:21.393909+03	\N	\N	\N	\N
593eb13d-3bda-4639-83db-7e03ec20e613	6b265c0a-f23f-4347-873a-ce4fc5eaf955	1	انس					2	2023-06-08 00:00:00+03	1				alii	1	2023-06-21		1	2023-06-30 00:00:00+03	1						\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	2023-06-12 21:56:35.221928+03	\N	\N	\N	\N
cfafcd9b-1b29-4ab4-a9e3-9cc8d3753c33	ac3031b2-72a0-41a1-b0d3-6a2623b30b77	2	محمد	علي	اسلام 	جاسم	الياسري	2	2023-06-14 00:00:00+03	1	سس	d		12345	1	2023-06-29	null	\N	\N	2						\N	\N	\N	07800121212	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-12 23:41:32.078365+03	\N	\N	\N	\N
e0f6f30d-ed16-4827-b6dc-ec43f4da557f	ac3031b2-72a0-41a1-b0d3-6a2623b30b77	3	ali	علي	اسلام 	جاسم	الياسري	2	2023-06-14 00:00:00+03	1	سس	d		12345	1	2023-06-29	null	\N	\N	2						\N	\N	\N	07800121212	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-12 23:41:32.364666+03	\N	\N	\N	\N
a3899840-bfa9-4295-b923-28409fb2d427	bed49de0-8845-4b69-8b65-07e67fa463dd	1	محمد	كمال	عبد العباس 	كريم	الموسوي	1	2023-06-14 00:00:00+03	1	ة	ة	ة	123	1	2023-06-14	null	\N	\N	1	hks					\N	\N	\N	07700121212	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-13 02:09:29.784454+03	\N	\N	\N	\N
ba0d9b59-7afa-4f8d-a127-e02d1a23214a	bed49de0-8845-4b69-8b65-07e67fa463dd	2	كرار	علي	عباس	حسين	العامري	1	2023-06-14 00:00:00+03	1	ة	ة	ة	123	1	2023-06-14	null	\N	\N	1	hks					\N	\N	\N	07700121212	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-13 02:09:30.193978+03	\N	\N	\N	\N
7fcbfc36-b540-498c-927a-98144bc07424	f8174dd0-82d3-4425-bb6b-7486c0ce3a6c	1	ly	lyl	uyu	yluy	luy	1	2023-06-07 00:00:00+03	2	tluy	tluy	luyluyt	qq	1	2023-06-28	null	\N	\N	2	سامر	q	q	4	q	\N	\N	\N	11	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-13 02:55:29.430563+03	\N	\N	\N	\N
\.


--
-- TOC entry 3417 (class 0 OID 27387)
-- Dependencies: 225
-- Data for Name: weapon_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapon_name (id, weapon_name, weapon_size, created_at, created_by, updated_at, updated_by) FROM stdin;
1	كلك	9	2023-05-10 11:26:22.30887+03	\N	\N	\N
\.


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 210
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 212
-- Name: gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gender_id_seq', 2, true);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 214
-- Name: issuer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issuer_id_seq', 1, true);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 216
-- Name: issuer_nat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issuer_nat_id_seq', 1, true);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 218
-- Name: license_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.license_type_id_seq', 3, true);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 220
-- Name: prev_weapons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prev_weapons_id_seq', 1, false);


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 222
-- Name: province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.province_id_seq', 4, true);


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 226
-- Name: weapon_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapon_name_id_seq', 1, true);


--
-- TOC entry 3229 (class 2606 OID 27403)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 27405)
-- Name: gender gender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 27407)
-- Name: issuer_nat issuer_nat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer_nat
    ADD CONSTRAINT issuer_nat_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 27409)
-- Name: issuer issuer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer
    ADD CONSTRAINT issuer_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 27411)
-- Name: license_type license_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type
    ADD CONSTRAINT license_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 27413)
-- Name: prev_weapons prev_weapons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons
    ADD CONSTRAINT prev_weapons_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 27415)
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 27417)
-- Name: requests_details requests_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 27419)
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 27421)
-- Name: weapon_name weapon_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name
    ADD CONSTRAINT weapon_name_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 27422)
-- Name: prev_weapons prev_weapons_req_det_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons
    ADD CONSTRAINT prev_weapons_req_det_id_fkey FOREIGN KEY (req_det_id) REFERENCES public.requests_details(id);


--
-- TOC entry 3249 (class 2606 OID 27427)
-- Name: prev_weapons prev_weapons_weapname_prev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons
    ADD CONSTRAINT prev_weapons_weapname_prev_id_fkey FOREIGN KEY (weapname_prev_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3250 (class 2606 OID 27432)
-- Name: prev_weapons prev_weapons_weapsize_prev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons
    ADD CONSTRAINT prev_weapons_weapsize_prev_id_fkey FOREIGN KEY (weapsize_prev_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3251 (class 2606 OID 27437)
-- Name: requests requests_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3254 (class 2606 OID 27442)
-- Name: requests_details requests_details_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3255 (class 2606 OID 27447)
-- Name: requests_details requests_details_gen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_gen_id_fkey FOREIGN KEY (gen_id) REFERENCES public.gender(id);


--
-- TOC entry 3256 (class 2606 OID 27452)
-- Name: requests_details requests_details_iss_id1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_iss_id1_fkey FOREIGN KEY (iss_id1) REFERENCES public.issuer(id);


--
-- TOC entry 3257 (class 2606 OID 27457)
-- Name: requests_details requests_details_iss_id2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_iss_id2_fkey FOREIGN KEY (iss_id2) REFERENCES public.issuer_nat(id);


--
-- TOC entry 3258 (class 2606 OID 27462)
-- Name: requests_details requests_details_license_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_license_id_fkey FOREIGN KEY (license_id) REFERENCES public.license_type(id);


--
-- TOC entry 3259 (class 2606 OID 27467)
-- Name: requests_details requests_details_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


--
-- TOC entry 3260 (class 2606 OID 27472)
-- Name: requests_details requests_details_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_req_id_fkey FOREIGN KEY (req_id) REFERENCES public.requests(id);


--
-- TOC entry 3261 (class 2606 OID 27477)
-- Name: requests_details requests_details_weapname_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_weapname_id_fkey FOREIGN KEY (weapname_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3252 (class 2606 OID 27482)
-- Name: requests requests_gen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_gen_id_fkey FOREIGN KEY (gen_id) REFERENCES public.gender(id);


--
-- TOC entry 3253 (class 2606 OID 27487)
-- Name: requests requests_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


-- Completed on 2023-06-13 09:17:49

--
-- PostgreSQL database dump complete
--

