--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0

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
-- Name: Role; Type: TYPE; Schema: public; Owner: harshit
--

CREATE TYPE public."Role" AS ENUM (
    'USER',
    'ADMIN'
);


ALTER TYPE public."Role" OWNER TO harshit;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Activity; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."Activity" (
    id integer NOT NULL,
    uuid text NOT NULL,
    "tripId" integer NOT NULL,
    "activityTypeId" integer NOT NULL,
    name text NOT NULL,
    description text,
    location text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    timezone text NOT NULL,
    public boolean NOT NULL,
    "maxPeople" integer DEFAULT 0,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Activity" OWNER TO harshit;

--
-- Name: ActivityType; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."ActivityType" (
    id integer NOT NULL,
    uuid text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ActivityType" OWNER TO harshit;

--
-- Name: ActivityType_id_seq; Type: SEQUENCE; Schema: public; Owner: harshit
--

CREATE SEQUENCE public."ActivityType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ActivityType_id_seq" OWNER TO harshit;

--
-- Name: ActivityType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harshit
--

ALTER SEQUENCE public."ActivityType_id_seq" OWNED BY public."ActivityType".id;


--
-- Name: Activity_id_seq; Type: SEQUENCE; Schema: public; Owner: harshit
--

CREATE SEQUENCE public."Activity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Activity_id_seq" OWNER TO harshit;

--
-- Name: Activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harshit
--

ALTER SEQUENCE public."Activity_id_seq" OWNED BY public."Activity".id;


--
-- Name: Trip; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."Trip" (
    id integer NOT NULL,
    uuid text NOT NULL,
    "userId" integer NOT NULL,
    name text NOT NULL,
    description text,
    public boolean NOT NULL,
    "dateFrom" timestamp(3) without time zone NOT NULL,
    "dateTo" timestamp(3) without time zone NOT NULL,
    adults integer NOT NULL,
    children integer DEFAULT 0,
    infants integer DEFAULT 0,
    "backgroundUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Trip" OWNER TO harshit;

--
-- Name: Trip_id_seq; Type: SEQUENCE; Schema: public; Owner: harshit
--

CREATE SEQUENCE public."Trip_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trip_id_seq" OWNER TO harshit;

--
-- Name: Trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harshit
--

ALTER SEQUENCE public."Trip_id_seq" OWNED BY public."Trip".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    uuid text NOT NULL,
    email text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    password text NOT NULL,
    status boolean DEFAULT true NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    role public."Role" DEFAULT 'USER'::public."Role" NOT NULL,
    public boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO harshit;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: harshit
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO harshit;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: harshit
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: UsersToActivities; Type: TABLE; Schema: public; Owner: harshit
--

CREATE TABLE public."UsersToActivities" (
    "userId" integer NOT NULL,
    "activityId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."UsersToActivities" OWNER TO harshit;

--
-- Name: Activity id; Type: DEFAULT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Activity" ALTER COLUMN id SET DEFAULT nextval('public."Activity_id_seq"'::regclass);


--
-- Name: ActivityType id; Type: DEFAULT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."ActivityType" ALTER COLUMN id SET DEFAULT nextval('public."ActivityType_id_seq"'::regclass);


--
-- Name: Trip id; Type: DEFAULT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Trip" ALTER COLUMN id SET DEFAULT nextval('public."Trip_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Activity; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."Activity" (id, uuid, "tripId", "activityTypeId", name, description, location, date, timezone, public, "maxPeople", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ActivityType; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."ActivityType" (id, uuid, name, type, "createdAt", "updatedAt") FROM stdin;
1	e4391f0c-18e8-450a-ba2b-f94f66f537ae	test	test	2020-12-07 11:12:31.319	2020-12-07 11:12:31.319
\.


--
-- Data for Name: Trip; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."Trip" (id, uuid, "userId", name, description, public, "dateFrom", "dateTo", adults, children, infants, "backgroundUrl", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."User" (id, uuid, email, "firstName", "lastName", password, status, locked, role, public, "createdAt", "updatedAt") FROM stdin;
1	1db28e7a-759a-4d73-ae1f-bfac4411bd6d	pantharshit00@gmail.com	Harshit 	Pant	123456	t	f	USER	t	2020-12-07 11:05:41.223	1970-01-01 00:00:00
\.


--
-- Data for Name: UsersToActivities; Type: TABLE DATA; Schema: public; Owner: harshit
--

COPY public."UsersToActivities" ("userId", "activityId", "createdAt") FROM stdin;
\.


--
-- Name: ActivityType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harshit
--

SELECT pg_catalog.setval('public."ActivityType_id_seq"', 1, true);


--
-- Name: Activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harshit
--

SELECT pg_catalog.setval('public."Activity_id_seq"', 1, false);


--
-- Name: Trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harshit
--

SELECT pg_catalog.setval('public."Trip_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: harshit
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- Name: ActivityType ActivityType_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."ActivityType"
    ADD CONSTRAINT "ActivityType_pkey" PRIMARY KEY (id);


--
-- Name: Activity Activity_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_pkey" PRIMARY KEY (id);


--
-- Name: Trip Trip_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Trip"
    ADD CONSTRAINT "Trip_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: UsersToActivities UsersToActivities_pkey; Type: CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."UsersToActivities"
    ADD CONSTRAINT "UsersToActivities_pkey" PRIMARY KEY ("userId", "activityId");


--
-- Name: Activity.tripId_id_unique; Type: INDEX; Schema: public; Owner: harshit
--

CREATE UNIQUE INDEX "Activity.tripId_id_unique" ON public."Activity" USING btree ("tripId", id);


--
-- Name: ActivityType.type_unique; Type: INDEX; Schema: public; Owner: harshit
--

CREATE UNIQUE INDEX "ActivityType.type_unique" ON public."ActivityType" USING btree (type);


--
-- Name: Trip.userId_id_unique; Type: INDEX; Schema: public; Owner: harshit
--

CREATE UNIQUE INDEX "Trip.userId_id_unique" ON public."Trip" USING btree ("userId", id);


--
-- Name: User.email_unique; Type: INDEX; Schema: public; Owner: harshit
--

CREATE UNIQUE INDEX "User.email_unique" ON public."User" USING btree (email);


--
-- Name: Activity Activity_activityTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_activityTypeId_fkey" FOREIGN KEY ("activityTypeId") REFERENCES public."ActivityType"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Activity Activity_tripId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_tripId_fkey" FOREIGN KEY ("tripId") REFERENCES public."Trip"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Trip Trip_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."Trip"
    ADD CONSTRAINT "Trip_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UsersToActivities UsersToActivities_activityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."UsersToActivities"
    ADD CONSTRAINT "UsersToActivities_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES public."Activity"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UsersToActivities UsersToActivities_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: harshit
--

ALTER TABLE ONLY public."UsersToActivities"
    ADD CONSTRAINT "UsersToActivities_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

