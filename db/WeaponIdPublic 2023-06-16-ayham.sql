--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-16 14:10:58

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
-- TOC entry 214 (class 1259 OID 205018)
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
-- TOC entry 215 (class 1259 OID 205024)
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
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 215
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 216 (class 1259 OID 205025)
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
-- TOC entry 217 (class 1259 OID 205031)
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
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 217
-- Name: gender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gender_id_seq OWNED BY public.gender.id;


--
-- TOC entry 218 (class 1259 OID 205032)
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
-- TOC entry 219 (class 1259 OID 205038)
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
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 219
-- Name: issuer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issuer_id_seq OWNED BY public.issuer.id;


--
-- TOC entry 220 (class 1259 OID 205039)
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
-- TOC entry 221 (class 1259 OID 205045)
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
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 221
-- Name: issuer_nat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issuer_nat_id_seq OWNED BY public.issuer_nat.id;


--
-- TOC entry 222 (class 1259 OID 205046)
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
-- TOC entry 223 (class 1259 OID 205052)
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
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 223
-- Name: license_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.license_type_id_seq OWNED BY public.license_type.id;


--
-- TOC entry 224 (class 1259 OID 205053)
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
-- TOC entry 225 (class 1259 OID 205059)
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
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 225
-- Name: prev_weapons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prev_weapons_id_seq OWNED BY public.prev_weapons.id;


--
-- TOC entry 226 (class 1259 OID 205060)
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
-- TOC entry 227 (class 1259 OID 205066)
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
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 227
-- Name: province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.province_id_seq OWNED BY public.province.id;


--
-- TOC entry 228 (class 1259 OID 205067)
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
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN requests.downloaded; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests.downloaded IS 'يؤشر حالة القيد هل تم تحويله الى قاعدة البيانات او لا وياخذ قيمتان (true,false)';


--
-- TOC entry 229 (class 1259 OID 205075)
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
-- TOC entry 230 (class 1259 OID 205082)
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
-- TOC entry 231 (class 1259 OID 205088)
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
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 231
-- Name: weapon_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapon_name_id_seq OWNED BY public.weapon_name.id;


--
-- TOC entry 3216 (class 2604 OID 205089)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 205090)
-- Name: gender id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender ALTER COLUMN id SET DEFAULT nextval('public.gender_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 205091)
-- Name: issuer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer ALTER COLUMN id SET DEFAULT nextval('public.issuer_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 205092)
-- Name: issuer_nat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer_nat ALTER COLUMN id SET DEFAULT nextval('public.issuer_nat_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 205093)
-- Name: license_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type ALTER COLUMN id SET DEFAULT nextval('public.license_type_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 205094)
-- Name: prev_weapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prev_weapons ALTER COLUMN id SET DEFAULT nextval('public.prev_weapons_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 205095)
-- Name: province id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 205096)
-- Name: weapon_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name ALTER COLUMN id SET DEFAULT nextval('public.weapon_name_id_seq'::regclass);


--
-- TOC entry 3413 (class 0 OID 205018)
-- Dependencies: 214
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, cat, created_at, created_by, updated_at, updated_by) VALUES (1, 'طبيب', '2023-06-15 15:34:01.414712+03', NULL, NULL, NULL);
INSERT INTO public.category (id, cat, created_at, created_by, updated_at, updated_by) VALUES (2, 'محامي', '2023-06-15 15:34:10.183618+03', NULL, NULL, NULL);
INSERT INTO public.category (id, cat, created_at, created_by, updated_at, updated_by) VALUES (3, 'رجل اعمال', '2023-06-15 15:34:16.941592+03', NULL, NULL, NULL);


--
-- TOC entry 3415 (class 0 OID 205025)
-- Dependencies: 216
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gender (id, gen, created_at, created_by, updated_at, updated_by) VALUES (1, 'ذكر', '2023-06-15 15:34:28.877922+03', NULL, NULL, NULL);
INSERT INTO public.gender (id, gen, created_at, created_by, updated_at, updated_by) VALUES (2, 'انثى', '2023-06-15 15:34:35.05019+03', NULL, NULL, NULL);


--
-- TOC entry 3417 (class 0 OID 205032)
-- Dependencies: 218
-- Data for Name: issuer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.issuer (id, iss, created_at, created_by, updated_at, updated_by) VALUES (2, 'الرصافة', '2023-06-15 15:50:37.977364+03', NULL, NULL, NULL);
INSERT INTO public.issuer (id, iss, created_at, created_by, updated_at, updated_by) VALUES (3, 'الكرخ', '2023-06-15 15:50:37.977364+03', NULL, NULL, NULL);


--
-- TOC entry 3419 (class 0 OID 205039)
-- Dependencies: 220
-- Data for Name: issuer_nat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.issuer_nat (id, iss, created_at, created_by, updated_at, updated_by) VALUES (2, 'احوال الرصافة', '2023-06-15 15:50:18.83409+03', NULL, NULL, NULL);
INSERT INTO public.issuer_nat (id, iss, created_at, created_by, updated_at, updated_by) VALUES (3, 'احوال الكرخ', '2023-06-15 15:50:18.83409+03', NULL, NULL, NULL);


--
-- TOC entry 3421 (class 0 OID 205046)
-- Dependencies: 222
-- Data for Name: license_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.license_type (id, license, created_at, created_by, updated_at, updated_by) VALUES (1, 'حيازة', '2023-06-15 15:36:03.04038+03', NULL, NULL, NULL);
INSERT INTO public.license_type (id, license, created_at, created_by, updated_at, updated_by) VALUES (2, 'حيازة وحمل', '2023-06-15 15:36:10.396538+03', NULL, NULL, NULL);


--
-- TOC entry 3423 (class 0 OID 205053)
-- Dependencies: 224
-- Data for Name: prev_weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3425 (class 0 OID 205060)
-- Dependencies: 226
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.province (id, pro, created_at, created_by, updated_at, updated_by) VALUES (1, 'بغداد', '2023-06-15 15:34:49.960989+03', NULL, NULL, NULL);
INSERT INTO public.province (id, pro, created_at, created_by, updated_at, updated_by) VALUES (2, 'البصرة', '2023-06-15 15:35:00.113325+03', NULL, NULL, NULL);
INSERT INTO public.province (id, pro, created_at, created_by, updated_at, updated_by) VALUES (3, 'اربيل', '2023-06-15 15:35:05.795682+03', NULL, NULL, NULL);


--
-- TOC entry 3427 (class 0 OID 205067)
-- Dependencies: 228
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, cat_id, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, note, created_at, created_by, updated_at, updated_by, downloaded, nanoid, org) VALUES ('82e60274-234b-4653-aebd-0295199a0103', 'عبدالرحمن', 'باقي', 'زاهر', 'سالم', 'الغانمي', '', '2023-06-15 00:00:00+03', 1, 'سميعة', 'سالم', 'اسماعيل', 1, '98569898', 2, '2023-06-14', '', NULL, NULL, 1, 'الرصافة', 'مدرسة', '45', '35', '35', NULL, NULL, NULL, '077757575', '', '2023-06-16 00:02:33.057076+03', NULL, NULL, NULL, true, '4b1d00493c', 'null');
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, cat_id, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, note, created_at, created_by, updated_at, updated_by, downloaded, nanoid, org) VALUES ('6488b483-4d5f-45a6-933b-52340120f858', 'هيثم', 'عبدالحسين', 'قاسم', 'محمد', 'العتابي', '', '1990-01-02 00:00:00+03', 1, 'جميلة', 'راسم', 'حجي', 3, '8999898', 3, '2021-11-30', '', NULL, NULL, 1, 'الكرخ', 'موال المنصور', '787', '77', '7', NULL, NULL, NULL, '07770888', '', '2023-06-16 11:46:20.678034+03', NULL, NULL, NULL, false, '52535b965e', 'null');
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, cat_id, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, note, created_at, created_by, updated_at, updated_by, downloaded, nanoid, org) VALUES ('51a33b0e-bff9-4f92-a5f1-0946723dfec7', 'محمد', 'شكر', 'محمود', 'سلمان', 'الربيعي', '', '1995-01-01 00:00:00+03', 1, 'مديحة', 'سالم', 'محمود', 3, '76767', 2, '2022-01-15', '', NULL, NULL, 1, 'الرصافة', 'مركز المدينة', '554', '23', '1', NULL, NULL, NULL, '077797', '', '2023-06-16 11:55:52.504047+03', NULL, NULL, NULL, false, 'ee7a882edb', 'null');
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, cat_id, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, note, created_at, created_by, updated_at, updated_by, downloaded, nanoid, org) VALUES ('b7b98cf0-e908-40f8-8999-15480b100689', 'طارق', 'عبد', 'رحمن', 'سعيد', 'الجبوري', '', '1991-02-03 00:00:00+03', 1, 'خميسة', 'سالم', 'داود', 3, '676676', 3, '2021-03-05', '', NULL, NULL, 1, 'الكرخ', 'المصفى', '877', '77', '7', NULL, NULL, NULL, '0777878', '', '2023-06-16 12:09:19.50572+03', NULL, NULL, NULL, false, '07fc29c354', 'null');
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gen_id, monam1, monam2, monam3, cat_id, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, note, created_at, created_by, updated_at, updated_by, downloaded, nanoid, org) VALUES ('2195ec6b-88c1-471c-862c-880bc07eff14', 'احمد', 'علي', 'راضي', 'حازم', 'التميمي', '', '2023-06-15 00:00:00+03', 1, 'هدية', 'سعيد', 'محسن', 1, '55768778', 2, '2023-06-08', '', NULL, NULL, 1, 'الكرخ', 'مركز الاطفاء', '335', '353', '223', NULL, NULL, NULL, '07709998', '', '2023-06-15 23:57:58.148226+03', NULL, NULL, NULL, true, 'dd8554c6c6', 'null');


--
-- TOC entry 3428 (class 0 OID 205075)
-- Dependencies: 229
-- Data for Name: requests_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('0c840c33-13be-4b71-9e95-2cd527265db5', '2195ec6b-88c1-471c-862c-880bc07eff14', 1, 'احمد', 'علي', 'راضي', 'حازم', 'التميمي', 1, '2023-06-15 00:00:00+03', 1, 'هدية', 'سعيد', 'محسن', '55768778', 2, '2023-06-08', 'null', NULL, NULL, 1, 'الكرخ', 'مركز الاطفاء', '335', '353', '223', NULL, NULL, NULL, '07709998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-15 23:57:58.164057+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('5629078c-9c63-4bca-80f9-184ec9a603c8', '82e60274-234b-4653-aebd-0295199a0103', 1, 'سعيد', 'اسماعيل', 'مزهر', 'سرمد', 'الزبيدي', 1, '1996-06-16 00:00:00+04', 1, 'حمدية', 'راضي', 'سلمان', '0957509', 3, '2023-06-15', 'null', NULL, NULL, 1, 'الكرخ', 'مركز الشرطة', '575', '565', '46', NULL, NULL, NULL, '0777760', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 00:02:33.079898+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('19de4c9a-4c16-4130-aebd-fcb1316e566f', '82e60274-234b-4653-aebd-0295199a0103', 1, 'بريسم', 'زاهر', 'رضيب', 'خزعل', 'البهادلي', 2, '2001-05-16 00:00:00+04', 1, 'رضية', 'فاضل', 'حميد', '67676', 2, '2021-05-15', 'null', NULL, NULL, 1, 'الرصافة', 'دار الازياء', '34', '24', '24', NULL, NULL, NULL, '0676767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 00:02:33.258438+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('2061d890-ed65-4667-a6b9-0c487380ed5c', '6488b483-4d5f-45a6-933b-52340120f858', 2, 'هيثم', 'عبدالحسين', 'قاسم', 'محمد', 'العتابي', 3, '1990-01-02 00:00:00+03', 1, 'جميلة', 'راسم', 'حجي', '8999898', 3, '2021-11-30', 'null', NULL, NULL, 1, 'الكرخ', 'موال المنصور', '787', '77', '7', NULL, NULL, NULL, '07770888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 11:46:20.686842+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('036cfe46-6b64-4d53-8de7-9b7cb943278b', '51a33b0e-bff9-4f92-a5f1-0946723dfec7', 2, 'سعد', 'جميل', 'ثابت', 'حارث', 'التميمي', 2, '1992-01-01 00:00:00+03', 1, 'سليمة', 'حميد', 'جاسم', '56565', 2, '2023-05-27', 'null', NULL, NULL, 1, 'الكرخ', 'المستشفى', '444', '22', '45', NULL, NULL, NULL, '07779557', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 11:55:52.515127+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('750f19e6-b117-4f97-8bfd-2ed2f4a2ccba', '51a33b0e-bff9-4f92-a5f1-0946723dfec7', 2, 'صبري', 'داود', 'عبدالوهاب', 'حسين', 'الساعدي', 2, '1993-01-01 00:00:00+03', 1, 'احلام', 'جاسم', 'عبدالنبي', '9896787', 2, '2022-01-01', 'null', NULL, NULL, 1, 'الرصافة', 'المركز', '89', '88', '12', NULL, NULL, NULL, '0770775', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 11:55:52.661004+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('67237252-61ae-4927-8c02-20f0f9362bb3', '51a33b0e-bff9-4f92-a5f1-0946723dfec7', 2, 'بسام', 'جواد', 'رضا', 'عزيز', 'اللامي', 2, '1988-01-02 00:00:00+03', 1, 'باسمة', 'حسين', 'خماس', '98897877', 2, '2022-02-28', 'null', NULL, NULL, 1, 'الرصافة', 'المستشفى', '989', '23', '12', NULL, NULL, NULL, '077790', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 11:55:52.662636+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('f76d3207-9eb5-48d8-9863-6df94ca0c4ac', '51a33b0e-bff9-4f92-a5f1-0946723dfec7', 2, 'عماد', 'ادور', 'جرجي', 'بولس', 'السناطي', 2, '1978-01-04 00:00:00+03', 1, 'كريزة', 'سالم', 'جون', '46565464', 3, '2022-12-01', 'null', NULL, NULL, 1, 'الكرخ', 'البنك', '898', '45', '12', NULL, NULL, NULL, '0770799994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 11:55:52.692383+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('ff4bc25d-00b1-486c-a30d-ab122ce73c92', '51a33b0e-bff9-4f92-a5f1-0946723dfec7', 2, 'ماجد', 'جليل', 'ابراهيم', 'سعيد', 'الزبيدي', 2, '1989-01-01 00:00:00+03', 1, 'حليمة', 'نادر', 'حسين', '787877', 3, '2022-02-03', 'null', NULL, NULL, 1, 'الكرخ', 'مركز الشرطة', '565', '223', '12', NULL, NULL, NULL, '0777098', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 11:55:52.695519+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('568939c6-ab03-4dce-8587-b9cc70b06eb8', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'علاء', 'محمد', 'حسين', 'كاظم', 'الجنابي', 3, '1980-09-02 00:00:00+03', 1, 'سارة', 'جاسم', 'سالم', '787878', 3, '2021-06-15', 'null', NULL, NULL, 1, 'الكرخ', 'المول', '898', '87', '7', NULL, NULL, NULL, '07700755', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.519883+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('bd78b74b-de24-48a7-9aae-c8ae7ee92f2a', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'مرتضى', 'عامر', 'مجيد', 'حميد', 'النعيمي', 3, '1979-02-02 00:00:00+03', 1, 'سليمة', 'حميد', 'خالد', '76767', 3, '2022-12-01', 'null', NULL, NULL, 1, 'الكرخ', 'البنك', '898', '23', '12', NULL, NULL, NULL, '077797979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.743587+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('ce891919-fa64-45a4-b7ee-4902d9ece609', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'نعيم', 'محيسن', 'حمادي', 'راضي', 'الجبوري', 3, '1987-12-03 00:00:00+03', 1, 'علياء', 'باسم', 'حميد', '98898', 2, '2017-01-31', 'null', NULL, NULL, 1, 'الكرخ', 'الجامع', '898', '88', '7', NULL, NULL, NULL, '0770777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.744699+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('bea5cae7-17d4-421d-9844-7dda3e0515ac', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'علياء', 'حبيب', 'جاسم', 'راضي', 'الخفاجي', 2, '1997-02-01 00:00:00+03', 2, 'سبتية', 'سليم', 'حامد', '676767', 2, '2021-01-15', 'null', NULL, NULL, 1, 'الرصافة', 'دارالازياء', '45', '12', '1', NULL, NULL, NULL, '0787880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.744999+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('287354af-090a-4fe5-aa95-06bcd3ba1be8', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'ماجد', 'عزيز', 'صابر', 'راسم', 'العبيدي', 3, '1994-01-05 00:00:00+03', 1, 'زينب', 'حميد', 'سلمان', '5775577', 3, '2019-04-01', 'null', NULL, NULL, 1, 'الرصافة', 'المركز', '909', '99', '9', NULL, NULL, NULL, '0780976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.745317+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('b39ec246-2e88-4955-9378-8e059f7ba658', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'سلام', 'صالح', 'مهدي', 'عبدالله', 'الخيكاني', 3, '1991-11-04 00:00:00+03', 1, 'ازهار', 'محمد', 'شريف', '56557', 2, '2021-03-31', 'null', NULL, NULL, 1, 'الرصافة', 'الجمعية', '44', '3', '24', NULL, NULL, NULL, '07787868', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.746257+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('d324f3dd-f8c0-4c79-8263-d6e479ab2d00', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'عبدالرزاق', 'علي', 'حسين', 'محسن', 'الشمري', 3, '1976-04-06 00:00:00+03', 1, 'رزوقة', 'جاسم', 'محمد', '6767676', 2, '2019-01-31', 'null', NULL, NULL, 1, 'الرصافة', 'دار الازياء', '565', '22', '2', NULL, NULL, NULL, '0770776', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.825046+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('71a55e63-a2bd-4a51-8cbd-9597c5eefbcb', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'علي', 'عبدالعزيز', 'عبد', 'جبار', 'الكناني', 3, '1987-04-06 00:00:00+04', 1, 'قبيلة', 'حسين', 'راسم', '98888898', 3, '2021-06-01', 'null', NULL, NULL, 1, 'الرصافة', 'المطعم', '889', '88', '7', NULL, NULL, NULL, '077709', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.826442+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('9e5d9155-95de-493a-a7ab-e21b1f668298', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'محمد', 'جميل', 'جمعة', 'محمود', 'الركابي', 3, '1990-06-16 00:00:00+04', 1, 'حنين', 'باسم', 'راضي', '989887987', 3, '2019-02-04', 'null', NULL, NULL, 1, 'الكرخ البياع', 'الجامع', '989', '88', '7', NULL, NULL, NULL, '0778865', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.826899+03', NULL, NULL, NULL, NULL);
INSERT INTO public.requests_details (id, req_id, license_id, name1, name2, name3, name4, surname, cat_id, birdate, gen_id, monam1, monam2, monam3, idnum, iss_id1, issdat1, natnum, iss_id2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, apptype_id, appnum, appdate, wea_hold_per, margin_app, note, created_at, created_by, updated_at, updated_by, completed) VALUES ('f95cfe4e-ad21-49ff-a8f9-28495cbc3888', 'b7b98cf0-e908-40f8-8999-15480b100689', 2, 'مثنى', 'هاشم', 'قدوس', 'رويض', 'السامرائي', 2, '1976-02-05 00:00:00+03', 1, 'حبيبة', 'قاسم', 'حسيب', '557575', 2, '2022-01-29', 'null', NULL, NULL, 1, 'الرصافة', 'المدينة', '897', '66', '43', NULL, NULL, NULL, '077986757', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 12:09:19.8278+03', NULL, NULL, NULL, NULL);


--
-- TOC entry 3429 (class 0 OID 205082)
-- Dependencies: 230
-- Data for Name: weapon_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.weapon_name (id, weapon_name, weapon_size, created_at, created_by, updated_at, updated_by) VALUES (2, 'كلك', '9', '2023-06-15 15:35:25.79134+03', NULL, NULL, NULL);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 215
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 6, true);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 217
-- Name: gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gender_id_seq', 4, true);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 219
-- Name: issuer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issuer_id_seq', 3, true);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 221
-- Name: issuer_nat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issuer_nat_id_seq', 3, true);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 223
-- Name: license_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.license_type_id_seq', 5, true);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 225
-- Name: prev_weapons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prev_weapons_id_seq', 1, false);


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 227
-- Name: province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.province_id_seq', 7, true);


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 231
-- Name: weapon_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapon_name_id_seq', 2, true);


-- Completed on 2023-06-16 14:10:58

--
-- PostgreSQL database dump complete
--

