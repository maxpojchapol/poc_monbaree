--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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


ALTER SEQUENCE public.order_detail_id_seq OWNER TO max;

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


ALTER SEQUENCE public.product_id_seq OWNER TO max;

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


ALTER SEQUENCE public.product_option_id_seq OWNER TO max;

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


ALTER SEQUENCE public.shipping_id_seq OWNER TO max;

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
202312001	shipped	270	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150	123	240	170	100	พชพล	0908133372	2023-12-08 00:00:00	2023-12-08 10:57:10.220751	2023-12-08 10:57:10.220751
202312002	shipped	210	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150	fff	500	170	40	พชพล	0908133372	2023-12-10 00:00:00	2023-12-08 11:21:22.23579	2023-12-08 11:21:22.23579
202312003	paid	210	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		500	170	40	พชพล	0908133372	2023-12-08 00:00:00	2023-12-08 11:48:52.614853	2023-12-08 11:48:52.614853
202312004	pending	270	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150		240	170	100	พชพล	0908133372	2023-12-08 00:00:00	2023-12-08 12:15:58.358716	2023-12-08 12:15:58.358716
202312000	shipped	270	U5e9dbb896a6685b53a8e03997fa18802	\N	บ้านเลขที่ 56ซอย พระราม 2 ซอย3 แยก3ถนน พระราม2แขวง บางมดเขต Krung Thep Mahanakhon (Bangkok)จังหวัด Thailand10150	123	240	170	100	พชพล	0908133372	2023-12-15 00:00:00	2023-12-08 10:55:53.3721	2023-12-08 10:55:53.3721
\.


--
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.order_detail (id, order_id, product_option, quantity, product_name, option_price, product_description, created_at, updated_at) FROM stdin;
1	202312000	249	1	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	100	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-08 10:55:53.377991	2023-12-08 10:55:53.377991
2	202312001	249	1	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	100	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-08 10:57:10.223357	2023-12-08 10:57:10.223357
3	202312002	206	1	กรีนโอ๊ค (Green Oak Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-08 11:21:22.236955	2023-12-08 11:21:22.236955
4	202312003	206	1	กรีนโอ๊ค (Green Oak Lettuce)(500g)	40	ผักสลัดไฮโดรโปนิกจากสวนคุณโอ	2023-12-08 11:48:52.617085	2023-12-08 11:48:52.617085
5	202312004	249	1	ราสเบอรี่ สเปรด (Raspberry Spread)(ขวด)	100	แยมราสเบอรี่ทาขนมปัง มีเนื้อผลไม้มากกว่า 70% รสชาติหวานอมเปรี้ยว หอมกลิ่นผลไม้แท้ๆ ไม่เจือสี ไม่แต่งกลิ่นสังเคราะห์ เมื่อเปิดแล้ว ควรเก็บในตู้เย็นและบริโภคภายใน 2 สัปดาห์	2023-12-08 12:15:58.367151	2023-12-08 12:15:58.367151
\.


--
-- Data for Name: pinto; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.pinto (id, date_start, date_end, duration, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.product (id, product_name, product_type, image_url, active, vat, product_description, created_at, updated_at) FROM stdin;
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
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.product_option (id, product_id, product_option_name, price, active, weight, created_at, updated_at) FROM stdin;
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
\.


--
-- Data for Name: promo_code; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.promo_code (code, user_created, user_use, pinto_id, amount, created_at, updated_at) FROM stdin;
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
1	3	กล่องไซส์ S	170	\N	\N
2	5	กล่องไซส์ M	190	\N	\N
3	8	กล่องไซส์ L	225	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: max
--

COPY public.users (lineuserid, first_name, last_name, address, phone, admin, amount_remain, joined_at, house_no, county, post_code, sub_district, country, soi, road, created_at, updated_at) FROM stdin;
U5e9dbb896a6685b53a8e03997fa18802	พชพล	ธาราไพศาลสุข	56พระราม 2 ซอย3 แยก3พระราม2Krung Thep Mahanakhon (Bangkok)บางมดThailand10150	0908133372	t	0	2023-11-21 12:28:45.405996	56	Krung Thep Mahanakhon (Bangkok)	10150	บางมด	Thailand	พระราม 2 ซอย3 แยก3	พระราม2	2023-11-21 12:28:45.405996	2023-11-21 12:28:45.405996
\.


--
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('public.order_detail_id_seq', 5, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('public.product_id_seq', 169, true);


--
-- Name: product_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: max
--

SELECT pg_catalog.setval('public.product_option_id_seq', 265, true);


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

