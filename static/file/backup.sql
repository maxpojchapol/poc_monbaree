--
-- PostgreSQL database dump
--

<<<<<<< HEAD
-- Dumped from database version 15.5 (Ubuntu 15.5-0ubuntu0.23.10.1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-0ubuntu0.23.10.1)
=======
-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8

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
-- Name: order; Type: TABLE; Schema: public; Owner: max
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


ALTER TABLE public."order" OWNER TO max;

--
-- Name: order_detail; Type: TABLE; Schema: public; Owner: max
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


ALTER TABLE public.order_detail OWNER TO max;

--
-- Name: order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE public.order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


<<<<<<< HEAD
ALTER TABLE public.order_detail_id_seq OWNER TO max;
=======
ALTER SEQUENCE public.order_detail_id_seq OWNER TO max;
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8

--
-- Name: order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE public.order_detail_id_seq OWNED BY public.order_detail.id;


--
-- Name: pinto; Type: TABLE; Schema: public; Owner: max
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


ALTER TABLE public.pinto OWNER TO max;

--
-- Name: product; Type: TABLE; Schema: public; Owner: max
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


ALTER TABLE public.product OWNER TO max;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


<<<<<<< HEAD
ALTER TABLE public.product_id_seq OWNER TO max;
=======
ALTER SEQUENCE public.product_id_seq OWNER TO max;
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: product_option; Type: TABLE; Schema: public; Owner: max
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


ALTER TABLE public.product_option OWNER TO max;

--
-- Name: product_option_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE public.product_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


<<<<<<< HEAD
ALTER TABLE public.product_option_id_seq OWNER TO max;
=======
ALTER SEQUENCE public.product_option_id_seq OWNER TO max;
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8

--
-- Name: product_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE public.product_option_id_seq OWNED BY public.product_option.id;


--
-- Name: promo_code; Type: TABLE; Schema: public; Owner: max
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


ALTER TABLE public.promo_code OWNER TO max;

--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: max
--

CREATE TABLE public.schema_migration (
    version character varying(14) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO max;

--
-- Name: shipping; Type: TABLE; Schema: public; Owner: max
--

CREATE TABLE public.shipping (
    id integer NOT NULL,
    max_capacity integer NOT NULL,
    option_name character varying(255),
    box_price integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.shipping OWNER TO max;

--
-- Name: shipping_id_seq; Type: SEQUENCE; Schema: public; Owner: max
--

CREATE SEQUENCE public.shipping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


<<<<<<< HEAD
ALTER TABLE public.shipping_id_seq OWNER TO max;
=======
ALTER SEQUENCE public.shipping_id_seq OWNER TO max;
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8

--
-- Name: shipping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: max
--

ALTER SEQUENCE public.shipping_id_seq OWNED BY public.shipping.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: max
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


ALTER TABLE public.users OWNER TO max;

--
-- Name: order_detail id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.order_detail ALTER COLUMN id SET DEFAULT nextval('public.order_detail_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: product_option id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.product_option ALTER COLUMN id SET DEFAULT nextval('public.product_option_id_seq'::regclass);


--
-- Name: shipping id; Type: DEFAULT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.shipping ALTER COLUMN id SET DEFAULT nextval('public.shipping_id_seq'::regclass);


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public."order" (order_id, status, total_price, user_order, user_accept, address, shipping_id, weight, shipping_cost, product_cost, name, phone, date, created_at, updated_at) FROM stdin;
<<<<<<< HEAD
202312006	cancel	210	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		500	170	40	max	0908133372	2023-12-05 00:00:00	2023-12-05 10:06:32.875649	2023-12-05 10:06:32.875649
202312001	cancel	210	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		500	170	40	max	0908133372	2023-12-05 00:00:00	2023-12-05 08:32:25.931451	2023-12-05 08:32:25.931452
202312002	cancel	250	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		1000	170	80	max	0908133372	2023-12-05 00:00:00	2023-12-05 08:36:26.254084	2023-12-05 08:36:26.254084
202312011	paid	1250	U54b18aec21f7b67b56878e036b2ff678	\N	บ้านเลขที่ 104ซอย รามอินทรา 61 แยก 4ถนน รามอินทราแขวง ท่าแร้งเขต บางเขนจังหวัด กรุงเทพมหานคร10230		7540	225	1025	ไพโรจน์	0818316100	2023-12-06 00:00:00	2023-12-06 01:08:45.914815	2023-12-06 01:08:45.914815
202312005	cancel	210	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		500	170	40	max	0908133372	2023-12-05 00:00:00	2023-12-05 10:04:01.801531	2023-12-05 10:04:01.801531
202312004	cancel	590	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		5000	190	400	max	0908133372	2023-12-05 00:00:00	2023-12-05 10:03:19.767916	2023-12-05 10:03:19.767916
202312014	paid	1370	Ucfa80ae397d4791783b0f3de67239900	\N	บ้านเลขที่ 1529/69ซอย -ถนน เจริญนครแขวง บางลำภูล่างเขต คลองสานจังหวัด กรุงเทพฯ10600		4200	170	1200	วิไลรัตน์	0819143804	2023-12-07 00:00:00	2023-12-07 06:51:40.426004	2023-12-07 06:51:40.426004
202312010	cancel	210	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		500	170	40	max	0908133372	2023-12-05 00:00:00	2023-12-05 10:47:58.28371	2023-12-05 10:47:58.28371
202312009	cancel	250	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		1000	170	80	max	0908133372	2023-12-05 00:00:00	2023-12-05 10:17:38.57024	2023-12-05 10:17:38.57024
202312008	cancel	210	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		500	170	40	max	0908133372	2023-12-05 00:00:00	2023-12-05 10:14:14.737868	2023-12-05 10:14:14.737868
202312007	cancel	210	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		500	170	40	max	0908133372	2023-12-05 00:00:00	2023-12-05 10:07:51.26654	2023-12-05 10:07:51.26654
202312000	cancel	1370	U7af4c708e518546c5f4fc2d6767dbe88	\N	บ้านเลขที่ 56ซอย 3ถนน rama2แขวง bangmodเขต chomthongจังหวัด bangkok10150		2000	170	1200	max	0908133372	2023-12-05 00:00:00	2023-12-05 08:26:28.391751	2023-12-05 08:26:28.391751
202312003	cancel	330	Ua5ebfd67db5b94c8c59ad26b0b102f6d	\N	บ้านเลขที่ 60ซอย เพชรเกษม 62/1ถนน เพชรเกษมแขวง บางแคเหนือเขต บางแคจังหวัด กทม10160		2000	170	160	ณัชชารีย์	0956393961	2023-12-05 00:00:00	2023-12-05 09:37:27.763403	2023-12-05 09:37:27.763403
202312012	pending	990	U49b6bed5cf122592f5e37ae6b8044480	\N	บ้านเลขที่ 23/464ซอย อัศวนนท์ถนน สุขุมวิทแขวง บางเมืองเขต เมืองจังหวัด สมุทรปราการ10270		1520	170	820	สุนี	0962299959	2023-12-11 00:00:00	2023-12-06 02:54:40.150683	2023-12-06 02:54:40.150683
202312013	shipped	680	U26c4fb9c021b0dd2f684281a0c1d102a	\N	บ้านเลขที่ 589ซอย บริษัทเอกนวถนน พระราม 2แขวง บางมดเขต จอมทองจังหวัด กรุงเทพฯ10150	120453800784	2380	170	510	นวรัตน์	081-61-66055	2023-12-06 00:00:00	2023-12-06 03:29:49.608771	2023-12-06 03:29:49.608771
=======
202312001	shipped	270	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150	123	240	170	100	พชพล	0908133372	2023-12-08 00:00:00	2023-12-08 10:57:10.220751	2023-12-08 10:57:10.220751
202312002	shipped	210	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150	fff	500	170	40	พชพล	0908133372	2023-12-10 00:00:00	2023-12-08 11:21:22.23579	2023-12-08 11:21:22.23579
202312003	paid	210	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		500	170	40	พชพล	0908133372	2023-12-08 00:00:00	2023-12-08 11:48:52.614853	2023-12-08 11:48:52.614853
202312004	pending	270	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		240	170	100	พชพล	0908133372	2023-12-08 00:00:00	2023-12-08 12:15:58.358716	2023-12-08 12:15:58.358716
202312000	shipped	270	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150	123	240	170	100	พชพล	0908133372	2023-12-15 00:00:00	2023-12-08 10:55:53.3721	2023-12-08 10:55:53.3721
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8
\.


--
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.order_detail (id, order_id, product_option, quantity, product_name, option_price, product_description, created_at, updated_at) FROM stdin;
<<<<<<< HEAD
1	202312000	42	10	คุกกี้ราสเบอรี่ (Raspberry Cookie)(กระปุก)	120	คุกกี้เนยแท้ท๊อปด้วย แยมราสเบอรี่กวนสด รสชาติเปรี้ยวหวานเข้มข้น	2023-12-05 08:26:28.393175	2023-12-05 08:26:28.393175
2	202312001	5	1	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 08:32:25.938682	2023-12-05 08:32:25.938682
3	202312002	4	1	เรดโอ๊ค (Red Oak Lettuce)(1kg)	80	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 08:36:26.255112	2023-12-05 08:36:26.255112
4	202312003	1	1	กรีนโอ๊ค (Green Oak Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 09:37:27.765778	2023-12-05 09:37:27.765778
5	202312003	3	1	เรดโอ๊ค (Red Oak Lettuce)(500g)	80	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 09:37:27.768443	2023-12-05 09:37:27.768443
6	202312003	10	1	กรีนคอส (Cos Lettuce)(1kg)	160	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 09:37:27.769999	2023-12-05 09:37:27.769999
7	202312004	6	5	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)(1kg)	80	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 10:03:19.770136	2023-12-05 10:03:19.770136
8	202312005	5	1	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 10:04:01.802966	2023-12-05 10:04:01.802966
9	202312006	5	1	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 10:06:32.877894	2023-12-05 10:06:32.877894
10	202312007	5	1	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 10:07:51.267662	2023-12-05 10:07:51.267663
11	202312008	3	1	เรดโอ๊ค (Red Oak Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 10:14:14.739614	2023-12-05 10:14:14.739614
12	202312009	6	1	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)(1kg)	80	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 10:17:38.572381	2023-12-05 10:17:38.572381
13	202312010	3	1	เรดโอ๊ค (Red Oak Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-05 10:47:58.28644	2023-12-05 10:47:58.28644
14	202312011	3	1	เรดโอ๊ค (Red Oak Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-06 01:08:45.917113	2023-12-06 01:08:45.917114
15	202312011	5	1	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)(500g)	80	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-06 01:08:45.920176	2023-12-06 01:08:45.920176
16	202312011	7	1	เรดโครอล (Red Coral Lettuce)(500g)	120	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-06 01:08:45.921551	2023-12-06 01:08:45.921551
17	202312011	9	1	กรีนคอส (Cos Lettuce)(500g)	160	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-06 01:08:45.922876	2023-12-06 01:08:45.922877
18	202312011	16	1	มะเขือม่วง (Black Beauty Eggplant)(1kg)	260	จากสวนนางบัวคำ	2023-12-06 01:08:45.924171	2023-12-06 01:08:45.924171
19	202312011	18	1	แตงกวาญี่ปุ่น (Japanese Cucumber)(1kg)	310	แตงกวาญี่ปุ่นจากสวนคุณไนท์	2023-12-06 01:08:45.925043	2023-12-06 01:08:45.925043
20	202312011	21	1	เคล (Kale)(500g)	385	จากสวนคุณแอ้	2023-12-06 01:08:45.927102	2023-12-06 01:08:45.927103
21	202312011	26	1	มะเขือเทศ โทมัส (Thomas Tomato)(500g)	415	จากสวนคุณเบิ้ม	2023-12-06 01:08:45.928432	2023-12-06 01:08:45.928432
22	202312011	36	1	พริกหวาน3สี (Bell pepper)(500g)	465	จากสวนนางบัวคำ	2023-12-06 01:08:45.929315	2023-12-06 01:08:45.929316
23	202312011	44	1	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	565	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-06 01:08:45.930199	2023-12-06 01:08:45.930199
24	202312011	44	1	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	665	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-06 01:08:45.931319	2023-12-06 01:08:45.931319
25	202312011	50	1	แบล็คเบอรี่ซอส (Blackberry Sauce)(ขวด)	845	ซอสแบล็คเบอรี่ สำหรับราดบนไอศกรีม พุดดิ้ง โยเกิร์ต ขนมเค้ก ขนมหวานต่างๆ เนื้อซอสเข้มข้น จากแบล็คเบอรี่แท้ๆ	2023-12-06 01:08:45.932291	2023-12-06 01:08:45.932291
26	202312011	47	1	โรสเบอรี่ สเปรด (Roseberry Spread)(ขวด)	945	แยมราสเบอรี่ผสมกลีบกุหลาบมอญสุโขทัย ปลูกแบบออร์แกนิค ใช้ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-06 01:08:45.932989	2023-12-06 01:08:45.932989
27	202312011	35	1	อะโวคาโด พันธุ์แฮส (Hass Avocado)(1kg)	1025	จากสวนนางบัวคำ	2023-12-06 01:08:45.93371	2023-12-06 01:08:45.93371
28	202312012	40	2	คุกกี้ไต้หวัน ไส้ราสเบอรี่ (Taiwanese Raspberry Tart)(กล่อง (6 ชิ้น))	150	อัดแน่นด้วยเนื้อราสเบอรี่กวนเปรี้ยวๆหวานๆหอมกลิ่นเนยแท้ๆ	2023-12-06 02:54:40.152681	2023-12-06 02:54:40.152682
29	202312012	45	2	เลมอน สเปรด (Lemon Spread)(ขวด)	250	แยมเลมอนทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-06 02:54:40.154955	2023-12-06 02:54:40.154955
30	202312012	44	2	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	350	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-06 02:54:40.157777	2023-12-06 02:54:40.157777
31	202312012	57	2	สบู่ (Soap)(มะกรูด)	410	สบู่สมุนไพร ด้วยคุณค่าสารสกัดสมุนไพร ช่วยปรับผิวให้ขาว สะอาด เนียนใส นุ่ม ชุ่มชื่น มีสุขภาพดี ผิวใส กลิ่นกายหอม ลดกลิ่นตัว กลิ่นเหงื่อ	2023-12-06 02:54:40.158982	2023-12-06 02:54:40.158982
32	202312013	35	2	อะโวคาโด พันธุ์แฮส (Hass Avocado)(1kg)	80	จากสวนนางบัวคำ	2023-12-06 03:29:49.61041	2023-12-06 03:29:49.61041
33	202312013	43	1	น้ำสลัดราสเบอรี่ (Raspberry Vinaigrette)(ขวด)	360	น้ำสลัดชนิดเข้มข้น ด้วยเนื้อราสเบอรี่และ extra vergin olive oil เทราดบนสลัด หรือทำเป็น Dip จิ้มกับแครอท แตงกวา เป็นอาหารสุขภาพผักทุกชนิด	2023-12-06 03:29:49.612129	2023-12-06 03:29:49.612129
34	202312013	40	1	คุกกี้ไต้หวัน ไส้ราสเบอรี่ (Taiwanese Raspberry Tart)(กล่อง (6 ชิ้น))	510	อัดแน่นด้วยเนื้อราสเบอรี่กวนเปรี้ยวๆหวานๆหอมกลิ่นเนยแท้ๆ	2023-12-06 03:29:49.613075	2023-12-06 03:29:49.613075
35	202312014	23	2	คะน้า ฮ่องกง (Hongkong Kale)(500g)	40	จากสวนคุณแอ้	2023-12-07 06:51:40.428836	2023-12-07 06:51:40.428836
36	202312014	28	2	ฟักทองญี่ปุ่น (Japanese Pumpkin)(500g)	80	จากสวนคุณชาตินิยม	2023-12-07 06:51:40.433726	2023-12-07 06:51:40.433726
37	202312014	40	1	คุกกี้ไต้หวัน ไส้ราสเบอรี่ (Taiwanese Raspberry Tart)(กล่อง (6 ชิ้น))	320	อัดแน่นด้วยเนื้อราสเบอรี่กวนเปรี้ยวๆหวานๆหอมกลิ่นเนยแท้ๆ	2023-12-07 06:51:40.436059	2023-12-07 06:51:40.43606
38	202312014	41	1	คุกกี้บัตเตอร์ มิกซ์เบอรี่ (Mixed Berries Butter Cookies)(กระปุก)	480	คุกกี้เนยแท้ ผสมเนื้อราสเบอรี่และแบล็คเบอรี่อบแห้ง เนื้อแน่นหนึบเต็มๆคำ	2023-12-07 06:51:40.437558	2023-12-07 06:51:40.437558
39	202312014	42	1	คุกกี้ราสเบอรี่ (Raspberry Cookie)(กระปุก)	640	คุกกี้เนยแท้ท๊อปด้วย แยมราสเบอรี่กวนสด รสชาติเปรี้ยวหวานเข้มข้น	2023-12-07 06:51:40.43882	2023-12-07 06:51:40.43882
40	202312014	28	2	ฟักทองญี่ปุ่น (Japanese Pumpkin)(500g)	360	จากสวนคุณชาตินิยม	2023-12-07 06:51:40.440515	2023-12-07 06:51:40.440515
41	202312014	40	1	คุกกี้ไต้หวัน ไส้ราสเบอรี่ (Taiwanese Raspberry Tart)(กล่อง (6 ชิ้น))	880	อัดแน่นด้วยเนื้อราสเบอรี่กวนเปรี้ยวๆหวานๆหอมกลิ่นเนยแท้ๆ	2023-12-07 06:51:40.442693	2023-12-07 06:51:40.442693
42	202312014	41	1	คุกกี้บัตเตอร์ มิกซ์เบอรี่ (Mixed Berries Butter Cookies)(กระปุก)	1040	คุกกี้เนยแท้ ผสมเนื้อราสเบอรี่และแบล็คเบอรี่อบแห้ง เนื้อแน่นหนึบเต็มๆคำ	2023-12-07 06:51:40.444294	2023-12-07 06:51:40.444294
43	202312014	42	1	คุกกี้ราสเบอรี่ (Raspberry Cookie)(กระปุก)	1200	คุกกี้เนยแท้ท๊อปด้วย แยมราสเบอรี่กวนสด รสชาติเปรี้ยวหวานเข้มข้น	2023-12-07 06:51:40.445194	2023-12-07 06:51:40.445194
=======
1	202312000	249	1	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	100	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-08 10:55:53.377991	2023-12-08 10:55:53.377991
2	202312001	249	1	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	100	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-08 10:57:10.223357	2023-12-08 10:57:10.223357
3	202312002	206	1	กรีนโอ๊ค (Green Oak Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-08 11:21:22.236955	2023-12-08 11:21:22.236955
4	202312003	206	1	กรีนโอ๊ค (Green Oak Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-08 11:48:52.617085	2023-12-08 11:48:52.617085
5	202312004	249	1	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	100	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-08 12:15:58.367151	2023-12-08 12:15:58.367151
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8
\.


--
-- Data for Name: pinto; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.pinto (id, date_start, date_end, duration, user_id, created_at, updated_at) FROM stdin;
<<<<<<< HEAD
Pq003G1m	\N	\N	1	\N	\N	\N
Ry943G1m	\N	\N	1	\N	\N	\N
Ez752G1m	\N	\N	1	\N	\N	\N
Xc107G1m	\N	\N	1	\N	\N	\N
Gh598G1m	\N	\N	1	\N	\N	\N
Zd394G1m	\N	\N	1	\N	\N	\N
De067G1m	\N	\N	1	\N	\N	\N
Dw281G1m	\N	\N	1	\N	\N	\N
Vz305G1m	\N	\N	1	\N	\N	\N
Pt695G1m	\N	\N	1	\N	\N	\N
Lk759G1m	\N	\N	1	\N	\N	\N
Jc391G1m	\N	\N	1	\N	\N	\N
Zf133G1m	\N	\N	1	\N	\N	\N
Sq336G1m	\N	\N	1	\N	\N	\N
Tc769G1m	\N	\N	1	\N	\N	\N
Ts788G1m	\N	\N	1	\N	\N	\N
Zr583G1m	\N	\N	1	\N	\N	\N
Qn661G1m	\N	\N	1	\N	\N	\N
Tc570G1m	\N	\N	1	\N	\N	\N
Ds875G1m	\N	\N	1	\N	\N	\N
Pd851G1m	\N	\N	1	\N	\N	\N
Xy846G1m	\N	\N	1	\N	\N	\N
Ya138G1m	\N	\N	1	\N	\N	\N
Ut534G1m	\N	\N	1	\N	\N	\N
So920G1m	\N	\N	1	\N	\N	\N
Gl955G1m	\N	\N	1	\N	\N	\N
Nv513G1m	\N	\N	1	\N	\N	\N
Lz762G1m	\N	\N	1	\N	\N	\N
Qx445G1m	\N	\N	1	\N	\N	\N
Ho003G1m	\N	\N	1	\N	\N	\N
Hv152G1m	\N	\N	1	\N	\N	\N
Bv934G1m	\N	\N	1	\N	\N	\N
Ro107G1m	\N	\N	1	\N	\N	\N
Oe334G1m	\N	\N	1	\N	\N	\N
Zn957G1m	\N	\N	1	\N	\N	\N
Ns575G1m	\N	\N	1	\N	\N	\N
Xu938G1m	\N	\N	1	\N	\N	\N
It688G1m	\N	\N	1	\N	\N	\N
Qv912G1m	\N	\N	1	\N	\N	\N
Tb200G1m	\N	\N	1	\N	\N	\N
Pj596G1m	\N	\N	1	\N	\N	\N
Xt761G1m	\N	\N	1	\N	\N	\N
Oa920G1m	\N	\N	1	\N	\N	\N
Ve673G1m	\N	\N	1	\N	\N	\N
Fr035G1m	\N	\N	1	\N	\N	\N
Dj223G1m	\N	\N	1	\N	\N	\N
Dt533G1m	\N	\N	1	\N	\N	\N
Qf446G1m	\N	\N	1	\N	\N	\N
Km374G1m	\N	\N	1	\N	\N	\N
Wz947G1m	\N	\N	1	\N	\N	\N
Gt451G1m	\N	\N	1	\N	\N	\N
Pd257G1m	\N	\N	1	\N	\N	\N
Nn040G1m	\N	\N	1	\N	\N	\N
Dj066G1m	\N	\N	1	\N	\N	\N
Mw425G1m	\N	\N	1	\N	\N	\N
Nd282G1m	\N	\N	1	\N	\N	\N
Cd793G1m	\N	\N	1	\N	\N	\N
Kd131G1m	\N	\N	1	\N	\N	\N
Zh902G1m	\N	\N	1	\N	\N	\N
Qb260G1m	\N	\N	1	\N	\N	\N
Wq024G1m	\N	\N	1	\N	\N	\N
Xk465G1m	\N	\N	1	\N	\N	\N
Ux189G1m	\N	\N	1	\N	\N	\N
Qq515G1m	\N	\N	1	\N	\N	\N
Gm575G1m	\N	\N	1	\N	\N	\N
Co959G1m	\N	\N	1	\N	\N	\N
Gh807G1m	\N	\N	1	\N	\N	\N
Jd332G1m	\N	\N	1	\N	\N	\N
Uc813G1m	\N	\N	1	\N	\N	\N
Tr030G1m	\N	\N	1	\N	\N	\N
Mh229G1m	\N	\N	1	\N	\N	\N
Po907G1m	\N	\N	1	\N	\N	\N
It551G1m	\N	\N	1	\N	\N	\N
Fl138G1m	\N	\N	1	\N	\N	\N
Ur871G1m	\N	\N	1	\N	\N	\N
Xf444G1m	\N	\N	1	\N	\N	\N
Xp028G1m	\N	\N	1	\N	\N	\N
Fm264G1m	\N	\N	1	\N	\N	\N
Ui669G1m	\N	\N	1	\N	\N	\N
Lq934G1m	\N	\N	1	\N	\N	\N
Xo685G1m	\N	\N	1	\N	\N	\N
Ka033G1m	\N	\N	1	\N	\N	\N
Ce538G1m	\N	\N	1	\N	\N	\N
Jg931G1m	\N	\N	1	\N	\N	\N
Qm517G1m	\N	\N	1	\N	\N	\N
Gg328G1m	\N	\N	1	\N	\N	\N
At483G1m	\N	\N	1	\N	\N	\N
Gw998G1m	\N	\N	1	\N	\N	\N
Wx569G1m	\N	\N	1	\N	\N	\N
Kc368G1m	\N	\N	1	\N	\N	\N
Ix322G1m	\N	\N	1	\N	\N	\N
Si962G1m	\N	\N	1	\N	\N	\N
Uy605G1m	\N	\N	1	\N	\N	\N
As736G1m	\N	\N	1	\N	\N	\N
Ta487G1m	\N	\N	1	\N	\N	\N
Zv840G1m	\N	\N	1	\N	\N	\N
Ip713G1m	\N	\N	1	\N	\N	\N
Om316G1m	\N	\N	1	\N	\N	\N
Eg594G1m	\N	\N	1	\N	\N	\N
Wb021G1m	\N	\N	1	\N	\N	\N
Sc593G1m	\N	\N	1	\N	\N	\N
Xx406G1m	\N	\N	1	\N	\N	\N
Au725G1m	\N	\N	1	\N	\N	\N
Sm143G1m	\N	\N	1	\N	\N	\N
Tl088G1m	\N	\N	1	\N	\N	\N
Vc418G1m	\N	\N	1	\N	\N	\N
Ye570G1m	\N	\N	1	\N	\N	\N
Gb625G1m	\N	\N	1	\N	\N	\N
Ew316G1m	\N	\N	1	\N	\N	\N
Xb633G1m	\N	\N	1	\N	\N	\N
Rp684G1m	\N	\N	1	\N	\N	\N
We537G1m	\N	\N	1	\N	\N	\N
Jv811G1m	\N	\N	1	\N	\N	\N
Xp110G1m	\N	\N	1	\N	\N	\N
Xs121G1m	\N	\N	1	\N	\N	\N
Qg056G1m	\N	\N	1	\N	\N	\N
Kn037G1m	\N	\N	1	\N	\N	\N
Yd606G1m	\N	\N	1	\N	\N	\N
Mh327G1m	\N	\N	1	\N	\N	\N
Wg112G1m	\N	\N	1	\N	\N	\N
Qb455G1m	\N	\N	1	\N	\N	\N
Il697G1m	\N	\N	1	\N	\N	\N
Vb998G1m	\N	\N	1	\N	\N	\N
Xc897G1m	\N	\N	1	\N	\N	\N
Dd990G1m	\N	\N	1	\N	\N	\N
Gw045G1m	\N	\N	1	\N	\N	\N
Up956G1m	\N	\N	1	\N	\N	\N
Xq902G1m	\N	\N	1	\N	\N	\N
Di832G1m	\N	\N	1	\N	\N	\N
Qe143G1m	\N	\N	1	\N	\N	\N
Lj737G1m	\N	\N	1	\N	\N	\N
Oc403G1m	\N	\N	1	\N	\N	\N
Bi061G1m	\N	\N	1	\N	\N	\N
Us838G1m	\N	\N	1	\N	\N	\N
Fi787G1m	\N	\N	1	\N	\N	\N
Jz192G1m	\N	\N	1	\N	\N	\N
No977G1m	\N	\N	1	\N	\N	\N
Yh180G1m	\N	\N	1	\N	\N	\N
Pb119G1m	\N	\N	1	\N	\N	\N
Gb030G1m	\N	\N	1	\N	\N	\N
Fn870G1m	\N	\N	1	\N	\N	\N
Eo286G1m	\N	\N	1	\N	\N	\N
En309G1m	\N	\N	1	\N	\N	\N
Xh066G1m	\N	\N	1	\N	\N	\N
Nw743G1m	\N	\N	1	\N	\N	\N
Il835G1m	\N	\N	1	\N	\N	\N
Nd352G1m	\N	\N	1	\N	\N	\N
Hu155G1m	\N	\N	1	\N	\N	\N
Sv979G1m	\N	\N	1	\N	\N	\N
Ji454G1m	\N	\N	1	\N	\N	\N
Cr397G1m	\N	\N	1	\N	\N	\N
Us592G1m	\N	\N	1	\N	\N	\N
Bd478G1m	\N	\N	1	\N	\N	\N
Hb641G1m	\N	\N	1	\N	\N	\N
Jm301G1m	\N	\N	1	\N	\N	\N
Wp687G1m	\N	\N	1	\N	\N	\N
Ch884G1m	\N	\N	1	\N	\N	\N
Zt908G1m	\N	\N	1	\N	\N	\N
Wj200G1m	\N	\N	1	\N	\N	\N
Sp070G1m	\N	\N	1	\N	\N	\N
Pm595G1m	\N	\N	1	\N	\N	\N
Cg148G1m	\N	\N	1	\N	\N	\N
Rs231G1m	\N	\N	1	\N	\N	\N
Zx660G1m	\N	\N	1	\N	\N	\N
Hc827G1m	\N	\N	1	\N	\N	\N
Pr049G1m	\N	\N	1	\N	\N	\N
Fu639G1m	\N	\N	1	\N	\N	\N
Zq923G1m	\N	\N	1	\N	\N	\N
Ed836G1m	\N	\N	1	\N	\N	\N
Uq589G1m	\N	\N	1	\N	\N	\N
Mo339G1m	\N	\N	1	\N	\N	\N
Pq952G1m	\N	\N	1	\N	\N	\N
Vt491G1m	\N	\N	1	\N	\N	\N
Ls940G1m	\N	\N	1	\N	\N	\N
Lq485G1m	\N	\N	1	\N	\N	\N
Nl909G1m	\N	\N	1	\N	\N	\N
Wf862G1m	\N	\N	1	\N	\N	\N
Sa437G1m	\N	\N	1	\N	\N	\N
Ng284G1m	\N	\N	1	\N	\N	\N
Fl434G1m	\N	\N	1	\N	\N	\N
Of641G1m	\N	\N	1	\N	\N	\N
Bf944G1m	\N	\N	1	\N	\N	\N
Rw575G1m	\N	\N	1	\N	\N	\N
Gk028G1m	\N	\N	1	\N	\N	\N
Gb883G1m	\N	\N	1	\N	\N	\N
Qn059G1m	\N	\N	1	\N	\N	\N
Lv105G1m	\N	\N	1	\N	\N	\N
Ym383G1m	\N	\N	1	\N	\N	\N
Dr552G1m	\N	\N	1	\N	\N	\N
Il605G1m	\N	\N	1	\N	\N	\N
Tk254G1m	\N	\N	1	\N	\N	\N
Ha738G1m	\N	\N	1	\N	\N	\N
Xp303G1m	\N	\N	1	\N	\N	\N
Wj710G1m	\N	\N	1	\N	\N	\N
Vn793G1m	\N	\N	1	\N	\N	\N
Fi732G1m	\N	\N	1	\N	\N	\N
Tk165G1m	\N	\N	1	\N	\N	\N
Bm692G1m	\N	\N	1	\N	\N	\N
Ri583G1m	\N	\N	1	\N	\N	\N
Uv398G1m	\N	\N	1	\N	\N	\N
Dh756G2m	\N	\N	2	\N	\N	\N
Sh711G2m	\N	\N	2	\N	\N	\N
If185G2m	\N	\N	2	\N	\N	\N
Tn947G2m	\N	\N	2	\N	\N	\N
Kt466G2m	\N	\N	2	\N	\N	\N
Uq432G2m	\N	\N	2	\N	\N	\N
Lr915G2m	\N	\N	2	\N	\N	\N
Gf185G2m	\N	\N	2	\N	\N	\N
Sr214G2m	\N	\N	2	\N	\N	\N
Zm711G2m	\N	\N	2	\N	\N	\N
Bk588G2m	\N	\N	2	\N	\N	\N
Um216G2m	\N	\N	2	\N	\N	\N
Tw568G2m	\N	\N	2	\N	\N	\N
Hj715G2m	\N	\N	2	\N	\N	\N
Ek525G2m	\N	\N	2	\N	\N	\N
Wh082G2m	\N	\N	2	\N	\N	\N
Nj078G2m	\N	\N	2	\N	\N	\N
Rd174G2m	\N	\N	2	\N	\N	\N
Ga417G2m	\N	\N	2	\N	\N	\N
En131G2m	\N	\N	2	\N	\N	\N
Ii549G2m	\N	\N	2	\N	\N	\N
Nr707G2m	\N	\N	2	\N	\N	\N
Sr640G2m	\N	\N	2	\N	\N	\N
Nu552G2m	\N	\N	2	\N	\N	\N
Ja313G2m	\N	\N	2	\N	\N	\N
Nw654G2m	\N	\N	2	\N	\N	\N
Rf392G2m	\N	\N	2	\N	\N	\N
Jx798G2m	\N	\N	2	\N	\N	\N
Go544G2m	\N	\N	2	\N	\N	\N
Wv241G2m	\N	\N	2	\N	\N	\N
Hq166G2m	\N	\N	2	\N	\N	\N
An396G2m	\N	\N	2	\N	\N	\N
Yt634G2m	\N	\N	2	\N	\N	\N
Xh203G2m	\N	\N	2	\N	\N	\N
Av357G2m	\N	\N	2	\N	\N	\N
Bm976G2m	\N	\N	2	\N	\N	\N
Hb860G2m	\N	\N	2	\N	\N	\N
Gg636G2m	\N	\N	2	\N	\N	\N
Xr186G2m	\N	\N	2	\N	\N	\N
Si205G2m	\N	\N	2	\N	\N	\N
Gt589G2m	\N	\N	2	\N	\N	\N
Ii984G2m	\N	\N	2	\N	\N	\N
Gg116G2m	\N	\N	2	\N	\N	\N
Bg709G2m	\N	\N	2	\N	\N	\N
Um869G2m	\N	\N	2	\N	\N	\N
Cm042G2m	\N	\N	2	\N	\N	\N
Ck174G2m	\N	\N	2	\N	\N	\N
Ov016G2m	\N	\N	2	\N	\N	\N
Qb505G2m	\N	\N	2	\N	\N	\N
Yu636G2m	\N	\N	2	\N	\N	\N
Xh831G2m	\N	\N	2	\N	\N	\N
Wk677G2m	\N	\N	2	\N	\N	\N
Od708G2m	\N	\N	2	\N	\N	\N
Az572G2m	\N	\N	2	\N	\N	\N
Xy482G2m	\N	\N	2	\N	\N	\N
Uu517G2m	\N	\N	2	\N	\N	\N
Yv156G2m	\N	\N	2	\N	\N	\N
Fq966G2m	\N	\N	2	\N	\N	\N
Ya709G2m	\N	\N	2	\N	\N	\N
Pb878G2m	\N	\N	2	\N	\N	\N
Rc617G2m	\N	\N	2	\N	\N	\N
Zp347G2m	\N	\N	2	\N	\N	\N
Qh043G2m	\N	\N	2	\N	\N	\N
Vt912G2m	\N	\N	2	\N	\N	\N
Ap650G2m	\N	\N	2	\N	\N	\N
Ju211G2m	\N	\N	2	\N	\N	\N
Yi719G2m	\N	\N	2	\N	\N	\N
Eo845G2m	\N	\N	2	\N	\N	\N
Ef978G2m	\N	\N	2	\N	\N	\N
Jg814G2m	\N	\N	2	\N	\N	\N
Xs121G2m	\N	\N	2	\N	\N	\N
Nj637G2m	\N	\N	2	\N	\N	\N
Zo541G2m	\N	\N	2	\N	\N	\N
Ny217G2m	\N	\N	2	\N	\N	\N
Sg473G2m	\N	\N	2	\N	\N	\N
Oe792G2m	\N	\N	2	\N	\N	\N
Qb928G2m	\N	\N	2	\N	\N	\N
Fn323G2m	\N	\N	2	\N	\N	\N
Od537G2m	\N	\N	2	\N	\N	\N
Ck212G2m	\N	\N	2	\N	\N	\N
Bk018G2m	\N	\N	2	\N	\N	\N
Dy038G2m	\N	\N	2	\N	\N	\N
Fk405G2m	\N	\N	2	\N	\N	\N
Yl593G2m	\N	\N	2	\N	\N	\N
Id732G2m	\N	\N	2	\N	\N	\N
Zn376G2m	\N	\N	2	\N	\N	\N
Am892G2m	\N	\N	2	\N	\N	\N
Hj982G2m	\N	\N	2	\N	\N	\N
Qg245G2m	\N	\N	2	\N	\N	\N
Ps663G2m	\N	\N	2	\N	\N	\N
Ai216G2m	\N	\N	2	\N	\N	\N
Mu493G2m	\N	\N	2	\N	\N	\N
Vf230G2m	\N	\N	2	\N	\N	\N
Wg175G2m	\N	\N	2	\N	\N	\N
Tw017G2m	\N	\N	2	\N	\N	\N
Al347G2m	\N	\N	2	\N	\N	\N
Su338G2m	\N	\N	2	\N	\N	\N
Pc430G2m	\N	\N	2	\N	\N	\N
Wt844G2m	\N	\N	2	\N	\N	\N
Wz448G2m	\N	\N	2	\N	\N	\N
Gh627G2m	\N	\N	2	\N	\N	\N
Mh355G2m	\N	\N	2	\N	\N	\N
Za805G2m	\N	\N	2	\N	\N	\N
Fl539G2m	\N	\N	2	\N	\N	\N
Ga552G2m	\N	\N	2	\N	\N	\N
Cs537G2m	\N	\N	2	\N	\N	\N
Rj918G2m	\N	\N	2	\N	\N	\N
Wd759G2m	\N	\N	2	\N	\N	\N
Vv932G2m	\N	\N	2	\N	\N	\N
Zn060G2m	\N	\N	2	\N	\N	\N
Ed203G2m	\N	\N	2	\N	\N	\N
Kp697G2m	\N	\N	2	\N	\N	\N
Cp931G2m	\N	\N	2	\N	\N	\N
Cz124G2m	\N	\N	2	\N	\N	\N
Om894G2m	\N	\N	2	\N	\N	\N
Wx769G2m	\N	\N	2	\N	\N	\N
Pj452G2m	\N	\N	2	\N	\N	\N
Lm154G2m	\N	\N	2	\N	\N	\N
Yg118G2m	\N	\N	2	\N	\N	\N
Qd737G2m	\N	\N	2	\N	\N	\N
Nz610G2m	\N	\N	2	\N	\N	\N
Zz427G2m	\N	\N	2	\N	\N	\N
Te373G2m	\N	\N	2	\N	\N	\N
Dl186G2m	\N	\N	2	\N	\N	\N
Gq588G2m	\N	\N	2	\N	\N	\N
Hn456G2m	\N	\N	2	\N	\N	\N
Fk934G2m	\N	\N	2	\N	\N	\N
Kd931G2m	\N	\N	2	\N	\N	\N
Hq283G2m	\N	\N	2	\N	\N	\N
Vj462G2m	\N	\N	2	\N	\N	\N
Yy317G2m	\N	\N	2	\N	\N	\N
Il130G2m	\N	\N	2	\N	\N	\N
Al258G2m	\N	\N	2	\N	\N	\N
Fz588G2m	\N	\N	2	\N	\N	\N
Zh461G2m	\N	\N	2	\N	\N	\N
Zq932G2m	\N	\N	2	\N	\N	\N
Bz586G2m	\N	\N	2	\N	\N	\N
Lt531G2m	\N	\N	2	\N	\N	\N
Sv887G2m	\N	\N	2	\N	\N	\N
Qt165G2m	\N	\N	2	\N	\N	\N
Gp184G2m	\N	\N	2	\N	\N	\N
Gy203G2m	\N	\N	2	\N	\N	\N
Uv221G2m	\N	\N	2	\N	\N	\N
Qe124G2m	\N	\N	2	\N	\N	\N
Ul967G2m	\N	\N	2	\N	\N	\N
Fd185G2m	\N	\N	2	\N	\N	\N
Gm741G2m	\N	\N	2	\N	\N	\N
Ng053G2m	\N	\N	2	\N	\N	\N
Xq893G2m	\N	\N	2	\N	\N	\N
Nn615G2m	\N	\N	2	\N	\N	\N
Ce500G2m	\N	\N	2	\N	\N	\N
Wm102G2m	\N	\N	2	\N	\N	\N
Td288G2m	\N	\N	2	\N	\N	\N
Jy691G2m	\N	\N	2	\N	\N	\N
Bg999G2m	\N	\N	2	\N	\N	\N
Ok656G2m	\N	\N	2	\N	\N	\N
Cr473G2m	\N	\N	2	\N	\N	\N
Eo191G2m	\N	\N	2	\N	\N	\N
Pg848G2m	\N	\N	2	\N	\N	\N
Lu493G2m	\N	\N	2	\N	\N	\N
Hj360G2m	\N	\N	2	\N	\N	\N
Gu658G2m	\N	\N	2	\N	\N	\N
Gw471G2m	\N	\N	2	\N	\N	\N
Lp789G2m	\N	\N	2	\N	\N	\N
Pz077G2m	\N	\N	2	\N	\N	\N
Xt341G2m	\N	\N	2	\N	\N	\N
Vj860G2m	\N	\N	2	\N	\N	\N
Pg907G2m	\N	\N	2	\N	\N	\N
Ut043G2m	\N	\N	2	\N	\N	\N
Qq955G2m	\N	\N	2	\N	\N	\N
Ld516G2m	\N	\N	2	\N	\N	\N
Jd924G2m	\N	\N	2	\N	\N	\N
Kb167G2m	\N	\N	2	\N	\N	\N
Ti478G2m	\N	\N	2	\N	\N	\N
Fr545G2m	\N	\N	2	\N	\N	\N
Ct571G2m	\N	\N	2	\N	\N	\N
Ux844G2m	\N	\N	2	\N	\N	\N
Ow163G2m	\N	\N	2	\N	\N	\N
Bc245G2m	\N	\N	2	\N	\N	\N
Kn473G2m	\N	\N	2	\N	\N	\N
Cp984G2m	\N	\N	2	\N	\N	\N
Ix576G2m	\N	\N	2	\N	\N	\N
Ip215G2m	\N	\N	2	\N	\N	\N
Ce403G2m	\N	\N	2	\N	\N	\N
Ty651G2m	\N	\N	2	\N	\N	\N
Qa082G2m	\N	\N	2	\N	\N	\N
Uy669G2m	\N	\N	2	\N	\N	\N
Jp824G2m	\N	\N	2	\N	\N	\N
Od173G2m	\N	\N	2	\N	\N	\N
Tj887G2m	\N	\N	2	\N	\N	\N
Yc823G2m	\N	\N	2	\N	\N	\N
Kl126G2m	\N	\N	2	\N	\N	\N
La830G2m	\N	\N	2	\N	\N	\N
Ic504G2m	\N	\N	2	\N	\N	\N
Kr019G2m	\N	\N	2	\N	\N	\N
Ms614G2m	\N	\N	2	\N	\N	\N
Xe792G2m	\N	\N	2	\N	\N	\N
Ab184G2m	\N	\N	2	\N	\N	\N
Nf579G2m	\N	\N	2	\N	\N	\N
Jv532G2m	\N	\N	2	\N	\N	\N
Jf499G6m	\N	\N	6	\N	\N	\N
Ox579G6m	\N	\N	6	\N	\N	\N
Ge764G6m	\N	\N	6	\N	\N	\N
Ws050G6m	\N	\N	6	\N	\N	\N
Hm059G6m	\N	\N	6	\N	\N	\N
Zb321G6m	\N	\N	6	\N	\N	\N
Pe414G6m	\N	\N	6	\N	\N	\N
Pd190G6m	\N	\N	6	\N	\N	\N
Ta892G6m	\N	\N	6	\N	\N	\N
Ee187G6m	\N	\N	6	\N	\N	\N
Py969G6m	\N	\N	6	\N	\N	\N
Gi052G6m	\N	\N	6	\N	\N	\N
Ab401G6m	\N	\N	6	\N	\N	\N
Zr131G6m	\N	\N	6	\N	\N	\N
Mg525G6m	\N	\N	6	\N	\N	\N
No552G6m	\N	\N	6	\N	\N	\N
Ly181G6m	\N	\N	6	\N	\N	\N
Ka691G6m	\N	\N	6	\N	\N	\N
Hi150G6m	\N	\N	6	\N	\N	\N
Mq798G6m	\N	\N	6	\N	\N	\N
Pr877G6m	\N	\N	6	\N	\N	\N
Vx474G6m	\N	\N	6	\N	\N	\N
Os995G6m	\N	\N	6	\N	\N	\N
Rw351G6m	\N	\N	6	\N	\N	\N
Vq759G6m	\N	\N	6	\N	\N	\N
Ri839G6m	\N	\N	6	\N	\N	\N
Ep853G6m	\N	\N	6	\N	\N	\N
Eo356G6m	\N	\N	6	\N	\N	\N
Ns623G6m	\N	\N	6	\N	\N	\N
Hp981G6m	\N	\N	6	\N	\N	\N
Za836G6m	\N	\N	6	\N	\N	\N
Ul524G6m	\N	\N	6	\N	\N	\N
Nu334G6m	\N	\N	6	\N	\N	\N
Sd728G6m	\N	\N	6	\N	\N	\N
Cw493G6m	\N	\N	6	\N	\N	\N
Kh051G6m	\N	\N	6	\N	\N	\N
Po659G6m	\N	\N	6	\N	\N	\N
Vm662G6m	\N	\N	6	\N	\N	\N
Um721G6m	\N	\N	6	\N	\N	\N
Nq302G6m	\N	\N	6	\N	\N	\N
Nx210G6m	\N	\N	6	\N	\N	\N
Ic464G6m	\N	\N	6	\N	\N	\N
Zd261G6m	\N	\N	6	\N	\N	\N
Bs536G6m	\N	\N	6	\N	\N	\N
Ii193G6m	\N	\N	6	\N	\N	\N
Gx107G6m	\N	\N	6	\N	\N	\N
Wn073G6m	\N	\N	6	\N	\N	\N
Tz742G6m	\N	\N	6	\N	\N	\N
Jn663G6m	\N	\N	6	\N	\N	\N
Lm758G6m	\N	\N	6	\N	\N	\N
Ji648G6m	\N	\N	6	\N	\N	\N
Zs394G6m	\N	\N	6	\N	\N	\N
Vm591G6m	\N	\N	6	\N	\N	\N
Dc267G6m	\N	\N	6	\N	\N	\N
Kn555G6m	\N	\N	6	\N	\N	\N
Om898G6m	\N	\N	6	\N	\N	\N
Ce976G6m	\N	\N	6	\N	\N	\N
Dv359G6m	\N	\N	6	\N	\N	\N
Fd533G6m	\N	\N	6	\N	\N	\N
Ne401G6m	\N	\N	6	\N	\N	\N
Tm949G6m	\N	\N	6	\N	\N	\N
Rg873G6m	\N	\N	6	\N	\N	\N
Ud225G6m	\N	\N	6	\N	\N	\N
Zb001G6m	\N	\N	6	\N	\N	\N
Tu877G6m	\N	\N	6	\N	\N	\N
Fx971G6m	\N	\N	6	\N	\N	\N
Sy912G6m	\N	\N	6	\N	\N	\N
Rs707G6m	\N	\N	6	\N	\N	\N
Lh232G6m	\N	\N	6	\N	\N	\N
Hn189G6m	\N	\N	6	\N	\N	\N
Ku708G6m	\N	\N	6	\N	\N	\N
Oo370G6m	\N	\N	6	\N	\N	\N
Xs412G6m	\N	\N	6	\N	\N	\N
Dv109G6m	\N	\N	6	\N	\N	\N
Br330G6m	\N	\N	6	\N	\N	\N
Eb451G6m	\N	\N	6	\N	\N	\N
Bg723G6m	\N	\N	6	\N	\N	\N
Ab909G6m	\N	\N	6	\N	\N	\N
Dm609G6m	\N	\N	6	\N	\N	\N
Ks007G6m	\N	\N	6	\N	\N	\N
Xl997G6m	\N	\N	6	\N	\N	\N
Gw092G6m	\N	\N	6	\N	\N	\N
Eb294G6m	\N	\N	6	\N	\N	\N
Cj408G6m	\N	\N	6	\N	\N	\N
Gl643G6m	\N	\N	6	\N	\N	\N
Ux285G6m	\N	\N	6	\N	\N	\N
Wn310G6m	\N	\N	6	\N	\N	\N
Ue709G6m	\N	\N	6	\N	\N	\N
Rz754G6m	\N	\N	6	\N	\N	\N
Dz967G6m	\N	\N	6	\N	\N	\N
Es789G6m	\N	\N	6	\N	\N	\N
Jq421G6m	\N	\N	6	\N	\N	\N
Lk315G6m	\N	\N	6	\N	\N	\N
Ht540G6m	\N	\N	6	\N	\N	\N
Lw805G6m	\N	\N	6	\N	\N	\N
Ga153G6m	\N	\N	6	\N	\N	\N
Ir273G6m	\N	\N	6	\N	\N	\N
Kr517G6m	\N	\N	6	\N	\N	\N
Ce551G6m	\N	\N	6	\N	\N	\N
Lx332G6m	\N	\N	6	\N	\N	\N
Tc882G6m	\N	\N	6	\N	\N	\N
Pu701G6m	\N	\N	6	\N	\N	\N
Wn450G6m	\N	\N	6	\N	\N	\N
Uc328G6m	\N	\N	6	\N	\N	\N
Fo933G6m	\N	\N	6	\N	\N	\N
On463G6m	\N	\N	6	\N	\N	\N
Vg456G6m	\N	\N	6	\N	\N	\N
Xi580G6m	\N	\N	6	\N	\N	\N
Rz865G6m	\N	\N	6	\N	\N	\N
Hc430G6m	\N	\N	6	\N	\N	\N
By642G6m	\N	\N	6	\N	\N	\N
Jk345G6m	\N	\N	6	\N	\N	\N
Od185G6m	\N	\N	6	\N	\N	\N
Nt959G6m	\N	\N	6	\N	\N	\N
Gw710G6m	\N	\N	6	\N	\N	\N
Vm298G6m	\N	\N	6	\N	\N	\N
Do407G6m	\N	\N	6	\N	\N	\N
Eo899G6m	\N	\N	6	\N	\N	\N
Pt311G6m	\N	\N	6	\N	\N	\N
Jo706G6m	\N	\N	6	\N	\N	\N
Cb800G6m	\N	\N	6	\N	\N	\N
Re057G6m	\N	\N	6	\N	\N	\N
Iq985G6m	\N	\N	6	\N	\N	\N
Gq523G6m	\N	\N	6	\N	\N	\N
Gi466G6m	\N	\N	6	\N	\N	\N
Yk641G6m	\N	\N	6	\N	\N	\N
Zn657G6m	\N	\N	6	\N	\N	\N
Yy465G6m	\N	\N	6	\N	\N	\N
Mm767G6m	\N	\N	6	\N	\N	\N
Ka138G6m	\N	\N	6	\N	\N	\N
Tq144G6m	\N	\N	6	\N	\N	\N
Vn190G6m	\N	\N	6	\N	\N	\N
Mo667G6m	\N	\N	6	\N	\N	\N
Ht735G6m	\N	\N	6	\N	\N	\N
Fh272G6m	\N	\N	6	\N	\N	\N
Li848G6m	\N	\N	6	\N	\N	\N
Tz657G6m	\N	\N	6	\N	\N	\N
Fa279G6m	\N	\N	6	\N	\N	\N
Dc269G6m	\N	\N	6	\N	\N	\N
Kx540G6m	\N	\N	6	\N	\N	\N
Bp188G6m	\N	\N	6	\N	\N	\N
Lc922G6m	\N	\N	6	\N	\N	\N
Ya714G6m	\N	\N	6	\N	\N	\N
My193G6m	\N	\N	6	\N	\N	\N
Og370G6m	\N	\N	6	\N	\N	\N
Ws952G6m	\N	\N	6	\N	\N	\N
Bn730G6m	\N	\N	6	\N	\N	\N
Eo677G6m	\N	\N	6	\N	\N	\N
Re142G6m	\N	\N	6	\N	\N	\N
Zm451G6m	\N	\N	6	\N	\N	\N
Nk453G6m	\N	\N	6	\N	\N	\N
Wi036G6m	\N	\N	6	\N	\N	\N
Og690G6m	\N	\N	6	\N	\N	\N
Du489G6m	\N	\N	6	\N	\N	\N
Ib061G6m	\N	\N	6	\N	\N	\N
Pz855G6m	\N	\N	6	\N	\N	\N
Bw549G6m	\N	\N	6	\N	\N	\N
Uh537G6m	\N	\N	6	\N	\N	\N
Ze562G6m	\N	\N	6	\N	\N	\N
Om329G6m	\N	\N	6	\N	\N	\N
Qq748G6m	\N	\N	6	\N	\N	\N
Jk072G6m	\N	\N	6	\N	\N	\N
Mf579G6m	\N	\N	6	\N	\N	\N
Fl650G6m	\N	\N	6	\N	\N	\N
Ta997G6m	\N	\N	6	\N	\N	\N
Cm967G6m	\N	\N	6	\N	\N	\N
Zw069G6m	\N	\N	6	\N	\N	\N
Mu686G6m	\N	\N	6	\N	\N	\N
Ni787G6m	\N	\N	6	\N	\N	\N
Om145G6m	\N	\N	6	\N	\N	\N
Io680G6m	\N	\N	6	\N	\N	\N
Wd936G6m	\N	\N	6	\N	\N	\N
Id658G6m	\N	\N	6	\N	\N	\N
Cp071G6m	\N	\N	6	\N	\N	\N
Se125G6m	\N	\N	6	\N	\N	\N
Qa898G6m	\N	\N	6	\N	\N	\N
Wg756G6m	\N	\N	6	\N	\N	\N
Ij524G6m	\N	\N	6	\N	\N	\N
St539G6m	\N	\N	6	\N	\N	\N
Jz360G6m	\N	\N	6	\N	\N	\N
Ge697G6m	\N	\N	6	\N	\N	\N
Po975G6m	\N	\N	6	\N	\N	\N
Pb484G6m	\N	\N	6	\N	\N	\N
Rl162G6m	\N	\N	6	\N	\N	\N
Ce730G6m	\N	\N	6	\N	\N	\N
Hz392G6m	\N	\N	6	\N	\N	\N
Tj182G6m	\N	\N	6	\N	\N	\N
Qd646G6m	\N	\N	6	\N	\N	\N
Pc415G6m	\N	\N	6	\N	\N	\N
Jm650G6m	\N	\N	6	\N	\N	\N
Nc269G6m	\N	\N	6	\N	\N	\N
Or494G6m	\N	\N	6	\N	\N	\N
Ou400G6m	\N	\N	6	\N	\N	\N
Ix783G6m	\N	\N	6	\N	\N	\N
Cz841G6m	\N	\N	6	\N	\N	\N
Jb966G6m	\N	\N	6	\N	\N	\N
Iq990G6m	\N	\N	6	\N	\N	\N
Zk942G6m	\N	\N	6	\N	\N	\N
Oq841G6m	\N	\N	6	\N	\N	\N
Qw110G6m	\N	\N	6	\N	\N	\N
Jo785G6m	\N	\N	6	\N	\N	\N
Zp785G6m	\N	\N	6	\N	\N	\N
Pf575G6m	\N	\N	6	\N	\N	\N
Qb979G6m	\N	\N	6	\N	\N	\N
No347G6m	\N	\N	6	\N	\N	\N
Bv151G6m	\N	\N	6	\N	\N	\N
Qt110G6m	\N	\N	6	\N	\N	\N
Db295G6m	\N	\N	6	\N	\N	\N
Jd493G6m	\N	\N	6	\N	\N	\N
Qi530G6m	\N	\N	6	\N	\N	\N
Id430G6m	\N	\N	6	\N	\N	\N
Sf225G6m	\N	\N	6	\N	\N	\N
Ai735G6m	\N	\N	6	\N	\N	\N
Ur358G6m	\N	\N	6	\N	\N	\N
Cg372G6m	\N	\N	6	\N	\N	\N
Ej620G6m	\N	\N	6	\N	\N	\N
Ne383G6m	\N	\N	6	\N	\N	\N
Fn002G6m	\N	\N	6	\N	\N	\N
Ph672G6m	\N	\N	6	\N	\N	\N
Zs584G6m	\N	\N	6	\N	\N	\N
Lk302G6m	\N	\N	6	\N	\N	\N
Ic481G6m	\N	\N	6	\N	\N	\N
Tl571G6m	\N	\N	6	\N	\N	\N
Kv225G6m	\N	\N	6	\N	\N	\N
Ir307G6m	\N	\N	6	\N	\N	\N
Sx951G6m	\N	\N	6	\N	\N	\N
Wf347G6m	\N	\N	6	\N	\N	\N
Zu782G6m	\N	\N	6	\N	\N	\N
Sv084G6m	\N	\N	6	\N	\N	\N
Af491G6m	\N	\N	6	\N	\N	\N
Hn377G6m	\N	\N	6	\N	\N	\N
Ae741G6m	\N	\N	6	\N	\N	\N
Fw817G6m	\N	\N	6	\N	\N	\N
Cg281G6m	\N	\N	6	\N	\N	\N
Ps764G6m	\N	\N	6	\N	\N	\N
Ut250G6m	\N	\N	6	\N	\N	\N
Yw495G6m	\N	\N	6	\N	\N	\N
Lz516G6m	\N	\N	6	\N	\N	\N
Kh845G6m	\N	\N	6	\N	\N	\N
Au683G6m	\N	\N	6	\N	\N	\N
Cj472G6m	\N	\N	6	\N	\N	\N
Sf124G6m	\N	\N	6	\N	\N	\N
Mo672G6m	\N	\N	6	\N	\N	\N
Lb473G6m	\N	\N	6	\N	\N	\N
Bp714G6m	\N	\N	6	\N	\N	\N
Rf930G6m	\N	\N	6	\N	\N	\N
Us789G6m	\N	\N	6	\N	\N	\N
Yx636G6m	\N	\N	6	\N	\N	\N
Ps208G6m	\N	\N	6	\N	\N	\N
Mm285G6m	\N	\N	6	\N	\N	\N
Xs923G6m	\N	\N	6	\N	\N	\N
Ag553G6m	\N	\N	6	\N	\N	\N
Kh399G6m	\N	\N	6	\N	\N	\N
Um637G6m	\N	\N	6	\N	\N	\N
Rv828G6m	\N	\N	6	\N	\N	\N
Dq254G6m	\N	\N	6	\N	\N	\N
It926G6m	\N	\N	6	\N	\N	\N
Wr905G6m	\N	\N	6	\N	\N	\N
Nz869G6m	\N	\N	6	\N	\N	\N
Hx703G6m	\N	\N	6	\N	\N	\N
Op898G6m	\N	\N	6	\N	\N	\N
La176G6m	\N	\N	6	\N	\N	\N
Um973G6m	\N	\N	6	\N	\N	\N
Il951G6m	\N	\N	6	\N	\N	\N
Qw243G6m	\N	\N	6	\N	\N	\N
Xd730G6m	\N	\N	6	\N	\N	\N
Bw686G6m	\N	\N	6	\N	\N	\N
Ny011G6m	\N	\N	6	\N	\N	\N
Ju091G6m	\N	\N	6	\N	\N	\N
Sf841G6m	\N	\N	6	\N	\N	\N
Oi096G6m	\N	\N	6	\N	\N	\N
Hn177G6m	\N	\N	6	\N	\N	\N
Zr743G6m	\N	\N	6	\N	\N	\N
Rv699G6m	\N	\N	6	\N	\N	\N
Cn160G6m	\N	\N	6	\N	\N	\N
Fg578G6m	\N	\N	6	\N	\N	\N
Ti468G6m	\N	\N	6	\N	\N	\N
Hu482G6m	\N	\N	6	\N	\N	\N
Sc139G6m	\N	\N	6	\N	\N	\N
Ml722G6m	\N	\N	6	\N	\N	\N
Nx268G6m	\N	\N	6	\N	\N	\N
Oq067G6m	\N	\N	6	\N	\N	\N
Oa049G6m	\N	\N	6	\N	\N	\N
Ke210G6m	\N	\N	6	\N	\N	\N
Pv653G6m	\N	\N	6	\N	\N	\N
Ry818G6m	\N	\N	6	\N	\N	\N
Bj359G6m	\N	\N	6	\N	\N	\N
Db196G6m	\N	\N	6	\N	\N	\N
Kc927G6m	\N	\N	6	\N	\N	\N
Pe468G6m	\N	\N	6	\N	\N	\N
Cj344G6m	\N	\N	6	\N	\N	\N
Ps930G6m	\N	\N	6	\N	\N	\N
Zq071G6m	\N	\N	6	\N	\N	\N
Ru823G6m	\N	\N	6	\N	\N	\N
Hs835G6m	\N	\N	6	\N	\N	\N
Da377G6m	\N	\N	6	\N	\N	\N
Gt471G6m	\N	\N	6	\N	\N	\N
Bb765G6m	\N	\N	6	\N	\N	\N
Hc065G6m	\N	\N	6	\N	\N	\N
Gi004G6m	\N	\N	6	\N	\N	\N
Hb920G1y	\N	\N	12	\N	\N	\N
Dt508G1y	\N	\N	12	\N	\N	\N
Dp345G1y	\N	\N	12	\N	\N	\N
Kw253G1y	\N	\N	12	\N	\N	\N
Bm024G1y	\N	\N	12	\N	\N	\N
Cm842G1y	\N	\N	12	\N	\N	\N
Sz286G1y	\N	\N	12	\N	\N	\N
Bw250G1y	\N	\N	12	\N	\N	\N
Hj276G1y	\N	\N	12	\N	\N	\N
Tm617G1y	\N	\N	12	\N	\N	\N
Nf187G1y	\N	\N	12	\N	\N	\N
Do483G1y	\N	\N	12	\N	\N	\N
Gq360G1y	\N	\N	12	\N	\N	\N
Ix152G1y	\N	\N	12	\N	\N	\N
Ov626G1y	\N	\N	12	\N	\N	\N
Pl131G1y	\N	\N	12	\N	\N	\N
Mu006G1y	\N	\N	12	\N	\N	\N
Oa236G1y	\N	\N	12	\N	\N	\N
Rs413G1y	\N	\N	12	\N	\N	\N
He640G1y	\N	\N	12	\N	\N	\N
Wp215G1y	\N	\N	12	\N	\N	\N
Lg330G1y	\N	\N	12	\N	\N	\N
Sd473G1y	\N	\N	12	\N	\N	\N
Om655G1y	\N	\N	12	\N	\N	\N
Iq827G1y	\N	\N	12	\N	\N	\N
Jo833G1y	\N	\N	12	\N	\N	\N
Bf376G1y	\N	\N	12	\N	\N	\N
Ld096G1y	\N	\N	12	\N	\N	\N
Rl054G1y	\N	\N	12	\N	\N	\N
Qm772G1y	\N	\N	12	\N	\N	\N
Lg636G1y	\N	\N	12	\N	\N	\N
Rz633G1y	\N	\N	12	\N	\N	\N
Qp339G1y	\N	\N	12	\N	\N	\N
Rt308G1y	\N	\N	12	\N	\N	\N
Sw899G1y	\N	\N	12	\N	\N	\N
Ff836G1y	\N	\N	12	\N	\N	\N
Wz925G1y	\N	\N	12	\N	\N	\N
Hn477G1y	\N	\N	12	\N	\N	\N
Ko563G1y	\N	\N	12	\N	\N	\N
Bv346G1y	\N	\N	12	\N	\N	\N
Ys157G1y	\N	\N	12	\N	\N	\N
Ii114G1y	\N	\N	12	\N	\N	\N
Ur305G1y	\N	\N	12	\N	\N	\N
Kg438G1y	\N	\N	12	\N	\N	\N
Ar060G1y	\N	\N	12	\N	\N	\N
Qa370G1y	\N	\N	12	\N	\N	\N
Kk838G1y	\N	\N	12	\N	\N	\N
Yb027G1y	\N	\N	12	\N	\N	\N
Sa202G1y	\N	\N	12	\N	\N	\N
Nd705G1y	\N	\N	12	\N	\N	\N
Xt048G1y	\N	\N	12	\N	\N	\N
Zu201G1y	\N	\N	12	\N	\N	\N
Nf828G1y	\N	\N	12	\N	\N	\N
Xu421G1y	\N	\N	12	\N	\N	\N
Ly983G1y	\N	\N	12	\N	\N	\N
Zx801G1y	\N	\N	12	\N	\N	\N
Wz894G1y	\N	\N	12	\N	\N	\N
Uf969G1y	\N	\N	12	\N	\N	\N
Jt851G1y	\N	\N	12	\N	\N	\N
Ei464G1y	\N	\N	12	\N	\N	\N
Vf027G1y	\N	\N	12	\N	\N	\N
Qs565G1y	\N	\N	12	\N	\N	\N
Dm871G1y	\N	\N	12	\N	\N	\N
Zd176G1y	\N	\N	12	\N	\N	\N
Rx578G1y	\N	\N	12	\N	\N	\N
Np793G1y	\N	\N	12	\N	\N	\N
Ws621G1y	\N	\N	12	\N	\N	\N
Kq209G1y	\N	\N	12	\N	\N	\N
Ft898G1y	\N	\N	12	\N	\N	\N
Eq031G1y	\N	\N	12	\N	\N	\N
Tc649G1y	\N	\N	12	\N	\N	\N
Um380G1y	\N	\N	12	\N	\N	\N
Jx441G1y	\N	\N	12	\N	\N	\N
Dw379G1y	\N	\N	12	\N	\N	\N
Qj900G1y	\N	\N	12	\N	\N	\N
Ms854G1y	\N	\N	12	\N	\N	\N
Bb534G1y	\N	\N	12	\N	\N	\N
Wn179G1y	\N	\N	12	\N	\N	\N
Zg650G1y	\N	\N	12	\N	\N	\N
Dw926G1y	\N	\N	12	\N	\N	\N
Ez506G1y	\N	\N	12	\N	\N	\N
Ha500G1y	\N	\N	12	\N	\N	\N
Un374G1y	\N	\N	12	\N	\N	\N
Kx939G1y	\N	\N	12	\N	\N	\N
Vv084G1y	\N	\N	12	\N	\N	\N
Re812G1y	\N	\N	12	\N	\N	\N
Cc590G1y	\N	\N	12	\N	\N	\N
Pe987G1y	\N	\N	12	\N	\N	\N
Rq506G1y	\N	\N	12	\N	\N	\N
Sa025G1y	\N	\N	12	\N	\N	\N
Fh639G1y	\N	\N	12	\N	\N	\N
No620G1y	\N	\N	12	\N	\N	\N
Cd457G1y	\N	\N	12	\N	\N	\N
Hk311G1y	\N	\N	12	\N	\N	\N
Pw132G1y	\N	\N	12	\N	\N	\N
Zq297G1y	\N	\N	12	\N	\N	\N
Hx328G1y	\N	\N	12	\N	\N	\N
Ju210G1y	\N	\N	12	\N	\N	\N
Oq516G1y	\N	\N	12	\N	\N	\N
Lo460G1y	\N	\N	12	\N	\N	\N
=======
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.product (id, product_name, product_type, image_url, active, vat, product_description, created_at, updated_at) FROM stdin;
<<<<<<< HEAD
1	กรีนโอ๊ค (Green Oak Lettuce)	Vegetable	Green_Oak.jpg	t	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
2	เรดโอ๊ค (Red Oak Lettuce)	Vegetable	Red_Oak.jpg	t	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
3	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)	Vegetable	Filet.jpg	t	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
4	เรดโครอล (Red Coral Lettuce)	Vegetable	Red_Coral.jpg	t	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
5	กรีนคอส (Cos Lettuce)	Vegetable	Cos.jpg	t	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
6	หัวไช้เท้า (Radish)	Vegetable	Radish.jpg	t	f		\N	\N
7	แครอท (Carrot)	Vegetable	Carrot.jpg	t	f		\N	\N
25	น้ำสลัดราสเบอรี่ (Raspberry Vinaigrette)	Food_Product	R_Vinaigrette.jpg	f	t	น้ำสลัดชนิดเข้มข้น ด้วยเนื้อราสเบอรี่และ extra vergin olive oil เทราดบนสลัด หรือทำเป็น Dip จิ้มกับแครอท แตงกวา เป็นอาหารสุขภาพผักทุกชนิด	\N	\N
9	แตงกวาญี่ปุ่น (Japanese Cucumber)	Vegetable	Jap_Cucumber.jpg	t	f	แตงกวาญี่ปุ่นจากสวนคุณไนท์	\N	\N
10	ขิง (Ginger)	Vegetable	Ginger.jpg	t	f	จากสวนคุณชาตินิยม	\N	\N
18	อะโวคาโด พันธุ์แฮส (Hass Avocado)	Fruit	Avocado.jpg	f	f	จากสวนนางบัวคำ	\N	\N
12	คะน้า ฮ่องกง (Hongkong Kale)	Vegetable	HK_Kale.jpg	t	f	จากสวนคุณแอ้	\N	\N
13	มะแขว่นหอมแห้ง (Ma-khwaen)	Vegetable	Makhwaen.jpg	t	f	จากสวนนายตาล	\N	\N
14	มะเขือเทศ โทมัส (Thomas Tomato)	Fruit	Thomas.jpg	t	f	จากสวนคุณเบิ้ม	\N	\N
15	ฟักทองญี่ปุ่น (Japanese Pumpkin)	Fruit	Jap_Pumpkin.jpg	t	f	จากสวนคุณชาตินิยม	\N	\N
16	ฟักทองมินิ (Mini Pumpkin)	Fruit	Mini_Pumpkin.jpg	t	f	จากสวนคุณชาตินิยม	\N	\N
17	ฟักทองใหญ่ (Pumpkin)	Fruit	Big_Pumpkin.jpg	t	f	จากสวนคุณชาตินิยม	\N	\N
19	พริกหวาน3สี (Bell pepper)	Fruit	Bell.jpg	t	f	จากสวนนางบัวคำ	\N	\N
11	เคล (Kale)	Vegetable	Curled_Kale.jpg	f	f	จากสวนคุณแอ้	\N	\N
22	คุกกี้ไต้หวัน ไส้ราสเบอรี่ (Taiwanese Raspberry Tart)	Food_Product	T_Tart.jpg	t	t	อัดแน่นด้วยเนื้อราสเบอรี่กวนเปรี้ยวๆหวานๆหอมกลิ่นเนยแท้ๆ	\N	\N
23	คุกกี้บัตเตอร์ มิกซ์เบอรี่ (Mixed Berries Butter Cookies)	Food_Product	M_Cookie.jpg	t	t	คุกกี้เนยแท้ ผสมเนื้อราสเบอรี่และแบล็คเบอรี่อบแห้ง เนื้อแน่นหนึบเต็มๆคำ	\N	\N
24	คุกกี้ราสเบอรี่ (Raspberry Cookie)	Food_Product	R_Cookie.jpg	t	t	คุกกี้เนยแท้ท๊อปด้วย แยมราสเบอรี่กวนสด รสชาติเปรี้ยวหวานเข้มข้น	\N	\N
21	แบล็คเบอรี่คอมบูชะ (Blackberry Kombucha)	Food_Product	B_Kom.jpg	f	f	คอมบูชะแบล็คเบอรี่ ชาหมักกับผลแบล็คเบอรี่สดช่วยปรับสมดุลย์ในลำไส้ด้วย Probiotics เพิ่มจุลินทรีย์ชนิดดี ทำให้ขับถ่ายปกติ อุดมด้วยสารต้านอนุมูลอิสระ ช่วยเสริมสร้างภูมิคุ้มกัน ให้กับร่างกาย	\N	\N
26	ราสเบอรี่ สเปรด (Raspberry Spread)	Food_Product	Ras_Spread.jpg	t	t	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
27	เลมอน สเปรด (Lemon Spread)	Food_Product	L_Spread.jpg	t	t	แยมเลมอนทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
28	แบล็คเบอรี่ สเปรด (Blackberry Spread)	Food_Product	B_Spread.jpg	t	t	แยมแบล็คเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
8	มะเขือม่วง (Black Beauty Eggplant)	Vegetable	Eggplant.jpg	f	f	จากสวนนางบัวคำ	\N	\N
29	โรสเบอรี่ สเปรด (Roseberry Spread)	Food_Product	Rose_Spread.jpg	t	t	แยมราสเบอรี่ผสมกลีบกุหลาบมอญสุโขทัย ปลูกแบบออร์แกนิค ใช้ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
30	แพชชั่นฟรุต สเปรด (Passion Fruit Spread)	Food_Product	P_Spread.jpg	t	t	แยมเสาวรสทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
31	ราสเบอรี่ซอส (Raspberry Sauce)	Food_Product	R_Sauce.jpg	t	t	ซอสราสเบอรี่สำหรับราดบนไอศกรีม พุดดิ้ง โยเกิร์ต ขนมเค้ก ขนมหวานต่างๆ เนื้อซอสเข้มข้น ราสเบอรี่เต็มขวด	\N	\N
32	แบล็คเบอรี่ซอส (Blackberry Sauce)	Food_Product	B_Sauce.jpg	t	t	ซอสแบล็คเบอรี่ สำหรับราดบนไอศกรีม พุดดิ้ง โยเกิร์ต ขนมเค้ก ขนมหวานต่างๆ เนื้อซอสเข้มข้น จากแบล็คเบอรี่แท้ๆ	\N	\N
33	ซอสเสาวรส (Passion Fruit Sauce)	Food_Product	P_Sauce.jpg	t	t	ซอสเสาวรส สำหรับราดบนไอศกรีม พุดดิ้ง โยเกิร์ต ขนมเค้ก ขนมหวานต่างๆ เนื้อซอสเข้มข้น เสาวรสเปรี้ยวหวาน	\N	\N
34	มิกซ์เบอรี่และผักดอง (Mixed Berries & Veggie Pickles)	Food_Product	MV_Pic.jpg	t	t	ผลราสเบอรี่และแบล็คเบอรี่สดๆจากสวน นำมาดองกับผักสดกรอบที่คัดสรรมาอย่างดี ทั้งแตงกวาญี่ปุ่น แครอทและหัวไชเท้า ด้วยสูตรน้ำดองรสกลมกล่อมจากตำรับดั้งเดิม	\N	\N
35	มิกซ์เบอรี่ดอง (Mixed Berries Pickles)	Food_Product	MB_Pic.jpg	t	t	ผลราสเบอรี่และแบล็คเบอรี่สดๆจากสวน ผสานกับน้ำดองรสกลมกล่อมจากตำรับดั้งเดิม ได้ผลไม้ดองรสเปรี้ยวเค็มหวานสีสวยจากผลไม้แท้ๆ	\N	\N
37	ครีมทามือ กลิ่นราสเบอรี่ (Raspberry Hand Cream)	Non_Food_Product	Hand_Cream.jpg	t	t	ครีมบำรุงผิว สำหรับทามือ กลิ่นราสเบอรี่ ช่วยให้มือชุ่มชื้น ไม่แห้งกระด้าง	\N	\N
38	เจลบำรุงมือ (Raspberry Hand)	Non_Food_Product	Hand_Gel.jpg	t	t	เจลบำรุงมือ กลิ่นราสเบอรี่ ช่วยให้มือชุ่มชื้น ไม่แห้งกระด้าง	\N	\N
39	สบู่ (Soap)	Non_Food_Product	Soap.jpg	t	t	สบู่สมุนไพร ด้วยคุณค่าสารสกัดสมุนไพร ช่วยปรับผิวให้ขาว สะอาด เนียนใส นุ่ม ชุ่มชื่น มีสุขภาพดี ผิวใส กลิ่นกายหอม ลดกลิ่นตัว กลิ่นเหงื่อ	\N	\N
20	ราสเบอรี่คอมบูชะ (Raspberry Kombucha)	Food_Product	R_Kom.jpg	f	t	คอมบูชะราสเบอรี่ ชาหมักกับผลราสเบอรี่สดช่วยปรับสมดุลย์ในลำไส้ด้วย Probiotics เพิ่มจุลินทรีย์ชนิดดี ทำให้ขับถ่ายปกติ อุดมด้วยสารต้านอนุมูลอิสระ ช่วยเสริมสร้างภูมิคุ้มกัน ให้กับร่างกาย	\N	\N
36	ดอกกุหลาบ (Rose)	Non_Food_Product	Rose.jpg	f	t	ดอกกุหลาบคละสี	\N	\N
=======
156	ราสเบอรี่ สเปรด (Raspberry Spread)	Food_Product	Ras_Spread.jpg	t	t	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
132	เรดโอ๊ค (Red Oak Lettuce)	Vegetable	Red_Oak.jpg	f	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
133	ฟิลเลย์ ไอซ์เบิร์ก (Frillice Iceberg Lettuce)	Vegetable	Filet.jpg	f	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
134	เรดโครอล (Red Coral Lettuce)	Vegetable	Red_Coral.jpg	f	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
135	กรีนคอส (Cos Lettuce)	Vegetable	Cos.jpg	f	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
136	หัวไช้เท้า (Radish)	Vegetable	Radish.jpg	f	f		\N	\N
137	แครอท (Carrot)	Vegetable	Carrot.jpg	f	f		\N	\N
138	มะเขือม่วง (Black Beauty Eggplant)	Vegetable	Eggplant.jpg	f	f	จากสวนนางบัวคำ	\N	\N
139	แตงกวาญี่ปุ่น (Japanese Cucumber)	Vegetable	Jap_Cucumber.jpg	f	f	แตงกวาญี่ปุ่นจากสวนคุณไนท์	\N	\N
140	ขิง (Ginger)	Vegetable	Ginger.jpg	f	f	จากสวนคุณชาตินิยม	\N	\N
141	เคล (Kale)	Vegetable	Curled_Kale.jpg	f	f	จากสวนคุณแอ้	\N	\N
142	คะน้า ฮ่องกง (Hongkong Kale)	Vegetable	HK_Kale.jpg	f	f	จากสวนคุณแอ้	\N	\N
143	มะแขว่นหอมแห้ง (Ma-khwaen)	Vegetable	Makhwaen.jpg	f	f	จากสวนนายตาล	\N	\N
145	ฟักทองญี่ปุ่น (Japanese Pumpkin)	Fruit	Jap_Pumpkin.jpg	f	f	จากสวนคุณชาตินิยม	\N	\N
146	ฟักทองมินิ (Mini Pumpkin)	Fruit	Mini_Pumpkin.jpg	f	f	จากสวนคุณชาตินิยม	\N	\N
147	ฟักทองใหญ่ (Pumpkin)	Fruit	Big_Pumpkin.jpg	f	f	จากสวนคุณชาตินิยม	\N	\N
148	อะโวคาโด พันธุ์แฮส (Hass Avocado)	Fruit	Avocado.jpg	f	f	จากสวนนางบัวคำ	\N	\N
149	พริกหวาน3สี (Bell pepper)	Fruit	Bell.jpg	f	f	จากสวนนางบัวคำ	\N	\N
150	ราสเบอรี่คอมบูชะ (Raspberry Kombucha)	Food_Product	R_Kom.jpg	f	t	คอมบูชะราสเบอรี่ ชาหมักกับผลราสเบอรี่สดช่วยปรับสมดุลย์ในลำไส้ด้วย Probiotics เพิ่มจุลินทรีย์ชนิดดี ทำให้ขับถ่ายปกติ อุดมด้วยสารต้านอนุมูลอิสระ ช่วยเสริมสร้างภูมิคุ้มกัน ให้กับร่างกาย	\N	\N
151	แบล็คเบอรี่คอมบูชะ (Blackberry Kombucha)	Food_Product	B_Kom.jpg	f	f	คอมบูชะแบล็คเบอรี่ ชาหมักกับผลแบล็คเบอรี่สดช่วยปรับสมดุลย์ในลำไส้ด้วย Probiotics เพิ่มจุลินทรีย์ชนิดดี ทำให้ขับถ่ายปกติ อุดมด้วยสารต้านอนุมูลอิสระ ช่วยเสริมสร้างภูมิคุ้มกัน ให้กับร่างกาย	\N	\N
152	คุกกี้ไต้หวัน ไส้ราสเบอรี่ (Taiwanese Raspberry Tart)	Food_Product	T_Tart.jpg	f	t	อัดแน่นด้วยเนื้อราสเบอรี่กวนเปรี้ยวๆหวานๆหอมกลิ่นเนยแท้ๆ	\N	\N
153	คุกกี้บัตเตอร์ มิกซ์เบอรี่ (Mixed Berries Butter Cookies)	Food_Product	M_Cookie.jpg	f	t	คุกกี้เนยแท้ ผสมเนื้อราสเบอรี่และแบล็คเบอรี่อบแห้ง เนื้อแน่นหนึบเต็มๆคำ	\N	\N
154	คุกกี้ราสเบอรี่ (Raspberry Cookie)	Food_Product	R_Cookie.jpg	f	t	คุกกี้เนยแท้ท๊อปด้วย แยมราสเบอรี่กวนสด รสชาติเปรี้ยวหวานเข้มข้น	\N	\N
155	น้ำสลัดราสเบอรี่ (Raspberry Vinaigrette)	Food_Product	R_Vinaigrette.jpg	f	t	น้ำสลัดชนิดเข้มข้น ด้วยเนื้อราสเบอรี่และ extra vergin olive oil เทราดบนสลัด หรือทำเป็น Dip จิ้มกับแครอท แตงกวา เป็นอาหารสุขภาพผักทุกชนิด	\N	\N
157	เลมอน สเปรด (Lemon Spread)	Food_Product	L_Spread.jpg	f	t	แยมเลมอนทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
158	แบล็คเบอรี่ สเปรด (Blackberry Spread)	Food_Product	B_Spread.jpg	f	t	แยมแบล็คเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
131	กรีนโอ๊ค (Green Oak Lettuce)	Vegetable	Green_Oak.jpg	t	f	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	\N	\N
144	มะเขือเทศ โทมัส (Thomas Tomato)	Fruit	Thomas.jpg	t	f	จากสวนคุณเบิ้ม	\N	\N
163	ซอสเสาวรส (Passion Fruit Sauce)	Food_Product	P_Sauce.jpg	f	t	ซอสเสาวรส สำหรับราดบนไอศกรีม พุดดิ้ง โยเกิร์ต ขนมเค้ก ขนมหวานต่างๆ เนื้อซอสเข้มข้น เสาวรสเปรี้ยวหวาน	\N	\N
159	โรสเบอรี่ สเปรด (Roseberry Spread)	Food_Product	Rose_Spread.jpg	f	t	แยมราสเบอรี่ผสมกลีบกุหลาบมอญสุโขทัย ปลูกแบบออร์แกนิค ใช้ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
160	แพชชั่นฟรุต สเปรด (Passion Fruit Spread)	Food_Product	P_Spread.jpg	f	t	แยมเสาวรสทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	\N	\N
161	ราสเบอรี่ซอส (Raspberry Sauce)	Food_Product	R_Sauce.jpg	f	t	ซอสราสเบอรี่สำหรับราดบนไอศกรีม พุดดิ้ง โยเกิร์ต ขนมเค้ก ขนมหวานต่างๆ เนื้อซอสเข้มข้น ราสเบอรี่เต็มขวด	\N	\N
162	แบล็คเบอรี่ซอส (Blackberry Sauce)	Food_Product	B_Sauce.jpg	f	t	ซอสแบล็คเบอรี่ สำหรับราดบนไอศกรีม พุดดิ้ง โยเกิร์ต ขนมเค้ก ขนมหวานต่างๆ เนื้อซอสเข้มข้น จากแบล็คเบอรี่แท้ๆ	\N	\N
164	มิกซ์เบอรี่และผักดอง (Mixed Berries & Veggie Pickles)	Food_Product	MV_Pic.jpg	f	t	ผลราสเบอรี่และแบล็คเบอรี่สดๆจากสวน นำมาดองกับผักสดกรอบที่คัดสรรมาอย่างดี ทั้งแตงกวาญี่ปุ่น แครอทและหัวไชเท้า ด้วยสูตรน้ำดองรสกลมกล่อมจากตำรับดั้งเดิม	\N	\N
165	มิกซ์เบอรี่ดอง (Mixed Berries Pickles)	Food_Product	MB_Pic.jpg	f	t	ผลราสเบอรี่และแบล็คเบอรี่สดๆจากสวน ผสานกับน้ำดองรสกลมกล่อมจากตำรับดั้งเดิม ได้ผลไม้ดองรสเปรี้ยวเค็มหวานสีสวยจากผลไม้แท้ๆ	\N	\N
167	ครีมทามือ กลิ่นราสเบอรี่ (Raspberry Hand Cream)	Non_Food_Product	Hand_Cream.jpg	f	t	ครีมบำรุงผิว สำหรับทามือ กลิ่นราสเบอรี่ ช่วยให้มือชุ่มชื้น ไม่แห้งกระด้าง	\N	\N
168	เจลบำรุงมือ (Raspberry Hand)	Non_Food_Product	Hand_Gel.jpg	f	t	เจลบำรุงมือ กลิ่นราสเบอรี่ ช่วยให้มือชุ่มชื้น ไม่แห้งกระด้าง	\N	\N
169	สบู่ (Soap)	Non_Food_Product	Soap.jpg	f	t	สบู่สมุนไพร ด้วยคุณค่าสารสกัดสมุนไพร ช่วยปรับผิวให้ขาว สะอาด เนียนใส นุ่ม ชุ่มชื่น มีสุขภาพดี ผิวใส กลิ่นกายหอม ลดกลิ่นตัว กลิ่นเหงื่อ	\N	\N
166	ดอกกุหลาบ (Rose)	Non_Food_Product	Rose.jpg	t	t	ดอกกุหลาบคละสี	\N	\N
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.product_option (id, product_id, product_option_name, price, active, weight, created_at, updated_at) FROM stdin;
<<<<<<< HEAD
1	1	500g	40	t	500	\N	\N
2	1	1kg	80	t	1000	\N	\N
3	2	500g	40	t	500	\N	\N
4	2	1kg	80	t	1000	\N	\N
5	3	500g	40	t	500	\N	\N
6	3	1kg	80	t	1000	\N	\N
7	4	500g	40	t	500	\N	\N
8	4	1kg	80	t	1000	\N	\N
9	5	500g	40	t	500	\N	\N
10	5	1kg	80	t	1000	\N	\N
11	6	500g	25	t	500	\N	\N
12	6	1kg	50	t	1000	\N	\N
13	7	500g	20	t	500	\N	\N
14	7	1kg	40	t	1000	\N	\N
15	8	500g	50	t	500	\N	\N
16	8	1kg	100	t	1000	\N	\N
17	9	500g	25	t	500	\N	\N
18	9	1kg	50	t	1000	\N	\N
19	10	500g	30	t	500	\N	\N
20	10	1kg	60	t	1000	\N	\N
21	11	500g	75	t	500	\N	\N
22	11	1kg	150	t	1000	\N	\N
23	12	500g	40	t	500	\N	\N
24	12	1kg	80	t	1000	\N	\N
26	14	500g	30	t	500	\N	\N
27	14	1kg	60	t	1000	\N	\N
28	15	500g	40	t	500	\N	\N
29	15	1kg	80	t	1000	\N	\N
30	16	500g	40	t	500	\N	\N
31	16	1kg	80	t	1000	\N	\N
32	17	500g	20	t	500	\N	\N
33	17	1kg	40	t	1000	\N	\N
34	18	500g	40	t	500	\N	\N
35	18	1kg	80	t	1000	\N	\N
36	19	500g	50	t	500	\N	\N
37	19	1kg	100	t	1000	\N	\N
38	20	ขวด (ml)	75	t	280	\N	\N
49	31	ขวด	180	t	320	\N	\N
50	32	ขวด	180	t	320	\N	\N
51	33	ขวด	180	t	320	\N	\N
52	34	ขวด	195	t	400	\N	\N
53	35	ขวด	250	t	400	\N	\N
39	21	ขวด (ml)	85	t	280	\N	\N
44	26	ขวด	105	t	240	\N	\N
43	25	ขวด	220	t	180	\N	\N
45	27	ขวด	105	t	240	\N	\N
46	28	ขวด	105	t	240	\N	\N
47	29	ขวด	105	t	240	\N	\N
48	30	ขวด	105	t	240	\N	\N
54	36	กำ	130	t	0	\N	\N
55	37	ตลับ	60	t	50	\N	\N
56	38	หลอด	60	t	50	\N	\N
57	39	มะกรูด	65	t	80	\N	\N
58	39	ขิง	65	t	80	\N	\N
59	39	กุหลาบ	65	t	80	\N	\N
60	39	ราสเบอรี่	65	t	80	\N	\N
25	13	ขวด	60	t	30	\N	\N
42	24	กระปุก	160	t	200	\N	\N
40	22	กล่อง (6 ชิ้น)	160	t	200	\N	\N
41	23	กระปุก	160	t	200	\N	\N
=======
206	131	500g	40	t	500	\N	\N
207	131	1kg	80	t	1000	\N	\N
208	132	500g	40	t	500	\N	\N
209	132	1kg	80	t	1000	\N	\N
210	133	500g	40	t	500	\N	\N
211	133	1kg	80	t	1000	\N	\N
212	134	500g	40	t	500	\N	\N
213	134	1kg	80	t	1000	\N	\N
214	135	500g	40	t	500	\N	\N
215	135	1kg	80	t	1000	\N	\N
216	136	500g	25	t	500	\N	\N
217	136	1kg	50	t	1000	\N	\N
218	137	500g	20	t	500	\N	\N
219	137	1kg	40	t	1000	\N	\N
220	138	500g	50	t	500	\N	\N
221	138	1kg	100	t	1000	\N	\N
222	139	500g	25	t	500	\N	\N
223	139	1kg	50	t	1000	\N	\N
224	140	500g	30	t	500	\N	\N
225	140	1kg	60	t	1000	\N	\N
226	141	500g	75	t	500	\N	\N
227	141	1kg	150	t	1000	\N	\N
228	142	500g	40	t	500	\N	\N
229	142	1kg	80	t	1000	\N	\N
230	143	ขวด	50	t	30	\N	\N
231	144	500g	30	t	500	\N	\N
232	144	1kg	60	t	1000	\N	\N
233	145	500g	40	t	500	\N	\N
234	145	1kg	80	t	1000	\N	\N
235	146	500g	40	t	500	\N	\N
236	146	1kg	80	t	1000	\N	\N
237	147	500g	20	t	500	\N	\N
238	147	1kg	40	t	1000	\N	\N
239	148	500g	40	t	500	\N	\N
240	148	1kg	80	t	1000	\N	\N
241	149	500g	50	t	500	\N	\N
242	149	1kg	100	t	1000	\N	\N
243	150	ขวด (ml)	75	t	280	\N	\N
244	151	ขวด (ml)	75	t	280	\N	\N
245	152	กล่อง (6 ชิ้น)	150	t	200	\N	\N
246	153	กระปุก	120	t	200	\N	\N
247	154	กระปุก	120	t	200	\N	\N
248	155	ขวด	200	t	180	\N	\N
249	156	ขวด	100	t	240	\N	\N
250	157	ขวด	100	t	240	\N	\N
251	158	ขวด	100	t	240	\N	\N
252	159	ขวด	100	t	240	\N	\N
253	160	ขวด	100	t	240	\N	\N
254	161	ขวด	180	t	320	\N	\N
255	162	ขวด	180	t	320	\N	\N
256	163	ขวด	180	t	320	\N	\N
257	164	ขวด	195	t	400	\N	\N
258	165	ขวด	250	t	400	\N	\N
259	166	กำ	120	t	0	\N	\N
260	167	ตลับ	50	t	50	\N	\N
261	168	หลอด	50	t	50	\N	\N
262	169	มะกรูด	60	t	80	\N	\N
263	169	ขิง	60	t	80	\N	\N
264	169	กุหลาบ	60	t	80	\N	\N
265	169	ราสเบอรี่	60	t	80	\N	\N
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8
\.


--
-- Data for Name: promo_code; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.promo_code (code, user_created, user_use, pinto_id, amount, created_at, updated_at) FROM stdin;
<<<<<<< HEAD
Wd9897CF	\N	\N		100000	\N	\N
Lh6643CF	\N	\N		100000	\N	\N
Aa7275CF	\N	\N		100000	\N	\N
Lp6515CF	\N	\N		100000	\N	\N
Kt9519CF	\N	\N		100000	\N	\N
Pk4329CF	\N	\N		100000	\N	\N
Nv1018CF	\N	\N		100000	\N	\N
Bt0640CF	\N	\N		100000	\N	\N
Cs0633CF	\N	\N		100000	\N	\N
Th5933CF	\N	\N		100000	\N	\N
Nx1075CF	\N	\N		100000	\N	\N
Od0740CF	\N	\N		100000	\N	\N
Dy4101CF	\N	\N		100000	\N	\N
Zc9527CF	\N	\N		100000	\N	\N
Am9155CF	\N	\N		100000	\N	\N
Nw6206CF	\N	\N		100000	\N	\N
Gy5007CF	\N	\N		100000	\N	\N
Al6897CF	\N	\N		100000	\N	\N
Je4356CF	\N	\N		100000	\N	\N
Iz3611CF	\N	\N		100000	\N	\N
Qc5760CA	\N	\N		10000	\N	\N
Wx3669CA	\N	\N		10000	\N	\N
Le4579CA	\N	\N		10000	\N	\N
Ni1777CA	\N	\N		10000	\N	\N
Ft4994CA	\N	\N		10000	\N	\N
Qo5208CA	\N	\N		10000	\N	\N
Vf3694CA	\N	\N		10000	\N	\N
Aw6516CA	\N	\N		10000	\N	\N
Yz5611CA	\N	\N		10000	\N	\N
Lc5165CA	\N	\N		10000	\N	\N
Zd7705CA	\N	\N		10000	\N	\N
Ed1183CA	\N	\N		10000	\N	\N
Ke8498CA	\N	\N		10000	\N	\N
Fc2543CA	\N	\N		10000	\N	\N
Kt8410CA	\N	\N		10000	\N	\N
Vn6041CA	\N	\N		10000	\N	\N
Do4377CA	\N	\N		10000	\N	\N
Hc8925CA	\N	\N		10000	\N	\N
Ue7842CA	\N	\N		10000	\N	\N
Wx1638CA	\N	\N		10000	\N	\N
Aq3161CA	\N	\N		10000	\N	\N
Jn6090CA	\N	\N		10000	\N	\N
Ng1799CA	\N	\N		10000	\N	\N
Eg9035CA	\N	\N		10000	\N	\N
Kc2719CA	\N	\N		10000	\N	\N
Bq1030CA	\N	\N		10000	\N	\N
Qd4240CA	\N	\N		10000	\N	\N
Sl9880CA	\N	\N		10000	\N	\N
Va6637CA	\N	\N		10000	\N	\N
Rz0284CA	\N	\N		10000	\N	\N
Zw2011CA	\N	\N		10000	\N	\N
Ql6942CA	\N	\N		10000	\N	\N
Bt3249CA	\N	\N		10000	\N	\N
Hu0833CA	\N	\N		10000	\N	\N
Dw4263CA	\N	\N		10000	\N	\N
Xh7222CA	\N	\N		10000	\N	\N
Jf7308CA	\N	\N		10000	\N	\N
Pz7767CA	\N	\N		10000	\N	\N
Ku7768CA	\N	\N		10000	\N	\N
Jv8808CA	\N	\N		10000	\N	\N
Sj6926CA	\N	\N		10000	\N	\N
Fa0697CA	\N	\N		10000	\N	\N
Aw6092CA	\N	\N		10000	\N	\N
Ne6442CA	\N	\N		10000	\N	\N
Fv2538CA	\N	\N		10000	\N	\N
Rr8249CA	\N	\N		10000	\N	\N
Ol2150CA	\N	\N		10000	\N	\N
Ig4580CA	\N	\N		10000	\N	\N
Oo0994CA	\N	\N		10000	\N	\N
Tk1333CA	\N	\N		10000	\N	\N
Of3904CB	\N	\N		5000	\N	\N
Kk3214CB	\N	\N		5000	\N	\N
Xv7227CB	\N	\N		5000	\N	\N
Yi6418CB	\N	\N		5000	\N	\N
Eo8976CB	\N	\N		5000	\N	\N
Xl9167CB	\N	\N		5000	\N	\N
If3624CB	\N	\N		5000	\N	\N
Ma5987CB	\N	\N		5000	\N	\N
Vu6795CB	\N	\N		5000	\N	\N
Ro0983CB	\N	\N		5000	\N	\N
Lm5926CB	\N	\N		5000	\N	\N
Bg4490CB	\N	\N		5000	\N	\N
Bb5245CB	\N	\N		5000	\N	\N
Mx8691CB	\N	\N		5000	\N	\N
Iw8764CB	\N	\N		5000	\N	\N
Kq4313CB	\N	\N		5000	\N	\N
Cl9477CB	\N	\N		5000	\N	\N
Me9024CB	\N	\N		5000	\N	\N
Do5884CB	\N	\N		5000	\N	\N
Iy5757CB	\N	\N		5000	\N	\N
Cf1476CB	\N	\N		5000	\N	\N
Bu8959CB	\N	\N		5000	\N	\N
Cu0634CB	\N	\N		5000	\N	\N
Ec6490CB	\N	\N		5000	\N	\N
Gm7960CB	\N	\N		5000	\N	\N
En8428CB	\N	\N		5000	\N	\N
Qy2573CB	\N	\N		5000	\N	\N
Xh5402CB	\N	\N		5000	\N	\N
Ge6604CB	\N	\N		5000	\N	\N
Wq3142CB	\N	\N		5000	\N	\N
Ea6575CB	\N	\N		5000	\N	\N
Yg6914CB	\N	\N		5000	\N	\N
Vg1232CB	\N	\N		5000	\N	\N
Kz7688CB	\N	\N		5000	\N	\N
Ae1752CB	\N	\N		5000	\N	\N
Fe8831CB	\N	\N		5000	\N	\N
Sf9259CB	\N	\N		5000	\N	\N
Cr3299CB	\N	\N		5000	\N	\N
Ms4536CB	\N	\N		5000	\N	\N
Xo9645CB	\N	\N		5000	\N	\N
Ku6566CB	\N	\N		5000	\N	\N
Rv6577CB	\N	\N		5000	\N	\N
Iw0045CB	\N	\N		5000	\N	\N
Vz9324CB	\N	\N		5000	\N	\N
Os2397CB	\N	\N		5000	\N	\N
Vk8759CB	\N	\N		5000	\N	\N
Lp2943CB	\N	\N		5000	\N	\N
Jn5449CB	\N	\N		5000	\N	\N
Jc4688CB	\N	\N		5000	\N	\N
Kr4646CB	\N	\N		5000	\N	\N
Iu8156CB	\N	\N		5000	\N	\N
Vu5158CB	\N	\N		5000	\N	\N
Bl1483CB	\N	\N		5000	\N	\N
Ef3565CB	\N	\N		5000	\N	\N
Lx2974CB	\N	\N		5000	\N	\N
Dm0151CB	\N	\N		5000	\N	\N
Dz9845CB	\N	\N		5000	\N	\N
Xx7045CB	\N	\N		5000	\N	\N
Vg6163CB	\N	\N		5000	\N	\N
Zb6458CB	\N	\N		5000	\N	\N
Jr8195CB	\N	\N		5000	\N	\N
Bp2189CB	\N	\N		5000	\N	\N
Of7329CB	\N	\N		5000	\N	\N
Ob2584CB	\N	\N		5000	\N	\N
Oe8540CB	\N	\N		5000	\N	\N
Sd7000CB	\N	\N		5000	\N	\N
Up8730CB	\N	\N		5000	\N	\N
Mc9802CB	\N	\N		5000	\N	\N
Pv7837CB	\N	\N		5000	\N	\N
Tv2806CB	\N	\N		5000	\N	\N
Bf5740CB	\N	\N		5000	\N	\N
Cf4957CB	\N	\N		5000	\N	\N
Nz5846CB	\N	\N		5000	\N	\N
Sf0759CB	\N	\N		5000	\N	\N
Fc4342CB	\N	\N		5000	\N	\N
Hz7451CB	\N	\N		5000	\N	\N
Gm0754CB	\N	\N		5000	\N	\N
Kh1643CB	\N	\N		5000	\N	\N
Pb4532CB	\N	\N		5000	\N	\N
Yn8177CB	\N	\N		5000	\N	\N
Xa7047CB	\N	\N		5000	\N	\N
Mp6874CB	\N	\N		5000	\N	\N
Lv7567CB	\N	\N		5000	\N	\N
Mw8253CB	\N	\N		5000	\N	\N
Qv1038CB	\N	\N		5000	\N	\N
Uw1595CB	\N	\N		5000	\N	\N
Rn9182CB	\N	\N		5000	\N	\N
Er6297CB	\N	\N		5000	\N	\N
Vv5201CB	\N	\N		5000	\N	\N
Fe8374CB	\N	\N		5000	\N	\N
An8510CB	\N	\N		5000	\N	\N
Iu6473CB	\N	\N		5000	\N	\N
Yi6743CB	\N	\N		5000	\N	\N
Oz9181CB	\N	\N		5000	\N	\N
Ld8376CB	\N	\N		5000	\N	\N
Mf7280CB	\N	\N		5000	\N	\N
Ri9687CB	\N	\N		5000	\N	\N
Il2514CB	\N	\N		5000	\N	\N
Nt4125CB	\N	\N		5000	\N	\N
Hm9238CB	\N	\N		5000	\N	\N
Uw0496CC	\N	\N		2000	\N	\N
Ui7778CC	\N	\N		2000	\N	\N
Fw5478CC	\N	\N		2000	\N	\N
Lv5103CC	\N	\N		2000	\N	\N
Fy1422CC	\N	\N		2000	\N	\N
Yq2197CC	\N	\N		2000	\N	\N
Lw6752CC	\N	\N		2000	\N	\N
Yo2870CC	\N	\N		2000	\N	\N
Nm4628CC	\N	\N		2000	\N	\N
Qt0473CC	\N	\N		2000	\N	\N
Fc4418CC	\N	\N		2000	\N	\N
Qk9094CC	\N	\N		2000	\N	\N
Nh8117CC	\N	\N		2000	\N	\N
Jj8242CC	\N	\N		2000	\N	\N
Bx0400CC	\N	\N		2000	\N	\N
We6485CC	\N	\N		2000	\N	\N
Ow2150CC	\N	\N		2000	\N	\N
Ng2430CC	\N	\N		2000	\N	\N
Xj5884CC	\N	\N		2000	\N	\N
Tw7805CC	\N	\N		2000	\N	\N
Xg5936CC	\N	\N		2000	\N	\N
Zn0530CC	\N	\N		2000	\N	\N
Yn8617CC	\N	\N		2000	\N	\N
Oo8305CC	\N	\N		2000	\N	\N
Dq0191CC	\N	\N		2000	\N	\N
Tt0515CC	\N	\N		2000	\N	\N
Pa8327CC	\N	\N		2000	\N	\N
Wa9886CC	\N	\N		2000	\N	\N
Nv2344CC	\N	\N		2000	\N	\N
Ps7765CC	\N	\N		2000	\N	\N
Iy8924CC	\N	\N		2000	\N	\N
Za8202CC	\N	\N		2000	\N	\N
Ec1664CC	\N	\N		2000	\N	\N
Lq3081CC	\N	\N		2000	\N	\N
Tb4403CC	\N	\N		2000	\N	\N
Ys0997CC	\N	\N		2000	\N	\N
Ca1895CC	\N	\N		2000	\N	\N
Ze3626CC	\N	\N		2000	\N	\N
Fd3728CC	\N	\N		2000	\N	\N
Ve0139CC	\N	\N		2000	\N	\N
Yg6021CC	\N	\N		2000	\N	\N
Tm1331CC	\N	\N		2000	\N	\N
Jy5810CC	\N	\N		2000	\N	\N
Xe9556CC	\N	\N		2000	\N	\N
Wz0869CC	\N	\N		2000	\N	\N
Ha2154CC	\N	\N		2000	\N	\N
Dm0151CC	\N	\N		2000	\N	\N
Pt1949CC	\N	\N		2000	\N	\N
Ay7615CC	\N	\N		2000	\N	\N
Pt4242CC	\N	\N		2000	\N	\N
Aj0512CC	\N	\N		2000	\N	\N
Lh0304CC	\N	\N		2000	\N	\N
Hi6276CC	\N	\N		2000	\N	\N
En3829CC	\N	\N		2000	\N	\N
Kc9109CC	\N	\N		2000	\N	\N
Rr9394CC	\N	\N		2000	\N	\N
Ej7505CC	\N	\N		2000	\N	\N
Zv7102CC	\N	\N		2000	\N	\N
Nk1637CC	\N	\N		2000	\N	\N
Rf9519CC	\N	\N		2000	\N	\N
Bk0870CC	\N	\N		2000	\N	\N
Li3414CC	\N	\N		2000	\N	\N
Kt1887CC	\N	\N		2000	\N	\N
Yl5785CC	\N	\N		2000	\N	\N
Sn4985CC	\N	\N		2000	\N	\N
Mn9595CC	\N	\N		2000	\N	\N
Aa2592CC	\N	\N		2000	\N	\N
No7216CC	\N	\N		2000	\N	\N
Mr2568CC	\N	\N		2000	\N	\N
Of4808CC	\N	\N		2000	\N	\N
Nc5972CC	\N	\N		2000	\N	\N
Jz9090CC	\N	\N		2000	\N	\N
Tk8991CC	\N	\N		2000	\N	\N
Bs0221CC	\N	\N		2000	\N	\N
Dp9633CC	\N	\N		2000	\N	\N
Gr9091CC	\N	\N		2000	\N	\N
Hu7841CC	\N	\N		2000	\N	\N
Vj3032CC	\N	\N		2000	\N	\N
Gh5258CC	\N	\N		2000	\N	\N
Zw5849CC	\N	\N		2000	\N	\N
Is3937CC	\N	\N		2000	\N	\N
Om4999CC	\N	\N		2000	\N	\N
Dr5389CC	\N	\N		2000	\N	\N
Lk9618CC	\N	\N		2000	\N	\N
Zc1383CC	\N	\N		2000	\N	\N
Do5307CC	\N	\N		2000	\N	\N
Ti6477CC	\N	\N		2000	\N	\N
An1623CC	\N	\N		2000	\N	\N
Bs1562CC	\N	\N		2000	\N	\N
Ai6022CC	\N	\N		2000	\N	\N
Mo0357CC	\N	\N		2000	\N	\N
Tq4272CC	\N	\N		2000	\N	\N
Mu6203CC	\N	\N		2000	\N	\N
Vq8797CC	\N	\N		2000	\N	\N
Di1758CC	\N	\N		2000	\N	\N
Fa8662CC	\N	\N		2000	\N	\N
Zb5914CC	\N	\N		2000	\N	\N
Kl8776CC	\N	\N		2000	\N	\N
Qu8028CC	\N	\N		2000	\N	\N
Bu8703CC	\N	\N		2000	\N	\N
Tg8435CC	\N	\N		2000	\N	\N
Jd2861CC	\N	\N		2000	\N	\N
Mf3584CC	\N	\N		2000	\N	\N
Sq5025CC	\N	\N		2000	\N	\N
Ry1196CC	\N	\N		2000	\N	\N
Dv0707CC	\N	\N		2000	\N	\N
Fo8196CC	\N	\N		2000	\N	\N
Fo4666CC	\N	\N		2000	\N	\N
Hv0637CC	\N	\N		2000	\N	\N
Eh7888CC	\N	\N		2000	\N	\N
Ld1781CC	\N	\N		2000	\N	\N
Fz8596CC	\N	\N		2000	\N	\N
Js1283CC	\N	\N		2000	\N	\N
Vn9340CC	\N	\N		2000	\N	\N
Ln0777CC	\N	\N		2000	\N	\N
Ow8851CC	\N	\N		2000	\N	\N
Vo8771CC	\N	\N		2000	\N	\N
Ep2349CC	\N	\N		2000	\N	\N
Oh9775CC	\N	\N		2000	\N	\N
Ia2073CC	\N	\N		2000	\N	\N
Rm4760CC	\N	\N		2000	\N	\N
Uh7972CC	\N	\N		2000	\N	\N
Kt1040CC	\N	\N		2000	\N	\N
Ve1680CC	\N	\N		2000	\N	\N
Cq7761CC	\N	\N		2000	\N	\N
Wz8960CC	\N	\N		2000	\N	\N
Sr9811CC	\N	\N		2000	\N	\N
Qg9887CC	\N	\N		2000	\N	\N
Vc7019CC	\N	\N		2000	\N	\N
Tz2669CC	\N	\N		2000	\N	\N
Jz2780CC	\N	\N		2000	\N	\N
Ie1797CC	\N	\N		2000	\N	\N
Ek7614CC	\N	\N		2000	\N	\N
Pm3190CC	\N	\N		2000	\N	\N
Sn0693CC	\N	\N		2000	\N	\N
Ik5563CC	\N	\N		2000	\N	\N
Bf2539CC	\N	\N		2000	\N	\N
Gf4280CC	\N	\N		2000	\N	\N
Ux8497CC	\N	\N		2000	\N	\N
Db9772CC	\N	\N		2000	\N	\N
Ta6318CC	\N	\N		2000	\N	\N
Ho6334CC	\N	\N		2000	\N	\N
Vr5777CC	\N	\N		2000	\N	\N
Ew1103CC	\N	\N		2000	\N	\N
Ey8725CC	\N	\N		2000	\N	\N
Yl1244CC	\N	\N		2000	\N	\N
Ym5671CC	\N	\N		2000	\N	\N
Oq4509CC	\N	\N		2000	\N	\N
Ft7799CC	\N	\N		2000	\N	\N
Yg8846CC	\N	\N		2000	\N	\N
Rd5253CC	\N	\N		2000	\N	\N
Ae5050CC	\N	\N		2000	\N	\N
Pk3514CC	\N	\N		2000	\N	\N
Zd4325CC	\N	\N		2000	\N	\N
Bg5110CC	\N	\N		2000	\N	\N
Rl0803CC	\N	\N		2000	\N	\N
Rz9351CC	\N	\N		2000	\N	\N
Ss4220CC	\N	\N		2000	\N	\N
Zz3654CC	\N	\N		2000	\N	\N
El9492CC	\N	\N		2000	\N	\N
Vl3355CC	\N	\N		2000	\N	\N
Jc7928CC	\N	\N		2000	\N	\N
Gi4414CC	\N	\N		2000	\N	\N
Og8555CC	\N	\N		2000	\N	\N
Hq9478CC	\N	\N		2000	\N	\N
Oh0160CC	\N	\N		2000	\N	\N
Uo7805CC	\N	\N		2000	\N	\N
Hp4930CC	\N	\N		2000	\N	\N
Fd4588CC	\N	\N		2000	\N	\N
Yi8889CC	\N	\N		2000	\N	\N
Qp7909CC	\N	\N		2000	\N	\N
Qc7208CC	\N	\N		2000	\N	\N
Zi6794CC	\N	\N		2000	\N	\N
Rq6822CC	\N	\N		2000	\N	\N
Jz8702CC	\N	\N		2000	\N	\N
Ez2339CC	\N	\N		2000	\N	\N
Yp7567CC	\N	\N		2000	\N	\N
Ye8227CC	\N	\N		2000	\N	\N
Wa6048CC	\N	\N		2000	\N	\N
Vt2824CC	\N	\N		2000	\N	\N
Ef5024CC	\N	\N		2000	\N	\N
Io6214CC	\N	\N		2000	\N	\N
Yq5788CC	\N	\N		2000	\N	\N
Ff0113CC	\N	\N		2000	\N	\N
Rg0043CC	\N	\N		2000	\N	\N
Hp0351CC	\N	\N		2000	\N	\N
Ki9124CC	\N	\N		2000	\N	\N
Hp0562CC	\N	\N		2000	\N	\N
Pg9368CC	\N	\N		2000	\N	\N
Qc2464CC	\N	\N		2000	\N	\N
Iv7599CC	\N	\N		2000	\N	\N
Kj4128CC	\N	\N		2000	\N	\N
Ky6250CC	\N	\N		2000	\N	\N
Ww7507CC	\N	\N		2000	\N	\N
Up0498CC	\N	\N		2000	\N	\N
Jx6389CC	\N	\N		2000	\N	\N
Ur3923CC	\N	\N		2000	\N	\N
Jg1000CC	\N	\N		2000	\N	\N
Pw1590CC	\N	\N		2000	\N	\N
Zx9953CC	\N	\N		2000	\N	\N
Ni1760CC	\N	\N		2000	\N	\N
Sb1852CC	\N	\N		2000	\N	\N
Pd7821CC	\N	\N		2000	\N	\N
Xp4220CC	\N	\N		2000	\N	\N
Zz8391CC	\N	\N		2000	\N	\N
Qo4636CC	\N	\N		2000	\N	\N
Bb7691CC	\N	\N		2000	\N	\N
Ck2924CC	\N	\N		2000	\N	\N
Ly2498CC	\N	\N		2000	\N	\N
Hf4295CC	\N	\N		2000	\N	\N
Wo0474CC	\N	\N		2000	\N	\N
Fh7514CC	\N	\N		2000	\N	\N
Qw3074CC	\N	\N		2000	\N	\N
Gr9350CC	\N	\N		2000	\N	\N
Zv0687CC	\N	\N		2000	\N	\N
Nk6257CC	\N	\N		2000	\N	\N
Sa2403CC	\N	\N		2000	\N	\N
Ga5388CC	\N	\N		2000	\N	\N
Tb4965CC	\N	\N		2000	\N	\N
Cv2093CC	\N	\N		2000	\N	\N
Cz9892CC	\N	\N		2000	\N	\N
Ft8054CC	\N	\N		2000	\N	\N
Np8253CC	\N	\N		2000	\N	\N
Xd6006CC	\N	\N		2000	\N	\N
Ln9293CC	\N	\N		2000	\N	\N
Or2006CC	\N	\N		2000	\N	\N
Fz3394CC	\N	\N		2000	\N	\N
Gh2348CC	\N	\N		2000	\N	\N
Lp8570CC	\N	\N		2000	\N	\N
Tb1080CC	\N	\N		2000	\N	\N
Lu9380CC	\N	\N		2000	\N	\N
Jj4765CC	\N	\N		2000	\N	\N
Ib6414CC	\N	\N		2000	\N	\N
Hf3128CC	\N	\N		2000	\N	\N
Ka0316CC	\N	\N		2000	\N	\N
Nb1331CC	\N	\N		2000	\N	\N
Fx6674CC	\N	\N		2000	\N	\N
Ai1298CC	\N	\N		2000	\N	\N
Sp9889CC	\N	\N		2000	\N	\N
Qd4931CC	\N	\N		2000	\N	\N
Nk6899CC	\N	\N		2000	\N	\N
Pa5103CC	\N	\N		2000	\N	\N
Ep1105CC	\N	\N		2000	\N	\N
Qv9159CC	\N	\N		2000	\N	\N
Uk8939CC	\N	\N		2000	\N	\N
Dv3444CC	\N	\N		2000	\N	\N
Uj9598CC	\N	\N		2000	\N	\N
Pt5972CC	\N	\N		2000	\N	\N
Eh2861CC	\N	\N		2000	\N	\N
Vn5297CC	\N	\N		2000	\N	\N
Qg2236CC	\N	\N		2000	\N	\N
Xn4392CC	\N	\N		2000	\N	\N
Wx5172CC	\N	\N		2000	\N	\N
Kp5533CC	\N	\N		2000	\N	\N
Tp3966CC	\N	\N		2000	\N	\N
Hv4964CC	\N	\N		2000	\N	\N
Zg9445CC	\N	\N		2000	\N	\N
Cs0413CC	\N	\N		2000	\N	\N
Qr9867CC	\N	\N		2000	\N	\N
Ru7588CC	\N	\N		2000	\N	\N
Py5527CC	\N	\N		2000	\N	\N
Oz9552CC	\N	\N		2000	\N	\N
Wl0255CC	\N	\N		2000	\N	\N
Gm5758CC	\N	\N		2000	\N	\N
Qq8913CC	\N	\N		2000	\N	\N
Ax8331CC	\N	\N		2000	\N	\N
Gb4052CC	\N	\N		2000	\N	\N
Xw3134CC	\N	\N		2000	\N	\N
Dk7064CC	\N	\N		2000	\N	\N
Vd4785CC	\N	\N		2000	\N	\N
Ej3104CC	\N	\N		2000	\N	\N
Ee7745CC	\N	\N		2000	\N	\N
Ed1476CC	\N	\N		2000	\N	\N
Jt5529CC	\N	\N		2000	\N	\N
Mr9731CC	\N	\N		2000	\N	\N
Bi8528CC	\N	\N		2000	\N	\N
Dw0744CC	\N	\N		2000	\N	\N
Qa5791CC	\N	\N		2000	\N	\N
Xz5515CC	\N	\N		2000	\N	\N
Rv1245CC	\N	\N		2000	\N	\N
Fm1715CC	\N	\N		2000	\N	\N
Po2206CC	\N	\N		2000	\N	\N
Hd6179CC	\N	\N		2000	\N	\N
Za1103CC	\N	\N		2000	\N	\N
Sb9824CC	\N	\N		2000	\N	\N
Un1734CC	\N	\N		2000	\N	\N
Ul9252CC	\N	\N		2000	\N	\N
Dd7089CC	\N	\N		2000	\N	\N
Zm3298CC	\N	\N		2000	\N	\N
At9056CC	\N	\N		2000	\N	\N
Ti8784CC	\N	\N		2000	\N	\N
Mh5636CC	\N	\N		2000	\N	\N
Nr5309CC	\N	\N		2000	\N	\N
Ir4565CC	\N	\N		2000	\N	\N
Gt1064CC	\N	\N		2000	\N	\N
Ch0401CC	\N	\N		2000	\N	\N
Zq2432CC	\N	\N		2000	\N	\N
Ny8178CC	\N	\N		2000	\N	\N
Bh5594CC	\N	\N		2000	\N	\N
Nv5516CC	\N	\N		2000	\N	\N
Zg7720CC	\N	\N		2000	\N	\N
Ae7644CC	\N	\N		2000	\N	\N
Qp7970CC	\N	\N		2000	\N	\N
Yh4957CC	\N	\N		2000	\N	\N
Xi3655CC	\N	\N		2000	\N	\N
Yk9968CC	\N	\N		2000	\N	\N
Zi1580CC	\N	\N		2000	\N	\N
Xh6969CC	\N	\N		2000	\N	\N
Qz8161CC	\N	\N		2000	\N	\N
Gf4607CC	\N	\N		2000	\N	\N
Zt9560CC	\N	\N		2000	\N	\N
Ia1586CC	\N	\N		2000	\N	\N
We0534CC	\N	\N		2000	\N	\N
Hb0435CC	\N	\N		2000	\N	\N
Bd1782CC	\N	\N		2000	\N	\N
Re8640CC	\N	\N		2000	\N	\N
Of6825CC	\N	\N		2000	\N	\N
Bb5537CC	\N	\N		2000	\N	\N
Uw7680CC	\N	\N		2000	\N	\N
Ye3333CC	\N	\N		2000	\N	\N
Gi9233CC	\N	\N		2000	\N	\N
Vg3201CC	\N	\N		2000	\N	\N
Fv3498CC	\N	\N		2000	\N	\N
Sb4055CC	\N	\N		2000	\N	\N
Hz7901CC	\N	\N		2000	\N	\N
As2043CC	\N	\N		2000	\N	\N
Wv4862CC	\N	\N		2000	\N	\N
Gz1291CC	\N	\N		2000	\N	\N
Iw5113CC	\N	\N		2000	\N	\N
Te3643CC	\N	\N		2000	\N	\N
Zn0515CC	\N	\N		2000	\N	\N
Yd0667CC	\N	\N		2000	\N	\N
Pp8700CC	\N	\N		2000	\N	\N
Tg3449CC	\N	\N		2000	\N	\N
Pp6226CC	\N	\N		2000	\N	\N
Ay1343CC	\N	\N		2000	\N	\N
Tq0300CC	\N	\N		2000	\N	\N
Vk1101CC	\N	\N		2000	\N	\N
Fq5052CC	\N	\N		2000	\N	\N
Au9333CC	\N	\N		2000	\N	\N
Qx1347CC	\N	\N		2000	\N	\N
Mr1413CC	\N	\N		2000	\N	\N
Vq8424CC	\N	\N		2000	\N	\N
Hu7251CC	\N	\N		2000	\N	\N
Sv5824CC	\N	\N		2000	\N	\N
Gv5899CC	\N	\N		2000	\N	\N
Tk5499CC	\N	\N		2000	\N	\N
Oc4146CC	\N	\N		2000	\N	\N
Gw2820CC	\N	\N		2000	\N	\N
Da1773CC	\N	\N		2000	\N	\N
Rk7185CC	\N	\N		2000	\N	\N
Pd6228CC	\N	\N		2000	\N	\N
Xv4286CC	\N	\N		2000	\N	\N
Le7480CC	\N	\N		2000	\N	\N
Cl8364CC	\N	\N		2000	\N	\N
Ht3515CC	\N	\N		2000	\N	\N
Dl4987CC	\N	\N		2000	\N	\N
Be1188CC	\N	\N		2000	\N	\N
Zn7849CC	\N	\N		2000	\N	\N
Sm3871CC	\N	\N		2000	\N	\N
Bc8992CC	\N	\N		2000	\N	\N
De1297CC	\N	\N		2000	\N	\N
Xh8995CC	\N	\N		2000	\N	\N
Xd9791CC	\N	\N		2000	\N	\N
Gt2443CC	\N	\N		2000	\N	\N
Sj3179CC	\N	\N		2000	\N	\N
Oq8024CC	\N	\N		2000	\N	\N
Nq1333CC	\N	\N		2000	\N	\N
Qo5487CC	\N	\N		2000	\N	\N
Br3096CC	\N	\N		2000	\N	\N
Mc1245CC	\N	\N		2000	\N	\N
Jl8730CC	\N	\N		2000	\N	\N
Zz9137CC	\N	\N		2000	\N	\N
Qx0819CC	\N	\N		2000	\N	\N
Qd3872CC	\N	\N		2000	\N	\N
Xj0424CC	\N	\N		2000	\N	\N
Fn2993CC	\N	\N		2000	\N	\N
Il9418CC	\N	\N		2000	\N	\N
Dd4162CC	\N	\N		2000	\N	\N
Ds2113CC	\N	\N		2000	\N	\N
Vr4897CC	\N	\N		2000	\N	\N
Mo8409CC	\N	\N		2000	\N	\N
Jt2915CC	\N	\N		2000	\N	\N
Jg3119CC	\N	\N		2000	\N	\N
En9250CC	\N	\N		2000	\N	\N
Zw9898CC	\N	\N		2000	\N	\N
Qd8827CC	\N	\N		2000	\N	\N
Kr6543CC	\N	\N		2000	\N	\N
Xq2325CC	\N	\N		2000	\N	\N
Vu0228CC	\N	\N		2000	\N	\N
Mi5697CC	\N	\N		2000	\N	\N
Cr0290CC	\N	\N		2000	\N	\N
Re4778CC	\N	\N		2000	\N	\N
Vv0525CC	\N	\N		2000	\N	\N
Jj8279CC	\N	\N		2000	\N	\N
It7970CC	\N	\N		2000	\N	\N
Ay2510CC	\N	\N		2000	\N	\N
Mz7496CC	\N	\N		2000	\N	\N
Hh5964CC	\N	\N		2000	\N	\N
Xy5160CC	\N	\N		2000	\N	\N
Uw1923CC	\N	\N		2000	\N	\N
Hd4620CC	\N	\N		2000	\N	\N
Lj7206CC	\N	\N		2000	\N	\N
Vl5325CC	\N	\N		2000	\N	\N
Hy6387CC	\N	\N		2000	\N	\N
Zx0101CC	\N	\N		2000	\N	\N
Fi0694CC	\N	\N		2000	\N	\N
Lh0884CC	\N	\N		2000	\N	\N
Gt5474CC	\N	\N		2000	\N	\N
Xp4940CC	\N	\N		2000	\N	\N
Xb2744CC	\N	\N		2000	\N	\N
Ut7885CC	\N	\N		2000	\N	\N
Yt6882CC	\N	\N		2000	\N	\N
Uj9501CC	\N	\N		2000	\N	\N
Qw8304CC	\N	\N		2000	\N	\N
Wx3332CC	\N	\N		2000	\N	\N
Og9007CC	\N	\N		2000	\N	\N
Hz5770CC	\N	\N		2000	\N	\N
Oc4902CC	\N	\N		2000	\N	\N
Qk0384CC	\N	\N		2000	\N	\N
Oa0586CC	\N	\N		2000	\N	\N
Vg0815CC	\N	\N		2000	\N	\N
Mo1133CC	\N	\N		2000	\N	\N
Fx7593CC	\N	\N		2000	\N	\N
Ay7031CC	\N	\N		2000	\N	\N
Wv8203CC	\N	\N		2000	\N	\N
An5571CC	\N	\N		2000	\N	\N
Bt5995CC	\N	\N		2000	\N	\N
Wj3790CC	\N	\N		2000	\N	\N
Oz1628CC	\N	\N		2000	\N	\N
Pd5925CC	\N	\N		2000	\N	\N
Te8180CC	\N	\N		2000	\N	\N
Nx7119CC	\N	\N		2000	\N	\N
Bd2492CC	\N	\N		2000	\N	\N
Fv9738CC	\N	\N		2000	\N	\N
Rh4105CC	\N	\N		2000	\N	\N
Bm8869CC	\N	\N		2000	\N	\N
Pw2243CC	\N	\N		2000	\N	\N
Rv2670CC	\N	\N		2000	\N	\N
Hd3948CC	\N	\N		2000	\N	\N
Dl8671CC	\N	\N		2000	\N	\N
Lb2826CC	\N	\N		2000	\N	\N
Cg4285CC	\N	\N		2000	\N	\N
Hu7101CC	\N	\N		2000	\N	\N
Bz8962CC	\N	\N		2000	\N	\N
Wy4456CC	\N	\N		2000	\N	\N
Zo2209CC	\N	\N		2000	\N	\N
Bh4255CC	\N	\N		2000	\N	\N
Fd6424CC	\N	\N		2000	\N	\N
Kt7660CC	\N	\N		2000	\N	\N
Vo7888CC	\N	\N		2000	\N	\N
Aj1385CC	\N	\N		2000	\N	\N
Zb4390CC	\N	\N		2000	\N	\N
Aq5004CC	\N	\N		2000	\N	\N
Fr6218CC	\N	\N		2000	\N	\N
Qp9149CC	\N	\N		2000	\N	\N
Nz2103CC	\N	\N		2000	\N	\N
Qd3859CC	\N	\N		2000	\N	\N
Ef8546CC	\N	\N		2000	\N	\N
Lw7666CC	\N	\N		2000	\N	\N
Dd6730CC	\N	\N		2000	\N	\N
Eh2005CC	\N	\N		2000	\N	\N
Bl3513CC	\N	\N		2000	\N	\N
La6159CC	\N	\N		2000	\N	\N
Er9709CC	\N	\N		2000	\N	\N
Sy8792CC	\N	\N		2000	\N	\N
Qr2536CC	\N	\N		2000	\N	\N
Ef4075CC	\N	\N		2000	\N	\N
Ax0555CC	\N	\N		2000	\N	\N
Il3070CC	\N	\N		2000	\N	\N
Fs9645CC	\N	\N		2000	\N	\N
Cm1422CC	\N	\N		2000	\N	\N
Ok9368CC	\N	\N		2000	\N	\N
Kj6699CC	\N	\N		2000	\N	\N
Yc1272CC	\N	\N		2000	\N	\N
Tw3662CC	\N	\N		2000	\N	\N
Zc0146CC	\N	\N		2000	\N	\N
Ea4872CC	\N	\N		2000	\N	\N
Xr5143CC	\N	\N		2000	\N	\N
Jx6845CC	\N	\N		2000	\N	\N
Yr1769CC	\N	\N		2000	\N	\N
Lz8877CC	\N	\N		2000	\N	\N
Kc2795CC	\N	\N		2000	\N	\N
Kg6045CC	\N	\N		2000	\N	\N
Fx5740CC	\N	\N		2000	\N	\N
Lf3523CC	\N	\N		2000	\N	\N
Qi8144CC	\N	\N		2000	\N	\N
Gn1495CC	\N	\N		2000	\N	\N
Od0590CC	\N	\N		2000	\N	\N
Yt7716CC	\N	\N		2000	\N	\N
Jl8632CC	\N	\N		2000	\N	\N
Cj4263CC	\N	\N		2000	\N	\N
Mv0222CC	\N	\N		2000	\N	\N
Qz7964CC	\N	\N		2000	\N	\N
Mv0327CC	\N	\N		2000	\N	\N
Jv8581CC	\N	\N		2000	\N	\N
Gm5675CC	\N	\N		2000	\N	\N
Fw7080CC	\N	\N		2000	\N	\N
Rv5652CC	\N	\N		2000	\N	\N
Wq1610CC	\N	\N		2000	\N	\N
Ut5868CD	\N	\N		1000	\N	\N
Pr5998CD	\N	\N		1000	\N	\N
Fl7840CD	\N	\N		1000	\N	\N
Tj4604CD	\N	\N		1000	\N	\N
Tl3675CD	\N	\N		1000	\N	\N
Fp1648CD	\N	\N		1000	\N	\N
Ms2467CD	\N	\N		1000	\N	\N
Ms9284CD	\N	\N		1000	\N	\N
Wj5986CD	\N	\N		1000	\N	\N
Ys2918CD	\N	\N		1000	\N	\N
Ss6503CD	\N	\N		1000	\N	\N
Da8005CD	\N	\N		1000	\N	\N
Sk5553CD	\N	\N		1000	\N	\N
Dv4562CD	\N	\N		1000	\N	\N
Ll0988CD	\N	\N		1000	\N	\N
Mb1566CD	\N	\N		1000	\N	\N
Bc2195CD	\N	\N		1000	\N	\N
Mk8207CD	\N	\N		1000	\N	\N
Kn1269CD	\N	\N		1000	\N	\N
Wp9707CD	\N	\N		1000	\N	\N
Vm8576CD	\N	\N		1000	\N	\N
Nm7178CD	\N	\N		1000	\N	\N
Rw7474CD	\N	\N		1000	\N	\N
Zd3453CD	\N	\N		1000	\N	\N
Pu5217CD	\N	\N		1000	\N	\N
Wy7104CD	\N	\N		1000	\N	\N
Df0511CD	\N	\N		1000	\N	\N
Lk6656CD	\N	\N		1000	\N	\N
Jy7031CD	\N	\N		1000	\N	\N
Cf8224CD	\N	\N		1000	\N	\N
Wk0424CD	\N	\N		1000	\N	\N
Gx7974CD	\N	\N		1000	\N	\N
Xc2351CD	\N	\N		1000	\N	\N
Tx2911CD	\N	\N		1000	\N	\N
Cn0807CD	\N	\N		1000	\N	\N
Qh7361CD	\N	\N		1000	\N	\N
Lq7366CD	\N	\N		1000	\N	\N
Ur7992CD	\N	\N		1000	\N	\N
Zs3642CD	\N	\N		1000	\N	\N
Ou2848CD	\N	\N		1000	\N	\N
Sz1048CD	\N	\N		1000	\N	\N
Ve7236CD	\N	\N		1000	\N	\N
Bb1421CD	\N	\N		1000	\N	\N
Nm1379CD	\N	\N		1000	\N	\N
Pi9518CD	\N	\N		1000	\N	\N
Mx7114CD	\N	\N		1000	\N	\N
Aj3588CD	\N	\N		1000	\N	\N
Qa5838CD	\N	\N		1000	\N	\N
Fx1815CD	\N	\N		1000	\N	\N
Ll4774CD	\N	\N		1000	\N	\N
Zx7718CD	\N	\N		1000	\N	\N
Ux2028CD	\N	\N		1000	\N	\N
Yl4481CD	\N	\N		1000	\N	\N
Jb1710CD	\N	\N		1000	\N	\N
Ok6316CD	\N	\N		1000	\N	\N
Qs4152CD	\N	\N		1000	\N	\N
Kb9644CD	\N	\N		1000	\N	\N
Uh6657CD	\N	\N		1000	\N	\N
Cx4386CD	\N	\N		1000	\N	\N
Qn7433CD	\N	\N		1000	\N	\N
Vp7019CD	\N	\N		1000	\N	\N
Ka3860CD	\N	\N		1000	\N	\N
Rx4775CD	\N	\N		1000	\N	\N
Xz9740CD	\N	\N		1000	\N	\N
Jv3068CD	\N	\N		1000	\N	\N
Th3875CD	\N	\N		1000	\N	\N
Zu4375CD	\N	\N		1000	\N	\N
Kl8828CD	\N	\N		1000	\N	\N
Ya2782CD	\N	\N		1000	\N	\N
Ee7245CD	\N	\N		1000	\N	\N
Zt2081CD	\N	\N		1000	\N	\N
Qx1606CD	\N	\N		1000	\N	\N
Gw8875CD	\N	\N		1000	\N	\N
Ht0213CD	\N	\N		1000	\N	\N
Xe3306CD	\N	\N		1000	\N	\N
Xd5404CD	\N	\N		1000	\N	\N
Yg6434CD	\N	\N		1000	\N	\N
Up2476CD	\N	\N		1000	\N	\N
Iq1820CD	\N	\N		1000	\N	\N
Bp5676CD	\N	\N		1000	\N	\N
Hb4293CD	\N	\N		1000	\N	\N
Qa3981CD	\N	\N		1000	\N	\N
Pk1133CD	\N	\N		1000	\N	\N
Cv7489CD	\N	\N		1000	\N	\N
Vr8122CD	\N	\N		1000	\N	\N
Xo6636CD	\N	\N		1000	\N	\N
Ew6317CD	\N	\N		1000	\N	\N
Oy2962CD	\N	\N		1000	\N	\N
Yk0835CD	\N	\N		1000	\N	\N
Bo8880CD	\N	\N		1000	\N	\N
Cn4061CD	\N	\N		1000	\N	\N
Hy9539CD	\N	\N		1000	\N	\N
Gd3257CD	\N	\N		1000	\N	\N
Jq6409CD	\N	\N		1000	\N	\N
Zc5359CD	\N	\N		1000	\N	\N
Gq4592CD	\N	\N		1000	\N	\N
Gc2897CD	\N	\N		1000	\N	\N
Zn4288CD	\N	\N		1000	\N	\N
Uj0882CD	\N	\N		1000	\N	\N
Is6508CD	\N	\N		1000	\N	\N
Lt9024CD	\N	\N		1000	\N	\N
Bk2490CD	\N	\N		1000	\N	\N
Ov4948CD	\N	\N		1000	\N	\N
Ou4224CD	\N	\N		1000	\N	\N
Pc7669CD	\N	\N		1000	\N	\N
Qx5770CD	\N	\N		1000	\N	\N
Yb1599CD	\N	\N		1000	\N	\N
Qx4396CD	\N	\N		1000	\N	\N
Cj8748CD	\N	\N		1000	\N	\N
Jq1694CD	\N	\N		1000	\N	\N
Zb5689CD	\N	\N		1000	\N	\N
Ml1826CD	\N	\N		1000	\N	\N
Yz3808CD	\N	\N		1000	\N	\N
Ye2023CD	\N	\N		1000	\N	\N
Dv3530CD	\N	\N		1000	\N	\N
Zx9221CD	\N	\N		1000	\N	\N
Dn8741CD	\N	\N		1000	\N	\N
We6704CD	\N	\N		1000	\N	\N
Ry7289CD	\N	\N		1000	\N	\N
Yu4059CD	\N	\N		1000	\N	\N
Zl4427CD	\N	\N		1000	\N	\N
Iy8242CD	\N	\N		1000	\N	\N
Ya0042CD	\N	\N		1000	\N	\N
Tr3877CD	\N	\N		1000	\N	\N
De7277CD	\N	\N		1000	\N	\N
Jf4211CD	\N	\N		1000	\N	\N
Eq4171CD	\N	\N		1000	\N	\N
Jr2796CD	\N	\N		1000	\N	\N
Qh5454CD	\N	\N		1000	\N	\N
Lq7234CD	\N	\N		1000	\N	\N
Vk7210CD	\N	\N		1000	\N	\N
Mh0531CD	\N	\N		1000	\N	\N
Ve4723CD	\N	\N		1000	\N	\N
Co4293CD	\N	\N		1000	\N	\N
Tz1503CD	\N	\N		1000	\N	\N
Ic0917CD	\N	\N		1000	\N	\N
Yi9577CD	\N	\N		1000	\N	\N
Th6006CD	\N	\N		1000	\N	\N
Fd6414CD	\N	\N		1000	\N	\N
Fb0252CD	\N	\N		1000	\N	\N
Lj7516CD	\N	\N		1000	\N	\N
Pk1131CD	\N	\N		1000	\N	\N
Ye1525CD	\N	\N		1000	\N	\N
Cv4361CD	\N	\N		1000	\N	\N
Sg3725CD	\N	\N		1000	\N	\N
Gw7231CD	\N	\N		1000	\N	\N
Vo8320CD	\N	\N		1000	\N	\N
Jv1240CD	\N	\N		1000	\N	\N
Fk0742CD	\N	\N		1000	\N	\N
Ml2358CD	\N	\N		1000	\N	\N
Cj8317CD	\N	\N		1000	\N	\N
Bc0058CD	\N	\N		1000	\N	\N
Wm7900CD	\N	\N		1000	\N	\N
Vg4807CD	\N	\N		1000	\N	\N
Do7322CD	\N	\N		1000	\N	\N
Vf8904CD	\N	\N		1000	\N	\N
Tt5155CD	\N	\N		1000	\N	\N
Cw7883CD	\N	\N		1000	\N	\N
Qh6502CD	\N	\N		1000	\N	\N
Ny2006CD	\N	\N		1000	\N	\N
Ea1139CD	\N	\N		1000	\N	\N
Cp2210CD	\N	\N		1000	\N	\N
Id1750CD	\N	\N		1000	\N	\N
Uw9290CD	\N	\N		1000	\N	\N
Oi5615CD	\N	\N		1000	\N	\N
Ma1141CD	\N	\N		1000	\N	\N
Tw5969CD	\N	\N		1000	\N	\N
Ie6712CD	\N	\N		1000	\N	\N
Bh2529CD	\N	\N		1000	\N	\N
Gk5709CD	\N	\N		1000	\N	\N
Qj7433CD	\N	\N		1000	\N	\N
Aw0949CD	\N	\N		1000	\N	\N
Dh0905CD	\N	\N		1000	\N	\N
Bw6470CD	\N	\N		1000	\N	\N
Ps8136CD	\N	\N		1000	\N	\N
Hc2804CD	\N	\N		1000	\N	\N
Mp0784CD	\N	\N		1000	\N	\N
Uo9663CD	\N	\N		1000	\N	\N
Nu6600CD	\N	\N		1000	\N	\N
Cm2595CD	\N	\N		1000	\N	\N
Bc5067CD	\N	\N		1000	\N	\N
Oc5984CD	\N	\N		1000	\N	\N
Bf7194CD	\N	\N		1000	\N	\N
Fs2725CD	\N	\N		1000	\N	\N
Ew8603CD	\N	\N		1000	\N	\N
Ia1300CD	\N	\N		1000	\N	\N
Lw1693CD	\N	\N		1000	\N	\N
Tu3682CD	\N	\N		1000	\N	\N
Ds5365CD	\N	\N		1000	\N	\N
Is0804CD	\N	\N		1000	\N	\N
Su1715CD	\N	\N		1000	\N	\N
Kh3142CD	\N	\N		1000	\N	\N
Os2296CD	\N	\N		1000	\N	\N
Cm9156CD	\N	\N		1000	\N	\N
Pi2929CD	\N	\N		1000	\N	\N
Ks6222CD	\N	\N		1000	\N	\N
Ew6620CD	\N	\N		1000	\N	\N
Hv4661CD	\N	\N		1000	\N	\N
Ae6182CD	\N	\N		1000	\N	\N
Wv9997CD	\N	\N		1000	\N	\N
Rg0738CD	\N	\N		1000	\N	\N
Mu3313CD	\N	\N		1000	\N	\N
Lv3533CD	\N	\N		1000	\N	\N
Sc0976CD	\N	\N		1000	\N	\N
Dy0563CD	\N	\N		1000	\N	\N
Ns5122CD	\N	\N		1000	\N	\N
Xx9809CD	\N	\N		1000	\N	\N
Lh7406CD	\N	\N		1000	\N	\N
Sj3362CD	\N	\N		1000	\N	\N
Zd4854CD	\N	\N		1000	\N	\N
It1831CD	\N	\N		1000	\N	\N
Cj3297CD	\N	\N		1000	\N	\N
Jn3804CD	\N	\N		1000	\N	\N
Nq7733CD	\N	\N		1000	\N	\N
St1173CD	\N	\N		1000	\N	\N
Hk5499CD	\N	\N		1000	\N	\N
Jl3602CD	\N	\N		1000	\N	\N
Ql3615CD	\N	\N		1000	\N	\N
Rn6247CD	\N	\N		1000	\N	\N
Pe4361CD	\N	\N		1000	\N	\N
Mk3864CD	\N	\N		1000	\N	\N
Hg5531CD	\N	\N		1000	\N	\N
Ug0849CD	\N	\N		1000	\N	\N
Io3565CD	\N	\N		1000	\N	\N
Pq0425CD	\N	\N		1000	\N	\N
Gx1385CD	\N	\N		1000	\N	\N
Ld8660CD	\N	\N		1000	\N	\N
Vv5142CD	\N	\N		1000	\N	\N
Yg9422CD	\N	\N		1000	\N	\N
Lq4158CD	\N	\N		1000	\N	\N
Qw9322CD	\N	\N		1000	\N	\N
Tl3095CD	\N	\N		1000	\N	\N
Rt6094CD	\N	\N		1000	\N	\N
Je4382CD	\N	\N		1000	\N	\N
Sm5618CD	\N	\N		1000	\N	\N
Qm4789CD	\N	\N		1000	\N	\N
Lb3257CD	\N	\N		1000	\N	\N
Ao9994CD	\N	\N		1000	\N	\N
My7416CD	\N	\N		1000	\N	\N
Bv5700CD	\N	\N		1000	\N	\N
Ew1003CD	\N	\N		1000	\N	\N
Nu2773CD	\N	\N		1000	\N	\N
Sq7622CD	\N	\N		1000	\N	\N
Wm1097CD	\N	\N		1000	\N	\N
Ll4088CD	\N	\N		1000	\N	\N
Rj1674CD	\N	\N		1000	\N	\N
Ki4305CD	\N	\N		1000	\N	\N
Pp6421CD	\N	\N		1000	\N	\N
Fb0535CD	\N	\N		1000	\N	\N
Fb2553CD	\N	\N		1000	\N	\N
Gr8954CD	\N	\N		1000	\N	\N
Hq1687CD	\N	\N		1000	\N	\N
Pi5746CD	\N	\N		1000	\N	\N
Gq9682CD	\N	\N		1000	\N	\N
Mg4576CD	\N	\N		1000	\N	\N
Ax6287CD	\N	\N		1000	\N	\N
Vk3099CD	\N	\N		1000	\N	\N
Eu6902CD	\N	\N		1000	\N	\N
Co6730CD	\N	\N		1000	\N	\N
Kf0753CD	\N	\N		1000	\N	\N
Wv9499CD	\N	\N		1000	\N	\N
Qw9022CD	\N	\N		1000	\N	\N
Ra5099CD	\N	\N		1000	\N	\N
Ok5939CD	\N	\N		1000	\N	\N
Vt3394CD	\N	\N		1000	\N	\N
Jr2983CD	\N	\N		1000	\N	\N
Yd1210CD	\N	\N		1000	\N	\N
Hn6455CD	\N	\N		1000	\N	\N
Rm2343CD	\N	\N		1000	\N	\N
Nm2418CD	\N	\N		1000	\N	\N
Jq2914CD	\N	\N		1000	\N	\N
Iv7944CD	\N	\N		1000	\N	\N
Qu1099CD	\N	\N		1000	\N	\N
Py9865CD	\N	\N		1000	\N	\N
Up8471CD	\N	\N		1000	\N	\N
Jf0618CD	\N	\N		1000	\N	\N
Tc3219CD	\N	\N		1000	\N	\N
In6341CD	\N	\N		1000	\N	\N
Pr3265CD	\N	\N		1000	\N	\N
Ht6631CD	\N	\N		1000	\N	\N
Ki6590CD	\N	\N		1000	\N	\N
Vq8332CD	\N	\N		1000	\N	\N
Pn4184CD	\N	\N		1000	\N	\N
Qn5401CD	\N	\N		1000	\N	\N
Qy4224CD	\N	\N		1000	\N	\N
Qe3631CD	\N	\N		1000	\N	\N
Gt7893CD	\N	\N		1000	\N	\N
Vx5530CD	\N	\N		1000	\N	\N
Jk5173CD	\N	\N		1000	\N	\N
Fu0221CD	\N	\N		1000	\N	\N
Ws3485CD	\N	\N		1000	\N	\N
Oi5636CD	\N	\N		1000	\N	\N
Ak4314CD	\N	\N		1000	\N	\N
Gu8813CD	\N	\N		1000	\N	\N
Br7704CD	\N	\N		1000	\N	\N
Or0151CD	\N	\N		1000	\N	\N
Ue0178CD	\N	\N		1000	\N	\N
Rq2810CD	\N	\N		1000	\N	\N
Cp2756CD	\N	\N		1000	\N	\N
Xr1999CD	\N	\N		1000	\N	\N
Zx4662CD	\N	\N		1000	\N	\N
At8135CD	\N	\N		1000	\N	\N
Zw6171CD	\N	\N		1000	\N	\N
Fl4492CD	\N	\N		1000	\N	\N
Kv0072CD	\N	\N		1000	\N	\N
Nc0277CD	\N	\N		1000	\N	\N
Ea4012CD	\N	\N		1000	\N	\N
Ai7050CD	\N	\N		1000	\N	\N
Gx7868CD	\N	\N		1000	\N	\N
Jy9203CD	\N	\N		1000	\N	\N
Nr2438CD	\N	\N		1000	\N	\N
Jh1053CD	\N	\N		1000	\N	\N
Jc2884CD	\N	\N		1000	\N	\N
Pr3857CD	\N	\N		1000	\N	\N
Dc0513CD	\N	\N		1000	\N	\N
Nb8005CD	\N	\N		1000	\N	\N
Xu0975CD	\N	\N		1000	\N	\N
Xk3443CD	\N	\N		1000	\N	\N
Bh3710CD	\N	\N		1000	\N	\N
Sh6218CD	\N	\N		1000	\N	\N
Vl5753CD	\N	\N		1000	\N	\N
Vb0896CD	\N	\N		1000	\N	\N
Vk0861CD	\N	\N		1000	\N	\N
Kg6005CD	\N	\N		1000	\N	\N
Ph9336CD	\N	\N		1000	\N	\N
Hy2999CD	\N	\N		1000	\N	\N
Qe0636CD	\N	\N		1000	\N	\N
Po3057CD	\N	\N		1000	\N	\N
Bv9724CD	\N	\N		1000	\N	\N
On0752CD	\N	\N		1000	\N	\N
Lw3718CD	\N	\N		1000	\N	\N
Ll1520CD	\N	\N		1000	\N	\N
Yv8974CD	\N	\N		1000	\N	\N
Fc1714CD	\N	\N		1000	\N	\N
Gv5041CD	\N	\N		1000	\N	\N
Hq8189CD	\N	\N		1000	\N	\N
Kp5155CD	\N	\N		1000	\N	\N
Gu0554CD	\N	\N		1000	\N	\N
Wl7052CD	\N	\N		1000	\N	\N
Jb8099CD	\N	\N		1000	\N	\N
Nb9885CD	\N	\N		1000	\N	\N
Op1385CD	\N	\N		1000	\N	\N
An9833CD	\N	\N		1000	\N	\N
Wb9017CD	\N	\N		1000	\N	\N
Mo3309CD	\N	\N		1000	\N	\N
Ze0207CD	\N	\N		1000	\N	\N
Fe2419CD	\N	\N		1000	\N	\N
Gq3030CD	\N	\N		1000	\N	\N
Wb5428CD	\N	\N		1000	\N	\N
Uj8237CD	\N	\N		1000	\N	\N
Gf0204CD	\N	\N		1000	\N	\N
Rf4428CD	\N	\N		1000	\N	\N
Zb9894CD	\N	\N		1000	\N	\N
Pl3584CD	\N	\N		1000	\N	\N
Xz7481CD	\N	\N		1000	\N	\N
Mi0163CD	\N	\N		1000	\N	\N
Jy6764CD	\N	\N		1000	\N	\N
Wu2308CD	\N	\N		1000	\N	\N
Db6742CD	\N	\N		1000	\N	\N
Uw3137CD	\N	\N		1000	\N	\N
Lr4759CD	\N	\N		1000	\N	\N
Ba8819CD	\N	\N		1000	\N	\N
Aw1206CD	\N	\N		1000	\N	\N
Ao6655CD	\N	\N		1000	\N	\N
Ti1936CD	\N	\N		1000	\N	\N
Zy1628CD	\N	\N		1000	\N	\N
Ro6609CD	\N	\N		1000	\N	\N
Ju1796CD	\N	\N		1000	\N	\N
Vs2014CD	\N	\N		1000	\N	\N
Oo5136CD	\N	\N		1000	\N	\N
Pm2938CD	\N	\N		1000	\N	\N
Ub2800CD	\N	\N		1000	\N	\N
Nu8387CD	\N	\N		1000	\N	\N
Us9038CD	\N	\N		1000	\N	\N
Uw4397CD	\N	\N		1000	\N	\N
Zs2520CD	\N	\N		1000	\N	\N
Qy6964CD	\N	\N		1000	\N	\N
Vh2122CD	\N	\N		1000	\N	\N
Zu2818CD	\N	\N		1000	\N	\N
Jg5602CD	\N	\N		1000	\N	\N
We6868CD	\N	\N		1000	\N	\N
Cp8876CD	\N	\N		1000	\N	\N
Rc2212CD	\N	\N		1000	\N	\N
Fd3242CD	\N	\N		1000	\N	\N
Bt6639CD	\N	\N		1000	\N	\N
Xj0346CD	\N	\N		1000	\N	\N
Ws8253CD	\N	\N		1000	\N	\N
Ai8587CD	\N	\N		1000	\N	\N
Xu9028CD	\N	\N		1000	\N	\N
Er1684CD	\N	\N		1000	\N	\N
Sm5215CD	\N	\N		1000	\N	\N
Vt3544CD	\N	\N		1000	\N	\N
Mz7300CD	\N	\N		1000	\N	\N
Yz7914CD	\N	\N		1000	\N	\N
Ft7948CD	\N	\N		1000	\N	\N
Hn5027CD	\N	\N		1000	\N	\N
Tc9968CD	\N	\N		1000	\N	\N
Dz3172CD	\N	\N		1000	\N	\N
Lu5877CD	\N	\N		1000	\N	\N
Dt5177CD	\N	\N		1000	\N	\N
Fh2694CD	\N	\N		1000	\N	\N
Pw8329CD	\N	\N		1000	\N	\N
Ev9659CD	\N	\N		1000	\N	\N
Ex6743CD	\N	\N		1000	\N	\N
Id6535CD	\N	\N		1000	\N	\N
Na2021CD	\N	\N		1000	\N	\N
Ou0303CD	\N	\N		1000	\N	\N
Pi2811CD	\N	\N		1000	\N	\N
Uq6454CD	\N	\N		1000	\N	\N
Xt2377CD	\N	\N		1000	\N	\N
Ov4495CD	\N	\N		1000	\N	\N
Nc2272CD	\N	\N		1000	\N	\N
Ln0232CD	\N	\N		1000	\N	\N
Qd3052CD	\N	\N		1000	\N	\N
Rh0881CD	\N	\N		1000	\N	\N
Ok9140CD	\N	\N		1000	\N	\N
Pf2469CD	\N	\N		1000	\N	\N
Yf9817CD	\N	\N		1000	\N	\N
Rb8943CD	\N	\N		1000	\N	\N
Mi4394CD	\N	\N		1000	\N	\N
Al8573CD	\N	\N		1000	\N	\N
Am8037CD	\N	\N		1000	\N	\N
Sz4010CD	\N	\N		1000	\N	\N
Ap4511CD	\N	\N		1000	\N	\N
Yp1587CD	\N	\N		1000	\N	\N
Zm9246CD	\N	\N		1000	\N	\N
Py7521CD	\N	\N		1000	\N	\N
Cd7907CD	\N	\N		1000	\N	\N
Su7816CD	\N	\N		1000	\N	\N
Sh6346CD	\N	\N		1000	\N	\N
Ic6070CD	\N	\N		1000	\N	\N
Vv3694CD	\N	\N		1000	\N	\N
Ml3581CD	\N	\N		1000	\N	\N
Sb2641CD	\N	\N		1000	\N	\N
Qg2040CD	\N	\N		1000	\N	\N
Rx4987CD	\N	\N		1000	\N	\N
Wl2773CD	\N	\N		1000	\N	\N
Jt0754CD	\N	\N		1000	\N	\N
Vd4760CD	\N	\N		1000	\N	\N
Dg9895CD	\N	\N		1000	\N	\N
Jz5911CD	\N	\N		1000	\N	\N
Mb4774CD	\N	\N		1000	\N	\N
Ml9905CD	\N	\N		1000	\N	\N
Rk6620CD	\N	\N		1000	\N	\N
Is5072CD	\N	\N		1000	\N	\N
Az1419CD	\N	\N		1000	\N	\N
Pf6831CD	\N	\N		1000	\N	\N
Kh8864CD	\N	\N		1000	\N	\N
Jy3136CD	\N	\N		1000	\N	\N
Zv9262CD	\N	\N		1000	\N	\N
Rb8250CD	\N	\N		1000	\N	\N
Oy4114CD	\N	\N		1000	\N	\N
Hz6706CD	\N	\N		1000	\N	\N
Af8577CD	\N	\N		1000	\N	\N
Dr9387CD	\N	\N		1000	\N	\N
Bg0834CD	\N	\N		1000	\N	\N
Ms1702CD	\N	\N		1000	\N	\N
Dx4298CD	\N	\N		1000	\N	\N
Cj2692CD	\N	\N		1000	\N	\N
Hr3932CD	\N	\N		1000	\N	\N
Bs7887CD	\N	\N		1000	\N	\N
Hy2371CD	\N	\N		1000	\N	\N
Pk7366CD	\N	\N		1000	\N	\N
Un1639CD	\N	\N		1000	\N	\N
Yj4837CD	\N	\N		1000	\N	\N
Ms2635CD	\N	\N		1000	\N	\N
Ze0737CD	\N	\N		1000	\N	\N
Df1840CD	\N	\N		1000	\N	\N
Tv2434CD	\N	\N		1000	\N	\N
Hd2116CD	\N	\N		1000	\N	\N
Yq1726CD	\N	\N		1000	\N	\N
Wd1576CD	\N	\N		1000	\N	\N
Kd6495CD	\N	\N		1000	\N	\N
Fr7473CD	\N	\N		1000	\N	\N
Rd9268CD	\N	\N		1000	\N	\N
Oe0858CD	\N	\N		1000	\N	\N
Hw5504CD	\N	\N		1000	\N	\N
Rl6586CD	\N	\N		1000	\N	\N
Dd8152CD	\N	\N		1000	\N	\N
Kg1803CD	\N	\N		1000	\N	\N
Rb8749CD	\N	\N		1000	\N	\N
Mc2463CD	\N	\N		1000	\N	\N
Fv8251CD	\N	\N		1000	\N	\N
Xs1116CD	\N	\N		1000	\N	\N
Ng3533CD	\N	\N		1000	\N	\N
Ay5957CD	\N	\N		1000	\N	\N
Ww6887CD	\N	\N		1000	\N	\N
Py8005CD	\N	\N		1000	\N	\N
Sb4998CD	\N	\N		1000	\N	\N
Yc0844CD	\N	\N		1000	\N	\N
Un4241CD	\N	\N		1000	\N	\N
Ub4667CD	\N	\N		1000	\N	\N
Cb2957CD	\N	\N		1000	\N	\N
Up9349CD	\N	\N		1000	\N	\N
Nu2184CD	\N	\N		1000	\N	\N
Jo0338CD	\N	\N		1000	\N	\N
Wf1266CD	\N	\N		1000	\N	\N
Ii1152CD	\N	\N		1000	\N	\N
Cx4829CD	\N	\N		1000	\N	\N
Fx0200CD	\N	\N		1000	\N	\N
Pq003G1m	\N	\N	Pq003G1m	0	\N	\N
Ry943G1m	\N	\N	Ry943G1m	0	\N	\N
Ez752G1m	\N	\N	Ez752G1m	0	\N	\N
Xc107G1m	\N	\N	Xc107G1m	0	\N	\N
Gh598G1m	\N	\N	Gh598G1m	0	\N	\N
Zd394G1m	\N	\N	Zd394G1m	0	\N	\N
De067G1m	\N	\N	De067G1m	0	\N	\N
Dw281G1m	\N	\N	Dw281G1m	0	\N	\N
Vz305G1m	\N	\N	Vz305G1m	0	\N	\N
Pt695G1m	\N	\N	Pt695G1m	0	\N	\N
Lk759G1m	\N	\N	Lk759G1m	0	\N	\N
Jc391G1m	\N	\N	Jc391G1m	0	\N	\N
Zf133G1m	\N	\N	Zf133G1m	0	\N	\N
Sq336G1m	\N	\N	Sq336G1m	0	\N	\N
Tc769G1m	\N	\N	Tc769G1m	0	\N	\N
Ts788G1m	\N	\N	Ts788G1m	0	\N	\N
Zr583G1m	\N	\N	Zr583G1m	0	\N	\N
Qn661G1m	\N	\N	Qn661G1m	0	\N	\N
Tc570G1m	\N	\N	Tc570G1m	0	\N	\N
Ds875G1m	\N	\N	Ds875G1m	0	\N	\N
Pd851G1m	\N	\N	Pd851G1m	0	\N	\N
Xy846G1m	\N	\N	Xy846G1m	0	\N	\N
Ya138G1m	\N	\N	Ya138G1m	0	\N	\N
Ut534G1m	\N	\N	Ut534G1m	0	\N	\N
So920G1m	\N	\N	So920G1m	0	\N	\N
Gl955G1m	\N	\N	Gl955G1m	0	\N	\N
Nv513G1m	\N	\N	Nv513G1m	0	\N	\N
Lz762G1m	\N	\N	Lz762G1m	0	\N	\N
Qx445G1m	\N	\N	Qx445G1m	0	\N	\N
Ho003G1m	\N	\N	Ho003G1m	0	\N	\N
Hv152G1m	\N	\N	Hv152G1m	0	\N	\N
Bv934G1m	\N	\N	Bv934G1m	0	\N	\N
Ro107G1m	\N	\N	Ro107G1m	0	\N	\N
Oe334G1m	\N	\N	Oe334G1m	0	\N	\N
Zn957G1m	\N	\N	Zn957G1m	0	\N	\N
Ns575G1m	\N	\N	Ns575G1m	0	\N	\N
Xu938G1m	\N	\N	Xu938G1m	0	\N	\N
It688G1m	\N	\N	It688G1m	0	\N	\N
Qv912G1m	\N	\N	Qv912G1m	0	\N	\N
Tb200G1m	\N	\N	Tb200G1m	0	\N	\N
Pj596G1m	\N	\N	Pj596G1m	0	\N	\N
Xt761G1m	\N	\N	Xt761G1m	0	\N	\N
Oa920G1m	\N	\N	Oa920G1m	0	\N	\N
Ve673G1m	\N	\N	Ve673G1m	0	\N	\N
Fr035G1m	\N	\N	Fr035G1m	0	\N	\N
Dj223G1m	\N	\N	Dj223G1m	0	\N	\N
Dt533G1m	\N	\N	Dt533G1m	0	\N	\N
Qf446G1m	\N	\N	Qf446G1m	0	\N	\N
Km374G1m	\N	\N	Km374G1m	0	\N	\N
Wz947G1m	\N	\N	Wz947G1m	0	\N	\N
Gt451G1m	\N	\N	Gt451G1m	0	\N	\N
Pd257G1m	\N	\N	Pd257G1m	0	\N	\N
Nn040G1m	\N	\N	Nn040G1m	0	\N	\N
Dj066G1m	\N	\N	Dj066G1m	0	\N	\N
Mw425G1m	\N	\N	Mw425G1m	0	\N	\N
Nd282G1m	\N	\N	Nd282G1m	0	\N	\N
Cd793G1m	\N	\N	Cd793G1m	0	\N	\N
Kd131G1m	\N	\N	Kd131G1m	0	\N	\N
Zh902G1m	\N	\N	Zh902G1m	0	\N	\N
Qb260G1m	\N	\N	Qb260G1m	0	\N	\N
Wq024G1m	\N	\N	Wq024G1m	0	\N	\N
Xk465G1m	\N	\N	Xk465G1m	0	\N	\N
Ux189G1m	\N	\N	Ux189G1m	0	\N	\N
Qq515G1m	\N	\N	Qq515G1m	0	\N	\N
Gm575G1m	\N	\N	Gm575G1m	0	\N	\N
Co959G1m	\N	\N	Co959G1m	0	\N	\N
Gh807G1m	\N	\N	Gh807G1m	0	\N	\N
Jd332G1m	\N	\N	Jd332G1m	0	\N	\N
Uc813G1m	\N	\N	Uc813G1m	0	\N	\N
Tr030G1m	\N	\N	Tr030G1m	0	\N	\N
Mh229G1m	\N	\N	Mh229G1m	0	\N	\N
Po907G1m	\N	\N	Po907G1m	0	\N	\N
It551G1m	\N	\N	It551G1m	0	\N	\N
Fl138G1m	\N	\N	Fl138G1m	0	\N	\N
Ur871G1m	\N	\N	Ur871G1m	0	\N	\N
Xf444G1m	\N	\N	Xf444G1m	0	\N	\N
Xp028G1m	\N	\N	Xp028G1m	0	\N	\N
Fm264G1m	\N	\N	Fm264G1m	0	\N	\N
Ui669G1m	\N	\N	Ui669G1m	0	\N	\N
Lq934G1m	\N	\N	Lq934G1m	0	\N	\N
Xo685G1m	\N	\N	Xo685G1m	0	\N	\N
Ka033G1m	\N	\N	Ka033G1m	0	\N	\N
Ce538G1m	\N	\N	Ce538G1m	0	\N	\N
Jg931G1m	\N	\N	Jg931G1m	0	\N	\N
Qm517G1m	\N	\N	Qm517G1m	0	\N	\N
Gg328G1m	\N	\N	Gg328G1m	0	\N	\N
At483G1m	\N	\N	At483G1m	0	\N	\N
Gw998G1m	\N	\N	Gw998G1m	0	\N	\N
Wx569G1m	\N	\N	Wx569G1m	0	\N	\N
Kc368G1m	\N	\N	Kc368G1m	0	\N	\N
Ix322G1m	\N	\N	Ix322G1m	0	\N	\N
Si962G1m	\N	\N	Si962G1m	0	\N	\N
Uy605G1m	\N	\N	Uy605G1m	0	\N	\N
As736G1m	\N	\N	As736G1m	0	\N	\N
Ta487G1m	\N	\N	Ta487G1m	0	\N	\N
Zv840G1m	\N	\N	Zv840G1m	0	\N	\N
Ip713G1m	\N	\N	Ip713G1m	0	\N	\N
Om316G1m	\N	\N	Om316G1m	0	\N	\N
Eg594G1m	\N	\N	Eg594G1m	0	\N	\N
Wb021G1m	\N	\N	Wb021G1m	0	\N	\N
Sc593G1m	\N	\N	Sc593G1m	0	\N	\N
Xx406G1m	\N	\N	Xx406G1m	0	\N	\N
Au725G1m	\N	\N	Au725G1m	0	\N	\N
Sm143G1m	\N	\N	Sm143G1m	0	\N	\N
Tl088G1m	\N	\N	Tl088G1m	0	\N	\N
Vc418G1m	\N	\N	Vc418G1m	0	\N	\N
Ye570G1m	\N	\N	Ye570G1m	0	\N	\N
Gb625G1m	\N	\N	Gb625G1m	0	\N	\N
Ew316G1m	\N	\N	Ew316G1m	0	\N	\N
Xb633G1m	\N	\N	Xb633G1m	0	\N	\N
Rp684G1m	\N	\N	Rp684G1m	0	\N	\N
We537G1m	\N	\N	We537G1m	0	\N	\N
Jv811G1m	\N	\N	Jv811G1m	0	\N	\N
Xp110G1m	\N	\N	Xp110G1m	0	\N	\N
Xs121G1m	\N	\N	Xs121G1m	0	\N	\N
Qg056G1m	\N	\N	Qg056G1m	0	\N	\N
Kn037G1m	\N	\N	Kn037G1m	0	\N	\N
Yd606G1m	\N	\N	Yd606G1m	0	\N	\N
Mh327G1m	\N	\N	Mh327G1m	0	\N	\N
Wg112G1m	\N	\N	Wg112G1m	0	\N	\N
Qb455G1m	\N	\N	Qb455G1m	0	\N	\N
Il697G1m	\N	\N	Il697G1m	0	\N	\N
Vb998G1m	\N	\N	Vb998G1m	0	\N	\N
Xc897G1m	\N	\N	Xc897G1m	0	\N	\N
Dd990G1m	\N	\N	Dd990G1m	0	\N	\N
Gw045G1m	\N	\N	Gw045G1m	0	\N	\N
Up956G1m	\N	\N	Up956G1m	0	\N	\N
Xq902G1m	\N	\N	Xq902G1m	0	\N	\N
Di832G1m	\N	\N	Di832G1m	0	\N	\N
Qe143G1m	\N	\N	Qe143G1m	0	\N	\N
Lj737G1m	\N	\N	Lj737G1m	0	\N	\N
Oc403G1m	\N	\N	Oc403G1m	0	\N	\N
Bi061G1m	\N	\N	Bi061G1m	0	\N	\N
Us838G1m	\N	\N	Us838G1m	0	\N	\N
Fi787G1m	\N	\N	Fi787G1m	0	\N	\N
Jz192G1m	\N	\N	Jz192G1m	0	\N	\N
No977G1m	\N	\N	No977G1m	0	\N	\N
Yh180G1m	\N	\N	Yh180G1m	0	\N	\N
Pb119G1m	\N	\N	Pb119G1m	0	\N	\N
Gb030G1m	\N	\N	Gb030G1m	0	\N	\N
Fn870G1m	\N	\N	Fn870G1m	0	\N	\N
Eo286G1m	\N	\N	Eo286G1m	0	\N	\N
En309G1m	\N	\N	En309G1m	0	\N	\N
Xh066G1m	\N	\N	Xh066G1m	0	\N	\N
Nw743G1m	\N	\N	Nw743G1m	0	\N	\N
Il835G1m	\N	\N	Il835G1m	0	\N	\N
Nd352G1m	\N	\N	Nd352G1m	0	\N	\N
Hu155G1m	\N	\N	Hu155G1m	0	\N	\N
Sv979G1m	\N	\N	Sv979G1m	0	\N	\N
Ji454G1m	\N	\N	Ji454G1m	0	\N	\N
Cr397G1m	\N	\N	Cr397G1m	0	\N	\N
Us592G1m	\N	\N	Us592G1m	0	\N	\N
Bd478G1m	\N	\N	Bd478G1m	0	\N	\N
Hb641G1m	\N	\N	Hb641G1m	0	\N	\N
Jm301G1m	\N	\N	Jm301G1m	0	\N	\N
Wp687G1m	\N	\N	Wp687G1m	0	\N	\N
Ch884G1m	\N	\N	Ch884G1m	0	\N	\N
Zt908G1m	\N	\N	Zt908G1m	0	\N	\N
Wj200G1m	\N	\N	Wj200G1m	0	\N	\N
Sp070G1m	\N	\N	Sp070G1m	0	\N	\N
Pm595G1m	\N	\N	Pm595G1m	0	\N	\N
Cg148G1m	\N	\N	Cg148G1m	0	\N	\N
Rs231G1m	\N	\N	Rs231G1m	0	\N	\N
Zx660G1m	\N	\N	Zx660G1m	0	\N	\N
Hc827G1m	\N	\N	Hc827G1m	0	\N	\N
Pr049G1m	\N	\N	Pr049G1m	0	\N	\N
Fu639G1m	\N	\N	Fu639G1m	0	\N	\N
Zq923G1m	\N	\N	Zq923G1m	0	\N	\N
Ed836G1m	\N	\N	Ed836G1m	0	\N	\N
Uq589G1m	\N	\N	Uq589G1m	0	\N	\N
Mo339G1m	\N	\N	Mo339G1m	0	\N	\N
Pq952G1m	\N	\N	Pq952G1m	0	\N	\N
Vt491G1m	\N	\N	Vt491G1m	0	\N	\N
Ls940G1m	\N	\N	Ls940G1m	0	\N	\N
Lq485G1m	\N	\N	Lq485G1m	0	\N	\N
Nl909G1m	\N	\N	Nl909G1m	0	\N	\N
Wf862G1m	\N	\N	Wf862G1m	0	\N	\N
Sa437G1m	\N	\N	Sa437G1m	0	\N	\N
Ng284G1m	\N	\N	Ng284G1m	0	\N	\N
Fl434G1m	\N	\N	Fl434G1m	0	\N	\N
Of641G1m	\N	\N	Of641G1m	0	\N	\N
Bf944G1m	\N	\N	Bf944G1m	0	\N	\N
Rw575G1m	\N	\N	Rw575G1m	0	\N	\N
Gk028G1m	\N	\N	Gk028G1m	0	\N	\N
Gb883G1m	\N	\N	Gb883G1m	0	\N	\N
Qn059G1m	\N	\N	Qn059G1m	0	\N	\N
Lv105G1m	\N	\N	Lv105G1m	0	\N	\N
Ym383G1m	\N	\N	Ym383G1m	0	\N	\N
Dr552G1m	\N	\N	Dr552G1m	0	\N	\N
Il605G1m	\N	\N	Il605G1m	0	\N	\N
Tk254G1m	\N	\N	Tk254G1m	0	\N	\N
Ha738G1m	\N	\N	Ha738G1m	0	\N	\N
Xp303G1m	\N	\N	Xp303G1m	0	\N	\N
Wj710G1m	\N	\N	Wj710G1m	0	\N	\N
Vn793G1m	\N	\N	Vn793G1m	0	\N	\N
Fi732G1m	\N	\N	Fi732G1m	0	\N	\N
Tk165G1m	\N	\N	Tk165G1m	0	\N	\N
Bm692G1m	\N	\N	Bm692G1m	0	\N	\N
Ri583G1m	\N	\N	Ri583G1m	0	\N	\N
Uv398G1m	\N	\N	Uv398G1m	0	\N	\N
Dh756G2m	\N	\N	Dh756G2m	0	\N	\N
Sh711G2m	\N	\N	Sh711G2m	0	\N	\N
If185G2m	\N	\N	If185G2m	0	\N	\N
Tn947G2m	\N	\N	Tn947G2m	0	\N	\N
Kt466G2m	\N	\N	Kt466G2m	0	\N	\N
Uq432G2m	\N	\N	Uq432G2m	0	\N	\N
Lr915G2m	\N	\N	Lr915G2m	0	\N	\N
Gf185G2m	\N	\N	Gf185G2m	0	\N	\N
Sr214G2m	\N	\N	Sr214G2m	0	\N	\N
Zm711G2m	\N	\N	Zm711G2m	0	\N	\N
Bk588G2m	\N	\N	Bk588G2m	0	\N	\N
Um216G2m	\N	\N	Um216G2m	0	\N	\N
Tw568G2m	\N	\N	Tw568G2m	0	\N	\N
Hj715G2m	\N	\N	Hj715G2m	0	\N	\N
Ek525G2m	\N	\N	Ek525G2m	0	\N	\N
Wh082G2m	\N	\N	Wh082G2m	0	\N	\N
Nj078G2m	\N	\N	Nj078G2m	0	\N	\N
Rd174G2m	\N	\N	Rd174G2m	0	\N	\N
Ga417G2m	\N	\N	Ga417G2m	0	\N	\N
En131G2m	\N	\N	En131G2m	0	\N	\N
Ii549G2m	\N	\N	Ii549G2m	0	\N	\N
Nr707G2m	\N	\N	Nr707G2m	0	\N	\N
Sr640G2m	\N	\N	Sr640G2m	0	\N	\N
Nu552G2m	\N	\N	Nu552G2m	0	\N	\N
Ja313G2m	\N	\N	Ja313G2m	0	\N	\N
Nw654G2m	\N	\N	Nw654G2m	0	\N	\N
Rf392G2m	\N	\N	Rf392G2m	0	\N	\N
Jx798G2m	\N	\N	Jx798G2m	0	\N	\N
Go544G2m	\N	\N	Go544G2m	0	\N	\N
Wv241G2m	\N	\N	Wv241G2m	0	\N	\N
Hq166G2m	\N	\N	Hq166G2m	0	\N	\N
An396G2m	\N	\N	An396G2m	0	\N	\N
Yt634G2m	\N	\N	Yt634G2m	0	\N	\N
Xh203G2m	\N	\N	Xh203G2m	0	\N	\N
Av357G2m	\N	\N	Av357G2m	0	\N	\N
Bm976G2m	\N	\N	Bm976G2m	0	\N	\N
Hb860G2m	\N	\N	Hb860G2m	0	\N	\N
Gg636G2m	\N	\N	Gg636G2m	0	\N	\N
Xr186G2m	\N	\N	Xr186G2m	0	\N	\N
Si205G2m	\N	\N	Si205G2m	0	\N	\N
Gt589G2m	\N	\N	Gt589G2m	0	\N	\N
Ii984G2m	\N	\N	Ii984G2m	0	\N	\N
Gg116G2m	\N	\N	Gg116G2m	0	\N	\N
Bg709G2m	\N	\N	Bg709G2m	0	\N	\N
Um869G2m	\N	\N	Um869G2m	0	\N	\N
Cm042G2m	\N	\N	Cm042G2m	0	\N	\N
Ck174G2m	\N	\N	Ck174G2m	0	\N	\N
Ov016G2m	\N	\N	Ov016G2m	0	\N	\N
Qb505G2m	\N	\N	Qb505G2m	0	\N	\N
Yu636G2m	\N	\N	Yu636G2m	0	\N	\N
Xh831G2m	\N	\N	Xh831G2m	0	\N	\N
Wk677G2m	\N	\N	Wk677G2m	0	\N	\N
Od708G2m	\N	\N	Od708G2m	0	\N	\N
Az572G2m	\N	\N	Az572G2m	0	\N	\N
Xy482G2m	\N	\N	Xy482G2m	0	\N	\N
Uu517G2m	\N	\N	Uu517G2m	0	\N	\N
Yv156G2m	\N	\N	Yv156G2m	0	\N	\N
Fq966G2m	\N	\N	Fq966G2m	0	\N	\N
Ya709G2m	\N	\N	Ya709G2m	0	\N	\N
Pb878G2m	\N	\N	Pb878G2m	0	\N	\N
Rc617G2m	\N	\N	Rc617G2m	0	\N	\N
Zp347G2m	\N	\N	Zp347G2m	0	\N	\N
Qh043G2m	\N	\N	Qh043G2m	0	\N	\N
Vt912G2m	\N	\N	Vt912G2m	0	\N	\N
Ap650G2m	\N	\N	Ap650G2m	0	\N	\N
Ju211G2m	\N	\N	Ju211G2m	0	\N	\N
Yi719G2m	\N	\N	Yi719G2m	0	\N	\N
Eo845G2m	\N	\N	Eo845G2m	0	\N	\N
Ef978G2m	\N	\N	Ef978G2m	0	\N	\N
Jg814G2m	\N	\N	Jg814G2m	0	\N	\N
Xs121G2m	\N	\N	Xs121G2m	0	\N	\N
Nj637G2m	\N	\N	Nj637G2m	0	\N	\N
Zo541G2m	\N	\N	Zo541G2m	0	\N	\N
Ny217G2m	\N	\N	Ny217G2m	0	\N	\N
Sg473G2m	\N	\N	Sg473G2m	0	\N	\N
Oe792G2m	\N	\N	Oe792G2m	0	\N	\N
Qb928G2m	\N	\N	Qb928G2m	0	\N	\N
Fn323G2m	\N	\N	Fn323G2m	0	\N	\N
Od537G2m	\N	\N	Od537G2m	0	\N	\N
Ck212G2m	\N	\N	Ck212G2m	0	\N	\N
Bk018G2m	\N	\N	Bk018G2m	0	\N	\N
Dy038G2m	\N	\N	Dy038G2m	0	\N	\N
Fk405G2m	\N	\N	Fk405G2m	0	\N	\N
Yl593G2m	\N	\N	Yl593G2m	0	\N	\N
Id732G2m	\N	\N	Id732G2m	0	\N	\N
Zn376G2m	\N	\N	Zn376G2m	0	\N	\N
Am892G2m	\N	\N	Am892G2m	0	\N	\N
Hj982G2m	\N	\N	Hj982G2m	0	\N	\N
Qg245G2m	\N	\N	Qg245G2m	0	\N	\N
Ps663G2m	\N	\N	Ps663G2m	0	\N	\N
Ai216G2m	\N	\N	Ai216G2m	0	\N	\N
Mu493G2m	\N	\N	Mu493G2m	0	\N	\N
Vf230G2m	\N	\N	Vf230G2m	0	\N	\N
Wg175G2m	\N	\N	Wg175G2m	0	\N	\N
Tw017G2m	\N	\N	Tw017G2m	0	\N	\N
Al347G2m	\N	\N	Al347G2m	0	\N	\N
Su338G2m	\N	\N	Su338G2m	0	\N	\N
Pc430G2m	\N	\N	Pc430G2m	0	\N	\N
Wt844G2m	\N	\N	Wt844G2m	0	\N	\N
Wz448G2m	\N	\N	Wz448G2m	0	\N	\N
Gh627G2m	\N	\N	Gh627G2m	0	\N	\N
Mh355G2m	\N	\N	Mh355G2m	0	\N	\N
Za805G2m	\N	\N	Za805G2m	0	\N	\N
Fl539G2m	\N	\N	Fl539G2m	0	\N	\N
Ga552G2m	\N	\N	Ga552G2m	0	\N	\N
Cs537G2m	\N	\N	Cs537G2m	0	\N	\N
Rj918G2m	\N	\N	Rj918G2m	0	\N	\N
Wd759G2m	\N	\N	Wd759G2m	0	\N	\N
Vv932G2m	\N	\N	Vv932G2m	0	\N	\N
Zn060G2m	\N	\N	Zn060G2m	0	\N	\N
Ed203G2m	\N	\N	Ed203G2m	0	\N	\N
Kp697G2m	\N	\N	Kp697G2m	0	\N	\N
Cp931G2m	\N	\N	Cp931G2m	0	\N	\N
Cz124G2m	\N	\N	Cz124G2m	0	\N	\N
Om894G2m	\N	\N	Om894G2m	0	\N	\N
Wx769G2m	\N	\N	Wx769G2m	0	\N	\N
Pj452G2m	\N	\N	Pj452G2m	0	\N	\N
Lm154G2m	\N	\N	Lm154G2m	0	\N	\N
Yg118G2m	\N	\N	Yg118G2m	0	\N	\N
Qd737G2m	\N	\N	Qd737G2m	0	\N	\N
Nz610G2m	\N	\N	Nz610G2m	0	\N	\N
Zz427G2m	\N	\N	Zz427G2m	0	\N	\N
Te373G2m	\N	\N	Te373G2m	0	\N	\N
Dl186G2m	\N	\N	Dl186G2m	0	\N	\N
Gq588G2m	\N	\N	Gq588G2m	0	\N	\N
Hn456G2m	\N	\N	Hn456G2m	0	\N	\N
Fk934G2m	\N	\N	Fk934G2m	0	\N	\N
Kd931G2m	\N	\N	Kd931G2m	0	\N	\N
Hq283G2m	\N	\N	Hq283G2m	0	\N	\N
Vj462G2m	\N	\N	Vj462G2m	0	\N	\N
Yy317G2m	\N	\N	Yy317G2m	0	\N	\N
Il130G2m	\N	\N	Il130G2m	0	\N	\N
Al258G2m	\N	\N	Al258G2m	0	\N	\N
Fz588G2m	\N	\N	Fz588G2m	0	\N	\N
Zh461G2m	\N	\N	Zh461G2m	0	\N	\N
Zq932G2m	\N	\N	Zq932G2m	0	\N	\N
Bz586G2m	\N	\N	Bz586G2m	0	\N	\N
Lt531G2m	\N	\N	Lt531G2m	0	\N	\N
Sv887G2m	\N	\N	Sv887G2m	0	\N	\N
Qt165G2m	\N	\N	Qt165G2m	0	\N	\N
Gp184G2m	\N	\N	Gp184G2m	0	\N	\N
Gy203G2m	\N	\N	Gy203G2m	0	\N	\N
Uv221G2m	\N	\N	Uv221G2m	0	\N	\N
Qe124G2m	\N	\N	Qe124G2m	0	\N	\N
Ul967G2m	\N	\N	Ul967G2m	0	\N	\N
Fd185G2m	\N	\N	Fd185G2m	0	\N	\N
Gm741G2m	\N	\N	Gm741G2m	0	\N	\N
Ng053G2m	\N	\N	Ng053G2m	0	\N	\N
Xq893G2m	\N	\N	Xq893G2m	0	\N	\N
Nn615G2m	\N	\N	Nn615G2m	0	\N	\N
Ce500G2m	\N	\N	Ce500G2m	0	\N	\N
Wm102G2m	\N	\N	Wm102G2m	0	\N	\N
Td288G2m	\N	\N	Td288G2m	0	\N	\N
Jy691G2m	\N	\N	Jy691G2m	0	\N	\N
Bg999G2m	\N	\N	Bg999G2m	0	\N	\N
Ok656G2m	\N	\N	Ok656G2m	0	\N	\N
Cr473G2m	\N	\N	Cr473G2m	0	\N	\N
Eo191G2m	\N	\N	Eo191G2m	0	\N	\N
Pg848G2m	\N	\N	Pg848G2m	0	\N	\N
Lu493G2m	\N	\N	Lu493G2m	0	\N	\N
Hj360G2m	\N	\N	Hj360G2m	0	\N	\N
Gu658G2m	\N	\N	Gu658G2m	0	\N	\N
Gw471G2m	\N	\N	Gw471G2m	0	\N	\N
Lp789G2m	\N	\N	Lp789G2m	0	\N	\N
Pz077G2m	\N	\N	Pz077G2m	0	\N	\N
Xt341G2m	\N	\N	Xt341G2m	0	\N	\N
Vj860G2m	\N	\N	Vj860G2m	0	\N	\N
Pg907G2m	\N	\N	Pg907G2m	0	\N	\N
Ut043G2m	\N	\N	Ut043G2m	0	\N	\N
Qq955G2m	\N	\N	Qq955G2m	0	\N	\N
Ld516G2m	\N	\N	Ld516G2m	0	\N	\N
Jd924G2m	\N	\N	Jd924G2m	0	\N	\N
Kb167G2m	\N	\N	Kb167G2m	0	\N	\N
Ti478G2m	\N	\N	Ti478G2m	0	\N	\N
Fr545G2m	\N	\N	Fr545G2m	0	\N	\N
Ct571G2m	\N	\N	Ct571G2m	0	\N	\N
Ux844G2m	\N	\N	Ux844G2m	0	\N	\N
Ow163G2m	\N	\N	Ow163G2m	0	\N	\N
Bc245G2m	\N	\N	Bc245G2m	0	\N	\N
Kn473G2m	\N	\N	Kn473G2m	0	\N	\N
Cp984G2m	\N	\N	Cp984G2m	0	\N	\N
Ix576G2m	\N	\N	Ix576G2m	0	\N	\N
Ip215G2m	\N	\N	Ip215G2m	0	\N	\N
Ce403G2m	\N	\N	Ce403G2m	0	\N	\N
Ty651G2m	\N	\N	Ty651G2m	0	\N	\N
Qa082G2m	\N	\N	Qa082G2m	0	\N	\N
Uy669G2m	\N	\N	Uy669G2m	0	\N	\N
Jp824G2m	\N	\N	Jp824G2m	0	\N	\N
Od173G2m	\N	\N	Od173G2m	0	\N	\N
Tj887G2m	\N	\N	Tj887G2m	0	\N	\N
Yc823G2m	\N	\N	Yc823G2m	0	\N	\N
Kl126G2m	\N	\N	Kl126G2m	0	\N	\N
La830G2m	\N	\N	La830G2m	0	\N	\N
Ic504G2m	\N	\N	Ic504G2m	0	\N	\N
Kr019G2m	\N	\N	Kr019G2m	0	\N	\N
Ms614G2m	\N	\N	Ms614G2m	0	\N	\N
Xe792G2m	\N	\N	Xe792G2m	0	\N	\N
Ab184G2m	\N	\N	Ab184G2m	0	\N	\N
Nf579G2m	\N	\N	Nf579G2m	0	\N	\N
Jv532G2m	\N	\N	Jv532G2m	0	\N	\N
Jf499G6m	\N	\N	Jf499G6m	0	\N	\N
Ox579G6m	\N	\N	Ox579G6m	0	\N	\N
Ge764G6m	\N	\N	Ge764G6m	0	\N	\N
Ws050G6m	\N	\N	Ws050G6m	0	\N	\N
Hm059G6m	\N	\N	Hm059G6m	0	\N	\N
Zb321G6m	\N	\N	Zb321G6m	0	\N	\N
Pe414G6m	\N	\N	Pe414G6m	0	\N	\N
Pd190G6m	\N	\N	Pd190G6m	0	\N	\N
Ta892G6m	\N	\N	Ta892G6m	0	\N	\N
Ee187G6m	\N	\N	Ee187G6m	0	\N	\N
Py969G6m	\N	\N	Py969G6m	0	\N	\N
Gi052G6m	\N	\N	Gi052G6m	0	\N	\N
Ab401G6m	\N	\N	Ab401G6m	0	\N	\N
Zr131G6m	\N	\N	Zr131G6m	0	\N	\N
Mg525G6m	\N	\N	Mg525G6m	0	\N	\N
No552G6m	\N	\N	No552G6m	0	\N	\N
Ly181G6m	\N	\N	Ly181G6m	0	\N	\N
Ka691G6m	\N	\N	Ka691G6m	0	\N	\N
Hi150G6m	\N	\N	Hi150G6m	0	\N	\N
Mq798G6m	\N	\N	Mq798G6m	0	\N	\N
Pr877G6m	\N	\N	Pr877G6m	0	\N	\N
Vx474G6m	\N	\N	Vx474G6m	0	\N	\N
Os995G6m	\N	\N	Os995G6m	0	\N	\N
Rw351G6m	\N	\N	Rw351G6m	0	\N	\N
Vq759G6m	\N	\N	Vq759G6m	0	\N	\N
Ri839G6m	\N	\N	Ri839G6m	0	\N	\N
Ep853G6m	\N	\N	Ep853G6m	0	\N	\N
Eo356G6m	\N	\N	Eo356G6m	0	\N	\N
Ns623G6m	\N	\N	Ns623G6m	0	\N	\N
Hp981G6m	\N	\N	Hp981G6m	0	\N	\N
Za836G6m	\N	\N	Za836G6m	0	\N	\N
Ul524G6m	\N	\N	Ul524G6m	0	\N	\N
Nu334G6m	\N	\N	Nu334G6m	0	\N	\N
Sd728G6m	\N	\N	Sd728G6m	0	\N	\N
Cw493G6m	\N	\N	Cw493G6m	0	\N	\N
Kh051G6m	\N	\N	Kh051G6m	0	\N	\N
Po659G6m	\N	\N	Po659G6m	0	\N	\N
Vm662G6m	\N	\N	Vm662G6m	0	\N	\N
Um721G6m	\N	\N	Um721G6m	0	\N	\N
Nq302G6m	\N	\N	Nq302G6m	0	\N	\N
Nx210G6m	\N	\N	Nx210G6m	0	\N	\N
Ic464G6m	\N	\N	Ic464G6m	0	\N	\N
Zd261G6m	\N	\N	Zd261G6m	0	\N	\N
Bs536G6m	\N	\N	Bs536G6m	0	\N	\N
Ii193G6m	\N	\N	Ii193G6m	0	\N	\N
Gx107G6m	\N	\N	Gx107G6m	0	\N	\N
Wn073G6m	\N	\N	Wn073G6m	0	\N	\N
Tz742G6m	\N	\N	Tz742G6m	0	\N	\N
Jn663G6m	\N	\N	Jn663G6m	0	\N	\N
Lm758G6m	\N	\N	Lm758G6m	0	\N	\N
Ji648G6m	\N	\N	Ji648G6m	0	\N	\N
Zs394G6m	\N	\N	Zs394G6m	0	\N	\N
Vm591G6m	\N	\N	Vm591G6m	0	\N	\N
Dc267G6m	\N	\N	Dc267G6m	0	\N	\N
Kn555G6m	\N	\N	Kn555G6m	0	\N	\N
Om898G6m	\N	\N	Om898G6m	0	\N	\N
Ce976G6m	\N	\N	Ce976G6m	0	\N	\N
Dv359G6m	\N	\N	Dv359G6m	0	\N	\N
Fd533G6m	\N	\N	Fd533G6m	0	\N	\N
Ne401G6m	\N	\N	Ne401G6m	0	\N	\N
Tm949G6m	\N	\N	Tm949G6m	0	\N	\N
Rg873G6m	\N	\N	Rg873G6m	0	\N	\N
Ud225G6m	\N	\N	Ud225G6m	0	\N	\N
Zb001G6m	\N	\N	Zb001G6m	0	\N	\N
Tu877G6m	\N	\N	Tu877G6m	0	\N	\N
Fx971G6m	\N	\N	Fx971G6m	0	\N	\N
Sy912G6m	\N	\N	Sy912G6m	0	\N	\N
Rs707G6m	\N	\N	Rs707G6m	0	\N	\N
Lh232G6m	\N	\N	Lh232G6m	0	\N	\N
Hn189G6m	\N	\N	Hn189G6m	0	\N	\N
Ku708G6m	\N	\N	Ku708G6m	0	\N	\N
Oo370G6m	\N	\N	Oo370G6m	0	\N	\N
Xs412G6m	\N	\N	Xs412G6m	0	\N	\N
Dv109G6m	\N	\N	Dv109G6m	0	\N	\N
Br330G6m	\N	\N	Br330G6m	0	\N	\N
Eb451G6m	\N	\N	Eb451G6m	0	\N	\N
Bg723G6m	\N	\N	Bg723G6m	0	\N	\N
Ab909G6m	\N	\N	Ab909G6m	0	\N	\N
Dm609G6m	\N	\N	Dm609G6m	0	\N	\N
Ks007G6m	\N	\N	Ks007G6m	0	\N	\N
Xl997G6m	\N	\N	Xl997G6m	0	\N	\N
Gw092G6m	\N	\N	Gw092G6m	0	\N	\N
Eb294G6m	\N	\N	Eb294G6m	0	\N	\N
Cj408G6m	\N	\N	Cj408G6m	0	\N	\N
Gl643G6m	\N	\N	Gl643G6m	0	\N	\N
Ux285G6m	\N	\N	Ux285G6m	0	\N	\N
Wn310G6m	\N	\N	Wn310G6m	0	\N	\N
Ue709G6m	\N	\N	Ue709G6m	0	\N	\N
Rz754G6m	\N	\N	Rz754G6m	0	\N	\N
Dz967G6m	\N	\N	Dz967G6m	0	\N	\N
Es789G6m	\N	\N	Es789G6m	0	\N	\N
Jq421G6m	\N	\N	Jq421G6m	0	\N	\N
Lk315G6m	\N	\N	Lk315G6m	0	\N	\N
Ht540G6m	\N	\N	Ht540G6m	0	\N	\N
Lw805G6m	\N	\N	Lw805G6m	0	\N	\N
Ga153G6m	\N	\N	Ga153G6m	0	\N	\N
Ir273G6m	\N	\N	Ir273G6m	0	\N	\N
Kr517G6m	\N	\N	Kr517G6m	0	\N	\N
Ce551G6m	\N	\N	Ce551G6m	0	\N	\N
Lx332G6m	\N	\N	Lx332G6m	0	\N	\N
Tc882G6m	\N	\N	Tc882G6m	0	\N	\N
Pu701G6m	\N	\N	Pu701G6m	0	\N	\N
Wn450G6m	\N	\N	Wn450G6m	0	\N	\N
Uc328G6m	\N	\N	Uc328G6m	0	\N	\N
Fo933G6m	\N	\N	Fo933G6m	0	\N	\N
On463G6m	\N	\N	On463G6m	0	\N	\N
Vg456G6m	\N	\N	Vg456G6m	0	\N	\N
Xi580G6m	\N	\N	Xi580G6m	0	\N	\N
Rz865G6m	\N	\N	Rz865G6m	0	\N	\N
Hc430G6m	\N	\N	Hc430G6m	0	\N	\N
By642G6m	\N	\N	By642G6m	0	\N	\N
Jk345G6m	\N	\N	Jk345G6m	0	\N	\N
Od185G6m	\N	\N	Od185G6m	0	\N	\N
Nt959G6m	\N	\N	Nt959G6m	0	\N	\N
Gw710G6m	\N	\N	Gw710G6m	0	\N	\N
Vm298G6m	\N	\N	Vm298G6m	0	\N	\N
Do407G6m	\N	\N	Do407G6m	0	\N	\N
Eo899G6m	\N	\N	Eo899G6m	0	\N	\N
Pt311G6m	\N	\N	Pt311G6m	0	\N	\N
Jo706G6m	\N	\N	Jo706G6m	0	\N	\N
Cb800G6m	\N	\N	Cb800G6m	0	\N	\N
Re057G6m	\N	\N	Re057G6m	0	\N	\N
Iq985G6m	\N	\N	Iq985G6m	0	\N	\N
Gq523G6m	\N	\N	Gq523G6m	0	\N	\N
Gi466G6m	\N	\N	Gi466G6m	0	\N	\N
Yk641G6m	\N	\N	Yk641G6m	0	\N	\N
Zn657G6m	\N	\N	Zn657G6m	0	\N	\N
Yy465G6m	\N	\N	Yy465G6m	0	\N	\N
Mm767G6m	\N	\N	Mm767G6m	0	\N	\N
Ka138G6m	\N	\N	Ka138G6m	0	\N	\N
Tq144G6m	\N	\N	Tq144G6m	0	\N	\N
Vn190G6m	\N	\N	Vn190G6m	0	\N	\N
Mo667G6m	\N	\N	Mo667G6m	0	\N	\N
Ht735G6m	\N	\N	Ht735G6m	0	\N	\N
Fh272G6m	\N	\N	Fh272G6m	0	\N	\N
Li848G6m	\N	\N	Li848G6m	0	\N	\N
Tz657G6m	\N	\N	Tz657G6m	0	\N	\N
Fa279G6m	\N	\N	Fa279G6m	0	\N	\N
Dc269G6m	\N	\N	Dc269G6m	0	\N	\N
Kx540G6m	\N	\N	Kx540G6m	0	\N	\N
Bp188G6m	\N	\N	Bp188G6m	0	\N	\N
Lc922G6m	\N	\N	Lc922G6m	0	\N	\N
Ya714G6m	\N	\N	Ya714G6m	0	\N	\N
My193G6m	\N	\N	My193G6m	0	\N	\N
Og370G6m	\N	\N	Og370G6m	0	\N	\N
Ws952G6m	\N	\N	Ws952G6m	0	\N	\N
Bn730G6m	\N	\N	Bn730G6m	0	\N	\N
Eo677G6m	\N	\N	Eo677G6m	0	\N	\N
Re142G6m	\N	\N	Re142G6m	0	\N	\N
Zm451G6m	\N	\N	Zm451G6m	0	\N	\N
Nk453G6m	\N	\N	Nk453G6m	0	\N	\N
Wi036G6m	\N	\N	Wi036G6m	0	\N	\N
Og690G6m	\N	\N	Og690G6m	0	\N	\N
Du489G6m	\N	\N	Du489G6m	0	\N	\N
Ib061G6m	\N	\N	Ib061G6m	0	\N	\N
Pz855G6m	\N	\N	Pz855G6m	0	\N	\N
Bw549G6m	\N	\N	Bw549G6m	0	\N	\N
Uh537G6m	\N	\N	Uh537G6m	0	\N	\N
Ze562G6m	\N	\N	Ze562G6m	0	\N	\N
Om329G6m	\N	\N	Om329G6m	0	\N	\N
Qq748G6m	\N	\N	Qq748G6m	0	\N	\N
Jk072G6m	\N	\N	Jk072G6m	0	\N	\N
Mf579G6m	\N	\N	Mf579G6m	0	\N	\N
Fl650G6m	\N	\N	Fl650G6m	0	\N	\N
Ta997G6m	\N	\N	Ta997G6m	0	\N	\N
Cm967G6m	\N	\N	Cm967G6m	0	\N	\N
Zw069G6m	\N	\N	Zw069G6m	0	\N	\N
Mu686G6m	\N	\N	Mu686G6m	0	\N	\N
Ni787G6m	\N	\N	Ni787G6m	0	\N	\N
Om145G6m	\N	\N	Om145G6m	0	\N	\N
Io680G6m	\N	\N	Io680G6m	0	\N	\N
Wd936G6m	\N	\N	Wd936G6m	0	\N	\N
Id658G6m	\N	\N	Id658G6m	0	\N	\N
Cp071G6m	\N	\N	Cp071G6m	0	\N	\N
Se125G6m	\N	\N	Se125G6m	0	\N	\N
Qa898G6m	\N	\N	Qa898G6m	0	\N	\N
Wg756G6m	\N	\N	Wg756G6m	0	\N	\N
Ij524G6m	\N	\N	Ij524G6m	0	\N	\N
St539G6m	\N	\N	St539G6m	0	\N	\N
Jz360G6m	\N	\N	Jz360G6m	0	\N	\N
Ge697G6m	\N	\N	Ge697G6m	0	\N	\N
Po975G6m	\N	\N	Po975G6m	0	\N	\N
Pb484G6m	\N	\N	Pb484G6m	0	\N	\N
Rl162G6m	\N	\N	Rl162G6m	0	\N	\N
Ce730G6m	\N	\N	Ce730G6m	0	\N	\N
Hz392G6m	\N	\N	Hz392G6m	0	\N	\N
Tj182G6m	\N	\N	Tj182G6m	0	\N	\N
Qd646G6m	\N	\N	Qd646G6m	0	\N	\N
Pc415G6m	\N	\N	Pc415G6m	0	\N	\N
Jm650G6m	\N	\N	Jm650G6m	0	\N	\N
Nc269G6m	\N	\N	Nc269G6m	0	\N	\N
Or494G6m	\N	\N	Or494G6m	0	\N	\N
Ou400G6m	\N	\N	Ou400G6m	0	\N	\N
Ix783G6m	\N	\N	Ix783G6m	0	\N	\N
Cz841G6m	\N	\N	Cz841G6m	0	\N	\N
Jb966G6m	\N	\N	Jb966G6m	0	\N	\N
Iq990G6m	\N	\N	Iq990G6m	0	\N	\N
Zk942G6m	\N	\N	Zk942G6m	0	\N	\N
Oq841G6m	\N	\N	Oq841G6m	0	\N	\N
Qw110G6m	\N	\N	Qw110G6m	0	\N	\N
Jo785G6m	\N	\N	Jo785G6m	0	\N	\N
Zp785G6m	\N	\N	Zp785G6m	0	\N	\N
Pf575G6m	\N	\N	Pf575G6m	0	\N	\N
Qb979G6m	\N	\N	Qb979G6m	0	\N	\N
No347G6m	\N	\N	No347G6m	0	\N	\N
Bv151G6m	\N	\N	Bv151G6m	0	\N	\N
Qt110G6m	\N	\N	Qt110G6m	0	\N	\N
Db295G6m	\N	\N	Db295G6m	0	\N	\N
Jd493G6m	\N	\N	Jd493G6m	0	\N	\N
Qi530G6m	\N	\N	Qi530G6m	0	\N	\N
Id430G6m	\N	\N	Id430G6m	0	\N	\N
Sf225G6m	\N	\N	Sf225G6m	0	\N	\N
Ai735G6m	\N	\N	Ai735G6m	0	\N	\N
Ur358G6m	\N	\N	Ur358G6m	0	\N	\N
Cg372G6m	\N	\N	Cg372G6m	0	\N	\N
Ej620G6m	\N	\N	Ej620G6m	0	\N	\N
Ne383G6m	\N	\N	Ne383G6m	0	\N	\N
Fn002G6m	\N	\N	Fn002G6m	0	\N	\N
Ph672G6m	\N	\N	Ph672G6m	0	\N	\N
Zs584G6m	\N	\N	Zs584G6m	0	\N	\N
Lk302G6m	\N	\N	Lk302G6m	0	\N	\N
Ic481G6m	\N	\N	Ic481G6m	0	\N	\N
Tl571G6m	\N	\N	Tl571G6m	0	\N	\N
Kv225G6m	\N	\N	Kv225G6m	0	\N	\N
Ir307G6m	\N	\N	Ir307G6m	0	\N	\N
Sx951G6m	\N	\N	Sx951G6m	0	\N	\N
Wf347G6m	\N	\N	Wf347G6m	0	\N	\N
Zu782G6m	\N	\N	Zu782G6m	0	\N	\N
Sv084G6m	\N	\N	Sv084G6m	0	\N	\N
Af491G6m	\N	\N	Af491G6m	0	\N	\N
Hn377G6m	\N	\N	Hn377G6m	0	\N	\N
Ae741G6m	\N	\N	Ae741G6m	0	\N	\N
Fw817G6m	\N	\N	Fw817G6m	0	\N	\N
Cg281G6m	\N	\N	Cg281G6m	0	\N	\N
Ps764G6m	\N	\N	Ps764G6m	0	\N	\N
Ut250G6m	\N	\N	Ut250G6m	0	\N	\N
Yw495G6m	\N	\N	Yw495G6m	0	\N	\N
Lz516G6m	\N	\N	Lz516G6m	0	\N	\N
Kh845G6m	\N	\N	Kh845G6m	0	\N	\N
Au683G6m	\N	\N	Au683G6m	0	\N	\N
Cj472G6m	\N	\N	Cj472G6m	0	\N	\N
Sf124G6m	\N	\N	Sf124G6m	0	\N	\N
Mo672G6m	\N	\N	Mo672G6m	0	\N	\N
Lb473G6m	\N	\N	Lb473G6m	0	\N	\N
Bp714G6m	\N	\N	Bp714G6m	0	\N	\N
Rf930G6m	\N	\N	Rf930G6m	0	\N	\N
Us789G6m	\N	\N	Us789G6m	0	\N	\N
Yx636G6m	\N	\N	Yx636G6m	0	\N	\N
Ps208G6m	\N	\N	Ps208G6m	0	\N	\N
Mm285G6m	\N	\N	Mm285G6m	0	\N	\N
Xs923G6m	\N	\N	Xs923G6m	0	\N	\N
Ag553G6m	\N	\N	Ag553G6m	0	\N	\N
Kh399G6m	\N	\N	Kh399G6m	0	\N	\N
Um637G6m	\N	\N	Um637G6m	0	\N	\N
Rv828G6m	\N	\N	Rv828G6m	0	\N	\N
Dq254G6m	\N	\N	Dq254G6m	0	\N	\N
It926G6m	\N	\N	It926G6m	0	\N	\N
Wr905G6m	\N	\N	Wr905G6m	0	\N	\N
Nz869G6m	\N	\N	Nz869G6m	0	\N	\N
Hx703G6m	\N	\N	Hx703G6m	0	\N	\N
Op898G6m	\N	\N	Op898G6m	0	\N	\N
La176G6m	\N	\N	La176G6m	0	\N	\N
Um973G6m	\N	\N	Um973G6m	0	\N	\N
Il951G6m	\N	\N	Il951G6m	0	\N	\N
Qw243G6m	\N	\N	Qw243G6m	0	\N	\N
Xd730G6m	\N	\N	Xd730G6m	0	\N	\N
Bw686G6m	\N	\N	Bw686G6m	0	\N	\N
Ny011G6m	\N	\N	Ny011G6m	0	\N	\N
Ju091G6m	\N	\N	Ju091G6m	0	\N	\N
Sf841G6m	\N	\N	Sf841G6m	0	\N	\N
Oi096G6m	\N	\N	Oi096G6m	0	\N	\N
Hn177G6m	\N	\N	Hn177G6m	0	\N	\N
Zr743G6m	\N	\N	Zr743G6m	0	\N	\N
Rv699G6m	\N	\N	Rv699G6m	0	\N	\N
Cn160G6m	\N	\N	Cn160G6m	0	\N	\N
Fg578G6m	\N	\N	Fg578G6m	0	\N	\N
Ti468G6m	\N	\N	Ti468G6m	0	\N	\N
Hu482G6m	\N	\N	Hu482G6m	0	\N	\N
Sc139G6m	\N	\N	Sc139G6m	0	\N	\N
Ml722G6m	\N	\N	Ml722G6m	0	\N	\N
Nx268G6m	\N	\N	Nx268G6m	0	\N	\N
Oq067G6m	\N	\N	Oq067G6m	0	\N	\N
Oa049G6m	\N	\N	Oa049G6m	0	\N	\N
Ke210G6m	\N	\N	Ke210G6m	0	\N	\N
Pv653G6m	\N	\N	Pv653G6m	0	\N	\N
Ry818G6m	\N	\N	Ry818G6m	0	\N	\N
Bj359G6m	\N	\N	Bj359G6m	0	\N	\N
Db196G6m	\N	\N	Db196G6m	0	\N	\N
Kc927G6m	\N	\N	Kc927G6m	0	\N	\N
Pe468G6m	\N	\N	Pe468G6m	0	\N	\N
Cj344G6m	\N	\N	Cj344G6m	0	\N	\N
Ps930G6m	\N	\N	Ps930G6m	0	\N	\N
Zq071G6m	\N	\N	Zq071G6m	0	\N	\N
Ru823G6m	\N	\N	Ru823G6m	0	\N	\N
Hs835G6m	\N	\N	Hs835G6m	0	\N	\N
Da377G6m	\N	\N	Da377G6m	0	\N	\N
Gt471G6m	\N	\N	Gt471G6m	0	\N	\N
Bb765G6m	\N	\N	Bb765G6m	0	\N	\N
Hc065G6m	\N	\N	Hc065G6m	0	\N	\N
Gi004G6m	\N	\N	Gi004G6m	0	\N	\N
Hb920G1y	\N	\N	Hb920G1y	0	\N	\N
Dt508G1y	\N	\N	Dt508G1y	0	\N	\N
Dp345G1y	\N	\N	Dp345G1y	0	\N	\N
Kw253G1y	\N	\N	Kw253G1y	0	\N	\N
Bm024G1y	\N	\N	Bm024G1y	0	\N	\N
Cm842G1y	\N	\N	Cm842G1y	0	\N	\N
Sz286G1y	\N	\N	Sz286G1y	0	\N	\N
Bw250G1y	\N	\N	Bw250G1y	0	\N	\N
Hj276G1y	\N	\N	Hj276G1y	0	\N	\N
Tm617G1y	\N	\N	Tm617G1y	0	\N	\N
Nf187G1y	\N	\N	Nf187G1y	0	\N	\N
Do483G1y	\N	\N	Do483G1y	0	\N	\N
Gq360G1y	\N	\N	Gq360G1y	0	\N	\N
Ix152G1y	\N	\N	Ix152G1y	0	\N	\N
Ov626G1y	\N	\N	Ov626G1y	0	\N	\N
Pl131G1y	\N	\N	Pl131G1y	0	\N	\N
Mu006G1y	\N	\N	Mu006G1y	0	\N	\N
Oa236G1y	\N	\N	Oa236G1y	0	\N	\N
Rs413G1y	\N	\N	Rs413G1y	0	\N	\N
He640G1y	\N	\N	He640G1y	0	\N	\N
Wp215G1y	\N	\N	Wp215G1y	0	\N	\N
Lg330G1y	\N	\N	Lg330G1y	0	\N	\N
Sd473G1y	\N	\N	Sd473G1y	0	\N	\N
Om655G1y	\N	\N	Om655G1y	0	\N	\N
Iq827G1y	\N	\N	Iq827G1y	0	\N	\N
Jo833G1y	\N	\N	Jo833G1y	0	\N	\N
Bf376G1y	\N	\N	Bf376G1y	0	\N	\N
Ld096G1y	\N	\N	Ld096G1y	0	\N	\N
Rl054G1y	\N	\N	Rl054G1y	0	\N	\N
Qm772G1y	\N	\N	Qm772G1y	0	\N	\N
Lg636G1y	\N	\N	Lg636G1y	0	\N	\N
Rz633G1y	\N	\N	Rz633G1y	0	\N	\N
Qp339G1y	\N	\N	Qp339G1y	0	\N	\N
Rt308G1y	\N	\N	Rt308G1y	0	\N	\N
Sw899G1y	\N	\N	Sw899G1y	0	\N	\N
Ff836G1y	\N	\N	Ff836G1y	0	\N	\N
Wz925G1y	\N	\N	Wz925G1y	0	\N	\N
Hn477G1y	\N	\N	Hn477G1y	0	\N	\N
Ko563G1y	\N	\N	Ko563G1y	0	\N	\N
Bv346G1y	\N	\N	Bv346G1y	0	\N	\N
Ys157G1y	\N	\N	Ys157G1y	0	\N	\N
Ii114G1y	\N	\N	Ii114G1y	0	\N	\N
Ur305G1y	\N	\N	Ur305G1y	0	\N	\N
Kg438G1y	\N	\N	Kg438G1y	0	\N	\N
Ar060G1y	\N	\N	Ar060G1y	0	\N	\N
Qa370G1y	\N	\N	Qa370G1y	0	\N	\N
Kk838G1y	\N	\N	Kk838G1y	0	\N	\N
Yb027G1y	\N	\N	Yb027G1y	0	\N	\N
Sa202G1y	\N	\N	Sa202G1y	0	\N	\N
Nd705G1y	\N	\N	Nd705G1y	0	\N	\N
Xt048G1y	\N	\N	Xt048G1y	0	\N	\N
Zu201G1y	\N	\N	Zu201G1y	0	\N	\N
Nf828G1y	\N	\N	Nf828G1y	0	\N	\N
Xu421G1y	\N	\N	Xu421G1y	0	\N	\N
Ly983G1y	\N	\N	Ly983G1y	0	\N	\N
Zx801G1y	\N	\N	Zx801G1y	0	\N	\N
Wz894G1y	\N	\N	Wz894G1y	0	\N	\N
Uf969G1y	\N	\N	Uf969G1y	0	\N	\N
Jt851G1y	\N	\N	Jt851G1y	0	\N	\N
Ei464G1y	\N	\N	Ei464G1y	0	\N	\N
Vf027G1y	\N	\N	Vf027G1y	0	\N	\N
Qs565G1y	\N	\N	Qs565G1y	0	\N	\N
Dm871G1y	\N	\N	Dm871G1y	0	\N	\N
Zd176G1y	\N	\N	Zd176G1y	0	\N	\N
Rx578G1y	\N	\N	Rx578G1y	0	\N	\N
Np793G1y	\N	\N	Np793G1y	0	\N	\N
Ws621G1y	\N	\N	Ws621G1y	0	\N	\N
Kq209G1y	\N	\N	Kq209G1y	0	\N	\N
Ft898G1y	\N	\N	Ft898G1y	0	\N	\N
Eq031G1y	\N	\N	Eq031G1y	0	\N	\N
Tc649G1y	\N	\N	Tc649G1y	0	\N	\N
Um380G1y	\N	\N	Um380G1y	0	\N	\N
Jx441G1y	\N	\N	Jx441G1y	0	\N	\N
Dw379G1y	\N	\N	Dw379G1y	0	\N	\N
Qj900G1y	\N	\N	Qj900G1y	0	\N	\N
Ms854G1y	\N	\N	Ms854G1y	0	\N	\N
Bb534G1y	\N	\N	Bb534G1y	0	\N	\N
Wn179G1y	\N	\N	Wn179G1y	0	\N	\N
Zg650G1y	\N	\N	Zg650G1y	0	\N	\N
Dw926G1y	\N	\N	Dw926G1y	0	\N	\N
Ez506G1y	\N	\N	Ez506G1y	0	\N	\N
Ha500G1y	\N	\N	Ha500G1y	0	\N	\N
Un374G1y	\N	\N	Un374G1y	0	\N	\N
Kx939G1y	\N	\N	Kx939G1y	0	\N	\N
Vv084G1y	\N	\N	Vv084G1y	0	\N	\N
Re812G1y	\N	\N	Re812G1y	0	\N	\N
Cc590G1y	\N	\N	Cc590G1y	0	\N	\N
Pe987G1y	\N	\N	Pe987G1y	0	\N	\N
Rq506G1y	\N	\N	Rq506G1y	0	\N	\N
Sa025G1y	\N	\N	Sa025G1y	0	\N	\N
Fh639G1y	\N	\N	Fh639G1y	0	\N	\N
No620G1y	\N	\N	No620G1y	0	\N	\N
Cd457G1y	\N	\N	Cd457G1y	0	\N	\N
Hk311G1y	\N	\N	Hk311G1y	0	\N	\N
Pw132G1y	\N	\N	Pw132G1y	0	\N	\N
Zq297G1y	\N	\N	Zq297G1y	0	\N	\N
Hx328G1y	\N	\N	Hx328G1y	0	\N	\N
Ju210G1y	\N	\N	Ju210G1y	0	\N	\N
Oq516G1y	\N	\N	Oq516G1y	0	\N	\N
Lo460G1y	\N	\N	Lo460G1y	0	\N	\N
=======
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8
\.


--
-- Data for Name: schema_migration; Type: TABLE DATA; Schema: public; Owner: max
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
20231121123850
\.


--
-- Data for Name: shipping; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.shipping (id, max_capacity, option_name, box_price, created_at, updated_at) FROM stdin;
<<<<<<< HEAD
1	8	กล่องไซส์ S	170	\N	\N
2	15	กล่องไซส์ M	190	\N	\N
3	20	กล่องไซส์ L	225	\N	\N
=======
1	3	กล่องไซส์ S	170	\N	\N
2	5	กล่องไซส์ M	190	\N	\N
3	8	กล่องไซส์ L	225	\N	\N
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.users (lineuserid, first_name, last_name, address, phone, admin, amount_remain, joined_at, house_no, county, post_code, sub_district, country, soi, road, created_at, updated_at) FROM stdin;
U5e9dbb896a6685b53a8e03997fa18802	พชพล	ธาราไพศาลสุข	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150	0908133372	t	0	2023-11-21 12:28:45.405996	56	Krung Thep Mahanakhon (Bangkok)	10150	บางมด	Thailand	พระราม 2 ซอย3 แยก3	พระราม2	2023-11-21 12:28:45.405996	2023-11-21 12:28:45.405996
Ud2fd3f7140f27c0747147da653856520	พรรณทิพา	วิเชียรสรรค์	222/1ยาสูบ 1 แยก 7วิภาวดีรังสิต 5จตุจักรจอมพลกรุงเทพ10900	0847514829	f	0	2023-12-06 02:34:56.633669	222/1	จตุจักร	10900	จอมพล	กรุงเทพ	ยาสูบ 1 แยก 7	วิภาวดีรังสิต 5	2023-12-06 02:34:56.633675	2023-12-06 02:34:56.633675
U0e6053a1d63d083afa7f87de19323dc0	สุภาภรณ์	เสนาลักษณ์	18เพชรบุรี 13เพชรบุรีราชเทวีแขวงถนนพญาไทกรุงเทพฯ10400	0835444020	f	0	2023-12-06 03:59:19.871656	18	ราชเทวี	10400	แขวงถนนพญาไท	กรุงเทพฯ	เพชรบุรี 13	เพชรบุรี	2023-12-06 03:59:19.871663	2023-12-06 03:59:19.871663
U49b6bed5cf122592f5e37ae6b8044480	สุนี	วิจิตรศรีกมล	23/464อัศวนนท์สุขุมวิทเมืองบางเมืองสมุทรปราการ10270	0962299959	f	0	2023-12-06 02:44:12.375846	23/464	เมือง	10270	บางเมือง	สมุทรปราการ	อัศวนนท์	สุขุมวิท	2023-12-06 02:44:12.375856	2023-12-06 02:44:12.375856
U8bdf6a3ecf269839c5c8f0c80767812c	ต่อพงศ์	ชัยวัฒน์	333/338ประชาชื่น 10ประชาชื่นหลักสี่ทุ่งสองห้องกรุงเทพฯ10210	0894590808	f	0	2023-12-06 03:03:41.249079	333/338	หลักสี่	10210	ทุ่งสองห้อง	กรุงเทพฯ	ประชาชื่น 10	ประชาชื่น	2023-12-06 03:03:41.249087	2023-12-06 03:03:41.249087
U3d51fb385aac64e61d595c7c3d89bc29	สพลดนัย	มหานิล	7/3---โป่งเเยงเชียงใหม่50180	0631141267	t	0	2023-12-06 02:13:17.507426	7/3	-	50180	โป่งเเยง	เชียงใหม่	-	-	2023-12-06 02:13:17.507435	2023-12-06 02:13:17.507435
U9ef261c5f0630c829f898f778ce59627	สพลดนัย	มหานิล	7/3---โป่งเเยงเชียงใหม่50180	0631141267	t	0	2023-12-06 02:33:15.682161	7/3	-	50180	โป่งเเยง	เชียงใหม่	-	-	2023-12-06 02:33:15.682181	2023-12-06 02:33:15.682181
Ub4c7831cbf0a2b8b03eaab63c0c9e9ee	ธัญญวัฒน์	เกษมสุวรรณ	4พร้อมมิตรสุขุมวิท39วัฒนาคลองตันเหนือกรุงเทพ10110	0994461699	t	0	2023-12-05 09:12:31.980757	4	วัฒนา	10110	คลองตันเหนือ	กรุงเทพ	พร้อมมิตร	สุขุมวิท39	2023-12-05 09:12:31.980762	2023-12-05 09:12:31.980763
Ua5ebfd67db5b94c8c59ad26b0b102f6d	ณัชชารีย์	อิทธิพันธ์วดี	60เพชรเกษม 62/1เพชรเกษมบางแคบางแคเหนือกทม10160	0956393961	t	0	2023-12-05 08:46:56.476169	60	บางแค	10160	บางแคเหนือ	กทม	เพชรเกษม 62/1	เพชรเกษม	2023-12-05 08:46:56.476177	2023-12-05 08:46:56.476177
U7af4c708e518546c5f4fc2d6767dbe88	max	tharaphaisarnsuk	563rama2chomthongbangmodbangkok10150	0908133372	t	0	2023-12-05 08:21:43.855193	56	chomthong	10150	bangmod	bangkok	3	rama2	2023-12-05 08:21:43.8552	2023-12-05 08:21:43.8552
U59360043045b610424f4adf3bd69b05c	ณฐมน	รัตนเดชตระกูล	1747/23. สุขุมวิท​วัฒนาพระโขนงเหนือกทม10110	0896499190	f	0	2023-12-05 12:27:19.29675	1747/23	วัฒนา	10110	พระโขนงเหนือ	กทม	. 	สุขุมวิท​	2023-12-05 12:27:19.296757	2023-12-05 12:27:19.296757
	ไพโรจน์	กวียานั	104รามอินทรา 61 แยก 4รามอินทราบางเขนท่าแร้งกรุงเทพมหานคร10230	0818316100	f	0	2023-12-06 01:03:59.498643	104	บางเขน	10230	ท่าแร้ง	กรุงเทพมหานคร	รามอินทรา 61 แยก 4	รามอินทรา	2023-12-06 01:03:59.49865	2023-12-06 01:03:59.49865
U54b18aec21f7b67b56878e036b2ff678	ไพโรจน์	กวียานั	104รามอินทรา 61 แยก 4รามอินทราบางเขนท่าแร้งกรุงเทพมหานคร10230	0818316100	f	0	2023-12-06 00:59:38.170116	104	บางเขน	10230	ท่าแร้ง	กรุงเทพมหานคร	รามอินทรา 61 แยก 4	รามอินทรา	2023-12-06 00:59:38.170125	2023-12-06 00:59:38.170125
U26c4fb9c021b0dd2f684281a0c1d102a	นวรัตน์	วนากุล	589บริษัทเอกนวพระราม 2จอมทองบางมดกรุงเทพฯ10150	081-61-66055	f	0	2023-12-06 02:35:56.680045	589	จอมทอง	10150	บางมด	กรุงเทพฯ	บริษัทเอกนว	พระราม 2	2023-12-06 02:35:56.680053	2023-12-06 02:35:56.680053
U58f82ec3a29375b0cf629449726973db	สุธิดา	ไชยคุตร	254/560 Amber condominium-กรุงเทพฯ-นนท์เมืองนนทบุรีบางเขนนนทบุรี11000	0612954532	f	0	2023-12-07 01:58:59.064701	254/560 Amber condominium	เมืองนนทบุรี	11000	บางเขน	นนทบุรี	-	กรุงเทพฯ-นนท์	2023-12-07 01:58:59.064707	2023-12-07 01:58:59.064708
U957de25d9200969295392cf58ed08308	นางสาวสาริศา	เรืองศรี	51/2โรงงาน กาโตว์  เฮ้าส์ส์ ม 2 นครชัยศรีบางแก้วนครปฐม73120	0941916456	f	0	2023-12-07 02:31:34.427999	51/2	นครชัยศรี	73120	บางแก้ว	นครปฐม	โรงงาน กาโตว์  เฮ้าส์ส์ 	ม 2 	2023-12-07 02:31:34.428004	2023-12-07 02:31:34.428004
U1c433c7f442e533443611599ce81bff5	ภสมน	สายสวาท	974โรงพยาบาลพระราม 9ริมคลองสามเสนห้วยขวางบางกะปิกทม10310	0822922826	f	0	2023-12-07 02:43:43.194505	974	ห้วยขวาง	10310	บางกะปิ	กทม	โรงพยาบาลพระราม 9	ริมคลองสามเสน	2023-12-07 02:43:43.194512	2023-12-07 02:43:43.194512
U7576e454028898b1d0262df704e30d3f	นางพราภินันท์	ชาตะสิงห์	1057พระรามเก้าสวนหลวงพัฒนาการกรุงเทพ10250	0869145695	f	0	2023-12-07 03:41:04.634165	10	สวนหลวง	10250	พัฒนาการ	กรุงเทพ	57	พระรามเก้า	2023-12-07 03:41:04.634175	2023-12-07 03:41:04.634175
U31b9e7c591f5a6b3117ef5dcfbea80a0	ฐะมันตา	สมบูรณ์	82ไม่มีสวนผักตลิ่งชันฉิมพลีกทม10170	0846400799	f	0	2023-12-07 03:59:32.302462	82	ตลิ่งชัน	10170	ฉิมพลี	กทม	ไม่มี	สวนผัก	2023-12-07 03:59:32.302467	2023-12-07 03:59:32.302467
Ub1060de57c8fe246d38a9121e3d66b56	พันธมาศ 	เมืองรัตน์	78/103 อินดี้1รร. ราชวินิตบางนาตราดบางพลีบางแก้วสมุทรปราการ10540	0636265229	f	0	2023-12-07 04:58:03.223828	78/103 อินดี้1	บางพลี	10540	บางแก้ว	สมุทรปราการ	รร. ราชวินิต	บางนาตราด	2023-12-07 04:58:03.223836	2023-12-07 04:58:03.223836
Ue4c7bf86c53260c8b6155246de8f6fb6	ทัดลาภ	เผ่าเหลืองทอว	164/83ลาดพร้าว 1 แยก 25ลาดพร้าวจตุจักรจอมพลกรุงเทพ10900	0812053660	f	0	2023-12-07 05:08:36.070052	164/83	จตุจักร	10900	จอมพล	กรุงเทพ	ลาดพร้าว 1 แยก 25	ลาดพร้าว	2023-12-07 05:08:36.07006	2023-12-07 05:08:36.07006
Ue762f254a97423752251cf4a401db07d	Pichet	Durongkaveroj	20พัฒนเวศม์2ปรีดี26วัฒนาพระโขนง​เหนือ​กทม10110	0818128120	f	0	2023-12-07 05:11:12.254588	20	วัฒนา	10110	พระโขนง​เหนือ​	กทม	พัฒนเวศม์2	ปรีดี26	2023-12-07 05:11:12.254596	2023-12-07 05:11:12.254596
U414af3635f47beebde8180008b3b279d	X	X	9SoSkBjSnBb10250	0098	f	0	2023-12-07 05:23:23.573952	9	Bj	10250	Sn	Bb	So	Sk	2023-12-07 05:23:23.573961	2023-12-07 05:23:23.573961
U0f5c87a8a4cde9ace9b69e12bb0f0c44	สุนิตา	สุขุม	21/1สุขุมวิท 34สุขุมวิทคลองเตยคลองตันกรุงเทพ10110	0849265495	f	0	2023-12-07 05:34:41.794842	21/1	คลองเตย	10110	คลองตัน	กรุงเทพ	สุขุมวิท 34	สุขุมวิท	2023-12-07 05:34:41.794849	2023-12-07 05:34:41.794849
U549ec39d5e101d99e3395e1daa0d7990	สักกมน	เทพหัสดิน ณ อยุธยา	128/1สุขุมวิท 23สุขุมวิทวัฒนาคลองเตยเหนือกรุงเทพฯ10110	0875922123	f	0	2023-12-07 05:38:16.327156	128/1	วัฒนา	10110	คลองเตยเหนือ	กรุงเทพฯ	สุขุมวิท 23	สุขุมวิท	2023-12-07 05:38:16.327163	2023-12-07 05:38:16.327163
U0ddfd0cf322a715eddbbcbf333217f19	พรรณกิจ	วนแสงสกุล	399/185 หมู่บ้านกฤษนัย เลค แอนด์ พาร์ท18ศรีณรงค์เมืองนอกเมืองสุรินทร์32000	+66923615691	f	0	2023-12-07 06:44:08.64521	399/185 หมู่บ้านกฤษนัย เลค แอนด์ พาร์ท	เมือง	32000	นอกเมือง	สุรินทร์	18	ศรีณรงค์	2023-12-07 06:44:08.645216	2023-12-07 06:44:08.645216
Ucfa80ae397d4791783b0f3de67239900	วิไลรัตน์	วรรณกิจวิทย์	1529/69-เจริญนครคลองสานบางลำภูล่างกรุงเทพฯ10600	0819143804	f	0	2023-12-07 06:39:53.884172	1529/69	คลองสาน	10600	บางลำภูล่าง	กรุงเทพฯ	-	เจริญนคร	2023-12-07 06:39:53.8842	2023-12-07 06:39:53.8842
U41e2b8a4b8e76016897ca3f1cd6a4ae6	อลิสา	ลีเชวงวงศ์	65/62Athenee Residenceวิทยุปทุมวันลุมพินีกทม10330	0800760466	f	0	2023-12-07 07:45:34.428347	65/62	ปทุมวัน	10330	ลุมพินี	กทม	Athenee Residence	วิทยุ	2023-12-07 07:45:34.428358	2023-12-07 07:45:34.428358
U4e52813bb2d4faeb062306bf4ca34d69	ศิริลักษณ์	สุวรรณรังษี	49539นวมืนทร์บางกะปิคลองจัานกรุงเทพ10240	0614195976	f	0	2023-12-07 07:52:04.083474	495	บางกะปิ	10240	คลองจัาน	กรุงเทพ	39	นวมืนทร์	2023-12-07 07:52:04.083482	2023-12-07 07:52:04.083483
\.


--
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

<<<<<<< HEAD
SELECT pg_catalog.setval('public.order_detail_id_seq', 43, true);
=======
SELECT pg_catalog.setval('public.order_detail_id_seq', 5, true);
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

<<<<<<< HEAD
SELECT pg_catalog.setval('public.product_id_seq', 39, true);
=======
SELECT pg_catalog.setval('public.product_id_seq', 169, true);
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8


--
-- Name: product_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

<<<<<<< HEAD
SELECT pg_catalog.setval('public.product_option_id_seq', 60, true);
=======
SELECT pg_catalog.setval('public.product_option_id_seq', 265, true);
>>>>>>> 0edfd14153db364d20b15a1bbc6e3bdcbcb138c8


--
-- Name: shipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('public.shipping_id_seq', 3, true);


--
-- Name: order_detail order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- Name: pinto pinto_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.pinto
    ADD CONSTRAINT pinto_pkey PRIMARY KEY (id);


--
-- Name: product_option product_option_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: promo_code promo_code_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.promo_code
    ADD CONSTRAINT promo_code_pkey PRIMARY KEY (code);


--
-- Name: schema_migration schema_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.schema_migration
    ADD CONSTRAINT schema_migration_pkey PRIMARY KEY (version);


--
-- Name: shipping shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT shipping_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (lineuserid);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: max
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- Name: order_detail order_detail_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id);


--
-- Name: order_detail order_detail_product_option_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_product_option_fkey FOREIGN KEY (product_option) REFERENCES public.product_option(id);


--
-- Name: order order_user_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_order_fkey FOREIGN KEY (user_order) REFERENCES public.users(lineuserid);


--
-- Name: pinto pinto_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.pinto
    ADD CONSTRAINT pinto_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(lineuserid);


--
-- Name: product_option product_option_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: max
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- PostgreSQL database dump complete
--

