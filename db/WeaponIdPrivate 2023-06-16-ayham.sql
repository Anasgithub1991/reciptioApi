--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-16 14:09:17

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
-- TOC entry 857 (class 1247 OID 49349)
-- Name: approval_part; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.approval_part AS ENUM (
    'person',
    'weapon'
);


ALTER TYPE public.approval_part OWNER TO postgres;

--
-- TOC entry 860 (class 1247 OID 49354)
-- Name: approval_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.approval_role AS ENUM (
    'Prime_mimister',
    'Minister'
);


ALTER TYPE public.approval_role OWNER TO postgres;

--
-- TOC entry 863 (class 1247 OID 49360)
-- Name: gender_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender_type AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.gender_type OWNER TO postgres;

--
-- TOC entry 866 (class 1247 OID 49366)
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status AS ENUM (
    'PENDING',
    'APPROVED',
    'DECLINED'
);


ALTER TYPE public.status OWNER TO postgres;

--
-- TOC entry 869 (class 1247 OID 49374)
-- Name: user_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_type AS ENUM (
    'identification_managment',
    'approval_destination'
);


ALTER TYPE public.user_type OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 205002)
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
-- TOC entry 233 (class 1255 OID 205001)
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
-- TOC entry 214 (class 1259 OID 49379)
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
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN approval_destination.role_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.approval_destination.role_type IS '0 none -> userType = 1,
1 accept suspense -> userType = 2, 
2 accept reject userType = 2,
3 supervisor userType = 2';


--
-- TOC entry 215 (class 1259 OID 49384)
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
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 215
-- Name: app_person_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_person_type_id_seq OWNED BY public.approval_destination.id;


--
-- TOC entry 216 (class 1259 OID 49385)
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
-- TOC entry 217 (class 1259 OID 49392)
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
-- TOC entry 218 (class 1259 OID 49399)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    cat text NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 49404)
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
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 219
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 220 (class 1259 OID 49405)
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
    is_print smallint
);


ALTER TABLE public.identification OWNER TO postgres;

--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN identification.is_print; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification.is_print IS '0 - not print
1- print
2- Error print';


--
-- TOC entry 221 (class 1259 OID 49412)
-- Name: license_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.license_type (
    id integer NOT NULL,
    license text NOT NULL
);


ALTER TABLE public.license_type OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 49417)
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
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 222
-- Name: license_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.license_type_id_seq OWNED BY public.license_type.id;


--
-- TOC entry 223 (class 1259 OID 49418)
-- Name: province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.province (
    id integer NOT NULL,
    pro_name text NOT NULL
);


ALTER TABLE public.province OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 49423)
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
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 224
-- Name: province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.province_id_seq OWNED BY public.province.id;


--
-- TOC entry 225 (class 1259 OID 49424)
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
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN requests.gender_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests.gender_type IS '1- male
2- female';


--
-- TOC entry 226 (class 1259 OID 49431)
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
    biometric_id uuid
);


ALTER TABLE public.requests_details OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN requests_details.approval_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.approval_role IS '1- Prime_minister
2- Minister';


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN requests_details.gender_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.gender_type IS '1- male
2- female';


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN requests_details.completed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.requests_details.completed IS '0- decline
1- approval
2- pending';


--
-- TOC entry 231 (class 1259 OID 164041)
-- Name: subidentity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subidentity (
    sudid smallint NOT NULL,
    sudname text,
    sudrultype smallint
);


ALTER TABLE public.subidentity OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN subidentity.sudid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudid IS 'التسلسل';


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN subidentity.sudname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudname IS 'اسم الجهة التابعة الى مديرية الهويات';


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN subidentity.sudrultype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.subidentity.sudrultype IS 'الصلاحية الخاصة بالجهة 
-غير مؤثر
-رفض
-وغيرها
0 none -> userType = 1,
1 accept suspense -> userType = 2, 
2 accept reject userType = 2,
3 supervisor userType = 2';


--
-- TOC entry 232 (class 1259 OID 164046)
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
-- TOC entry 227 (class 1259 OID 49438)
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
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN users.user_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.user_type IS '1- iditification_managment
2- approvals_managment
3- minister office';


--
-- TOC entry 228 (class 1259 OID 49446)
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
-- TOC entry 229 (class 1259 OID 49447)
-- Name: weapon_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapon_name (
    id integer NOT NULL,
    weapon_name text NOT NULL,
    weapon_size text NOT NULL
);


ALTER TABLE public.weapon_name OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 49452)
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
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 230
-- Name: weapon_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapon_name_id_seq OWNED BY public.weapon_name.id;


--
-- TOC entry 3240 (class 2604 OID 49453)
-- Name: approval_destination id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approval_destination ALTER COLUMN id SET DEFAULT nextval('public.app_person_type_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 49454)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 49455)
-- Name: license_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type ALTER COLUMN id SET DEFAULT nextval('public.license_type_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 49456)
-- Name: province id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 49457)
-- Name: weapon_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name ALTER COLUMN id SET DEFAULT nextval('public.weapon_name_id_seq'::regclass);


--
-- TOC entry 3439 (class 0 OID 49379)
-- Dependencies: 214
-- Data for Name: approval_destination; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.approval_destination (id, destination, role_type, approval_part) VALUES (4, 'الادلة الجنائية', 1, 1);
INSERT INTO public.approval_destination (id, destination, role_type, approval_part) VALUES (5, 'التسجيل الجنائي', 1, 2);
INSERT INTO public.approval_destination (id, destination, role_type, approval_part) VALUES (2, 'الاستخبارات', 1, 1);
INSERT INTO public.approval_destination (id, destination, role_type, approval_part) VALUES (3, 'البنى التحتية', 1, 2);
INSERT INTO public.approval_destination (id, destination, role_type, approval_part) VALUES (7, 'الفحص الطبي', 1, 1);
INSERT INTO public.approval_destination (id, destination, role_type, approval_part) VALUES (8, 'فحص السلاح', 1, 2);


--
-- TOC entry 3441 (class 0 OID 49385)
-- Dependencies: 216
-- Data for Name: approvals; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('9efc8be5-2665-44ff-9002-54bcaeabaa49', '1ac4ba58-99b1-460d-b8ac-63677dcf2312', 2, NULL, 1, 'لايوجد', '121', '2023-06-16 00:00:00+03', 'لايوجد', '2023-06-16 01:27:41.31698+03', 2, NULL, NULL, B'0', NULL, NULL);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('3b7d5591-0902-40d8-9d70-b87b1a492c3d', '1ac4ba58-99b1-460d-b8ac-63677dcf2312', 7, 1, 0, 'مخالة قانونية', '1212', '2023-06-16 00:00:00+03', 'لايوجد', '2023-06-16 01:33:24.211211+03', 2, NULL, NULL, B'0', NULL, NULL);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('3cf3363d-82e5-485c-b2dd-d8209379d70c', '1ac4ba58-99b1-460d-b8ac-63677dcf2312', 8, NULL, 0, 'غير مطابق', '123', '2023-06-10 00:00:00+03', 'null', '2023-06-16 01:34:24.225437+03', 2, NULL, NULL, B'0', NULL, NULL);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('8d83c509-7757-452b-88c4-264db7e9d557', '1ac4ba58-99b1-460d-b8ac-63677dcf2312', 4, NULL, 1, 'لايوجد', '122', '2023-06-23 00:00:00+03', 'لايوجد', '2023-06-16 01:38:32.346904+03', 2, NULL, NULL, B'0', NULL, NULL);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('7ba03b63-8e12-488d-8ede-1bf2cbf6ad7a', '1ac4ba58-99b1-460d-b8ac-63677dcf2312', NULL, NULL, 1, 'لايوجد', '12', '2023-06-16 00:00:00+03', 'لايوجد', '2023-06-16 01:41:46.805447+03', 2, NULL, NULL, B'0', NULL, 2);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('bb9a9038-7b75-48ba-8d6a-5d8679d947a5', '8929b616-87b4-4ce2-85b5-41910d2400f6', 7, NULL, 0, 'غير لائق', '12', '2023-06-16 00:00:00+03', 'لايوجد', '2023-06-16 01:52:29.955799+03', 2, NULL, NULL, B'0', NULL, NULL);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('4436be5b-810c-49b1-bbf5-98e1de75259e', '8929b616-87b4-4ce2-85b5-41910d2400f6', NULL, NULL, 0, 'حسب الفحص الطبي غير لائق', '12', '2023-06-16 00:00:00+03', 'لايوجد', '2023-06-16 01:53:14.723738+03', 2, NULL, NULL, B'0', NULL, 2);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('89164806-e8d9-4459-94b4-587b6a1f92d5', 'b795b687-2211-4251-b19e-977090a6ac8a', 7, NULL, 1, 'لايوجد', '1212', '2023-06-16 00:00:00+03', 'لايوجد', '2023-06-16 12:30:23.490921+03', 2, NULL, NULL, B'0', NULL, NULL);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('94cc41b7-4e62-4186-bfb7-37f1279c849a', 'b795b687-2211-4251-b19e-977090a6ac8a', 8, NULL, 0, 'غير صالح للاستخادم', '12', '2023-06-16 00:00:00+03', 'مرفوض', '2023-06-16 12:31:39.310224+03', 2, NULL, NULL, B'0', NULL, NULL);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('0f347187-a3dc-4bc2-82d9-0d6267528298', 'b795b687-2211-4251-b19e-977090a6ac8a', NULL, NULL, 0, 'حسب كتاب رفض فحص السلاح', '12', '2023-06-17 00:00:00+03', 'null', '2023-06-16 12:34:12.787395+03', 2, NULL, NULL, B'0', NULL, 3);
INSERT INTO public.approvals (id, req_details_id, approval_dest_id, approval_part, status, reason, booknum, bookdate, note, created_at, created_by, updated_at, updated_by, audit, audit_updated, sub_identity) VALUES ('142398ff-fe9e-4ed0-bbcd-aaf07d4e6891', 'b795b687-2211-4251-b19e-977090a6ac8a', NULL, NULL, 0, 'حسب كتاب فحص السلاح', '1212', '2023-06-16 00:00:00+03', 'غير صالح', '2023-06-16 12:35:08.209664+03', 2, NULL, NULL, B'0', NULL, 4);


--
-- TOC entry 3442 (class 0 OID 49392)
-- Dependencies: 217
-- Data for Name: biometric; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.biometric (id, pict, iris, fing_dat, fing_xml, note, created_at, created_by, updated_at, updated_by) VALUES ('7d95b0cd-f10d-490f-a135-01fd03242db9', '94482811-6d99-4999-9d9b-8e84d71357fb.jpg', NULL, '6cfaa1a0-8286-41de-b043-2c908ce4c971.dat', 'c6847716-8e31-45b8-9d1f-2afd0fe65c5a.xml', NULL, '2023-06-16 01:20:14.526752+03', 8, '2023-06-16 01:24:02.369364+03', 8);
INSERT INTO public.biometric (id, pict, iris, fing_dat, fing_xml, note, created_at, created_by, updated_at, updated_by) VALUES ('21ce7e7d-2fb5-43cb-91c6-2b690a7aeec2', '8826c6a8-d61f-4809-9188-a4d8783a624b.jpg', NULL, '26d81d69-e561-4e5b-a769-e2252bd6cdff.dat', '155b67f9-06b1-4626-9a75-acde5e2251b7.xml', NULL, '2023-06-16 01:35:03.701406+03', 8, '2023-06-16 01:36:12.358016+03', 8);
INSERT INTO public.biometric (id, pict, iris, fing_dat, fing_xml, note, created_at, created_by, updated_at, updated_by) VALUES ('39c4e4dd-0b1f-405e-931e-bb9b83fd10f8', '2dcface0-c169-4be2-992d-b95f397a97ac.jpg', NULL, '7ccb043e-d388-4810-add6-56b5f6f467af.dat', '0fb7dfe3-17a7-40cf-b425-4c1206d954d8.xml', NULL, '2023-06-16 12:27:28.635113+03', 8, '2023-06-16 12:29:23.566046+03', 8);


--
-- TOC entry 3443 (class 0 OID 49399)
-- Dependencies: 218
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, cat) VALUES (1, 'طبيب');
INSERT INTO public.category (id, cat) VALUES (2, 'محامي');
INSERT INTO public.category (id, cat) VALUES (3, 'رجل اعمال');
INSERT INTO public.category (id, cat) VALUES (4, 'صائغ');
INSERT INTO public.category (id, cat) VALUES (5, 'شيخ عشيرة');
INSERT INTO public.category (id, cat) VALUES (6, 'استاذ جامعي');


--
-- TOC entry 3445 (class 0 OID 49405)
-- Dependencies: 220
-- Data for Name: identification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3446 (class 0 OID 49412)
-- Dependencies: 221
-- Data for Name: license_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.license_type (id, license) VALUES (1, 'حيازة');
INSERT INTO public.license_type (id, license) VALUES (2, 'حيازة وحمل');


--
-- TOC entry 3448 (class 0 OID 49418)
-- Dependencies: 223
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.province (id, pro_name) VALUES (4, 'النجف الاشرف');
INSERT INTO public.province (id, pro_name) VALUES (1, 'بغداد');
INSERT INTO public.province (id, pro_name) VALUES (2, 'البصرة');
INSERT INTO public.province (id, pro_name) VALUES (3, 'اربيل');
INSERT INTO public.province (id, pro_name) VALUES (5, 'الديوانية');
INSERT INTO public.province (id, pro_name) VALUES (6, 'واسط');
INSERT INTO public.province (id, pro_name) VALUES (7, 'ديالى');


--
-- TOC entry 3450 (class 0 OID 49424)
-- Dependencies: 225
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gender_type, cat_id, monam1, monam2, monam3, idnum, pro_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, approv_num, approv_date) VALUES ('82e60274-234b-4653-aebd-0295199a0103', 'عبدالرحمن', 'باقي', 'زاهر', 'سالم', 'الغانمي', '', '2023-06-15 00:00:00+03', 1, 1, 'سميعة', 'سالم', 'اسماعيل', '98569898', 1, 'الرصافة', '077757575', '', '2023-06-16 00:16:00.039482+03', NULL, NULL, NULL, '1212', '2023-06-16');
INSERT INTO public.requests (id, name1, name2, name3, name4, surname, profession, birdate, gender_type, cat_id, monam1, monam2, monam3, idnum, pro_id, addresses, phone, note, created_at, created_by, updated_at, updated_by, approv_num, approv_date) VALUES ('2195ec6b-88c1-471c-862c-880bc07eff14', 'احمد', 'علي', 'راضي', 'حازم', 'التميمي', '', '2023-06-15 00:00:00+03', 1, 1, 'هدية', 'سعيد', 'محسن', '55768778', 1, 'الكرخ', '07709998', '', '2023-06-16 12:25:27.480304+03', NULL, NULL, NULL, '1212', '2023-06-16');


--
-- TOC entry 3451 (class 0 OID 49431)
-- Dependencies: 226
-- Data for Name: requests_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requests_details (id, req_id, license_id, approval_role, name1, name2, name3, name4, surname, gender_type, cat_id, birdate, monam1, monam2, monam3, idnum, iss_1, issdat1, natnum, iss_2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, wea_hold_per, margin_app, completed, note, created_at, created_by, updated_at, updated_by, prev_weapn, archive_num, biometric_id) VALUES ('b795b687-2211-4251-b19e-977090a6ac8a', '2195ec6b-88c1-471c-862c-880bc07eff14', 1, 2, 'احمد', 'علي', 'راضي', 'حازم', 'التميمي', 1, 1, '2023-06-15 00:00:00+03', 'هدية', 'سعيد', 'محسن', '55768778', '2', '2023-06-08', 'null', 'null', '1900-01-01 00:00:00+02:57:36', 1, 'الكرخ', 'مركز الاطفاء', '335', '353', '223', 'null', 'null', '1900-01-01 00:00:00+02:57:36', '07709998', 2, '12jdg', '24', 'موافق', 0, 'null', '2023-06-16 12:25:27.507+03', 1, NULL, 8, 'لايوجد', '1', '39c4e4dd-0b1f-405e-931e-bb9b83fd10f8');
INSERT INTO public.requests_details (id, req_id, license_id, approval_role, name1, name2, name3, name4, surname, gender_type, cat_id, birdate, monam1, monam2, monam3, idnum, iss_1, issdat1, natnum, iss_2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, wea_hold_per, margin_app, completed, note, created_at, created_by, updated_at, updated_by, prev_weapn, archive_num, biometric_id) VALUES ('1ac4ba58-99b1-460d-b8ac-63677dcf2312', '82e60274-234b-4653-aebd-0295199a0103', 1, 2, 'سعيد', 'اسماعيل', 'مزهر', 'سرمد', 'الزبيدي', 1, 1, '1996-06-16 00:00:00+04', 'حمدية', 'راضي', 'سلمان', '957509', '3', '2023-06-15', 'null', 'null', '2023-06-16 00:00:00+03', 1, 'الكرخ', 'مركز الشرطة', '575', '565', '46', '', '', '2023-06-09 00:00:00+03', '0777760', NULL, 'null', '24', 'موافق', 1, 'null', '2023-06-16 00:16:00.062+03', 1, NULL, 8, 'لايوجد', '1', '21ce7e7d-2fb5-43cb-91c6-2b690a7aeec2');
INSERT INTO public.requests_details (id, req_id, license_id, approval_role, name1, name2, name3, name4, surname, gender_type, cat_id, birdate, monam1, monam2, monam3, idnum, iss_1, issdat1, natnum, iss_2, issdat2, pro_id, addresses, nearplace, mahala, zuqaq, dar, djp, numdet, datedet, phone, weapname_id, weapnum, wea_hold_per, margin_app, completed, note, created_at, created_by, updated_at, updated_by, prev_weapn, archive_num, biometric_id) VALUES ('8929b616-87b4-4ce2-85b5-41910d2400f6', '82e60274-234b-4653-aebd-0295199a0103', 1, 2, 'بريسم', 'زاهر', 'رضيب', 'خزعل', 'البهادلي', 1, 2, '2001-05-16 00:00:00+04', 'رضية', 'فاضل', 'حميد', '67676', '2', '2021-05-15', 'null', 'null', '1900-01-01 00:00:00+02:57:36', 1, 'الرصافة', 'دار الازياء', '34', '24', '24', 'null', 'null', '1900-01-01 00:00:00+02:57:36', '0676767', NULL, 'null', '24', 'موافق', 0, 'null', '2023-06-16 00:16:00.074+03', 1, NULL, 8, 'لايوجد', '1', '7d95b0cd-f10d-490f-a135-01fd03242db9');


--
-- TOC entry 3456 (class 0 OID 164041)
-- Dependencies: 231
-- Data for Name: subidentity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subidentity (sudid, sudname, sudrultype) OVERRIDING SYSTEM VALUE VALUES (2, 'مصرح هويات', 3);
INSERT INTO public.subidentity (sudid, sudname, sudrultype) OVERRIDING SYSTEM VALUE VALUES (3, 'مدقق هويات', 2);
INSERT INTO public.subidentity (sudid, sudname, sudrultype) OVERRIDING SYSTEM VALUE VALUES (4, 'قانونية الهويات', 2);
INSERT INTO public.subidentity (sudid, sudname, sudrultype) OVERRIDING SYSTEM VALUE VALUES (1, 'مفرزة الكرخ', 0);
INSERT INTO public.subidentity (sudid, sudname, sudrultype) OVERRIDING SYSTEM VALUE VALUES (5, 'ادارة الهويات', 0);
INSERT INTO public.subidentity (sudid, sudname, sudrultype) OVERRIDING SYSTEM VALUE VALUES (6, 'مفرزة الرصافة', 0);


--
-- TOC entry 3452 (class 0 OID 49438)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (13, NULL, 'مفرزة الكرخ', 'admin7', '$2a$10$vIFD4Voi4541vplZSmeC9e1G9loJm6z/VwMNdf35Vx95t3A0W2g/2', 1, '{"admin":true,"create":true,"update":true,"delete":false,"print":false,"report":false}', true, '2023-06-01 12:48:41.882079+03', true, 1);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (15, NULL, 'مفرزة الرصافة', 'admin9', '$2a$10$LOK993V65uHiTyPINFeva.OY.IUAbBQRm2nOopp94nZ6HQUj7GcuW', 1, '{"admin":true,"create":true,"update":false,"delete":false,"print":false,"report":false}', true, '2023-06-01 13:10:02.504556+03', true, 6);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (10, 2, 'مفرزة استخبارت', 'admin4', '$2a$10$95O5pzQjBqmVAmwDXyxpWea7NGwkLERprMSVDln0Shq8FcI3O9z32', 2, '{"admin":true,"create":true,"update":true,"delete":true,"print":true,"report":false}', true, '2023-05-28 09:25:30.264926+03', false, NULL);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (8, NULL, 'مدير القسم', 'admin1', '$2a$10$CTTPW4BH1Xn5C0QcYS9WMuh39vRdR1V3QvayoqKyjMW5qtkZmuBn.', 1, '{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}', true, '2023-05-24 09:27:28.590498+03', false, 2);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (7, NULL, 'مكتب الوزير', 'admin3', '$2a$10$euahTAFyTI2hUUxdmU6zZOZEXoBMMIYGlEHCiJuufTiXboezylNve', 3, '{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}', true, '2023-05-08 14:09:25.945852+03', false, NULL);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (16, 5, 'مفرزة التسجيل الجنائي', 'admin10', '$2a$10$.E6/4Xir5wD9VlQ1W5VnF.k1ElotwAmirfJgTEJrzPIfSjnDULpo6', 2, '{"admin":true,"create":true,"update":false,"delete":false,"print":false,"report":false}', true, '2023-06-01 13:10:24.948056+03', false, NULL);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (19, 4, 'الادلة الجنائية', 'admin16', '$2a$10$tUjN6YiwkudRKNizO0py7Okk7HC0JkReH6urJf7.GvttSUptJBEeG', 2, '{"admin":true,"create":false,"update":false,"delete":false,"print":false,"report":false}', true, '2023-06-15 18:20:57.46638+03', false, NULL);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (9, NULL, 'القانونية - الهويات', 'admin2', '$2a$10$TUZEvqbeuvMD6XHuheXNCuQ71cD7ikRugkbKIOkbINvXAJPmhBcDC', 1, '{"admin":true,"create":true,"update":true,"delete":true,"print":false,"report":false}', true, '2023-05-24 09:28:45.710406+03', false, 4);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (14, NULL, 'مدقق الهويات', 'admin8', '$2a$10$eE8kaF7JSYCB8MQz26x2E.oF/fI9f0c6Deb1fnp9bYkemA7Oqe.D.', 1, '{"admin":true,"create":true,"update":false,"delete":false,"print":false,"report":false}', true, '2023-06-01 12:49:20.212369+03', false, 3);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (11, 2, 'استخبارات', 'admin5', '$2a$10$T2pjHmwDv3FZ9CtfrPulZ..nrP8s776EahzNfpe737Dn5G2au042G', 2, '{"admin":true,"create":true,"update":false,"delete":false,"print":true,"report":false}', true, '2023-05-28 09:25:50.596505+03', false, NULL);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (12, 3, 'البنى التحتية', 'admin6', '$2a$10$98y3WCGrbyrC6.u88O6NnuUbbOmb6JUYiobmj0vkAyr0FWu6WqlcW', 2, '{"admin":true,"create":true,"update":true,"delete":false,"print":false,"report":false}', true, '2023-05-28 13:13:13.158523+03', false, NULL);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (17, 7, 'الفحص الطبي', 'admin14', '$2a$10$a.WkEjI9fzFEQDQyy1nMluIeeHWtu3JND37qX3DF00uBoIINgpOSy', 2, '{"admin":true,"create":false,"update":false,"delete":false,"print":false,"report":false}', true, '2023-06-15 18:19:29.191305+03', false, NULL);
INSERT INTO public.users (id, approval_det_id, name, username, password, user_type, roles, activation, created_at, first_enter, sudid) OVERRIDING SYSTEM VALUE VALUES (18, 8, 'فحص السلاح', 'admin15', '$2a$10$iysSAUDorkzRUxKfgZvaSeKE/XtOS.56383s.oJu7kGqGVTvK/Q8m', 2, '{"admin":true,"create":false,"update":false,"delete":false,"print":false,"report":false}', true, '2023-06-15 18:19:58.465392+03', false, NULL);


--
-- TOC entry 3454 (class 0 OID 49447)
-- Dependencies: 229
-- Data for Name: weapon_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.weapon_name (id, weapon_name, weapon_size) VALUES (1, 'p1', '9mm');
INSERT INTO public.weapon_name (id, weapon_name, weapon_size) VALUES (2, 'كلك', '9');


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 215
-- Name: app_person_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_person_type_id_seq', 8, true);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 219
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 6, true);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 222
-- Name: license_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.license_type_id_seq', 5, true);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 224
-- Name: province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.province_id_seq', 7, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 232
-- Name: subidentity_sudid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subidentity_sudid_seq', 6, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 230
-- Name: weapon_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapon_name_id_seq', 2, true);


--
-- TOC entry 3261 (class 2606 OID 49459)
-- Name: approval_destination app_person_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approval_destination
    ADD CONSTRAINT app_person_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 205010)
-- Name: biometric biometric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biometric
    ADD CONSTRAINT biometric_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 49461)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 49463)
-- Name: identification identification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT identification_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 49465)
-- Name: license_type license_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_type
    ADD CONSTRAINT license_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 49467)
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 49469)
-- Name: requests_details requests_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 49471)
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 164048)
-- Name: subidentity subidentity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subidentity
    ADD CONSTRAINT subidentity_pkey PRIMARY KEY (sudid);


--
-- TOC entry 3279 (class 2606 OID 49473)
-- Name: users users_namen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_namen_key UNIQUE (name);


--
-- TOC entry 3281 (class 2606 OID 49475)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 49477)
-- Name: users users_usernamen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_usernamen_key UNIQUE (username);


--
-- TOC entry 3263 (class 2606 OID 49479)
-- Name: approvals weapon_approvalsn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approvals
    ADD CONSTRAINT weapon_approvalsn_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 49481)
-- Name: weapon_name weapon_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_name
    ADD CONSTRAINT weapon_name_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 49482)
-- Name: requests requests_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3291 (class 2606 OID 49487)
-- Name: requests_details requests_details_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.category(id);


--
-- TOC entry 3292 (class 2606 OID 49492)
-- Name: requests_details requests_details_license_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_license_id_fkey FOREIGN KEY (license_id) REFERENCES public.license_type(id);


--
-- TOC entry 3293 (class 2606 OID 49497)
-- Name: requests_details requests_details_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


--
-- TOC entry 3294 (class 2606 OID 49502)
-- Name: requests_details requests_details_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_req_id_fkey FOREIGN KEY (req_id) REFERENCES public.requests(id);


--
-- TOC entry 3295 (class 2606 OID 49507)
-- Name: requests_details requests_details_weapname_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_details
    ADD CONSTRAINT requests_details_weapname_id_fkey FOREIGN KEY (weapname_id) REFERENCES public.weapon_name(id);


--
-- TOC entry 3290 (class 2606 OID 49512)
-- Name: requests requests_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.province(id);


--
-- TOC entry 3288 (class 2606 OID 172233)
-- Name: approvals sub_sudid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approvals
    ADD CONSTRAINT sub_sudid FOREIGN KEY (sub_identity) REFERENCES public.subidentity(sudid) NOT VALID;


--
-- TOC entry 3296 (class 2606 OID 49517)
-- Name: users users_approval_det; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_approval_det FOREIGN KEY (approval_det_id) REFERENCES public.approval_destination(id);


-- Completed on 2023-06-16 14:09:17

--
-- PostgreSQL database dump complete
--

