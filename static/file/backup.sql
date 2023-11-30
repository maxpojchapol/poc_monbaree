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
\.


--
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_detail (id, order_id, product_option, quantity, product_name, option_price, product_description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pinto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pinto (id, date_start, date_end, duration, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_name, product_type, image_url, active, vat, product_description, created_at, updated_at) FROM stdin;
1	fsd	Fruit	due.png	t	t	sdfsf	\N	\N
2	fwefw	Vegetable	abba.png	t	t	ewfewf	\N	\N
3	dsfsd	Food_Product	S__39043165_0.jpg	f	f	sdfs	\N	\N
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option (id, product_id, product_option_name, price, active, weight, created_at, updated_at) FROM stdin;
1	1	1kg	22	t	222	\N	\N
2	1	11	111	t	111	\N	\N
3	2	dsfs	1211	t	12122	\N	\N
4	3	232	3223	f	3223	\N	\N
\.


--
-- Data for Name: promo_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promo_code (code, user_created, user_use, pinto_id, amount, created_at, updated_at) FROM stdin;
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
1	1000	1 โล	50	\N	\N
2	2000	2kg	50	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (lineuserid, first_name, last_name, address, phone, admin, amount_remain, joined_at, house_no, county, post_code, sub_district, country, soi, road, created_at, updated_at) FROM stdin;
U5e9dbb896a6685b53a8e03997fa18802	พชพล	ธาราไพศาลสุข	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150	0908133372	t	0	2023-11-21 12:28:45.405996	56	Krung Thep Mahanakhon (Bangkok)	10150	บางมด	Thailand	พระราม 2 ซอย3 แยก3	พระราม2	2023-11-21 12:28:45.405996	2023-11-21 12:28:45.405996
\.


--
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_detail_id_seq', 1, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 3, true);


--
-- Name: product_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_id_seq', 4, true);


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

