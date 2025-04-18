toc.dat                                                                                             0000600 0004000 0002000 00000015451 14772031237 0014453 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       1                }            notifications #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)     w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         z           1262    20999    notifications    DATABASE     s   CREATE DATABASE notifications WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_NG';
    DROP DATABASE notifications;
                postgres    false         �            1259    21001    new_arrival_notification    TABLE       CREATE TABLE public.new_arrival_notification (
    id integer NOT NULL,
    shop_id uuid NOT NULL,
    new_arrival jsonb NOT NULL,
    "isNotificationSent" boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 ,   DROP TABLE public.new_arrival_notification;
       public         heap    postgres    false         �            1259    21000    new_arrival_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.new_arrival_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.new_arrival_notification_id_seq;
       public          postgres    false    216         {           0    0    new_arrival_notification_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.new_arrival_notification_id_seq OWNED BY public.new_arrival_notification.id;
          public          postgres    false    215         �            1259    21012    price_change_notification    TABLE       CREATE TABLE public.price_change_notification (
    id integer NOT NULL,
    shop_id uuid NOT NULL,
    price_change jsonb NOT NULL,
    "isNotificationSent" boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 -   DROP TABLE public.price_change_notification;
       public         heap    postgres    false         �            1259    21011     price_change_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.price_change_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.price_change_notification_id_seq;
       public          postgres    false    218         |           0    0     price_change_notification_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.price_change_notification_id_seq OWNED BY public.price_change_notification.id;
          public          postgres    false    217         �           2604    21004    new_arrival_notification id    DEFAULT     �   ALTER TABLE ONLY public.new_arrival_notification ALTER COLUMN id SET DEFAULT nextval('public.new_arrival_notification_id_seq'::regclass);
 J   ALTER TABLE public.new_arrival_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216         �           2604    21015    price_change_notification id    DEFAULT     �   ALTER TABLE ONLY public.price_change_notification ALTER COLUMN id SET DEFAULT nextval('public.price_change_notification_id_seq'::regclass);
 K   ALTER TABLE public.price_change_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218         r          0    21001    new_arrival_notification 
   TABLE DATA           z   COPY public.new_arrival_notification (id, shop_id, new_arrival, "isNotificationSent", created_at, updated_at) FROM stdin;
    public          postgres    false    216       3442.dat t          0    21012    price_change_notification 
   TABLE DATA           |   COPY public.price_change_notification (id, shop_id, price_change, "isNotificationSent", created_at, updated_at) FROM stdin;
    public          postgres    false    218       3444.dat }           0    0    new_arrival_notification_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.new_arrival_notification_id_seq', 4, true);
          public          postgres    false    215         ~           0    0     price_change_notification_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.price_change_notification_id_seq', 7, true);
          public          postgres    false    217         �           2606    21008 6   new_arrival_notification new_arrival_notification_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.new_arrival_notification
    ADD CONSTRAINT new_arrival_notification_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.new_arrival_notification DROP CONSTRAINT new_arrival_notification_pkey;
       public            postgres    false    216         �           2606    21019 8   price_change_notification price_change_notification_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.price_change_notification
    ADD CONSTRAINT price_change_notification_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.price_change_notification DROP CONSTRAINT price_change_notification_pkey;
       public            postgres    false    218         �           1259    21009    ix_new_arrival_notification_id    INDEX     a   CREATE INDEX ix_new_arrival_notification_id ON public.new_arrival_notification USING btree (id);
 2   DROP INDEX public.ix_new_arrival_notification_id;
       public            postgres    false    216         �           1259    21010 #   ix_new_arrival_notification_shop_id    INDEX     k   CREATE INDEX ix_new_arrival_notification_shop_id ON public.new_arrival_notification USING btree (shop_id);
 7   DROP INDEX public.ix_new_arrival_notification_shop_id;
       public            postgres    false    216         �           1259    21020    ix_price_change_notification_id    INDEX     c   CREATE INDEX ix_price_change_notification_id ON public.price_change_notification USING btree (id);
 3   DROP INDEX public.ix_price_change_notification_id;
       public            postgres    false    218         �           1259    21021 $   ix_price_change_notification_shop_id    INDEX     m   CREATE INDEX ix_price_change_notification_shop_id ON public.price_change_notification USING btree (shop_id);
 8   DROP INDEX public.ix_price_change_notification_shop_id;
       public            postgres    false    218                                                                                                                                                                                                                               3442.dat                                                                                            0000600 0004000 0002000 00000000313 14772031237 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	b76144b5-5d94-4f74-995c-e49a03a7db0b	{"products": [{"id": "4a594125-a59b-48cd-ab9c-7f86e55a3e5d", "name": "RICE(50kg)", "price": 46599.0}]}	f	2025-03-03 17:22:45.427153	2025-03-03 18:46:36.159346
\.


                                                                                                                                                                                                                                                                                                                     3444.dat                                                                                            0000600 0004000 0002000 00000001501 14772031237 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	b76144b5-5d94-4f74-995c-e49a03a7db0b	{"products": [{"id": "4a594125-a59b-48cd-ab9c-7f86e55a3e5d", "name": "Rice(50kg)", "price": 46799.0}]}	f	2025-03-03 17:27:11.483519	2025-03-03 17:57:47.113313
6	b76144b5-5d94-4f74-995c-e49a03a7db0b	{"products": [{"id": "146d8e36-8a93-4019-b7d9-1b2516553782", "name": "Potato", "price": 550000}, {"id": "4a594125-a59b-48cd-ab9c-7f86e55a3e5d", "name": "Rice", "price": 55000}, {"id": "4a594125-a59b-48cd-ab9c-7f86e55a3e5d", "name": "Rice", "price": 55000}]}	t	2025-03-12 21:45:38.996236	2025-03-13 20:19:51.195351
7	eed21407-3d84-4db8-831f-6553dcedab70	{"products": [{"id": "146d8e36-8a93-4019-b7d9-1b2516553782", "name": "Potato", "price": 550000.0}, {"id": "4a594125-a59b-48cd-ab9c-7f86e55a3e5d", "name": "Rice", "price": 55000.0}]}	t	2025-03-12 21:46:03.025378	2025-03-13 20:19:51.195351
\.


                                                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000014073 14772031237 0015377 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

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

DROP DATABASE notifications;
--
-- Name: notifications; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE notifications WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_NG';


ALTER DATABASE notifications OWNER TO postgres;

\connect notifications

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
-- Name: new_arrival_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_arrival_notification (
    id integer NOT NULL,
    shop_id uuid NOT NULL,
    new_arrival jsonb NOT NULL,
    "isNotificationSent" boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.new_arrival_notification OWNER TO postgres;

--
-- Name: new_arrival_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_arrival_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.new_arrival_notification_id_seq OWNER TO postgres;

--
-- Name: new_arrival_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_arrival_notification_id_seq OWNED BY public.new_arrival_notification.id;


--
-- Name: price_change_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_change_notification (
    id integer NOT NULL,
    shop_id uuid NOT NULL,
    price_change jsonb NOT NULL,
    "isNotificationSent" boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.price_change_notification OWNER TO postgres;

--
-- Name: price_change_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_change_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.price_change_notification_id_seq OWNER TO postgres;

--
-- Name: price_change_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_change_notification_id_seq OWNED BY public.price_change_notification.id;


--
-- Name: new_arrival_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_arrival_notification ALTER COLUMN id SET DEFAULT nextval('public.new_arrival_notification_id_seq'::regclass);


--
-- Name: price_change_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_change_notification ALTER COLUMN id SET DEFAULT nextval('public.price_change_notification_id_seq'::regclass);


--
-- Data for Name: new_arrival_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_arrival_notification (id, shop_id, new_arrival, "isNotificationSent", created_at, updated_at) FROM stdin;
\.
COPY public.new_arrival_notification (id, shop_id, new_arrival, "isNotificationSent", created_at, updated_at) FROM '$$PATH$$/3442.dat';

--
-- Data for Name: price_change_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_change_notification (id, shop_id, price_change, "isNotificationSent", created_at, updated_at) FROM stdin;
\.
COPY public.price_change_notification (id, shop_id, price_change, "isNotificationSent", created_at, updated_at) FROM '$$PATH$$/3444.dat';

--
-- Name: new_arrival_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_arrival_notification_id_seq', 4, true);


--
-- Name: price_change_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_change_notification_id_seq', 7, true);


--
-- Name: new_arrival_notification new_arrival_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_arrival_notification
    ADD CONSTRAINT new_arrival_notification_pkey PRIMARY KEY (id);


--
-- Name: price_change_notification price_change_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_change_notification
    ADD CONSTRAINT price_change_notification_pkey PRIMARY KEY (id);


--
-- Name: ix_new_arrival_notification_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_new_arrival_notification_id ON public.new_arrival_notification USING btree (id);


--
-- Name: ix_new_arrival_notification_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_new_arrival_notification_shop_id ON public.new_arrival_notification USING btree (shop_id);


--
-- Name: ix_price_change_notification_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_price_change_notification_id ON public.price_change_notification USING btree (id);


--
-- Name: ix_price_change_notification_shop_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_price_change_notification_shop_id ON public.price_change_notification USING btree (shop_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     