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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distances_from_earth numeric(10,4) NOT NULL,
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric(10,4) NOT NULL,
    description text,
    planet_id integer NOT NULL
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
-- Name: others; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.others (
    others_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.others OWNER TO freecodecamp;

--
-- Name: others_other_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.others_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.others_other_id_seq OWNER TO freecodecamp;

--
-- Name: others_other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.others_other_id_seq OWNED BY public.others.others_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric(10,4) NOT NULL,
    description text,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    star_type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,4) NOT NULL,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: others others_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.others ALTER COLUMN others_id SET DEFAULT nextval('public.others_other_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 'Barred Spiral', 13800, 30000.0000, 'The Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.5000, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 10000, 2.7000, 'The Triangulum Galaxy');
INSERT INTO public.galaxy VALUES (4, 'The Hat Galaxy', 'Spiral', 9000, 28.0000, 'The Hat Galaxy');
INSERT INTO public.galaxy VALUES (5, 'The Centaur Galaxy', 'Giant Elliptical', 13000, 11.0000, 'The Centaur Galaxy');
INSERT INTO public.galaxy VALUES (6, 'The Cigar Galaxy', 'Irregular', 12000, 12.0000, 'The Cigar Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, true, 384000.0000, 'Moon', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, false, 22.0000, 'Phobos', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, false, 12.0000, 'Deimos', 4);
INSERT INTO public.moon VALUES (4, 'Io', false, true, 304.0000, 'Io', 5);
INSERT INTO public.moon VALUES (5, 'Europe', false, true, 350.0000, 'Europe', 5);
INSERT INTO public.moon VALUES (6, 'Ganimedes', false, true, 450.0000, 'Ganimedes', 5);
INSERT INTO public.moon VALUES (7, 'Calisto', false, true, 500.0000, 'Calisto', 5);
INSERT INTO public.moon VALUES (8, 'Amaltea', false, false, 450.0000, 'Amaltea', 5);
INSERT INTO public.moon VALUES (9, 'Tebe', false, false, 450.0000, 'Tebe', 5);
INSERT INTO public.moon VALUES (10, 'Iocaste', false, true, 450.0000, 'Iocaste', 5);
INSERT INTO public.moon VALUES (11, 'Harpalyke', false, true, 450.0000, 'Harpalyke', 5);
INSERT INTO public.moon VALUES (12, 'Praxidike', false, false, 450.0000, 'Praxidike', 5);
INSERT INTO public.moon VALUES (13, 'Titan', false, true, 600.0000, 'Titan', 6);
INSERT INTO public.moon VALUES (14, 'Encelado', false, true, 700.0000, 'Encelado', 6);
INSERT INTO public.moon VALUES (15, 'Tetis', false, true, 700.0000, 'Tetis', 6);
INSERT INTO public.moon VALUES (16, 'Dione', false, true, 700.0000, 'Dione', 6);
INSERT INTO public.moon VALUES (17, 'Rea', false, true, 700.0000, 'Rea', 6);
INSERT INTO public.moon VALUES (18, 'Triton', false, true, 900.0000, 'Triton', 7);
INSERT INTO public.moon VALUES (19, 'Nereida', false, true, 900.0000, 'Nereida', 7);
INSERT INTO public.moon VALUES (20, 'Proteo', false, true, 900.0000, 'Proteo', 7);


--
-- Data for Name: others; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.others VALUES (1, 'others1', 1);
INSERT INTO public.others VALUES (2, 'others2', 2);
INSERT INTO public.others VALUES (3, 'others3', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Rock planet', false, true, 147.6000, 'Mercury', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Rock planet', false, true, 127.8900, 'Venus', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Rock planet', true, true, 0.0000, 'Earth', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Rock planet', false, true, 67.0000, 'Mars', 1);
INSERT INTO public.planet VALUES (5, 'Jupyter', 'Gas Giant', false, true, 128.0000, 'Jupyter', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, true, 250.0000, 'Saturn', 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice Giant', false, true, 400.0000, 'Neptune', 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice Giant', false, true, 650.0000, 'Uranus', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Small Rock', false, true, 800.0000, 'Pluto', 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Rock planet', false, true, 500.0000, 'Kepler-186f', 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Rock planet', false, true, 4.2000, 'Proxima Centauri b', 3);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 'Rock planet', false, true, 40.0000, 'Trappist-1e', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'G2V', 46000000, 149.6000, 'The Sun', 1);
INSERT INTO public.star VALUES (2, 'Mirach', 'Red Giant', 2400, 200.0000, 'Mirach', 2);
INSERT INTO public.star VALUES (3, 'RW Cephel', 'Red Hyper Giant', 11, 11420.0000, 'RW Cephel', 3);
INSERT INTO public.star VALUES (4, 'GY Andromedae', 'Variable Pulse', 300, 330.0000, 'GY Andromedae', 4);
INSERT INTO public.star VALUES (5, 'HD 10180g', 'Type A', 300, 16.0000, 'HD 10180g', 5);
INSERT INTO public.star VALUES (6, 'M31 4V1', 'Red Giant', 300, 11.0000, 'M31 4V1', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: others_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.others_other_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: others others_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.others
    ADD CONSTRAINT others_name_key UNIQUE (name);


--
-- Name: others others_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.others
    ADD CONSTRAINT others_pkey PRIMARY KEY (others_id);


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
-- Name: others others_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.others
    ADD CONSTRAINT others_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

