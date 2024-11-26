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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(20) NOT NULL,
    nationality character varying(20),
    age integer,
    visited_place text,
    planet_id integer,
    sex character varying(10),
    number_of_expeditions numeric,
    is_this_person_living boolean,
    does_this_person_have_children boolean,
    number_of_children integer
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass_in_solar_unit numeric NOT NULL,
    age_in_billion_of_years numeric(5,3),
    galaxy_type character varying(20),
    constellation character varying(20),
    is_a_satellite_galaxy boolean,
    has_satellite_galaxy boolean,
    number_of_satellite_galaxy integer,
    number_of_constellations integer
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
    orbit_in_days numeric(5,2),
    size_in_km integer,
    temperature numeric,
    planet_id integer,
    longer_orbit_than_the_moon boolean,
    bigger_than_the_moon boolean,
    orbit_in_aprox_hours integer
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
    planet_type character varying(20),
    age_in_billion_of_years numeric(3,2),
    temperature integer,
    star_id integer,
    is_in_the_solar_system boolean,
    older_than_earth boolean,
    number_of_moons integer,
    possibility_of_life text
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
    mass_in_solar_unit numeric(6,3) NOT NULL,
    age_in_billion_of_years numeric(5,4),
    temperature_celsius integer,
    galaxy_id integer,
    is_heavier_than_sun_mass boolean,
    is_brighter_than_the_sun boolean,
    magnitude_luminosity_unit integer
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
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


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
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Neil Armstrong', 'American', 82, 'Moon', 1, 'Male', 2, false, true, 3);
INSERT INTO public.astronaut VALUES (2, 'Valentina Tereshkova', 'Russian', 86, 'Low Earth Orbit', 1, 'Female', 1, true, true, 1);
INSERT INTO public.astronaut VALUES (3, 'Buzz Aldrin', 'American', 94, 'Moon', 1, 'Male', 2, true, true, 3);
INSERT INTO public.astronaut VALUES (4, 'Chris Hadfield', 'Canadian', 65, 'International Space Station', 1, 'Male', 3, true, true, 3);
INSERT INTO public.astronaut VALUES (5, 'Sally Ride', 'American', 61, 'Low Earth Orbit', 1, 'Female', 2, false, false, 0);
INSERT INTO public.astronaut VALUES (6, 'Yang Liwei', 'Chinese', 59, 'Low Earth Orbit', 1, 'Male', 1, true, true, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 1150000000000, 13.600, 'Barred Spiral Galaxy', NULL, false, true, 59, 88);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 150000000000, 1.101, 'Irregular', 'Dorado', true, true, 1, 1);
INSERT INTO public.galaxy VALUES (3, 'Black Eye (Messier 64)', 8400000, 13.280, 'Spiral', 'Coma Berenices', false, false, 0, 1);
INSERT INTO public.galaxy VALUES (4, 'Sombrero (Messier 104)', 800000000000, 13.800, 'Lenticular', 'Virgo', false, false, 0, 1);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool (Messier 51)', 160000000000, 0.400, 'Spiral', 'Canes Venatici', false, true, 1, 1);
INSERT INTO public.galaxy VALUES (6, 'Andromeda (Messier 31)', 1500000000000, 10.000, 'Spiral', 'Andromeda', false, true, 57, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 3.50, 3, -160, 2, false, false, 84);
INSERT INTO public.moon VALUES (2, 'Titan', 16.00, 2575, 180, 3, false, false, 384);
INSERT INTO public.moon VALUES (3, 'The Moon', 27.00, 3476, 121, 1, NULL, NULL, 648);
INSERT INTO public.moon VALUES (4, 'Triton', 5.90, 1680, -235, 4, false, false, 142);
INSERT INTO public.moon VALUES (5, 'Phobos', 0.33, 22, -4, 5, false, false, 8);
INSERT INTO public.moon VALUES (6, 'Io', 1.77, 3643, -143, 2, false, true, 42);
INSERT INTO public.moon VALUES (7, 'Ganymede', 7.15, 5268, -160, 2, false, true, 172);
INSERT INTO public.moon VALUES (8, 'Callisto', 16.69, 4821, -139, 2, false, true, 401);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1.37, 504, -201, 3, false, false, 33);
INSERT INTO public.moon VALUES (10, 'Rhea', 4.52, 1527, -174, 3, false, false, 108);
INSERT INTO public.moon VALUES (11, 'Deimos', 1.26, 12, -40, 5, false, false, 30);
INSERT INTO public.moon VALUES (12, 'Oberon', 13.46, 1523, -200, 12, false, false, 323);
INSERT INTO public.moon VALUES (13, 'Titania', 8.71, 1577, -203, 12, false, false, 209);
INSERT INTO public.moon VALUES (14, 'Miranda', 1.41, 471, -187, 12, false, false, 34);
INSERT INTO public.moon VALUES (15, 'Charon', 6.39, 1212, -220, 13, false, false, 153);
INSERT INTO public.moon VALUES (16, 'Mimas', 0.94, 396, -198, 3, false, false, 23);
INSERT INTO public.moon VALUES (17, 'Iapetus', 79.33, 1470, -143, 3, true, false, 1904);
INSERT INTO public.moon VALUES (18, 'Hyperion', 21.28, 270, -180, 3, false, false, 511);
INSERT INTO public.moon VALUES (19, 'Nereid', 360.14, 340, -235, 4, true, false, 8643);
INSERT INTO public.moon VALUES (20, 'Himalia', 250.56, 170, -160, 2, true, false, 6013);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'terrestrial', 4.50, 15, 1, true, NULL, 1, 'Yes, our planet is full of life');
INSERT INTO public.planet VALUES (2, 'Jupiter', 'gas', 4.60, -110, 1, true, true, 95, 'No. There is no possibility to have life here.');
INSERT INTO public.planet VALUES (3, 'Saturn', 'gas', 4.50, -178, 1, true, false, 145, 'No. There is no possibility to have life here.');
INSERT INTO public.planet VALUES (4, 'Neptune', 'ice', 4.50, -201, 1, true, false, 14, 'No. There is no possibility to have life here.');
INSERT INTO public.planet VALUES (5, 'Mars', 'terrestrial', 4.60, -65, 1, true, true, 2, 'There is no life here but scientifics says that is not impossible. Maybe, in the future, we can live here.');
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 'terrestrial', 4.85, -39, 7, false, true, 0, 'Yes, there is possibilities to have life here. This planet have similar characteristics as the Earth.');
INSERT INTO public.planet VALUES (7, 'LHS 1140 b', 'super-earth', 5.00, -43, 8, false, true, 0, 'Yes, there is possibilities to have life here. This planet have similar characteristics as the Earth.');
INSERT INTO public.planet VALUES (8, 'Trappist-1 e', 'terrestrial', 7.60, -22, 9, false, true, 0, 'Yes, there is possibilities to have life here. This planet have similar characteristics as the Earth.');
INSERT INTO public.planet VALUES (9, 'Keppler-452 b', 'super-earth', 6.00, -8, 10, false, true, 0, 'Yes, there is possibilities to have life here. This planet have similar characteristics as the Earth.');
INSERT INTO public.planet VALUES (10, 'Mercury', 'terrestrial', 4.60, 427, 1, true, true, 0, 'No. It is the nearest planet to the sun.');
INSERT INTO public.planet VALUES (11, 'Venus', 'terrestrial', 4.60, 464, 1, true, true, 0, 'No. It is the second planet near to the sun but is hotter than Mercury.');
INSERT INTO public.planet VALUES (12, 'Uranus', 'ice', 4.60, -197, 1, true, true, 27, 'No. There is no possibility to have life here.');
INSERT INTO public.planet VALUES (13, 'Pluto', 'Dwarf', 4.60, -229, 1, true, true, 5, 'No. It is the farest planet to the sun.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.000, 4.6000, 5500, 1, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 16.500, 0.0100, 3000, 1, true, true, 126000);
INSERT INTO public.star VALUES (3, 'Sirius', 3.100, 0.2300, 9400, 1, true, true, 25);
INSERT INTO public.star VALUES (4, 'Polaris', 3.500, 2.0000, 6925, 1, true, true, 2500);
INSERT INTO public.star VALUES (5, 'R136a1', 265.000, 0.0015, 46000, 2, true, true, 8700000);
INSERT INTO public.star VALUES (6, 'Vega', 2.100, 0.4550, 9600, 1, true, true, 40);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 0.120, 4.8500, 3000, 1, false, false, 0);
INSERT INTO public.star VALUES (8, 'LHS 1140', 0.230, 5.0000, 3300, 1, false, false, 0);
INSERT INTO public.star VALUES (9, 'Trappist-1', 0.089, 7.0000, 2550, 1, false, false, 0);
INSERT INTO public.star VALUES (10, 'Keppler-452', 1.030, 6.0000, 5300, 1, true, true, 4);


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: astronaut astronaut_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_which_orbits_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_which_orbits_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_nearest_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_nearest_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_belonging_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_belonging_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
