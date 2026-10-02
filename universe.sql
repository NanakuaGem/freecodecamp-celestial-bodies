--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    galaxy_type character varying(30),
    diameter_light_years integer,
    has_active_nucleus boolean,
    star_count_billions numeric(5,1)
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
    is_spherical boolean,
    galaxy_id integer,
    planet_id integer
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
    name character varying(30) NOT NULL,
    planet_type text,
    has_water boolean,
    number_of_moons integer,
    orbital_period_days numeric(7,2),
    star_id integer,
    galaxy_id integer
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
    name character varying(30),
    age_in_billions numeric(4,2),
    mass_sol_masses numeric(6,2),
    has_planetary_system boolean DEFAULT true,
    discovery_year integer,
    spectral_class character(1) DEFAULT 'G'::bpchar NOT NULL,
    galaxy_id integer,
    star_type_id integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_type_id_seq OWNED BY public.star_type.star_type_id;


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_types_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 'Spiral', 76000, true, 100.0);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Barred Spiral', 220000, false, 1000.0);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 14000, false, 30.0);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 100000, false, 400.0);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 7000, false, 3.0);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 170000, false, 1000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', true, 1, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 1, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 1, 4);
INSERT INTO public.moon VALUES (4, 'Io', true, 1, 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, 1, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 1, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 1, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 1, 5);
INSERT INTO public.moon VALUES (9, 'Titan', true, 1, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', true, 1, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', true, 1, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', true, 1, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', true, 1, 6);
INSERT INTO public.moon VALUES (14, 'Dione', true, 1, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', true, 1, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', true, 1, 7);
INSERT INTO public.moon VALUES (17, 'Titania', true, 1, 7);
INSERT INTO public.moon VALUES (18, 'Triton', true, 1, 8);
INSERT INTO public.moon VALUES (19, 'CD-35 2722 b-1', true, 2, 10);
INSERT INTO public.moon VALUES (20, 'Kepler-1625b I', true, 1, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'Gas Giant', true, 0, 290.00, 11, 1);
INSERT INTO public.planet VALUES (10, 'M51-ULS-1b', 'Gas Giant', false, 0, 25550.00, 2, 2);
INSERT INTO public.planet VALUES (11, 'PA-99-N2 b', 'Gas Giant', false, 0, NULL, 3, 3);
INSERT INTO public.planet VALUES (12, 'HH 1177 Proto-Planet Candidate', 'Rocky', false, 0, NULL, 6, 4);
INSERT INTO public.planet VALUES (13, 'SMC X-1 Exoplanet Candidate', 'Gas Giant', false, 0, 5.50, 7, 5);
INSERT INTO public.planet VALUES (14, 'M101 Exoplanet Candidate', 'Gas Giant', false, 0, NULL, 8, 6);
INSERT INTO public.planet VALUES (1, 'Mercury', 'Rocky', false, 0, 87.97, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Rocky', false, 0, 224.70, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Rocky', true, 1, 365.25, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Rocky', false, 2, 686.98, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 95, 4332.59, 1, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 146, 10759.22, 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 28, 30688.50, 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 16, 60182.00, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 4.60, 1.00, true, NULL, 'G', 1, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4.85, 0.12, true, 1915, 'M', 1, 3);
INSERT INTO public.star VALUES (5, 'Sirius', 0.24, 2.06, false, NULL, 'A', 1, 3);
INSERT INTO public.star VALUES (9, 'TRAPPIST-1', 7.60, 0.09, true, 1999, 'M', 1, 3);
INSERT INTO public.star VALUES (11, 'Kepler-22', 4.00, 0.97, true, 2011, 'G', 1, 3);
INSERT INTO public.star VALUES (2, 'M51-ULS-1', 0.02, 20.00, true, 2020, 'O', 2, 5);
INSERT INTO public.star VALUES (7, 'SMC X-1', 0.02, 17.00, true, 1971, 'B', 5, 5);
INSERT INTO public.star VALUES (8, 'M101-ULX-1', 0.01, 19.00, true, 2004, 'O', 6, 5);
INSERT INTO public.star VALUES (10, 'Betelgeuse', 0.01, 16.50, false, NULL, 'M', 1, 5);
INSERT INTO public.star VALUES (6, 'HH 1177', 0.00, 12.00, true, 2023, 'B', 4, 1);
INSERT INTO public.star VALUES (3, 'PA-99-N2', 8.00, 0.60, true, 1999, 'K', 3, 3);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Protostar', 'An early-stage star still gathering mass from a cloud of cosmic gas and dust.');
INSERT INTO public.star_type VALUES (2, 'Brown Dwarf', 'A failed star that never grew massive enough to ignite nuclear fusion in its core.');
INSERT INTO public.star_type VALUES (3, 'Main Sequence', 'A stable adult star continuously fusing hydrogen atoms in its core to create helium');
INSERT INTO public.star_type VALUES (4, 'Red Giant', 'An elderly, medium-sized star that has run out of core fuel and expanded hundreds of times its size');
INSERT INTO public.star_type VALUES (5, 'Supergiant', 'An extremely massive, aging star near the end of its life cycle that has swelled up dramatically');
INSERT INTO public.star_type VALUES (6, 'White Dwarf', 'The glowing, hyper-dense dead core left behind when a medium star sheds its outer layers');
INSERT INTO public.star_type VALUES (7, 'Neutron Star', 'The hyper-dense, city-sized remnant left behind when a massive star collapses in a violent supernova');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_type_id_seq', 7, true);


--
-- Name: galaxy galaxy_names_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_names_key UNIQUE (name);


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
-- Name: star star_names_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_names_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_name_key UNIQUE (name);


--
-- Name: star_type star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_type_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

