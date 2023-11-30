--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    order_id character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    total_price integer NOT NULL,
    user_order character varying(255) NOT NULL,
    user_accept character varying(255),
    address character varying(255) NOT NULL,
    shipping_id character varying(255),
    weight numeric,
    shipping_cost integer,
    product_cost integer,
    name character varying(255),
    phone character varying(255),
    date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_detail (
    id integer NOT NULL,
    order_id character varying(255) NOT NULL,
    product_option integer NOT NULL,
    quantity integer NOT NULL,
    product_name character varying(255),
    option_price integer,
    product_description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.order_detail OWNER TO postgres;

--
-- Name: order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_detail_id_seq OWNER TO postgres;

--
-- Name: order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_detail_id_seq OWNED BY public.order_detail.id;


--
-- Name: pinto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pinto (
    id character varying(255) NOT NULL,
    date_start timestamp without time zone,
    date_end timestamp without time zone,
    duration integer NOT NULL,
    user_id character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.pinto OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    product_name character varying(255) NOT NULL,
    product_type character varying(255) NOT NULL,
    image_url character varying(255),
    active boolean,
    vat boolean,
    product_description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: product_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option (
    id integer NOT NULL,
    product_id integer NOT NULL,
    product_option_name character varying(255) NOT NULL,
    price integer NOT NULL,
    active boolean,
    weight numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.product_option OWNER TO postgres;

--
-- Name: product_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_option_id_seq OWNER TO postgres;

--
-- Name: product_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_id_seq OWNED BY public.product_option.id;


--
-- Name: promo_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo_code (
    code character varying(255) NOT NULL,
    user_created character varying(255),
    user_use character varying(255),
    pinto_id character varying(255),
    amount integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.promo_code OWNER TO postgres;

--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migration (
    version character varying(14) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO postgres;

--
-- Name: shipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping (
    id integer NOT NULL,
    max_capacity integer NOT NULL,
    option_name character varying(255),
    box_price integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.shipping OWNER TO postgres;

--
-- Name: shipping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_id_seq OWNER TO postgres;

--
-- Name: shipping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_id_seq OWNED BY public.shipping.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    lineuserid character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    amount_remain integer NOT NULL,
    joined_at timestamp without time zone NOT NULL,
    house_no character varying(255) NOT NULL,
    county character varying(255) NOT NULL,
    post_code character varying(255) NOT NULL,
    sub_district character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    soi character varying(255) NOT NULL,
    road character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: order_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail ALTER COLUMN id SET DEFAULT nextval('public.order_detail_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: product_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option ALTER COLUMN id SET DEFAULT nextval('public.product_option_id_seq'::regclass);


--
-- Name: shipping id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping ALTER COLUMN id SET DEFAULT nextval('public.shipping_id_seq'::regclass);


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (order_id, status, total_price, user_order, user_accept, address, shipping_id, weight, shipping_cost, product_cost, name, phone, date, created_at, updated_at) FROM stdin;
202311012	cancel	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-23 19:15:23.878879	2023-11-23 19:15:23.878879
202311000	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-03 00:00:00	2023-11-23 18:53:50.783479	2023-11-23 18:53:50.783479
202311001	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-06 00:00:00	2023-11-23 18:53:50.910514	2023-11-23 18:53:50.910514
202311002	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-05 00:00:00	2023-11-23 18:53:50.912579	2023-11-23 18:53:50.912579
202311003	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-06 00:00:00	2023-11-23 18:53:50.914946	2023-11-23 18:53:50.914946
202311004	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-15 00:00:00	2023-11-23 18:53:50.917521	2023-11-23 18:53:50.917521
202311005	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-25 00:00:00	2023-11-23 18:53:50.920315	2023-11-23 18:53:50.920315
202311006	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-06 00:00:00	2023-11-23 19:03:27.76934	2023-11-23 19:03:27.76934
202311008	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-04 00:00:00	2023-11-23 19:03:27.777201	2023-11-23 19:03:27.777201
202311009	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-02 00:00:00	2023-11-23 19:03:27.778934	2023-11-23 19:03:27.778934
202311010	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-16 00:00:00	2023-11-23 19:03:27.78094	2023-11-23 19:03:27.78094
202311011	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-18 00:00:00	2023-11-23 19:03:27.784311	2023-11-23 19:03:27.784311
202311013	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-23 19:15:23.883252	2023-11-23 19:15:23.883252
202311014	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-23 19:15:23.885439	2023-11-23 19:15:23.885439
202311015	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-23 19:15:23.886997	2023-11-23 19:15:23.886997
202311016	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-23 19:15:23.889322	2023-11-23 19:15:23.889322
202311017	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-23 19:15:23.892322	2023-11-23 19:15:23.892322
202311018	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-23 19:21:07.532891	2023-11-23 19:21:07.532891
202311019	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-23 19:21:07.539507	2023-11-23 19:21:07.539507
202311020	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-23 19:21:07.542086	2023-11-23 19:21:07.542086
202311021	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-23 19:21:07.543829	2023-11-23 19:21:07.543829
202311022	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-23 19:21:07.545815	2023-11-23 19:21:07.545815
202311023	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-23 19:21:07.549123	2023-11-23 19:21:07.549123
202311024	pending	1261	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		12122	50	1211	พชพล	0908133372	2024-05-16 00:00:00	2023-11-24 16:47:24.764476	2023-11-24 16:47:24.764476
202311007	shipped	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150	ddssdsd	0	0	0	พชพล	0908133372	2023-12-05 00:00:00	2023-11-23 19:03:27.774205	2023-11-23 19:03:27.774205
202311025	pending	1261	Ube2cac2f444b8483388188d15b5df8ab	\N	บ้านเลขที่ 4 ซอย Prommit ถนน Sukhumvit แขวง Jahaเขต Jqjwjจังหวัด Jwheh10110		12122	50	1211	Nud 	0994461699	2023-11-24 00:00:00	2023-11-24 17:26:02.644682	2023-11-24 17:26:02.644682
202311026	pending	72	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		222	50	22	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:53:39.297607	2023-11-24 17:53:39.297607
202311027	pending	72	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		222	50	22	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:54:35.665082	2023-11-24 17:54:35.665082
202311028	pending	72	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		222	50	22	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:55:53.839528	2023-11-24 17:55:53.839528
202311029	pending	72	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		222	50	22	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:56:38.220422	2023-11-24 17:56:38.220422
202311030	pending	1261	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		12122	50	1211	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:57:24.109684	2023-11-24 17:57:24.109684
202311031	pending	1261	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		12122	50	1211	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:57:39.385066	2023-11-24 17:57:39.385066
202311032	pending	1261	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		12122	50	1211	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:58:06.416608	2023-11-24 17:58:06.416608
202311033	pending	1261	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		12122	50	1211	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:58:24.842712	2023-11-24 17:58:24.842712
202311034	pending	72	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		222	50	22	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:58:34.731497	2023-11-24 17:58:34.731497
202311035	pending	1261	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		12122	50	1211	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:59:05.133469	2023-11-24 17:59:05.133469
202311036	pending	1261	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		12122	50	1211	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 17:59:48.991405	2023-11-24 17:59:48.991405
202311037	pending	72	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		222	50	22	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 18:00:07.03411	2023-11-24 18:00:07.03411
202311038	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-24 22:05:48.314917	2023-11-24 22:05:48.314917
202311039	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-24 22:05:48.333169	2023-11-24 22:05:48.333169
202311040	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-24 22:05:48.337851	2023-11-24 22:05:48.337851
202311041	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-24 22:05:48.340917	2023-11-24 22:05:48.340917
202311042	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-24 22:05:48.343249	2023-11-24 22:05:48.343249
202311043	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-24 22:05:48.345842	2023-11-24 22:05:48.345842
202311044	pending	1261	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		12122	50	1211	พชพล	0908133372	2023-11-24 00:00:00	2023-11-24 22:08:55.559626	2023-11-24 22:08:55.559626
202311045	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-24 22:09:15.416769	2023-11-24 22:09:15.416769
202311046	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-24 22:09:15.418611	2023-11-24 22:09:15.418611
202311047	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-24 22:09:15.422713	2023-11-24 22:09:15.422713
202311048	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-24 22:09:15.425456	2023-11-24 22:09:15.425456
202311049	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-24 22:09:15.427237	2023-11-24 22:09:15.427237
202311050	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-24 22:09:15.429811	2023-11-24 22:09:15.429811
202311051	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-24 22:10:23.832314	2023-11-24 22:10:23.832314
202311052	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2023-12-01 00:00:00	2023-11-24 22:10:23.837971	2023-11-24 22:10:23.837971
202311053	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-24 22:10:23.841521	2023-11-24 22:10:23.841521
202311054	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-01-01 00:00:00	2023-11-24 22:10:23.847101	2023-11-24 22:10:23.847101
202311055	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-24 22:10:23.84946	2023-11-24 22:10:23.84946
202311056	paid	0	U5e9dbb896a6685b53a8e03997fa18802	\N	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150		0	0	0	พชพล	0908133372	2024-02-01 00:00:00	2023-11-24 22:10:23.852967	2023-11-24 22:10:23.852967
\.


--
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_detail (id, order_id, product_option, quantity, product_name, option_price, product_description, created_at, updated_at) FROM stdin;
2	202311000	1	1	Pinto	0		2023-11-23 18:53:50.901492	2023-11-23 18:53:50.901492
3	202311001	1	1	Pinto	0		2023-11-23 18:53:50.910651	2023-11-23 18:53:50.910651
4	202311002	1	1	Pinto	0		2023-11-23 18:53:50.913137	2023-11-23 18:53:50.913137
5	202311003	1	1	Pinto	0		2023-11-23 18:53:50.915502	2023-11-23 18:53:50.915502
6	202311004	1	1	Pinto	0		2023-11-23 18:53:50.918059	2023-11-23 18:53:50.918059
7	202311005	1	1	Pinto	0		2023-11-23 18:53:50.920826	2023-11-23 18:53:50.920826
8	202311006	1	1	Pinto	0		2023-11-23 19:03:27.770659	2023-11-23 19:03:27.770659
9	202311007	1	1	Pinto	0		2023-11-23 19:03:27.774748	2023-11-23 19:03:27.774748
10	202311008	1	1	Pinto	0		2023-11-23 19:03:27.777796	2023-11-23 19:03:27.777796
11	202311009	1	1	Pinto	0		2023-11-23 19:03:27.779439	2023-11-23 19:03:27.779439
12	202311010	1	1	Pinto	0		2023-11-23 19:03:27.782091	2023-11-23 19:03:27.782091
13	202311011	1	1	Pinto	0		2023-11-23 19:03:27.784857	2023-11-23 19:03:27.784857
14	202311012	1	1	Pinto	0	จากคุณ eeeถึงคุณ พชพล	2023-11-23 19:15:23.879943	2023-11-23 19:15:23.879943
15	202311013	1	1	Pinto	0	จากคุณ eeeถึงคุณ พชพล	2023-11-23 19:15:23.883764	2023-11-23 19:15:23.883764
16	202311014	1	1	Pinto	0	จากคุณ eeeถึงคุณ พชพล	2023-11-23 19:15:23.88595	2023-11-23 19:15:23.88595
17	202311015	1	1	Pinto	0	จากคุณ eeeถึงคุณ พชพล	2023-11-23 19:15:23.887508	2023-11-23 19:15:23.887508
18	202311016	1	1	Pinto	0	จากคุณ eeeถึงคุณ พชพล	2023-11-23 19:15:23.889837	2023-11-23 19:15:23.889837
19	202311017	1	1	Pinto	0	จากคุณ eeeถึงคุณ พชพล	2023-11-23 19:15:23.892865	2023-11-23 19:15:23.892865
20	202311018	1	1	Pinto	0	จากคุณ sssss ถึงคุณ พชพล	2023-11-23 19:21:07.53445	2023-11-23 19:21:07.53445
21	202311019	1	1	Pinto	0	จากคุณ sssss ถึงคุณ พชพล	2023-11-23 19:21:07.540099	2023-11-23 19:21:07.540099
22	202311020	1	1	Pinto	0	จากคุณ sssss ถึงคุณ พชพล	2023-11-23 19:21:07.542635	2023-11-23 19:21:07.542635
23	202311021	1	1	Pinto	0	จากคุณ sssss ถึงคุณ พชพล	2023-11-23 19:21:07.544342	2023-11-23 19:21:07.544342
24	202311022	1	1	Pinto	0	จากคุณ sssss ถึงคุณ พชพล	2023-11-23 19:21:07.54655	2023-11-23 19:21:07.54655
25	202311023	1	1	Pinto	0	จากคุณ sssss ถึงคุณ พชพล	2023-11-23 19:21:07.550286	2023-11-23 19:21:07.550286
26	202311024	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 16:47:24.867224	2023-11-24 16:47:24.867224
27	202311025	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 17:26:02.651574	2023-11-24 17:26:02.651574
28	202311026	1	1	fsd(1kg)	22	sdfsf	2023-11-24 17:53:39.312285	2023-11-24 17:53:39.312285
29	202311027	1	1	fsd(1kg)	22	sdfsf	2023-11-24 17:54:35.666885	2023-11-24 17:54:35.666885
30	202311028	1	1	fsd(1kg)	22	sdfsf	2023-11-24 17:55:53.842178	2023-11-24 17:55:53.842178
31	202311029	1	1	fsd(1kg)	22	sdfsf	2023-11-24 17:56:38.221484	2023-11-24 17:56:38.221484
32	202311030	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 17:57:24.112557	2023-11-24 17:57:24.112557
33	202311031	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 17:57:39.38614	2023-11-24 17:57:39.38614
34	202311032	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 17:58:06.417675	2023-11-24 17:58:06.417675
35	202311033	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 17:58:24.843798	2023-11-24 17:58:24.843798
36	202311034	1	1	fsd(1kg)	22	sdfsf	2023-11-24 17:58:34.734133	2023-11-24 17:58:34.734133
37	202311035	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 17:59:05.13419	2023-11-24 17:59:05.13419
38	202311036	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 17:59:48.992443	2023-11-24 17:59:48.992443
39	202311037	1	1	fsd(1kg)	22	sdfsf	2023-11-24 18:00:07.034946	2023-11-24 18:00:07.034946
40	202311038	1	1	Pinto	0	จากคุณ www ถึงคุณ พชพล	2023-11-24 22:05:48.326804	2023-11-24 22:05:48.326804
41	202311039	1	1	Pinto	0	จากคุณ www ถึงคุณ พชพล	2023-11-24 22:05:48.33369	2023-11-24 22:05:48.33369
42	202311040	1	1	Pinto	0	จากคุณ www ถึงคุณ พชพล	2023-11-24 22:05:48.339395	2023-11-24 22:05:48.339395
43	202311041	1	1	Pinto	0	จากคุณ www ถึงคุณ พชพล	2023-11-24 22:05:48.341473	2023-11-24 22:05:48.341473
44	202311042	1	1	Pinto	0	จากคุณ www ถึงคุณ พชพล	2023-11-24 22:05:48.34379	2023-11-24 22:05:48.34379
45	202311043	1	1	Pinto	0	จากคุณ www ถึงคุณ พชพล	2023-11-24 22:05:48.34639	2023-11-24 22:05:48.34639
46	202311044	3	1	fwefw(dsfs)	1211	ewfewf	2023-11-24 22:08:55.561897	2023-11-24 22:08:55.561897
47	202311045	1	1	Pinto	0	จากคุณ d ถึงคุณ พชพล	2023-11-24 22:09:15.417276	2023-11-24 22:09:15.417276
48	202311046	1	1	Pinto	0	จากคุณ d ถึงคุณ พชพล	2023-11-24 22:09:15.41912	2023-11-24 22:09:15.41912
49	202311047	1	1	Pinto	0	จากคุณ d ถึงคุณ พชพล	2023-11-24 22:09:15.423853	2023-11-24 22:09:15.423853
50	202311048	1	1	Pinto	0	จากคุณ d ถึงคุณ พชพล	2023-11-24 22:09:15.425964	2023-11-24 22:09:15.425964
51	202311049	1	1	Pinto	0	จากคุณ d ถึงคุณ พชพล	2023-11-24 22:09:15.427746	2023-11-24 22:09:15.427746
52	202311050	1	1	Pinto	0	จากคุณ d ถึงคุณ พชพล	2023-11-24 22:09:15.43032	2023-11-24 22:09:15.43032
53	202311051	1	1	Pinto	0	จากคุณ dd ถึงคุณ พชพล	2023-11-24 22:10:23.834409	2023-11-24 22:10:23.834409
54	202311052	1	1	Pinto	0	จากคุณ dd ถึงคุณ พชพล	2023-11-24 22:10:23.838522	2023-11-24 22:10:23.838522
55	202311053	1	1	Pinto	0	จากคุณ dd ถึงคุณ พชพล	2023-11-24 22:10:23.844061	2023-11-24 22:10:23.844061
56	202311054	1	1	Pinto	0	จากคุณ dd ถึงคุณ พชพล	2023-11-24 22:10:23.847654	2023-11-24 22:10:23.847654
57	202311055	1	1	Pinto	0	จากคุณ dd ถึงคุณ พชพล	2023-11-24 22:10:23.850514	2023-11-24 22:10:23.850514
58	202311056	1	1	Pinto	0	จากคุณ dd ถึงคุณ พชพล	2023-11-24 22:10:23.854727	2023-11-24 22:10:23.854727
\.


--
-- Data for Name: pinto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pinto (id, date_start, date_end, duration, user_id, created_at, updated_at) FROM stdin;
test	\N	\N	3	U5e9dbb896a6685b53a8e03997fa18802	\N	\N
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_name, product_type, image_url, active, vat, product_description, created_at, updated_at) FROM stdin;
1	fsd	Fruit	due.png	t	t	sdfsf	\N	\N
2	fwefw	Vegetable	abba.png	t	t	ewfewf	\N	\N
3	dsfsd	Food_Product	S__39043165_0.jpg	f	f	sdfs	\N	\N
4	fdsd	Fruit	ม่อนคาเฟ่1.JPG	t	f	sdfdsf	\N	\N
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option (id, product_id, product_option_name, price, active, weight, created_at, updated_at) FROM stdin;
1	1	1kg	22	t	222	\N	\N
2	1	11	111	t	111	\N	\N
3	2	dsfs	1211	t	12122	\N	\N
4	3	232	3223	f	3223	\N	\N
5	4	fdsf	333	t	33	\N	\N
\.


--
-- Data for Name: promo_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promo_code (code, user_created, user_use, pinto_id, amount, created_at, updated_at) FROM stdin;
test	\N		test	0	\N	\N
\.


--
-- Data for Name: schema_migration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migration (version) FROM stdin;
20231027000000
20231027000001
20231027064115
20231027123434
20231027130042
20231027130804
20231121043614
20231121044439
20231121123845
\.


--
-- Data for Name: shipping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping (id, max_capacity, option_name, box_price, created_at, updated_at) FROM stdin;
1	1000	ไซส์ M	50	\N	\N
2	2000	ไซส์ L	50	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (lineuserid, first_name, last_name, address, phone, admin, amount_remain, joined_at, house_no, county, post_code, sub_district, country, soi, road, created_at, updated_at) FROM stdin;
Ube2cac2f444b8483388188d15b5df8ab	Nud 	Kasemsuwan	4 Prommit Sukhumvit JqjwjJahaJwheh10110	0994461699	f	0	2023-11-24 17:25:40.268348	4 	Jqjwj	10110	Jaha	Jwheh	Prommit 	Sukhumvit 	2023-11-24 17:25:40.268348	2023-11-24 17:25:40.268348
U5e9dbb896a6685b53a8e03997fa18802	พชพล	ธาราไพศาลสุข	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150	0908133372	t	0	2023-11-21 12:28:45.405996	56	Krung Thep Mahanakhon (Bangkok)	10150	บางมด	Thailand	พระราม 2 ซอย3 แยก3	พระราม2	2023-11-21 12:28:45.405996	2023-11-21 12:28:45.405996
\.


--
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_detail_id_seq', 64, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 4, true);


--
-- Name: product_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_id_seq', 5, true);


--
-- Name: shipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_id_seq', 2, true);


--
-- Name: order_detail order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- Name: pinto pinto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pinto
    ADD CONSTRAINT pinto_pkey PRIMARY KEY (id);


--
-- Name: product_option product_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: promo_code promo_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_code
    ADD CONSTRAINT promo_code_pkey PRIMARY KEY (code);


--
-- Name: schema_migration schema_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migration
    ADD CONSTRAINT schema_migration_pkey PRIMARY KEY (version);


--
-- Name: shipping shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT shipping_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (lineuserid);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- Name: order_detail order_detail_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id);


--
-- Name: order_detail order_detail_product_option_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_product_option_fkey FOREIGN KEY (product_option) REFERENCES public.product_option(id);


--
-- Name: order order_user_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_order_fkey FOREIGN KEY (user_order) REFERENCES public.users(lineuserid);


--
-- Name: pinto pinto_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pinto
    ADD CONSTRAINT pinto_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(lineuserid);


--
-- Name: product_option product_option_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- PostgreSQL database dump complete
--

