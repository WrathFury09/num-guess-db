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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    secret_number integer NOT NULL,
    number_of_guesses integer NOT NULL
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 298, 299);
INSERT INTO public.games VALUES (2, 1, 244, 245);
INSERT INTO public.games VALUES (3, 2, 91, 92);
INSERT INTO public.games VALUES (4, 2, 754, 755);
INSERT INTO public.games VALUES (5, 1, 718, 721);
INSERT INTO public.games VALUES (6, 1, 635, 637);
INSERT INTO public.games VALUES (7, 1, 660, 661);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1738312051037');
INSERT INTO public.players VALUES (2, 'user_1738312051036');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1738309889782', 2, 629);
INSERT INTO public.users VALUES (15, 'user_1738310315642', 2, 127);
INSERT INTO public.users VALUES (1, 'user_1738309889783', 5, 257);
INSERT INTO public.users VALUES (3, 'dars', 1, 11);
INSERT INTO public.users VALUES (14, 'user_1738310315643', 5, 132);
INSERT INTO public.users VALUES (5, 'user_1738310002776', 2, 389);
INSERT INTO public.users VALUES (4, 'user_1738310002777', 5, 80);
INSERT INTO public.users VALUES (29, 'user_1738310767488', 2, 17);
INSERT INTO public.users VALUES (17, 'user_1738310351995', 2, 192);
INSERT INTO public.users VALUES (7, 'user_1738310211272', 2, 428);
INSERT INTO public.users VALUES (16, 'user_1738310351996', 5, 49);
INSERT INTO public.users VALUES (28, 'user_1738310767489', 5, 112);
INSERT INTO public.users VALUES (6, 'user_1738310211273', 5, 452);
INSERT INTO public.users VALUES (9, 'user_1738310215227', 2, 524);
INSERT INTO public.users VALUES (19, 'user_1738310559325', 2, 569);
INSERT INTO public.users VALUES (8, 'user_1738310215228', 5, 69);
INSERT INTO public.users VALUES (18, 'user_1738310559326', 5, 256);
INSERT INTO public.users VALUES (11, 'user_1738310216469', 2, 141);
INSERT INTO public.users VALUES (10, 'user_1738310216470', 5, 173);
INSERT INTO public.users VALUES (31, 'user_1738310875016', 2, 577);
INSERT INTO public.users VALUES (13, 'user_1738310238065', 2, 46);
INSERT INTO public.users VALUES (21, 'user_1738310598896', 2, 15);
INSERT INTO public.users VALUES (12, 'user_1738310238066', 5, 214);
INSERT INTO public.users VALUES (30, 'user_1738310875017', 5, 18);
INSERT INTO public.users VALUES (20, 'user_1738310598897', 5, 46);
INSERT INTO public.users VALUES (23, 'user_1738310605402', 2, 929);
INSERT INTO public.users VALUES (22, 'user_1738310605403', 5, 273);
INSERT INTO public.users VALUES (33, 'user_1738310994196', 1, 652);
INSERT INTO public.users VALUES (25, 'user_1738310635419', 2, 57);
INSERT INTO public.users VALUES (24, 'user_1738310635420', 5, 256);
INSERT INTO public.users VALUES (32, 'user_1738310994197', 1, 669);
INSERT INTO public.users VALUES (27, 'user_1738310658918', 2, 295);
INSERT INTO public.users VALUES (26, 'user_1738310658919', 5, 168);
INSERT INTO public.users VALUES (35, 'user_1738311082643', 1, 160);
INSERT INTO public.users VALUES (34, 'user_1738311082644', 1, 237);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 7, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 2, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

