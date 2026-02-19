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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL,
    secret_number integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 3, 765);
INSERT INTO public.games VALUES (2, 1, 8, 110);
INSERT INTO public.games VALUES (3, 1, 2, 43);
INSERT INTO public.games VALUES (4, 2, 6, 250);
INSERT INTO public.games VALUES (5, 18, 11, 528);
INSERT INTO public.games VALUES (6, 83, 289, 289);
INSERT INTO public.games VALUES (7, 84, 442, 442);
INSERT INTO public.games VALUES (8, 83, 779, 777);
INSERT INTO public.games VALUES (9, 83, 241, 241);
INSERT INTO public.games VALUES (10, 83, 616, 616);
INSERT INTO public.games VALUES (11, 85, 804, 804);
INSERT INTO public.games VALUES (12, 86, 950, 950);
INSERT INTO public.games VALUES (13, 85, 535, 533);
INSERT INTO public.games VALUES (14, 85, 526, 526);
INSERT INTO public.games VALUES (15, 85, 410, 410);
INSERT INTO public.games VALUES (16, 87, 384, 384);
INSERT INTO public.games VALUES (17, 88, 378, 378);
INSERT INTO public.games VALUES (18, 87, 578, 576);
INSERT INTO public.games VALUES (19, 87, 162, 162);
INSERT INTO public.games VALUES (20, 87, 867, 867);
INSERT INTO public.games VALUES (21, 89, 696, 696);
INSERT INTO public.games VALUES (22, 90, 71, 71);
INSERT INTO public.games VALUES (23, 89, 878, 876);
INSERT INTO public.games VALUES (24, 89, 965, 965);
INSERT INTO public.games VALUES (25, 89, 649, 649);
INSERT INTO public.games VALUES (26, 91, 404, 404);
INSERT INTO public.games VALUES (27, 92, 393, 393);
INSERT INTO public.games VALUES (28, 91, 652, 650);
INSERT INTO public.games VALUES (29, 91, 140, 140);
INSERT INTO public.games VALUES (30, 91, 594, 594);
INSERT INTO public.games VALUES (31, 93, 736, 736);
INSERT INTO public.games VALUES (32, 94, 259, 259);
INSERT INTO public.games VALUES (33, 93, 407, 405);
INSERT INTO public.games VALUES (34, 93, 33, 33);
INSERT INTO public.games VALUES (35, 93, 65, 65);
INSERT INTO public.games VALUES (36, 95, 229, 229);
INSERT INTO public.games VALUES (37, 96, 111, 111);
INSERT INTO public.games VALUES (38, 95, 491, 489);
INSERT INTO public.games VALUES (39, 95, 62, 62);
INSERT INTO public.games VALUES (40, 95, 472, 472);
INSERT INTO public.games VALUES (41, 97, 434, 434);
INSERT INTO public.games VALUES (42, 98, 78, 78);
INSERT INTO public.games VALUES (43, 97, 22, 20);
INSERT INTO public.games VALUES (44, 97, 266, 266);
INSERT INTO public.games VALUES (45, 97, 469, 469);
INSERT INTO public.games VALUES (46, 99, 296, 296);
INSERT INTO public.games VALUES (47, 100, 179, 179);
INSERT INTO public.games VALUES (48, 99, 976, 974);
INSERT INTO public.games VALUES (49, 99, 862, 862);
INSERT INTO public.games VALUES (50, 99, 446, 446);
INSERT INTO public.games VALUES (51, 1, 11, 190);
INSERT INTO public.games VALUES (52, 1, 10, 748);
INSERT INTO public.games VALUES (53, 101, 502, 502);
INSERT INTO public.games VALUES (54, 101, 235, 235);
INSERT INTO public.games VALUES (55, 102, 267, 267);
INSERT INTO public.games VALUES (56, 102, 516, 516);
INSERT INTO public.games VALUES (57, 101, 622, 620);
INSERT INTO public.games VALUES (58, 101, 222, 222);
INSERT INTO public.games VALUES (59, 103, 887, 887);
INSERT INTO public.games VALUES (60, 103, 700, 700);
INSERT INTO public.games VALUES (61, 104, 943, 943);
INSERT INTO public.games VALUES (62, 104, 476, 476);
INSERT INTO public.games VALUES (63, 103, 251, 249);
INSERT INTO public.games VALUES (64, 103, 388, 388);
INSERT INTO public.games VALUES (65, 103, 856, 856);
INSERT INTO public.games VALUES (66, 105, 103, 103);
INSERT INTO public.games VALUES (67, 105, 546, 546);
INSERT INTO public.games VALUES (68, 106, 554, 554);
INSERT INTO public.games VALUES (69, 106, 422, 422);
INSERT INTO public.games VALUES (70, 105, 908, 906);
INSERT INTO public.games VALUES (71, 105, 173, 173);
INSERT INTO public.games VALUES (72, 105, 275, 275);
INSERT INTO public.games VALUES (73, 107, 841, 840);
INSERT INTO public.games VALUES (74, 107, 178, 177);
INSERT INTO public.games VALUES (75, 108, 853, 852);
INSERT INTO public.games VALUES (76, 108, 145, 144);
INSERT INTO public.games VALUES (77, 107, 589, 586);
INSERT INTO public.games VALUES (78, 107, 667, 666);
INSERT INTO public.games VALUES (79, 107, 917, 916);
INSERT INTO public.games VALUES (80, 109, 867, 866);
INSERT INTO public.games VALUES (81, 109, 611, 610);
INSERT INTO public.games VALUES (82, 110, 43, 42);
INSERT INTO public.games VALUES (83, 110, 666, 665);
INSERT INTO public.games VALUES (84, 109, 171, 168);
INSERT INTO public.games VALUES (85, 109, 214, 213);
INSERT INTO public.games VALUES (86, 109, 502, 501);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'fkd');
INSERT INTO public.users VALUES (2, 'test');
INSERT INTO public.users VALUES (3, 'user_1770904014635');
INSERT INTO public.users VALUES (4, 'user_1770904014634');
INSERT INTO public.users VALUES (5, 'user_1770904178342');
INSERT INTO public.users VALUES (6, 'user_1770904178341');
INSERT INTO public.users VALUES (7, 'user_1770904542641');
INSERT INTO public.users VALUES (8, 'user_1770904542640');
INSERT INTO public.users VALUES (9, 'test2');
INSERT INTO public.users VALUES (10, 'user_1770904587210');
INSERT INTO public.users VALUES (11, 'user_1770904587209');
INSERT INTO public.users VALUES (12, 'user_1770907185295');
INSERT INTO public.users VALUES (13, 'user_1770907185294');
INSERT INTO public.users VALUES (14, 'user_1770907249442');
INSERT INTO public.users VALUES (15, 'user_1770907249441');
INSERT INTO public.users VALUES (16, 'user_1770907297861');
INSERT INTO public.users VALUES (17, 'user_1770907297860');
INSERT INTO public.users VALUES (18, 'FKD');
INSERT INTO public.users VALUES (19, 'user_1770907387807');
INSERT INTO public.users VALUES (20, 'user_1770907387806');
INSERT INTO public.users VALUES (21, 'user_1771338724786');
INSERT INTO public.users VALUES (22, 'user_1771338724785');
INSERT INTO public.users VALUES (23, 'user_1771338724785');
INSERT INTO public.users VALUES (24, 'user_1771340087747');
INSERT INTO public.users VALUES (25, 'user_1771340087746');
INSERT INTO public.users VALUES (26, 'user_1771340144432');
INSERT INTO public.users VALUES (27, 'user_1771340144431');
INSERT INTO public.users VALUES (28, 'user_1771411615772');
INSERT INTO public.users VALUES (29, 'user_1771411615771');
INSERT INTO public.users VALUES (30, 'user_1771423749093');
INSERT INTO public.users VALUES (31, 'user_1771423749092');
INSERT INTO public.users VALUES (32, 'user_1771423894562');
INSERT INTO public.users VALUES (33, 'user_1771423894561');
INSERT INTO public.users VALUES (34, 'user_1771423987360');
INSERT INTO public.users VALUES (35, 'user_1771423987359');
INSERT INTO public.users VALUES (36, 'user_1771424073398');
INSERT INTO public.users VALUES (37, 'user_1771424073397');
INSERT INTO public.users VALUES (38, 'user_1771424156858');
INSERT INTO public.users VALUES (39, 'user_1771424156857');
INSERT INTO public.users VALUES (40, 'user_1771424946898');
INSERT INTO public.users VALUES (41, 'user_1771424946897');
INSERT INTO public.users VALUES (42, 'user_1771424991860');
INSERT INTO public.users VALUES (43, 'user_1771424991859');
INSERT INTO public.users VALUES (44, 'user_1771425003755');
INSERT INTO public.users VALUES (45, 'user_1771425003754');
INSERT INTO public.users VALUES (46, 'user_1771425014107');
INSERT INTO public.users VALUES (47, 'user_1771425014106');
INSERT INTO public.users VALUES (48, 'user_1771425066197');
INSERT INTO public.users VALUES (49, 'user_1771425066196');
INSERT INTO public.users VALUES (50, 'user_1771425085576');
INSERT INTO public.users VALUES (51, 'user_1771425085575');
INSERT INTO public.users VALUES (52, 'user_1771425101974');
INSERT INTO public.users VALUES (53, 'user_1771425101973');
INSERT INTO public.users VALUES (54, 'user_1771425144609');
INSERT INTO public.users VALUES (55, 'user_1771425144608');
INSERT INTO public.users VALUES (56, 'user_1771425191856');
INSERT INTO public.users VALUES (57, 'user_1771425191855');
INSERT INTO public.users VALUES (58, 'user_1771425227182');
INSERT INTO public.users VALUES (59, 'user_1771425227181');
INSERT INTO public.users VALUES (60, 'user_1771425568784');
INSERT INTO public.users VALUES (61, 'user_1771425568783');
INSERT INTO public.users VALUES (62, 'user_1771425588357');
INSERT INTO public.users VALUES (63, 'user_1771425588356');
INSERT INTO public.users VALUES (64, 'user_1771425623623');
INSERT INTO public.users VALUES (65, 'user_1771425623622');
INSERT INTO public.users VALUES (66, 'user_1771425650420');
INSERT INTO public.users VALUES (67, 'user_1771425650419');
INSERT INTO public.users VALUES (68, 'user_1771425801123');
INSERT INTO public.users VALUES (69, 'user_1771425801122');
INSERT INTO public.users VALUES (70, 'user_1771425962249');
INSERT INTO public.users VALUES (71, 'user_1771425962248');
INSERT INTO public.users VALUES (72, 'user_1771426386024');
INSERT INTO public.users VALUES (73, 'user_1771426386023');
INSERT INTO public.users VALUES (74, 'user_1771426410358');
INSERT INTO public.users VALUES (75, 'user_1771426410357');
INSERT INTO public.users VALUES (76, 'user_1771426453457');
INSERT INTO public.users VALUES (77, 'user_1771426453456');
INSERT INTO public.users VALUES (78, 'user_1771426530045');
INSERT INTO public.users VALUES (79, 'user_1771426530044');
INSERT INTO public.users VALUES (80, 'user_1771426713982');
INSERT INTO public.users VALUES (81, 'user_1771426713981');
INSERT INTO public.users VALUES (82, 'KFD');
INSERT INTO public.users VALUES (83, 'user_1771426875781');
INSERT INTO public.users VALUES (84, 'user_1771426875780');
INSERT INTO public.users VALUES (85, 'user_1771426970771');
INSERT INTO public.users VALUES (86, 'user_1771426970770');
INSERT INTO public.users VALUES (87, 'user_1771491890200');
INSERT INTO public.users VALUES (88, 'user_1771491890199');
INSERT INTO public.users VALUES (89, 'user_1771491920171');
INSERT INTO public.users VALUES (90, 'user_1771491920170');
INSERT INTO public.users VALUES (91, 'user_1771491978460');
INSERT INTO public.users VALUES (92, 'user_1771491978459');
INSERT INTO public.users VALUES (93, 'user_1771492026585');
INSERT INTO public.users VALUES (94, 'user_1771492026584');
INSERT INTO public.users VALUES (95, 'user_1771492060420');
INSERT INTO public.users VALUES (96, 'user_1771492060419');
INSERT INTO public.users VALUES (97, 'user_1771492082780');
INSERT INTO public.users VALUES (98, 'user_1771492082779');
INSERT INTO public.users VALUES (99, 'user_1771492101665');
INSERT INTO public.users VALUES (100, 'user_1771492101664');
INSERT INTO public.users VALUES (101, 'user_1771493185273');
INSERT INTO public.users VALUES (102, 'user_1771493185272');
INSERT INTO public.users VALUES (103, 'user_1771493885713');
INSERT INTO public.users VALUES (104, 'user_1771493885712');
INSERT INTO public.users VALUES (105, 'user_1771493945478');
INSERT INTO public.users VALUES (106, 'user_1771493945477');
INSERT INTO public.users VALUES (107, 'user_1771494303599');
INSERT INTO public.users VALUES (108, 'user_1771494303598');
INSERT INTO public.users VALUES (109, 'user_1771494564301');
INSERT INTO public.users VALUES (110, 'user_1771494564300');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 86, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 110, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

