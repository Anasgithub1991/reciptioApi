--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-05-30 10:00:52

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
-- TOC entry 209 (class 1259 OID 57992)
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
-- TOC entry 210 (class 1259 OID 57998)
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
-- TOC entry 211 (class 1259 OID 57999)
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
-- TOC entry 212 (class 1259 OID 58005)
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
-- TOC entry 213 (class 1259 OID 58006)
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
-- TOC entry 214 (class 1259 OID 58012)
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
-- TOC entry 215 (class 1259 OID 58013)
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
-- TOC entry 216 (class 1259 OID 58019)
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
-- TOC entry 217 (class 1259 OID 58020)
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
-- TOC entry 218 (class 1259 OID 58026)
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
-- TOC entry 219 (class 1259 OID 58027)
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
-- TOC entry 220 (class 1259 OID 58033)
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
-- TOC entry 221 (class 1259 OID 58034)
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
-- TOC entry 222 (class 1259 OID 58040)
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
-- TOC entry 223 (class 1259 OID 58041)
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
    idnum text,
    pro_id integer,
    cat_id integer,
    addresses text,
    phone text,
    note text,
    created_at timestamp with time zone DEFAULT now(),
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    downloaded boolean DEFAULT false
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN requests.downloaded; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests.downloaded IS 'يؤشر حالة القيد هل تم تحويله الى قاعدة البيانات او لا وياخذ قيمتان (true,false)';


--
-- TOC entry 224 (class 1259 OID 58048)
-- Name: requests_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests_details (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    req_id uuid NOT NULL,
    license_id integer NOT NULL,
    name1 text NOT NULL,
    name2 text NOT NULL,
    name3 text NOT NULL,
    name4 text,
    surname text,
    cat_id integer NOT NULL,
    birdate timestamp with time zone NOT NULL,
    gen_id integer NOT NULL,
    monam1 text NOT NULL,
    monam2 text NOT NULL,
    monam3 text NOT NULL,
    idnum text NOT NULL,
    iss_id1 integer,
    issdat1 date NOT NULL,
    natnum text NOT NULL,
    iss_id2 integer NOT NULL,
    issdat2 timestamp with time zone NOT NULL,
    pro_id integer,
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
    apptype_id integer,
    appnum text,
    appdate text,
    wea_hold_per text,
    margin_app text,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    completed smallint
);


ALTER TABLE public.requests_details OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 58055)
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
-- TOC entry 226 (class 1259 OID 58061)
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
-- TOC entry 3208 (class 2604 OID 58062)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 58063)
-- Name: gender id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender ALTER COLUMN id SET DEFAULT nextval('public.gender_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 58064)
-- Name: issuer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer ALTER COLUMN id SET DEFAULT nextval('public.issuer_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 58065)
-- Name: issuer_nat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer_nat ALTER COLUMN id SET DEFAULT nextval('public.issuer_nat_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 58066)
-- Name: license_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type ALTER COLUMN id SET DEFAULT nextval('public.license_type_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 58067)
-- Name: prev_weapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons ALTER COLUMN id SET DEFAULT nextval('public.prev_weapons_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 58068)
-- Name: province id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 58069)
-- Name: weapon_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name ALTER COLUMN id SET DEFAULT nextval('public.weapon_name_id_seq'::regclass);


--
-- TOC entry 3401 (class 0 OID 57992)
-- Dependencies: 209
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, cat, created_at, created_by, updated_at, updated_by) VALUES (1, 'طبيب', '2023-05-10 11:21:18.913318+03', NULL, NULL, NULL);
INSERT INTO public.category (id, cat, created_at, created_by, updated_at, updated_by) VALUES (2, 'محامي', '2023-05-10 11:21:18.913318+03', NULL, NULL, NULL);
INSERT INTO public.category (id, cat, created_at, created_by, updated_at, updated_by) VALUES (3, 'رجل اعمال', '2023-05-10 11:21:18.913318+03', NULL, NULL, NULL);


--
-- TOC entry 3403 (class 0 OID 57999)
-- Dependencies: 211
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gender (id, gen, created_at, created_by, updated_at, updated_by) VALUES (1, 'ذكر', '2023-05-10 11:07:30.465484+03', NULL, NULL, NULL);
INSERT INTO public.gender (id, gen, created_at, created_by, updated_at, updated_by) VALUES (2, 'انثى', '2023-05-10 11:07:30.465484+03', NULL, NULL, NULL);


--
-- TOC entry 3405 (class 0 OID 58006)
-- Dependencies: 213
-- Data for Name: issuer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.issuer (id, iss, created_at, created_by, updated_at, updated_by) VALUES (1, 'مكتب معبومات بغداد', '2023-05-10 11:14:16.214813+03', NULL, NULL, NULL);


--
-- TOC entry 3407 (class 0 OID 58013)
-- Dependencies: 215
-- Data for Name: issuer_nat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.issuer_nat (id, iss, created_at, created_by, updated_at, updated_by) VALUES (1, 'kjwdkn', '2023-05-24 15:26:55.081312+03', NULL, NULL, NULL);


--
-- TOC entry 3409 (class 0 OID 58020)
-- Dependencies: 217
-- Data for Name: license_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.license_type (id, license, created_at, created_by, updated_at, updated_by) VALUES (1, 'اصدار جديد', '2023-05-10 11:15:29.716554+03', NULL, NULL, NULL);
INSERT INTO public.license_type (id, license, created_at, created_by, updated_at, updated_by) VALUES (2, 'تجديد', '2023-05-10 11:15:29.716554+03', NULL, NULL, NULL);


--
-- TOC entry 3411 (class 0 OID 58027)
-- Dependencies: 219
-- Data for Name: prev_weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3413 (class 0 OID 58034)
-- Dependencies: 221
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.province (id, pro, created_at, created_by, updated_at, updated_by) VALUES (1, 'بغداد', '2023-05-10 11:11:23.280333+03', NULL, NULL, NULL);
INSERT INTO public.province (id, pro, created_at, created_by, updated_at, updated_by) VALUES (2, 'اربيل', '2023-05-10 11:11:23.280333+03', NULL, NULL, NULL);
INSERT INTO public.province (id, pro, created_at, created_by, updated_at, updated_by) VALUES (3, 'بابل', '2023-05-10 11:11:23.280333+03', NULL, NULL, NULL);
INSERT INTO public.province (id, pro, created_at, created_by, updated_at, updated_by) VALUES (4, 'النجف الاشرف', '2023-05-10 11:11:23.280333+03', NULL, NULL, NULL);


--
-- TOC entry 3415 (class 0 OID 58041)
-- Dependencies: 223
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, idnum, pro_id, cat_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, downloaded) VALUES ('1e203947-57b5-489c-ab2b-4a4f744a0daa', 'mmmmm', 'B', 'C', 'D', 'E', 'F', '1988-01-01 00:00:00+03', 1, 'A', 'A', 'A', '9999', NULL, NULL, 'Baagdhad', '07701234', 'ddddddddddd', '2023-05-24 12:32:35.046176+03', NULL, NULL, NULL, false);
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, idnum, pro_id, cat_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, downloaded) VALUES ('3d14be86-1cc4-4b70-acb7-d02a7d0cf01d', 'qqqqqqqqqqqqqqq', 'B', 'C', 'D', 'E', 'F', '1988-01-01 00:00:00+03', 2, 'A', 'A', 'A', '9999', NULL, NULL, 'Baagdhad', '07701234', 'ddddddddddd', '2023-05-24 12:33:15.180433+03', NULL, NULL, NULL, false);
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, idnum, pro_id, cat_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, downloaded) VALUES ('7c74cd68-f710-44f0-a0c3-89376bb5d118', 'A', 'B', 'C', 'D', 'E', 'F', '1988-01-01 00:00:00+03', 1, 'A', 'A', 'A', '9999', 2, 1, 'Baagdhad', '07701234', 'not exists', '2023-05-24 11:15:20.322096+03', NULL, NULL, NULL, false);
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, idnum, pro_id, cat_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, downloaded) VALUES ('9c0d0a81-5c15-46be-a726-5f2fdc0ce4f0', 'mmmmm', 'B', 'C', 'D', 'E', 'F', '1988-01-01 00:00:00+03', 1, 'A', 'A', 'A', '9999', 1, 2, 'Baagdhad', '07701234', 'ddddddddddd', '2023-05-24 11:11:35.33552+03', NULL, NULL, NULL, false);
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, idnum, pro_id, cat_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, downloaded) VALUES ('e0e3c23b-4fbd-4e52-924d-060b2c28664f', 'test', 'test', 'test', 'test', 'test', 'test', '2023-05-22 00:00:00+03', 2, 'test', 'test', 'test', '99', 1, 1, 'بغداد', '0780123', 'لاتوجد ملاحظات', '2023-01-05 00:00:00+03', 1, '2023-01-05 00:00:00+03', 1, false);


--
-- TOC entry 3416 (class 0 OID 58048)
-- Dependencies: 224
-- Data for Name: requests_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('71e694fe-9030-43cc-a314-77e723c9e7a9', '7c74cd68-f710-44f0-a0c3-89376bb5d118', 1, 'n1', 'n2', 'n3', 'n4', 'n5', 1, '1998-01-01 00:00:00+03', 1, 'm1
', 'm2', 'm3', '12', 1, '2023-05-24', 'bnv', 1, '2022-01-01 00:00:00+03', 1, 'rrr', '22w', 'dkjdf', 'frfe', 'eef', 'wdwf', 'wdwd', NULL, 'wdw', 1, 'fe', 1, '1', '2023-05-24', 'sf', 'sfsf', NULL, '2023-05-24 15:27:00.790022+03', 1, NULL, NULL, 0);


--
-- TOC entry 3417 (class 0 OID 58055)
-- Dependencies: 225
-- Data for Name: weapon_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.weapon_name (id, weapon_name, weapon_size, created_at, created_by, updated_at, updated_by) VALUES (1, 'كلك', '9', '2023-05-10 11:26:22.30887+03', NULL, NULL, NULL);


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

SELECT pg_catalog.setval('public.license_type_id_seq', 2, true);


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
-- TOC entry 3229 (class 2606 OID 58071)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 58073)
-- Name: gender gender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 58075)
-- Name: issuer_nat issuer_nat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer_nat
    ADD CONSTRAINT issuer_nat_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 58077)
-- Name: issuer issuer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer
    ADD CONSTRAINT issuer_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 58079)
-- Name: license_type license_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type
    ADD CONSTRAINT license_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 58081)
-- Name: prev_weapons prev_weapons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons
    ADD CONSTRAINT prev_weapons_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 58083)
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 58085)
-- Name: requests_details requests_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 58087)
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 58089)
-- Name: weapon_name weapon_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name
    ADD CONSTRAINT weapon_name_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 58090)
-- Name: prev_weapons prev_weapons_req_det_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons
    ADD CONSTRAINT prev_weapons_req_det_id_fkey FOREIGN KEY (req_det_id) REFERENCES public.requests_details(id);


--
-- TOC entry 3249 (class 2606 OID 58095)
-- Name: prev_weapons prev_weapons_weapname_prev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons
    ADD CONSTRAINT prev_weapons_weapname_prev_id_fkey FOREIGN KEY (weapname_prev_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3250 (class 2606 OID 58100)
-- Name: prev_weapons prev_weapons_weapsize_prev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons
    ADD CONSTRAINT prev_weapons_weapsize_prev_id_fkey FOREIGN KEY (weapsize_prev_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3251 (class 2606 OID 58105)
-- Name: requests requests_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3254 (class 2606 OID 58110)
-- Name: requests_details requests_details_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3255 (class 2606 OID 58115)
-- Name: requests_details requests_details_gen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_gen_id_fkey FOREIGN KEY (gen_id) REFERENCES public.gender(id);


--
-- TOC entry 3256 (class 2606 OID 58120)
-- Name: requests_details requests_details_iss_id1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_iss_id1_fkey FOREIGN KEY (iss_id1) REFERENCES public.issuer(id);


--
-- TOC entry 3257 (class 2606 OID 58125)
-- Name: requests_details requests_details_iss_id2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_iss_id2_fkey FOREIGN KEY (iss_id2) REFERENCES public.issuer_nat(id);


--
-- TOC entry 3258 (class 2606 OID 58130)
-- Name: requests_details requests_details_license_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_license_id_fkey FOREIGN KEY (license_id) REFERENCES public.license_type(id);


--
-- TOC entry 3259 (class 2606 OID 58135)
-- Name: requests_details requests_details_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


--
-- TOC entry 3260 (class 2606 OID 58140)
-- Name: requests_details requests_details_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_req_id_fkey FOREIGN KEY (req_id) REFERENCES public.requests(id);


--
-- TOC entry 3261 (class 2606 OID 58145)
-- Name: requests_details requests_details_weapname_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_weapname_id_fkey FOREIGN KEY (weapname_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3252 (class 2606 OID 58150)
-- Name: requests requests_gen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_gen_id_fkey FOREIGN KEY (gen_id) REFERENCES public.gender(id);


--
-- TOC entry 3253 (class 2606 OID 58155)
-- Name: requests requests_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


-- Completed on 2023-05-30 10:00:53

--
-- PostgreSQL database dump complete
--

