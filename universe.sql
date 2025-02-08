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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter integer NOT NULL,
    is_potentially_hazardous boolean NOT NULL,
    orbital_period integer NOT NULL,
    composition text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth_in_millions_of_light_years integer NOT NULL,
    number_of_stars_in_billions integer NOT NULL,
    is_spiral boolean NOT NULL,
    has_life boolean DEFAULT false,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    is_spherical boolean NOT NULL,
    discovered_year integer,
    distance_from_planet integer NOT NULL,
    geology text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    orbital_period_in_days integer NOT NULL,
    has_moons boolean NOT NULL,
    is_habitable boolean DEFAULT false,
    distance_from_star_in_millions_of_km integer NOT NULL,
    atmosphere text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_billions_of_years integer NOT NULL,
    radius numeric(15,2) NOT NULL,
    temperature integer NOT NULL,
    is_dwarf boolean NOT NULL,
    notes text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 946, false, 1680, 'Rocky');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false, 1325, 'Rocky');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, false, 1686, 'Rocky');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 431, false, 2030, 'Carbonaceous');
INSERT INTO public.asteroid VALUES (5, 'Davida', 326, false, 2390, 'Carbonaceous');
INSERT INTO public.asteroid VALUES (6, 'Interamnia', 317, false, 1684, 'Carbonaceous');
INSERT INTO public.asteroid VALUES (7, 'Europa', 305, false, 2099, 'Carbonaceous');
INSERT INTO public.asteroid VALUES (8, 'Juno', 234, false, 1592, 'Rocky');
INSERT INTO public.asteroid VALUES (9, 'Amphitrite', 216, false, 1709, 'Rocky');
INSERT INTO public.asteroid VALUES (10, 'Eunomia', 215, false, 1269, 'Rocky');
INSERT INTO public.asteroid VALUES (11, 'Psyche', 222, false, 1830, 'Metallic');
INSERT INTO public.asteroid VALUES (12, 'Kleopatra', 127, false, 2899, 'Metallic');
INSERT INTO public.asteroid VALUES (13, 'Mathilde', 52, false, 1717, 'Carbonaceous');
INSERT INTO public.asteroid VALUES (14, 'Eros', 34, false, 643, 'Rocky');
INSERT INTO public.asteroid VALUES (15, 'Bennu', 510, true, 437, 'Carbonaceous');
INSERT INTO public.asteroid VALUES (16, 'Ryugu', 900, true, 358, 'Carbonaceous');
INSERT INTO public.asteroid VALUES (17, 'Didymos', 780, true, 770, 'Rocky');
INSERT INTO public.asteroid VALUES (18, 'Itokawa', 535, true, 1826, 'Rocky');
INSERT INTO public.asteroid VALUES (19, 'Toutatis', 540, true, 1599, 'Rocky');
INSERT INTO public.asteroid VALUES (20, 'Apophis', 370, true, 323, 'Rocky');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 100, true, true, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2, 1000, true, false, 'Nearest major galaxy.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, 40, true, false, 'A spiral galaxy.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 0, 10, false, false, 'A satellite galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 0, 7, false, false, 'Another satellite galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 29, 100, true, false, 'Known for its prominent dust lane.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (22, 'Moon', 12, 1737, true, NULL, 384400, 'Cratered surface');
INSERT INTO public.moon VALUES (23, 'Phobos', 13, 11, false, 1877, 9380, 'Irregular shape');
INSERT INTO public.moon VALUES (24, 'Deimos', 13, 6, false, 1877, 23460, 'Small and irregular');
INSERT INTO public.moon VALUES (25, 'Io', 15, 1821, true, 1610, 421700, 'Volcanically active');
INSERT INTO public.moon VALUES (26, 'Europa', 15, 1560, true, 1610, 671000, 'Possible subsurface ocean');
INSERT INTO public.moon VALUES (27, 'Ganymede', 15, 2634, true, 1610, 1070000, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (28, 'Callisto', 15, 2410, true, 1610, 1883000, 'Heavily cratered');
INSERT INTO public.moon VALUES (29, 'Titan', 16, 2575, true, 1655, 1221870, 'Has a dense atmosphere');
INSERT INTO public.moon VALUES (30, 'Enceladus', 16, 252, true, 1789, 238020, 'Geysers of water vapor');
INSERT INTO public.moon VALUES (31, 'Mimas', 16, 198, true, 1789, 185530, 'Impact crater');
INSERT INTO public.moon VALUES (32, 'Tethys', 16, 531, true, 1684, 294660, 'Icy moon');
INSERT INTO public.moon VALUES (33, 'Dione', 16, 561, true, 1684, 377400, 'Bright streaks');
INSERT INTO public.moon VALUES (34, 'Rhea', 16, 764, true, 1672, 527100, 'Icy surface');
INSERT INTO public.moon VALUES (35, 'Iapetus', 16, 735, true, 1671, 3560000, 'Two-toned appearance');
INSERT INTO public.moon VALUES (36, 'Miranda', 17, 235, true, 1948, 129390, 'Unique surface features');
INSERT INTO public.moon VALUES (37, 'Ariel', 17, 579, true, 1851, 191000, 'Smooth plains');
INSERT INTO public.moon VALUES (38, 'Umbriel', 17, 584, true, 1851, 436000, 'Dark surface');
INSERT INTO public.moon VALUES (39, 'Titania', 17, 783, true, 1787, 436000, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (40, 'Oberon', 17, 761, true, 1787, 583000, 'Farthest major moon of Uranus');
INSERT INTO public.moon VALUES (41, 'Triton', 18, 1353, true, 1846, 354800, 'Largest moon of Neptune');
INSERT INTO public.moon VALUES (42, 'Nereid', 18, 170, true, 1949, 5513400, 'Irregular moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 'Earth', 1, 365, true, true, 149, 'Nitrogen and oxygen rich');
INSERT INTO public.planet VALUES (13, 'Mars', 1, 687, true, false, 227, 'Thin atmosphere, mostly carbon dioxide');
INSERT INTO public.planet VALUES (14, 'Venus', 1, 225, false, false, 108, 'Dense, hot atmosphere');
INSERT INTO public.planet VALUES (15, 'Jupiter', 1, 4333, true, false, 778, 'Gas giant');
INSERT INTO public.planet VALUES (16, 'Saturn', 1, 10759, true, false, 1429, 'Ringed gas giant');
INSERT INTO public.planet VALUES (17, 'Uranus', 1, 30687, true, false, 2870, 'Ice giant');
INSERT INTO public.planet VALUES (18, 'Neptune', 1, 60190, true, false, 4504, 'Ice giant');
INSERT INTO public.planet VALUES (19, 'Mercury', 1, 88, false, false, 57, 'Rocky planet');
INSERT INTO public.planet VALUES (20, 'Kepler-186f', 6, 130, false, true, 58, 'Exoplanet');
INSERT INTO public.planet VALUES (21, 'Proxima Centauri b', 4, 11, false, true, 7, 'Exoplanet');
INSERT INTO public.planet VALUES (22, 'TRAPPIST-1e', 7, 6, false, true, 4, 'Exoplanet');
INSERT INTO public.planet VALUES (23, '55 Cancri e', 5, 1, false, false, 2, 'Exoplanet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5, 696340.00, 5778, false, 'Our star.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 0, 1190000.00, 9940, false, 'Brightest star in the night sky.');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 0, 764000000.00, 3500, false, 'A red supergiant.');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 5, 107000.00, 3050, true, 'Nearest star to the Sun.');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 6, 850000.00, 5790, false, 'Part of a triple star system.');
INSERT INTO public.star VALUES (6, 'Vega', 1, 0, 1660000.00, 9600, false, 'A bright star in the Lyra constellation.');
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', 1, 0, 100000.00, 2500, true, 'Host star of TRAPPIST-1e');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

