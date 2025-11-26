--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-06-20 15:18:29

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
-- TOC entry 842 (class 1247 OID 49154)
-- Name: approval_part; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.approval_part AS ENUM (
    'person',
    'weapon'
);


ALTER TYPE public.approval_part OWNER TO postgres;

--
-- TOC entry 845 (class 1247 OID 49160)
-- Name: approval_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.approval_role AS ENUM (
    'Prime_mimister',
    'Minister'
);


ALTER TYPE public.approval_role OWNER TO postgres;

--
-- TOC entry 848 (class 1247 OID 49166)
-- Name: gender_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender_type AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.gender_type OWNER TO postgres;

--
-- TOC entry 851 (class 1247 OID 49172)
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status AS ENUM (
    'PENDING',
    'APPROVED',
    'DECLINED'
);


ALTER TYPE public.status OWNER TO postgres;

--
-- TOC entry 854 (class 1247 OID 49180)
-- Name: user_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_type AS ENUM (
    'identification_managment',
    'approval_destination'
);


ALTER TYPE public.user_type OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 49185)
-- Name: fn_status1(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_status1(approval_dest_id_par integer) RETURNS TABLE(status integer)
    LANGUAGE plpgsql STABLE
    AS $$
  DECLARE status_intellig_var integer;
  

  

  BEGIN
  
status_intellig_var=
(select status1 from (
	SELECT 
 
  MAX(a.created_at),MAX(a.status) as status1
  
 FROM approvals a left join approval_destination d
 on a.approval_dest_id=d.id  
   left join  subidentity s 
   on a.sub_identity=s.sudid
            where 
			 a.approval_dest_id=approval_dest_id_par ) as statuses
);

return query select status_intellig_var as status;

	

  END;
$$;


ALTER FUNCTION public.fn_status1(approval_dest_id_par integer) OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 49186)
-- Name: fn_status2(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_status2(sub_identity_par integer) RETURNS TABLE(status integer)
    LANGUAGE plpgsql STABLE
    AS $$
  DECLARE status_Identification_count integer;
  

  BEGIN
  
status_Identification_count=
(select status1 from (
	SELECT 
 
  MAX(a.created_at),MAX(a.status) as status1
  
 FROM approvals a left join approval_destination d
 on a.approval_dest_id=d.id  
   left join  subidentity s 
   on a.sub_identity=s.sudid
            where 
			 a.sub_identity=sub_identity_par ) as statuses
);

return query select status_Identification_count as status;

	

  END;
$$;


ALTER FUNCTION public.fn_status2(sub_identity_par integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 49187)
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
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN approval_destination.role_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.approval_destination.role_type IS '0 none -> userType = 1,
1 accept suspense -> userType = 2, 
2 accept reject userType = 2,
3 supervisor userType = 2';


--
-- TOC entry 210 (class 1259 OID 49192)
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
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 210
-- Name: app_person_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_person_type_id_seq OWNED BY public.approval_destination.id;


--
-- TOC entry 211 (class 1259 OID 49193)
-- Name: approvals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approvals (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    req_details_id uuid NOT NULL,
    approval_dest_id integer,
    approval_part smallint,
    status smallint,
    reason text,
    booknum text,
    bookdate timestamp with time zone,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    audit bit(1) DEFAULT (0)::bit(1),
    audit_updated timestamp with time zone,
    sub_identity smallint
);


ALTER TABLE public.approvals OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 49201)
-- Name: biometric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biometric (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pict text,
    iris text,
    fing_dat text,
    fing_xml text,
    note text,
    created_at timestamp with time zone DEFAULT now(),
    created_by integer,
    updated_at timestamp with time zone DEFAULT now(),
    updated_by integer
);


ALTER TABLE public.biometric OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49209)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    cat text NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 49214)
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
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 215 (class 1259 OID 49215)
-- Name: identification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identification (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    req_det_id uuid,
    printtime date,
    idnum integer,
    expdate timestamp with time zone,
    permdate timestamp with time zone,
    note text,
    created_at timestamp with time zone DEFAULT now(),
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    is_print smallint DEFAULT 0,
    qr_code text,
    "dataunitID" bigint,
    quality bit(1),
    accountant integer,
    is_receive bit(1) DEFAULT (0)::bit(1)
);


ALTER TABLE public.identification OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN identification.is_print; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification.is_print IS '0 - not print
1- print
2- Error print';


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN identification.quality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification.quality IS 'false -> error
true -> success';


--
-- TOC entry 216 (class 1259 OID 49224)
-- Name: license_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.license_type (
    id integer NOT NULL,
    license text NOT NULL
);


ALTER TABLE public.license_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 49229)
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
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 217
-- Name: license_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.license_type_id_seq OWNED BY public.license_type.id;


--
-- TOC entry 218 (class 1259 OID 49230)
-- Name: province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.province (
    id integer NOT NULL,
    pro_name text NOT NULL
);


ALTER TABLE public.province OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 49235)
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
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 219
-- Name: province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.province_id_seq OWNED BY public.province.id;


--
-- TOC entry 220 (class 1259 OID 49236)
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
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN requests.gender_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests.gender_type IS '1- male
2- female';


--
-- TOC entry 221 (class 1259 OID 49243)
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
    iss_1 text,
    issdat1 date,
    natnum text NOT NULL,
    iss_2 text,
    issdat2 timestamp with time zone,
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
    weapname_id integer,
    weapnum text,
    wea_hold_per text,
    margin_app text,
    completed smallint,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp with time zone,
    updated_by integer,
    prev_weapn text,
    archive_num text,
    biometric_id uuid,
    e_fullname text,
    is_entry smallint DEFAULT 0,
    entry_note text,
    identity_type smallint
);


ALTER TABLE public.requests_details OWNER TO postgres;

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN requests_details.approval_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.approval_role IS '1- Prime_minister
2- Minister';


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN requests_details.gender_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.gender_type IS '1- male
2- female';


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN requests_details.completed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.completed IS '0- decline
1- approval
2- pending';


--
-- TOC entry 222 (class 1259 OID 49250)
-- Name: subidentity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subidentity (
    sudid smallint NOT NULL,
    sudname text,
    sudrultype smallint
);


ALTER TABLE public.subidentity OWNER TO postgres;

--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN subidentity.sudid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudid IS 'التسلسل';


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN subidentity.sudname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudname IS 'اسم الجهة التابعة الى مديرية الهويات';


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN subidentity.sudrultype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudrultype IS 'الصلاحية الخاصة بالجهة 
-غير مؤثر
-رفض
-وغيرها
0 none -> userType = 1,
1 accept suspense -> userType = 2, 
2 accept reject userType = 1,2
3 supervisor userType = 1';


--
-- TOC entry 223 (class 1259 OID 49255)
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
-- TOC entry 224 (class 1259 OID 49256)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    approval_det_id integer,
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
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN users.user_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.user_type IS '1- iditification_managment
2- approvals_managment
3- minister office';


--
-- TOC entry 225 (class 1259 OID 49264)
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
-- TOC entry 226 (class 1259 OID 49265)
-- Name: weapon_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapon_name (
    id integer NOT NULL,
    weapon_name text NOT NULL,
    weapon_size text NOT NULL
);


ALTER TABLE public.weapon_name OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 49270)
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
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 227
-- Name: weapon_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapon_name_id_seq OWNED BY public.weapon_name.id;


--
-- TOC entry 3231 (class 2604 OID 49271)
-- Name: approval_destination id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approval_destination ALTER COLUMN id SET DEFAULT nextval('public.app_person_type_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 49272)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 49273)
-- Name: license_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type ALTER COLUMN id SET DEFAULT nextval('public.license_type_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 49274)
-- Name: province id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 49275)
-- Name: weapon_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name ALTER COLUMN id SET DEFAULT nextval('public.weapon_name_id_seq'::regclass);


--
-- TOC entry 3430 (class 0 OID 49187)
-- Dependencies: 209
-- Data for Name: approval_destination; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_destination (id, destination, role_type, approval_part) FROM stdin;
4	الادلة الجنائية	1	1
5	التسجيل الجنائي	1	2
2	الاستخبارات	1	1
3	البنى التحتية	1	2
7	الفحص الطبي	1	1
8	فحص السلاح	1	2
\.


--
-- TOC entry 3432 (class 0 OID 49193)
-- Dependencies: 211
-- Data for Name: approvals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) FROM stdin;
9efc8be5-2665-44ff-9002-54bcaeabaa49	1ac4ba58-99b1-460d-b8ac-63677dcf2312	2	\N	1	لايوجد	121	2023-06-16 00:00:00+03	لايوجد	2023-06-16 01:27:41.31698+03	2	\N	\N	0	\N	\N
3b7d5591-0902-40d8-9d70-b87b1a492c3d	1ac4ba58-99b1-460d-b8ac-63677dcf2312	7	1	0	مخالة قانونية	1212	2023-06-16 00:00:00+03	لايوجد	2023-06-16 01:33:24.211211+03	2	\N	\N	0	\N	\N
3cf3363d-82e5-485c-b2dd-d8209379d70c	1ac4ba58-99b1-460d-b8ac-63677dcf2312	8	\N	0	غير مطابق	123	2023-06-10 00:00:00+03	null	2023-06-16 01:34:24.225437+03	2	\N	\N	0	\N	\N
8d83c509-7757-452b-88c4-264db7e9d557	1ac4ba58-99b1-460d-b8ac-63677dcf2312	4	\N	1	لايوجد	122	2023-06-23 00:00:00+03	لايوجد	2023-06-16 01:38:32.346904+03	2	\N	\N	0	\N	\N
7ba03b63-8e12-488d-8ede-1bf2cbf6ad7a	1ac4ba58-99b1-460d-b8ac-63677dcf2312	\N	\N	1	لايوجد	12	2023-06-16 00:00:00+03	لايوجد	2023-06-16 01:41:46.805447+03	2	\N	\N	0	\N	2
bb9a9038-7b75-48ba-8d6a-5d8679d947a5	8929b616-87b4-4ce2-85b5-41910d2400f6	7	\N	0	غير لائق	12	2023-06-16 00:00:00+03	لايوجد	2023-06-16 01:52:29.955799+03	2	\N	\N	0	\N	\N
4436be5b-810c-49b1-bbf5-98e1de75259e	8929b616-87b4-4ce2-85b5-41910d2400f6	\N	\N	0	حسب الفحص الطبي غير لائق	12	2023-06-16 00:00:00+03	لايوجد	2023-06-16 01:53:14.723738+03	2	\N	\N	0	\N	2
89164806-e8d9-4459-94b4-587b6a1f92d5	b795b687-2211-4251-b19e-977090a6ac8a	7	\N	1	لايوجد	1212	2023-06-16 00:00:00+03	لايوجد	2023-06-16 12:30:23.490921+03	2	\N	\N	0	\N	\N
94cc41b7-4e62-4186-bfb7-37f1279c849a	b795b687-2211-4251-b19e-977090a6ac8a	8	\N	0	غير صالح للاستخادم	12	2023-06-16 00:00:00+03	مرفوض	2023-06-16 12:31:39.310224+03	2	\N	\N	0	\N	\N
0f347187-a3dc-4bc2-82d9-0d6267528298	b795b687-2211-4251-b19e-977090a6ac8a	\N	\N	0	حسب كتاب رفض فحص السلاح	12	2023-06-17 00:00:00+03	null	2023-06-16 12:34:12.787395+03	2	\N	\N	0	\N	3
142398ff-fe9e-4ed0-bbcd-aaf07d4e6891	b795b687-2211-4251-b19e-977090a6ac8a	\N	\N	0	حسب كتاب فحص السلاح	1212	2023-06-16 00:00:00+03	غير صالح	2023-06-16 12:35:08.209664+03	2	\N	\N	0	\N	4
f3f603cc-c168-43d5-b17f-efeb6e2e4b5f	c7e3ef53-0030-4902-bba4-e51bdfb2e8b8	\N	\N	1	لايوجد	12	2023-06-15 00:00:00+03	لايوجد	2023-06-16 18:10:02.588616+03	2	\N	\N	0	\N	2
f8e3e2d6-f133-4404-add3-287eaf99133c	de98b0f7-811b-4e35-a3e7-d2fbc2cd5c39	7	\N	1	لايوجد	12	2023-06-16 00:00:00+03	لايوجد	2023-06-16 19:20:55.833483+03	2	\N	\N	0	\N	\N
61f88e10-3dd2-4252-8e0a-cad3ad078001	de98b0f7-811b-4e35-a3e7-d2fbc2cd5c39	8	2	0	غير صالح	12	2023-06-16 00:00:00+03	لايوجد	2023-06-16 19:27:18.935837+03	2	\N	\N	0	\N	\N
4ea68f01-0410-430a-bce6-4192a543f858	de98b0f7-811b-4e35-a3e7-d2fbc2cd5c39	\N	\N	1	لايوجد	12	2023-06-16 00:00:00+03	لايوجد	2023-06-16 19:30:40.03273+03	2	\N	\N	0	\N	2
97158eb4-2e91-42be-9004-2f58262a88de	0afbd703-e0f8-41f4-b75c-b7847344e607	7	1	1	null	22	2023-06-14 00:00:00+03	لايوجد	2023-06-18 13:04:12.942249+03	2	\N	\N	0	\N	\N
c4805899-2a31-4b0d-8a59-9ce287e0aca9	0afbd703-e0f8-41f4-b75c-b7847344e607	8	2	1	null	11	2023-06-15 00:00:00+03	لايوجد	2023-06-18 13:08:58.75857+03	2	\N	\N	0	\N	\N
59e6c8dd-e6c7-49b2-b8a5-31089ad78fbf	0afbd703-e0f8-41f4-b75c-b7847344e607	4	\N	0	طرق محلي	33	2023-06-22 00:00:00+03	null	2023-06-18 13:19:45.172388+03	2	\N	\N	0	\N	\N
15ba91bc-562d-4187-808f-598e470ca554	0afbd703-e0f8-41f4-b75c-b7847344e607	4	1	1	null	33	2023-06-22 00:00:00+03	تم تسليم السلاح 	2023-06-18 13:20:15.385501+03	2	\N	\N	0	\N	\N
0aa4f95e-17d9-492a-aebd-ac1eea5eaa29	0afbd703-e0f8-41f4-b75c-b7847344e607	2	\N	1	null	3	2023-06-16 00:00:00+03	null	2023-06-18 13:30:15.547611+03	2	\N	\N	0	\N	\N
225fbc1f-f7b3-4189-8333-5bca320b5936	0afbd703-e0f8-41f4-b75c-b7847344e607	5	\N	1	null	null	\N	null	2023-06-18 13:41:03.871753+03	2	\N	\N	0	\N	\N
\.


--
-- TOC entry 3433 (class 0 OID 49201)
-- Dependencies: 212
-- Data for Name: biometric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biometric (id, pict, iris, fing_dat, fing_xml, note, created_at, created_by, updated_at, updated_by) FROM stdin;
71ff1c19-4654-4541-912f-e92398ff97b8	669e0174-a084-4a9a-a5f2-fba4369892fb.jpg	\N	b65209c1-bea5-489a-a711-66d75f00099c.dat	816333e2-ec7c-4b22-ad5e-401c31173f95.xml	\N	2023-06-16 16:05:00.990023+03	8	2023-06-16 16:10:57.77708+03	8
9acc1399-f607-4a58-8349-2252a6c6f943	e4d90b6e-4396-44e8-989e-f822c028b759.jpg	\N	ce1b8cbb-ec5a-4f71-a884-e54c9053214f.dat	cad7a707-95b2-4f50-adbe-df2dd9778be3.xml	\N	2023-06-16 18:08:04.207446+03	8	2023-06-16 18:08:57.548511+03	8
4f7af3db-67ff-4457-b454-33ed90500478	d8bfa460-9561-4c65-80d4-441de28cfd55.jpg	\N	c0797935-c634-43a4-90fa-7c320f7c2d3e.dat	f12d62dc-21b8-47c0-a952-7e167d9d2045.xml	\N	2023-06-16 19:17:40.10904+03	8	2023-06-16 19:19:46.650782+03	8
7d95b0cd-f10d-490f-a135-01fd03242db9	94482811-6d99-4999-9d9b-8e84d71357fb.jpg	\N	6cfaa1a0-8286-41de-b043-2c908ce4c971.dat	c6847716-8e31-45b8-9d1f-2afd0fe65c5a.xml	\N	2023-06-16 01:20:14.526752+03	8	2023-06-16 01:24:02.369364+03	8
21ce7e7d-2fb5-43cb-91c6-2b690a7aeec2	8826c6a8-d61f-4809-9188-a4d8783a624b.jpg	\N	26d81d69-e561-4e5b-a769-e2252bd6cdff.dat	155b67f9-06b1-4626-9a75-acde5e2251b7.xml	\N	2023-06-16 01:35:03.701406+03	8	2023-06-16 01:36:12.358016+03	8
39c4e4dd-0b1f-405e-931e-bb9b83fd10f8	2dcface0-c169-4be2-992d-b95f397a97ac.jpg	\N	7ccb043e-d388-4810-add6-56b5f6f467af.dat	0fb7dfe3-17a7-40cf-b425-4c1206d954d8.xml	\N	2023-06-16 12:27:28.635113+03	8	2023-06-16 12:29:23.566046+03	8
\.


--
-- TOC entry 3434 (class 0 OID 49209)
-- Dependencies: 213
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, cat) FROM stdin;
1	طبيب
2	محامي
3	رجل اعمال
4	صائغ
5	شيخ عشيرة
6	استاذ جامعي
\.


--
-- TOC entry 3436 (class 0 OID 49215)
-- Dependencies: 215
-- Data for Name: identification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identification (id, req_det_id, printtime, idnum, expdate, permdate, note, created_at, created_by, updated_at, updated_by, is_print, qr_code, "dataunitID", quality, accountant, is_receive) FROM stdin;
824f3847-1a44-4e60-8233-76c46d60e406	\N	\N	\N	\N	\N	\N	2023-06-19 10:41:17.884044+03	\N	\N	\N	0	\N	\N	\N	\N	0
\.


--
-- TOC entry 3437 (class 0 OID 49224)
-- Dependencies: 216
-- Data for Name: license_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.license_type (id, license) FROM stdin;
1	حيازة
2	حيازة وحمل
\.


--
-- TOC entry 3439 (class 0 OID 49230)
-- Dependencies: 218
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.province (id, pro_name) FROM stdin;
4	النجف الاشرف
1	بغداد
2	البصرة
3	اربيل
5	الديوانية
6	واسط
7	ديالى
\.


--
-- TOC entry 3441 (class 0 OID 49236)
-- Dependencies: 220
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gender_type, cat_id, monam1, monam2, monam3, idnum, pro_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, approv_num, approv_date) FROM stdin;
2195ec6b-88c1-471c-862c-880bc07eff14	احمد	علي	راضي	حازم	التميمي		2023-06-15 00:00:00+03	1	1	هدية	سعيد	محسن	55768778	1	الكرخ	07709998		2023-06-16 12:25:27.480304+03	\N	\N	\N	1212	2023-06-16
82e60274-234b-4653-aebd-0295199a0103	عبدالرحمن	باقي	زاهر	سالم	الغانمي		2023-06-15 00:00:00+03	1	1	سميعة	سالم	اسماعيل	98569898	1	الرصافة	077757575		2023-06-16 18:07:09.335161+03	\N	\N	\N	1212	2023-06-16
6488b483-4d5f-45a6-933b-52340120f858	هيثم	عبدالحسين	قاسم	محمد	العتابي		1990-01-02 00:00:00+03	1	3	جميلة	راسم	حجي	8999898	1	الكرخ	07770888		2023-06-16 19:15:23.072584+03	\N	\N	\N	1212	2023-06-16
b7b98cf0-e908-40f8-8999-15480b100689	طارق	عبد	رحمن	سعيد	الجبوري		1991-02-03 00:00:00+03	1	3	خميسة	سالم	داود	676676	1	الكرخ	0777878		2023-06-18 12:04:27.414564+03	\N	\N	\N	\N	\N
e2637a01-afe1-4fcd-818e-7073da2a3c4e	ثامر	جعفر	عباس	جواد	العامري		1979-01-01 00:00:00+03	1	3	سعدية	محمد	حامد	67676	1	الكرخ	077708654		2023-06-18 12:08:03.31754+03	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3442 (class 0 OID 49243)
-- Dependencies: 221
-- Data for Name: requests_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests_details (id, req_id, license_id, approval_role, name1, name2, name3, name4, surname, gender_type, cat_id, birdate, monam1, monam2, monam3, idnum, iss_1, issdat1, natnum, iss_2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, wea_hold_per, margin_app, completed, note, created_at, created_by, updated_at, updated_by, prev_weapn, archive_num, biometric_id, e_fullname, is_entry, entry_note, identity_type) FROM stdin;
18a272ee-2cf6-4d5e-9c9c-16abe39ae4de	e2637a01-afe1-4fcd-818e-7073da2a3c4e	2	2	ثامر	جعفر	عباس	جواد	العامري	1	3	1979-01-01 00:00:00+03	سعدية	محمد	حامد	67676	3	2021-12-31	null	null	\N	1	الكرخ	مركز الشرطة	434	655	65	null	null	\N	077708654	\N	null	60	null	\N	null	2023-06-18 12:08:03.328198+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
b795b687-2211-4251-b19e-977090a6ac8a	2195ec6b-88c1-471c-862c-880bc07eff14	1	2	احمد	علي	راضي	حازم	التميمي	1	1	2023-06-15 00:00:00+03	هدية	سعيد	محسن	55768778	2	2023-06-08	null	null	1900-01-01 00:00:00+02:57:36	1	الكرخ	مركز الاطفاء	335	353	223	null	null	1900-01-01 00:00:00+02:57:36	07709998	2	12jdg	24	موافق	0	null	2023-06-16 12:25:27.507+03	1	\N	8	لايوجد	1	39c4e4dd-0b1f-405e-931e-bb9b83fd10f8	\N	0	\N	\N
059b6984-5e69-4502-8228-7e4e6364886b	b7b98cf0-e908-40f8-8999-15480b100689	2	2	علاء	محمد	حسين	كاظم	الجنابي	1	3	1980-09-02 00:00:00+03	سارة	جاسم	سالم	787878	3	2021-06-15	null	null	\N	1	الكرخ	المول	898	87	7	null	null	\N	07700755	\N	null	60	null	\N	null	2023-06-18 12:04:27.430031+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
e2510f9d-3ad4-434f-b60c-8301a6c95b46	b7b98cf0-e908-40f8-8999-15480b100689	2	2	مرتضى	عامر	مجيد	حميد	النعيمي	1	3	1979-02-02 00:00:00+03	سليمة	حميد	خالد	76767	3	2022-12-01	null	null	\N	1	الكرخ	البنك	898	23	12	null	null	\N	077797979	\N	null	60	null	\N	null	2023-06-18 12:04:27.436833+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
73fc35de-15d1-46ed-806e-1fa6ba5c73b5	b7b98cf0-e908-40f8-8999-15480b100689	2	2	نعيم	محيسن	حمادي	راضي	الجبوري	1	3	1987-12-03 00:00:00+03	علياء	باسم	حميد	98898	2	2017-01-31	null	null	\N	1	الكرخ	الجامع	898	88	7	null	null	\N	0770777	\N	null	60	null	\N	null	2023-06-18 12:04:27.440036+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
d27d81a4-3194-4f55-8945-cff5c0b1d87b	b7b98cf0-e908-40f8-8999-15480b100689	2	2	علياء	حبيب	جاسم	راضي	الخفاجي	2	2	1997-02-01 00:00:00+03	سبتية	سليم	حامد	676767	2	2021-01-15	null	null	\N	1	الرصافة	دارالازياء	45	12	1	null	null	\N	0787880	\N	null	60	null	\N	null	2023-06-18 12:04:27.443632+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
35dde25d-9429-470a-a839-a010f0f07bf9	b7b98cf0-e908-40f8-8999-15480b100689	2	2	ماجد	عزيز	صابر	راسم	العبيدي	1	3	1994-01-05 00:00:00+03	زينب	حميد	سلمان	5775577	3	2019-04-01	null	null	\N	1	الرصافة	المركز	909	99	9	null	null	\N	0780976	\N	null	60	null	\N	null	2023-06-18 12:04:27.454756+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
0478a0e1-a090-4544-a97c-5159fbb0228d	b7b98cf0-e908-40f8-8999-15480b100689	2	2	سلام	صالح	مهدي	عبدالله	الخيكاني	1	3	1991-11-04 00:00:00+03	ازهار	محمد	شريف	56557	2	2021-03-31	null	null	\N	1	الرصافة	الجمعية	44	3	24	null	null	\N	07787868	\N	null	60	null	\N	null	2023-06-18 12:04:27.459423+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
9ac7dd74-6308-40be-809e-41fec4921c5b	b7b98cf0-e908-40f8-8999-15480b100689	2	2	عبدالرزاق	علي	حسين	محسن	الشمري	1	3	1976-04-06 00:00:00+03	رزوقة	جاسم	محمد	6767676	2	2019-01-31	null	null	\N	1	الرصافة	دار الازياء	565	22	2	null	null	\N	0770776	\N	null	60	null	\N	null	2023-06-18 12:04:27.463424+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
bb2f5c95-577b-4e1f-9498-dd805a07c265	b7b98cf0-e908-40f8-8999-15480b100689	2	2	علي	عبدالعزيز	عبد	جبار	الكناني	1	3	1987-04-06 00:00:00+04	قبيلة	حسين	راسم	98888898	3	2021-06-01	null	null	\N	1	الرصافة	المطعم	889	88	7	null	null	\N	077709	\N	null	60	null	\N	null	2023-06-18 12:04:27.46875+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
7f61159f-870f-439b-816b-1ea7e3ec3878	b7b98cf0-e908-40f8-8999-15480b100689	2	2	محمد	جميل	جمعة	محمود	الركابي	1	3	1990-06-16 00:00:00+04	حنين	باسم	راضي	989887987	3	2019-02-04	null	null	\N	1	الكرخ البياع	الجامع	989	88	7	null	null	\N	0778865	\N	null	60	null	\N	null	2023-06-18 12:04:27.471534+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
118d3ecd-b9ca-43bb-ae9c-f18a8adcc5e6	b7b98cf0-e908-40f8-8999-15480b100689	2	2	مثنى	هاشم	قدوس	رويض	السامرائي	1	2	1976-02-05 00:00:00+03	حبيبة	قاسم	حسيب	557575	2	2022-01-29	null	null	\N	1	الرصافة	المدينة	897	66	43	null	null	\N	077986757	\N	null	60	null	\N	null	2023-06-18 12:04:27.478796+03	1	\N	\N	\N	\N	\N	\N	0	\N	\N
c7e3ef53-0030-4902-bba4-e51bdfb2e8b8	82e60274-234b-4653-aebd-0295199a0103	1	2	سعيد	اسماعيل	مزهر	سرمد	الزبيدي	1	1	1996-06-16 00:00:00+04	حمدية	راضي	سلمان	957509	3	2023-06-15	null	null	1900-01-01 00:00:00+02:57:36	1	الكرخ	مركز الشرطة	575	565	46	null	null	1900-01-01 00:00:00+02:57:36	0777760	\N	null	24	موافق اصوليا	1	null	2023-06-16 18:07:09.361+03	1	\N	8	لايوجد	1	9acc1399-f607-4a58-8349-2252a6c6f943	\N	0	\N	\N
0afbd703-e0f8-41f4-b75c-b7847344e607	82e60274-234b-4653-aebd-0295199a0103	1	2	بريسم	زاهر	رضيب	خزعل	البهادلي	1	2	2001-05-16 00:00:00+04	رضية	فاضل	حميد	67676	2	2021-05-15	null	null	1900-01-01 00:00:00+02:57:36	1	الرصافة	دار الازياء	34	24	24	null	null	1900-01-01 00:00:00+02:57:36	0676767	1	12345	24	موافق اصوليا	2	null	2023-06-16 18:07:09.38+03	1	\N	8	2	44	\N	\N	0	\N	\N
de98b0f7-811b-4e35-a3e7-d2fbc2cd5c39	6488b483-4d5f-45a6-933b-52340120f858	2	2	هيثم	عبدالحسين	قاسم	محمد	العتابي	1	3	1990-01-02 00:00:00+03	جميلة	راسم	حجي	8999898	3	2021-11-30	null	null	1900-01-01 00:00:00+02:57:36	1	الكرخ	موال المنصور	787	77	7	null	null	1900-01-01 00:00:00+02:57:36	07770888	2	gx12	24	موافق اصوليا	1	null	2023-06-16 19:15:23.099+03	1	\N	8	لايوجد	1	4f7af3db-67ff-4457-b454-33ed90500478	\N	0	\N	\N
\.


--
-- TOC entry 3443 (class 0 OID 49250)
-- Dependencies: 222
-- Data for Name: subidentity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subidentity (sudid, sudname, sudrultype) FROM stdin;
2	مصرح هويات	3
3	مدقق هويات	2
4	قانونية الهويات	2
1	مفرزة الكرخ	0
5	ادارة الهويات	0
6	مفرزة الرصافة	0
\.


--
-- TOC entry 3445 (class 0 OID 49256)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) FROM stdin;
13	\N	مفرزة الكرخ	admin7	$2a$10$vIFD4Voi4541vplZSmeC9e1G9loJm6z/VwMNdf35Vx95t3A0W2g/2	1	{"admin":true,"create":true,"update":true,"delete":false,"print":false,"report":false}	t	2023-06-01 12:48:41.882079+03	t	1
15	\N	مفرزة الرصافة	admin9	$2a$10$LOK993V65uHiTyPINFeva.OY.IUAbBQRm2nOopp94nZ6HQUj7GcuW	1	{"admin":true,"create":true,"update":false,"delete":false,"print":false,"report":false}	t	2023-06-01 13:10:02.504556+03	t	6
10	2	مفرزة استخبارت	admin4	$2a$10$95O5pzQjBqmVAmwDXyxpWea7NGwkLERprMSVDln0Shq8FcI3O9z32	2	{"admin":true,"create":true,"update":true,"delete":true,"print":true,"report":false}	t	2023-05-28 09:25:30.264926+03	f	\N
8	\N	مدير القسم	admin1	$2a$10$CTTPW4BH1Xn5C0QcYS9WMuh39vRdR1V3QvayoqKyjMW5qtkZmuBn.	1	{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}	t	2023-05-24 09:27:28.590498+03	f	2
7	\N	مكتب الوزير	admin3	$2a$10$euahTAFyTI2hUUxdmU6zZOZEXoBMMIYGlEHCiJuufTiXboezylNve	3	{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}	t	2023-05-08 14:09:25.945852+03	f	\N
16	5	مفرزة التسجيل الجنائي	admin10	$2a$10$.E6/4Xir5wD9VlQ1W5VnF.k1ElotwAmirfJgTEJrzPIfSjnDULpo6	2	{"admin":true,"create":true,"update":false,"delete":false,"print":false,"report":false}	t	2023-06-01 13:10:24.948056+03	f	\N
19	4	الادلة الجنائية	admin16	$2a$10$tUjN6YiwkudRKNizO0py7Okk7HC0JkReH6urJf7.GvttSUptJBEeG	2	{"admin":true,"create":false,"update":false,"delete":false,"print":false,"report":false}	t	2023-06-15 18:20:57.46638+03	f	\N
9	\N	القانونية - الهويات	admin2	$2a$10$TUZEvqbeuvMD6XHuheXNCuQ71cD7ikRugkbKIOkbINvXAJPmhBcDC	1	{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}	t	2023-05-24 09:28:45.710406+03	f	4
14	\N	مدقق الهويات	admin8	$2a$10$eE8kaF7JSYCB8MQz26x2E.oF/fI9f0c6Deb1fnp9bYkemA7Oqe.D.	1	{"admin":true,"create":true,"update":false,"delete":false,"print":false,"report":false}	t	2023-06-01 12:49:20.212369+03	f	3
11	2	استخبارات	admin5	$2a$10$T2pjHmwDv3FZ9CtfrPulZ..nrP8s776EahzNfpe737Dn5G2au042G	2	{"admin":true,"create":true,"update":false,"delete":false,"print":true,"report":false}	t	2023-05-28 09:25:50.596505+03	f	\N
12	3	البنى التحتية	admin6	$2a$10$98y3WCGrbyrC6.u88O6NnuUbbOmb6JUYiobmj0vkAyr0FWu6WqlcW	2	{"admin":true,"create":true,"update":true,"delete":false,"print":false,"report":false}	t	2023-05-28 13:13:13.158523+03	f	\N
17	7	الفحص الطبي	admin14	$2a$10$a.WkEjI9fzFEQDQyy1nMluIeeHWtu3JND37qX3DF00uBoIINgpOSy	2	{"admin":true,"create":false,"update":false,"delete":false,"print":false,"report":false}	t	2023-06-15 18:19:29.191305+03	f	\N
18	8	فحص السلاح	admin15	$2a$10$iysSAUDorkzRUxKfgZvaSeKE/XtOS.56383s.oJu7kGqGVTvK/Q8m	2	{"admin":true,"create":false,"update":false,"delete":false,"print":false,"report":false}	t	2023-06-15 18:19:58.465392+03	f	\N
\.


--
-- TOC entry 3447 (class 0 OID 49265)
-- Dependencies: 226
-- Data for Name: weapon_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapon_name (id, weapon_name, weapon_size) FROM stdin;
1	p1	9mm
2	كلك	9
\.


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 210
-- Name: app_person_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_person_type_id_seq', 8, true);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 6, true);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 217
-- Name: license_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.license_type_id_seq', 5, true);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 219
-- Name: province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.province_id_seq', 7, true);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 223
-- Name: subidentity_sudid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subidentity_sudid_seq', 6, true);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 227
-- Name: weapon_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapon_name_id_seq', 2, true);


--
-- TOC entry 3255 (class 2606 OID 49277)
-- Name: approval_destination app_person_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approval_destination
    ADD CONSTRAINT app_person_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 49279)
-- Name: biometric biometric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT biometric_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 49281)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 49283)
-- Name: identification identification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT identification_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 49285)
-- Name: license_type license_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type
    ADD CONSTRAINT license_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 49287)
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 49289)
-- Name: requests_details requests_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 49291)
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 49293)
-- Name: subidentity subidentity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subidentity
    ADD CONSTRAINT subidentity_pkey PRIMARY KEY (sudid);


--
-- TOC entry 3275 (class 2606 OID 49295)
-- Name: users users_namen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_namen_key UNIQUE (name);


--
-- TOC entry 3277 (class 2606 OID 49297)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 49299)
-- Name: users users_usernamen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_usernamen_key UNIQUE (username);


--
-- TOC entry 3257 (class 2606 OID 49301)
-- Name: approvals weapon_approvalsn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approvals
    ADD CONSTRAINT weapon_approvalsn_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 49303)
-- Name: weapon_name weapon_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name
    ADD CONSTRAINT weapon_name_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 49304)
-- Name: requests requests_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3285 (class 2606 OID 49309)
-- Name: requests_details requests_details_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3286 (class 2606 OID 49314)
-- Name: requests_details requests_details_license_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_license_id_fkey FOREIGN KEY (license_id) REFERENCES public.license_type(id);


--
-- TOC entry 3287 (class 2606 OID 49319)
-- Name: requests_details requests_details_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


--
-- TOC entry 3288 (class 2606 OID 49324)
-- Name: requests_details requests_details_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_req_id_fkey FOREIGN KEY (req_id) REFERENCES public.requests(id);


--
-- TOC entry 3289 (class 2606 OID 49329)
-- Name: requests_details requests_details_weapname_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_weapname_id_fkey FOREIGN KEY (weapname_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3284 (class 2606 OID 49334)
-- Name: requests requests_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


--
-- TOC entry 3282 (class 2606 OID 49339)
-- Name: approvals sub_sudid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approvals
    ADD CONSTRAINT sub_sudid FOREIGN KEY (sub_identity) REFERENCES public.subidentity(sudid) NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 49344)
-- Name: users users_approval_det; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_approval_det FOREIGN KEY (approval_det_id) REFERENCES public.approval_destination(id);


-- Completed on 2023-06-20 15:18:29

--
-- PostgreSQL database dump complete
--

