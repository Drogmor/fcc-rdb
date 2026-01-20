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
    name character varying(60) NOT NULL,
    description text,
    age numeric(4,1),
    galaxy_type character varying(30)
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
    name character varying(60) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    is_spherical boolean
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    is_star_nursery boolean,
    nebula_type character varying(50)
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    description text,
    planet_type character varying(50),
    composition text,
    name character varying(60) NOT NULL,
    has_moon boolean,
    star_id integer NOT NULL,
    number_of_moons integer,
    gravity numeric
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
    composition text,
    mass numeric(4,1),
    color character varying(20),
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth integer
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Aetheria', 'A swirling spiral of ancient blue stars and nebula clouds.', 13.8, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Obsidian Reach', 'A dark, dense elliptical galaxy rich in heavy metals.', 10.5, 'Elliptical');
INSERT INTO public.galaxy VALUES (3, 'The Chronos Void', 'A young, chaotic irregular galaxy where time seems to dilate.', 2.4, 'Irregular');
INSERT INTO public.galaxy VALUES (4, 'The Shattered Veil', 'A fragmented galaxy following a massive cosmic collision.', 8.2, 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Centauri Prime', 'A densely packed spiral galaxy with high luminosity.', 11.1, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Void-9', 'A lonely, dying galaxy on the edge of the observable universe.', 14.2, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Silversheen', 'A highly reflective moon that lights up the Veridian night.', 1, NULL);
INSERT INTO public.moon VALUES (2, 'Dust-Ball', 'A small, barren rock caught in Veridias gravity.', 1, NULL);
INSERT INTO public.moon VALUES (3, 'Glimmer-Ring', 'A moon that is slowly breaking apart into a planetary ring.', 3, NULL);
INSERT INTO public.moon VALUES (4, 'Tide-Bringer', 'A massive water-ice moon causing huge tides on Aqualis.', 5, NULL);
INSERT INTO public.moon VALUES (5, 'Deep-Cora', 'A moon with subterranean caves housing bioluminescent life.', 5, NULL);
INSERT INTO public.moon VALUES (6, 'Shard-9', 'An irregular fragment of a destroyed planet.', 5, NULL);
INSERT INTO public.moon VALUES (7, 'Aeolus', 'A small moon with extremely high wind speeds.', 7, NULL);
INSERT INTO public.moon VALUES (8, 'Boreas', 'A frozen rock orbiting the North pole of the planet.', 7, NULL);
INSERT INTO public.moon VALUES (9, 'Notus', 'A moon with a trail of gas following its orbit.', 7, NULL);
INSERT INTO public.moon VALUES (10, 'Eurus', 'The smallest and fastest moon of Zephyrus.', 7, NULL);
INSERT INTO public.moon VALUES (11, 'Ligeia', 'Features a large sea of liquid hydrocarbons.', 9, NULL);
INSERT INTO public.moon VALUES (12, 'Punga', 'A cratered moon with low surface gravity.', 9, NULL);
INSERT INTO public.moon VALUES (13, 'Arrakis-Minor', 'A moon that reflects a deep orange light.', 10, NULL);
INSERT INTO public.moon VALUES (14, 'Atlas', 'A massive moon nearly the size of Mars.', 12, NULL);
INSERT INTO public.moon VALUES (15, 'Kratos', 'Orbits so close it is being stretched by gravity.', 12, NULL);
INSERT INTO public.moon VALUES (16, 'Bia', 'A dark moon that is hard to see without infrared.', 12, NULL);
INSERT INTO public.moon VALUES (17, 'Nike', 'Has a very bright, reflective icy surface.', 12, NULL);
INSERT INTO public.moon VALUES (18, 'Zelos', 'A moon with active sulfur volcanoes.', 12, NULL);
INSERT INTO public.moon VALUES (19, 'Typhon', 'A moon with a chaotic, non-circular orbit.', 12, NULL);
INSERT INTO public.moon VALUES (20, 'Echidna', 'The furthest moon in the Goliath system.', 12, NULL);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'The Azure Cradle', 1, true, 'Emission');
INSERT INTO public.nebula VALUES (2, 'Cobalt Ghost', 1, false, 'Planetary');
INSERT INTO public.nebula VALUES (3, 'Iron Veil', 2, false, 'Supernova Remnant');
INSERT INTO public.nebula VALUES (4, 'Obsidian Forge', 2, true, 'Dark Nebula');
INSERT INTO public.nebula VALUES (5, 'Chronos Spark', 3, true, 'Diffuse');
INSERT INTO public.nebula VALUES (6, 'The Shattered Cloud', 4, false, 'Reflection');
INSERT INTO public.nebula VALUES (7, 'Centauri Bloom', 5, true, 'Emission');
INSERT INTO public.nebula VALUES (8, 'The Last Breath', 6, false, 'Planetary');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'A lush, green world with twin suns.', 'Terrestrial', 'Silicate Rock', 'Veridia', true, 1, 2, NULL);
INSERT INTO public.planet VALUES (2, 'A frozen wasteland of nitrogen ice.', 'Ice Giant', 'Nitrogen/Methane', 'Cryos', false, 1, 0, NULL);
INSERT INTO public.planet VALUES (3, 'A gas giant with rings made of diamond dust.', 'Gas Giant', 'Hydrogen/Carbon', 'Aurelius', true, 2, 1, NULL);
INSERT INTO public.planet VALUES (4, 'A volcanic world with rivers of molten gold.', 'Volcanic', 'Basalt/Gold', 'Midas-4', false, 3, 0, NULL);
INSERT INTO public.planet VALUES (5, 'A floating ocean world with no landmass.', 'Oceanic', 'H2O/Ammonia', 'Aqualis', true, 4, 3, NULL);
INSERT INTO public.planet VALUES (6, 'A hollowed-out planetoid used as a station.', 'Artificial', 'Titanium Alloy', 'Nexus-Prime', false, 6, 0, NULL);
INSERT INTO public.planet VALUES (7, 'A windy gas giant with purple storms.', 'Gas Giant', 'Helium/Neon', 'Zephyrus', true, 1, 4, NULL);
INSERT INTO public.planet VALUES (8, 'A rocky world covered in obsidian glass.', 'Terrestrial', 'Silica/Iron', 'Obsidia', false, 2, 0, NULL);
INSERT INTO public.planet VALUES (9, 'A planet where it rains liquid methane.', 'Cryo-world', 'Methane/Ethane', 'Titan-B', true, 4, 2, NULL);
INSERT INTO public.planet VALUES (10, 'A desert planet with massive sand dunes.', 'Terrestrial', 'Sand/Silicate', 'Dune-7', true, 5, 1, NULL);
INSERT INTO public.planet VALUES (11, 'An experimental colony on a small asteroid.', 'Asteroid', 'Iron/Nickel', 'Outpost-X', false, 5, 0, NULL);
INSERT INTO public.planet VALUES (12, 'A giant world with 10x Earth gravity.', 'Super-Earth', 'Heavy Metals', 'Goliath', true, 6, 7, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Hydrogen-Helium', 1.2, 'Yellow', 'Solara-Prime', 1, 4);
INSERT INTO public.star VALUES (2, 'Helium-Iron', 4.5, 'Blue', 'Rigel-X', 1, 850);
INSERT INTO public.star VALUES (3, 'Carbon-Oxygen', 0.8, 'White', 'Nova-Z', 2, 1200);
INSERT INTO public.star VALUES (4, 'Pure Plasma', 15.0, 'Violet', 'Hyperion', 2, 4500);
INSERT INTO public.star VALUES (5, 'Metallic Hydrogen', 0.5, 'Red', 'Ember-Core', 3, 150);
INSERT INTO public.star VALUES (6, 'Neutron Matter', 2.1, 'Cyan', 'Pulse-7', 3, 9000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

