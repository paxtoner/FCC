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
    name character varying(255) NOT NULL,
    radius integer NOT NULL,
    num_stars integer NOT NULL,
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
    planet_id integer,
    radius numeric,
    is_habitable boolean NOT NULL,
    CONSTRAINT moon_radius_check CHECK (((radius >= (1)::numeric) AND (radius <= (100)::numeric)))
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
    star_id integer,
    radius numeric,
    is_habitable boolean NOT NULL,
    num_moons integer,
    CONSTRAINT planet_num_moons_check CHECK (((num_moons >= 0) AND (num_moons <= 2000))),
    CONSTRAINT planet_radius_check CHECK (((radius >= (1)::numeric) AND (radius <= (5000)::numeric)))
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    weight numeric,
    is_operational boolean NOT NULL,
    launch_date date,
    CONSTRAINT satellite_weight_check CHECK (((weight >= (1)::numeric) AND (weight <= (1000)::numeric)))
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    radius numeric,
    num_planets integer,
    description text,
    CONSTRAINT star_num_planets_check CHECK (((num_planets >= 0) AND (num_planets <= 100))),
    CONSTRAINT star_radius_check CHECK (((radius >= (1)::numeric) AND (radius <= (1000)::numeric)))
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, 250, 'Spiral galaxy with billions of stars');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 900, 500, 'Largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 600, 300, 'A member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 800, 200, 'Located in the Ursa Major constellation');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 500, 150, 'Bright nucleus galaxy');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 700, 250, 'Interacting grand-design spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 1, 17, false);
INSERT INTO public.moon VALUES (22, 'Phobos', 2, 11, false);
INSERT INTO public.moon VALUES (23, 'Deimos', 2, 6, false);
INSERT INTO public.moon VALUES (24, 'Io', 3, 18, false);
INSERT INTO public.moon VALUES (25, 'Europa', 3, 16, true);
INSERT INTO public.moon VALUES (26, 'Ganymede', 3, 26, false);
INSERT INTO public.moon VALUES (27, 'Callisto', 3, 24, false);
INSERT INTO public.moon VALUES (28, 'Titan', 4, 26, false);
INSERT INTO public.moon VALUES (29, 'Enceladus', 4, 10, true);
INSERT INTO public.moon VALUES (30, 'Rhea', 4, 15, false);
INSERT INTO public.moon VALUES (31, 'Iapetus', 4, 14, false);
INSERT INTO public.moon VALUES (32, 'Dione', 4, 11, false);
INSERT INTO public.moon VALUES (33, 'Tethys', 4, 10, false);
INSERT INTO public.moon VALUES (34, 'Miranda', 5, 5, false);
INSERT INTO public.moon VALUES (35, 'Ariel', 5, 10, true);
INSERT INTO public.moon VALUES (36, 'Umbriel', 5, 11, false);
INSERT INTO public.moon VALUES (37, 'Titania', 5, 12, false);
INSERT INTO public.moon VALUES (38, 'Oberon', 5, 13, false);
INSERT INTO public.moon VALUES (39, 'Mimas', 4, 4, false);
INSERT INTO public.moon VALUES (40, 'Lund', 1, 17, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 637, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 339, false, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 699, false, 79);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 582, false, 82);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, 246, false, 14);
INSERT INTO public.planet VALUES (6, 'Proxima b', 6, 715, false, 0);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, 127, true, 0);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 2, 70, true, 0);
INSERT INTO public.planet VALUES (9, 'HD 40307g', 3, 90, true, 0);
INSERT INTO public.planet VALUES (10, 'Tau Ceti e', 4, 58, true, 0);
INSERT INTO public.planet VALUES (11, 'Luyten b', 4, 70, false, 0);
INSERT INTO public.planet VALUES (12, 'Ross 128 b', 4, 68, true, 0);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (3, 'Hubble Space Telescope', 1, 80, true, '1990-04-24');
INSERT INTO public.satellite VALUES (4, 'International Space Station', 1, 90, true, '1998-11-20');
INSERT INTO public.satellite VALUES (5, 'Lunar Gateway', 1, 70, false, '2024-01-01');
INSERT INTO public.satellite VALUES (6, 'James Webb Space Telescope', 1, 85, true, '2021-12-25');
INSERT INTO public.satellite VALUES (7, 'GOES-16', 1, 60, true, '2016-11-19');
INSERT INTO public.satellite VALUES (8, 'Pioneer 10', 3, 50, false, '1972-03-02');
INSERT INTO public.satellite VALUES (9, 'Voyager 1', 3, 55, false, '1977-09-05');
INSERT INTO public.satellite VALUES (10, 'Pioneer 11', 3, 45, false, '1973-04-06');
INSERT INTO public.satellite VALUES (11, 'New Horizons', 3, 65, true, '2006-01-19');
INSERT INTO public.satellite VALUES (12, 'Mars Reconnaissance Orbiter', 2, 75, true, '2006-03-10');
INSERT INTO public.satellite VALUES (13, 'Mars Science Laboratory', 2, 60, true, '2011-08-06');
INSERT INTO public.satellite VALUES (14, 'Sentinel-2A', 1, 55, true, '2015-06-23');
INSERT INTO public.satellite VALUES (15, 'GOES-R', 1, 70, true, '2016-11-19');
INSERT INTO public.satellite VALUES (16, 'LRO', 2, 40, true, '2009-06-18');
INSERT INTO public.satellite VALUES (17, 'Osiris-Rex', 3, 85, true, '2016-09-08');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 8, 'The star at the center of our solar system');
INSERT INTO public.star VALUES (2, 'Sirius', 2, 2, 0, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 3, 3, 0, 'Red supergiant star nearing the end of its life');
INSERT INTO public.star VALUES (4, 'Rigel', 4, 4, 0, 'Blue supergiant');
INSERT INTO public.star VALUES (5, 'Vega', 1, 5, 0, 'One of the brightest stars visible from Earth');
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 1, 6, 1, 'Closest star system to the Solar System');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 17, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

