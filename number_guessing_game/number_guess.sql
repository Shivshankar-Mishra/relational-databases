--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (17, 'user_1739819702984', 1, NULL);
INSERT INTO public.users VALUES (16, 'user_1739819702985', 4, NULL);
INSERT INTO public.users VALUES (3, 'user_1739818586869', 2, 147);
INSERT INTO public.users VALUES (2, 'user_1739818586870', 5, 8);
INSERT INTO public.users VALUES (19, 'user_1739819713911', 1, NULL);
INSERT INTO public.users VALUES (18, 'user_1739819713912', 4, NULL);
INSERT INTO public.users VALUES (1, 'Shiv', 5, 9);
INSERT INTO public.users VALUES (5, 'user_1739818607443', 2, 965);
INSERT INTO public.users VALUES (29, 'user_1739821222903', 2, 268);
INSERT INTO public.users VALUES (4, 'user_1739818607444', 5, 369);
INSERT INTO public.users VALUES (28, 'user_1739821222904', 5, 61);
INSERT INTO public.users VALUES (7, 'user_1739818852521', 2, NULL);
INSERT INTO public.users VALUES (6, 'user_1739818852522', 5, NULL);
INSERT INTO public.users VALUES (21, 'user_1739820176637', 2, 397);
INSERT INTO public.users VALUES (9, 'user_1739818864865', 2, NULL);
INSERT INTO public.users VALUES (20, 'user_1739820176638', 5, 191);
INSERT INTO public.users VALUES (8, 'user_1739818864866', 5, NULL);
INSERT INTO public.users VALUES (11, 'user_1739818872999', 2, NULL);
INSERT INTO public.users VALUES (31, 'user_1739821277641', 2, 242);
INSERT INTO public.users VALUES (10, 'user_1739818873000', 5, NULL);
INSERT INTO public.users VALUES (13, 'user_1739819191268', 1, NULL);
INSERT INTO public.users VALUES (23, 'user_1739820633388', 2, 476);
INSERT INTO public.users VALUES (12, 'user_1739819191269', 4, NULL);
INSERT INTO public.users VALUES (30, 'user_1739821277642', 5, 138);
INSERT INTO public.users VALUES (15, 'user_1739819202703', 1, NULL);
INSERT INTO public.users VALUES (14, 'user_1739819202704', 4, NULL);
INSERT INTO public.users VALUES (22, 'user_1739820633389', 5, 29);
INSERT INTO public.users VALUES (25, 'user_1739820872363', 2, 86);
INSERT INTO public.users VALUES (33, 'user_1739821328074', 2, 324);
INSERT INTO public.users VALUES (32, 'user_1739821328075', 5, 99);
INSERT INTO public.users VALUES (24, 'user_1739820872364', 5, 368);
INSERT INTO public.users VALUES (27, 'user_1739821117264', 2, 233);
INSERT INTO public.users VALUES (26, 'user_1739821117265', 5, 11);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 33, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

