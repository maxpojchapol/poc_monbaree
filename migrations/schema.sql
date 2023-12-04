--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Ubuntu 15.4-1ubuntu1)
-- Dumped by pg_dump version 15.4 (Ubuntu 15.4-1ubuntu1)

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


ALTER TABLE public.order_detail_id_seq OWNER TO max;

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


ALTER TABLE public.product_id_seq OWNER TO max;

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


ALTER TABLE public.product_option_id_seq OWNER TO max;

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


ALTER TABLE public.shipping_id_seq OWNER TO max;

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

