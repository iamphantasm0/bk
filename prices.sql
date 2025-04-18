toc.dat                                                                                             0000600 0004000 0002000 00000043402 14772031261 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   %    1                }            prices #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) 7    M           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         N           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         O           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         P           1262    18616    prices    DATABASE     l   CREATE DATABASE prices WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_NG';
    DROP DATABASE prices;
                postgres    false                     3079    18617    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false         Q           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2         �            1259    19726 	   gasprices    TABLE     �   CREATE TABLE public.gasprices (
    station_id uuid,
    oil_type character varying NOT NULL,
    amount double precision NOT NULL,
    ctime date NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.gasprices;
       public         heap    postgres    false         �            1259    19725    gasprices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gasprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.gasprices_id_seq;
       public          postgres    false    227         R           0    0    gasprices_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.gasprices_id_seq OWNED BY public.gasprices.id;
          public          postgres    false    226         �            1259    19739    stationmetrics    TABLE     �   CREATE TABLE public.stationmetrics (
    station_id uuid NOT NULL,
    integrity_score double precision NOT NULL,
    pharmacy character varying NOT NULL,
    supermarket character varying NOT NULL
);
 "   DROP TABLE public.stationmetrics;
       public         heap    postgres    false         �            1259    19693    stations    TABLE     K  CREATE TABLE public.stations (
    geom public.geometry,
    station_name character varying NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    status character varying NOT NULL,
    area character varying NOT NULL,
    address character varying NOT NULL,
    station_id uuid NOT NULL
);
    DROP TABLE public.stations;
       public         heap    postgres    false    2    2    2    2    2    2    2    2         �            1259    19703    user    TABLE       CREATE TABLE public."user" (
    email character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    phone_number character varying(11) NOT NULL,
    is_subscribed boolean NOT NULL,
    status character varying NOT NULL,
    image_url character varying,
    profession character varying,
    token character varying,
    password character varying NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    code character varying,
    points integer,
    referral_code character varying,
    total_spend double precision NOT NULL,
    level character varying NOT NULL,
    updated_at timestamp without time zone DEFAULT '2025-03-03 09:30:00'::timestamp without time zone NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false         �            1259    19702    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    223         S           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    222         �            1259    19751    useraddress    TABLE     �   CREATE TABLE public.useraddress (
    user_id integer NOT NULL,
    area character varying,
    lga character varying,
    state character varying,
    address character varying
);
    DROP TABLE public.useraddress;
       public         heap    postgres    false         �            1259    19717    userfeedback    TABLE     �   CREATE TABLE public.userfeedback (
    email character varying NOT NULL,
    feedback character varying NOT NULL,
    id integer NOT NULL
);
     DROP TABLE public.userfeedback;
       public         heap    postgres    false         �            1259    19716    userfeedback_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userfeedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.userfeedback_id_seq;
       public          postgres    false    225         T           0    0    userfeedback_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.userfeedback_id_seq OWNED BY public.userfeedback.id;
          public          postgres    false    224         �            1259    19765 
   withdrawal    TABLE     �   CREATE TABLE public.withdrawal (
    amount double precision NOT NULL,
    email character varying NOT NULL,
    number character varying NOT NULL,
    ctime date NOT NULL,
    user_id integer NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.withdrawal;
       public         heap    postgres    false         �            1259    19764    withdrawal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.withdrawal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.withdrawal_id_seq;
       public          postgres    false    231         U           0    0    withdrawal_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.withdrawal_id_seq OWNED BY public.withdrawal.id;
          public          postgres    false    230         �           2604    19729    gasprices id    DEFAULT     l   ALTER TABLE ONLY public.gasprices ALTER COLUMN id SET DEFAULT nextval('public.gasprices_id_seq'::regclass);
 ;   ALTER TABLE public.gasprices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227         �           2604    19706    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223         �           2604    19720    userfeedback id    DEFAULT     r   ALTER TABLE ONLY public.userfeedback ALTER COLUMN id SET DEFAULT nextval('public.userfeedback_id_seq'::regclass);
 >   ALTER TABLE public.userfeedback ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225         �           2604    19768    withdrawal id    DEFAULT     n   ALTER TABLE ONLY public.withdrawal ALTER COLUMN id SET DEFAULT nextval('public.withdrawal_id_seq'::regclass);
 <   ALTER TABLE public.withdrawal ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231         F          0    19726 	   gasprices 
   TABLE DATA           L   COPY public.gasprices (station_id, oil_type, amount, ctime, id) FROM stdin;
    public          postgres    false    227       4422.dat �          0    18935    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    217       4233.dat G          0    19739    stationmetrics 
   TABLE DATA           \   COPY public.stationmetrics (station_id, integrity_score, pharmacy, supermarket) FROM stdin;
    public          postgres    false    228       4423.dat @          0    19693    stations 
   TABLE DATA           n   COPY public.stations (geom, station_name, latitude, longitude, status, area, address, station_id) FROM stdin;
    public          postgres    false    221       4416.dat B          0    19703    user 
   TABLE DATA           �   COPY public."user" (email, first_name, last_name, phone_number, is_subscribed, status, image_url, profession, token, password, id, created_at, code, points, referral_code, total_spend, level, updated_at) FROM stdin;
    public          postgres    false    223       4418.dat H          0    19751    useraddress 
   TABLE DATA           I   COPY public.useraddress (user_id, area, lga, state, address) FROM stdin;
    public          postgres    false    229       4424.dat D          0    19717    userfeedback 
   TABLE DATA           ;   COPY public.userfeedback (email, feedback, id) FROM stdin;
    public          postgres    false    225       4420.dat J          0    19765 
   withdrawal 
   TABLE DATA           O   COPY public.withdrawal (amount, email, number, ctime, user_id, id) FROM stdin;
    public          postgres    false    231       4426.dat V           0    0    gasprices_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.gasprices_id_seq', 15, true);
          public          postgres    false    226         W           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 5, true);
          public          postgres    false    222         X           0    0    userfeedback_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.userfeedback_id_seq', 4, true);
          public          postgres    false    224         Y           0    0    withdrawal_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.withdrawal_id_seq', 4, true);
          public          postgres    false    230         �           2606    19733    gasprices gasprices_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.gasprices
    ADD CONSTRAINT gasprices_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.gasprices DROP CONSTRAINT gasprices_pkey;
       public            postgres    false    227         �           2606    19745 "   stationmetrics stationmetrics_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.stationmetrics
    ADD CONSTRAINT stationmetrics_pkey PRIMARY KEY (station_id);
 L   ALTER TABLE ONLY public.stationmetrics DROP CONSTRAINT stationmetrics_pkey;
       public            postgres    false    228         �           2606    19699    stations stations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);
 @   ALTER TABLE ONLY public.stations DROP CONSTRAINT stations_pkey;
       public            postgres    false    221         �           2606    19712    user user_phone_number_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_number_key UNIQUE (phone_number);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_phone_number_key;
       public            postgres    false    223         �           2606    19710    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    223         �           2606    19757    useraddress useraddress_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT useraddress_pkey PRIMARY KEY (user_id);
 F   ALTER TABLE ONLY public.useraddress DROP CONSTRAINT useraddress_pkey;
       public            postgres    false    229         �           2606    19724    userfeedback userfeedback_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.userfeedback
    ADD CONSTRAINT userfeedback_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.userfeedback DROP CONSTRAINT userfeedback_pkey;
       public            postgres    false    225         �           2606    19772    withdrawal withdrawal_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT withdrawal_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.withdrawal DROP CONSTRAINT withdrawal_pkey;
       public            postgres    false    231         �           1259    19700    idx_stations_geom    INDEX     E   CREATE INDEX idx_stations_geom ON public.stations USING gist (geom);
 %   DROP INDEX public.idx_stations_geom;
       public            postgres    false    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    221         �           1259    19701    ix_stations_station_id    INDEX     Q   CREATE INDEX ix_stations_station_id ON public.stations USING btree (station_id);
 *   DROP INDEX public.ix_stations_station_id;
       public            postgres    false    221         �           1259    19713    ix_user_code    INDEX     F   CREATE UNIQUE INDEX ix_user_code ON public."user" USING btree (code);
     DROP INDEX public.ix_user_code;
       public            postgres    false    223         �           1259    19714    ix_user_email    INDEX     H   CREATE UNIQUE INDEX ix_user_email ON public."user" USING btree (email);
 !   DROP INDEX public.ix_user_email;
       public            postgres    false    223         �           1259    19715    ix_user_token    INDEX     A   CREATE INDEX ix_user_token ON public."user" USING btree (token);
 !   DROP INDEX public.ix_user_token;
       public            postgres    false    223         �           1259    19763    ix_useraddress_area    INDEX     K   CREATE INDEX ix_useraddress_area ON public.useraddress USING btree (area);
 '   DROP INDEX public.ix_useraddress_area;
       public            postgres    false    229         �           2606    19734 #   gasprices gasprices_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gasprices
    ADD CONSTRAINT gasprices_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.stations(station_id);
 M   ALTER TABLE ONLY public.gasprices DROP CONSTRAINT gasprices_station_id_fkey;
       public          postgres    false    227    4245    221         �           2606    19746 -   stationmetrics stationmetrics_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stationmetrics
    ADD CONSTRAINT stationmetrics_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.stations(station_id);
 W   ALTER TABLE ONLY public.stationmetrics DROP CONSTRAINT stationmetrics_station_id_fkey;
       public          postgres    false    221    4245    228         �           2606    19758 $   useraddress useraddress_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT useraddress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 N   ALTER TABLE ONLY public.useraddress DROP CONSTRAINT useraddress_user_id_fkey;
       public          postgres    false    229    4252    223         �           2606    19773 "   withdrawal withdrawal_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT withdrawal_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 L   ALTER TABLE ONLY public.withdrawal DROP CONSTRAINT withdrawal_user_id_fkey;
       public          postgres    false    4252    231    223                                                                                                                                                                                                                                                                      4422.dat                                                                                            0000600 0004000 0002000 00000001624 14772031261 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        123e4567-e89b-12d3-a456-426614174000	Petrol	650	2025-02-25	1
123e4567-e89b-12d3-a456-426614174000	Diesel	750	2025-02-25	2
123e4567-e89b-12d3-a456-426614174000	Kero	800	2025-02-25	3
223e4567-e89b-12d3-a456-426614174001	Petrol	655	2025-02-25	4
223e4567-e89b-12d3-a456-426614174001	Diesel	755	2025-02-25	5
223e4567-e89b-12d3-a456-426614174001	Kero	810	2025-02-25	6
323e4567-e89b-12d3-a456-426614174002	Petrol	660	2025-02-25	7
323e4567-e89b-12d3-a456-426614174002	Diesel	760	2025-02-25	8
323e4567-e89b-12d3-a456-426614174002	Kero	815	2025-02-25	9
423e4567-e89b-12d3-a456-426614174003	Petrol	645	2025-02-25	10
423e4567-e89b-12d3-a456-426614174003	Diesel	745	2025-02-25	11
423e4567-e89b-12d3-a456-426614174003	Kero	795	2025-02-25	12
523e4567-e89b-12d3-a456-426614174004	Petrol	665	2025-02-25	13
523e4567-e89b-12d3-a456-426614174004	Diesel	765	2025-02-25	14
523e4567-e89b-12d3-a456-426614174004	Kero	820	2025-02-25	15
\.


                                                                                                            4233.dat                                                                                            0000600 0004000 0002000 00000000005 14772031261 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4423.dat                                                                                            0000600 0004000 0002000 00000000372 14772031261 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        123e4567-e89b-12d3-a456-426614174000	0.95	Yes	No
223e4567-e89b-12d3-a456-426614174001	0.88	Yes	Yes
323e4567-e89b-12d3-a456-426614174002	0.92	No	Yes
423e4567-e89b-12d3-a456-426614174003	0.75	No	No
523e4567-e89b-12d3-a456-426614174004	0.9	Yes	Yes
\.


                                                                                                                                                                                                                                                                      4416.dat                                                                                            0000600 0004000 0002000 00000001565 14772031261 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        0101000020E61000005F29CB10C7BA0A4054E3A59BC4601A40	Oando Filling Station Ikeja	6.5945	3.3412	ACTIVE	ikeja	23 Airport Road, Ikeja	123e4567-e89b-12d3-a456-426614174000
0101000020E61000001FF46C567DAE0C40A9A44E4013E11940	Total Filling Station Lekki	6.4698	3.5852	ACTIVE	lekki	15 Admiralty Way, Lekki	223e4567-e89b-12d3-a456-426614174001
0101000020E61000008E75711B0D600B409FABADD85FB61940	Mobil Filling Station Victoria Island	6.4281	3.4219	ACTIVE	victoria island	10 Kofo Abayomi Street, Victoria Island	323e4567-e89b-12d3-a456-426614174002
0101000020E6100000EFC9C342ADE90A40832F4CA60A061A40	NNPC Filling Station Surulere	6.5059	3.3641	INACTIVE	surulere	5 Adelabu Street, Surulere	423e4567-e89b-12d3-a456-426614174003
0101000020E6100000280F0BB5A6790B4050FC1873D7D21940	MRS Filling Station Ikoyi	6.4559	3.4344	ACTIVE	ikoyi	20 Bourdillon Road, Ikoyi	523e4567-e89b-12d3-a456-426614174004
\.


                                                                                                                                           4418.dat                                                                                            0000600 0004000 0002000 00000003042 14772031261 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        sarah.johnson@example.com	Sarah	Johnson	08045678901	f	INACTIVE	https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png	Teacher	\N	$2b$12$567890abcdefghijkl1234	4	2024-03-01 16:20:00	SJOH2024	0	MBRO2024	0	Basic	2025-03-03 09:30:00
iamphantasm0@gmail.com	John	Doe	08012345678	t	ACTIVE	https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png	Engineer	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqb2huLmRvZUBleGFtcGxlLmNvbSJ9	$2b$12$1234567890abcdefghijk	1	2024-02-15 09:30:00	JDOE2024	500	JSMI2024	2500.75	Silver	2025-03-03 09:30:00
jane.smith@example.com	Jane	Smith	08023456789	t	ACTIVE	https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png	Doctor	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqYW5lLnNtaXRoQGV4YW1wbGUuY29tIn0	$2b$12$abcdefghijk1234567890	2	2024-02-20 14:45:00	JSMI2024	250	JDOE2024	1200.5	Basic	2025-03-03 09:30:00
michael.brown@example.com	Michael	Brown	08034567890	t	ACTIVE	https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png	Accountant	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtaWNoYWVsLmJyb3duQGV4YW1wbGUuY29tIn0	$2b$12$ghijkl1234567890abcdef	3	2024-01-10 08:15:00	MBRO2024	1500	DWIL2023	7500.25	Gold	2025-03-03 09:30:00
david.williams@example.com	David	Williams	08056789012	t	ACTIVE	https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png	Business Owner	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkYXZpZC53aWxsaWFtc0BleGFtcGxlLmNvbSJ9	$2b$12$90abcdefghijkl12345678	5	2023-12-05 10:10:00	DWIL2023	3000	SJOH2024	15000	Platinum	2025-03-03 09:30:00
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              4424.dat                                                                                            0000600 0004000 0002000 00000000320 14772031261 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	lekki	Eti-Osa	Lagos	7B Admiralty Way
3	victoria island	Eti-Osa	Lagos	25 Kofo Abayomi Street
4	surulere	Surulere	Lagos	10 Adelabu Street
5	ikoyi	Eti-Osa	Lagos	30 Bourdillon Road
1	ogba	Ikeja	Lagos	adek
\.


                                                                                                                                                                                                                                                                                                                4420.dat                                                                                            0000600 0004000 0002000 00000000547 14772031261 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        john.doe@example.com	Great app! Would love to see more stations in my area.	1
jane.smith@example.com	The price updates are very helpful. Thank you!	2
michael.brown@example.com	I experienced an issue with the withdrawal process. Could you please check?	3
david.williams@example.com	Very useful application. Would recommend adding notification features.	4
\.


                                                                                                                                                         4426.dat                                                                                            0000600 0004000 0002000 00000000342 14772031261 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        500	john.doe@example.com	08012345678	2025-02-10	1	1
750	john.doe@example.com	08012345678	2025-02-20	1	2
1000	michael.brown@example.com	08034567890	2025-02-15	3	3
2500	david.williams@example.com	08056789012	2025-02-18	5	4
\.


                                                                                                                                                                                                                                                                                              restore.sql                                                                                         0000600 0004000 0002000 00000032327 14772031261 0015376 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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

DROP DATABASE prices;
--
-- Name: prices; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE prices WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_NG';


ALTER DATABASE prices OWNER TO postgres;

\connect prices

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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: gasprices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gasprices (
    station_id uuid,
    oil_type character varying NOT NULL,
    amount double precision NOT NULL,
    ctime date NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.gasprices OWNER TO postgres;

--
-- Name: gasprices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gasprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gasprices_id_seq OWNER TO postgres;

--
-- Name: gasprices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gasprices_id_seq OWNED BY public.gasprices.id;


--
-- Name: stationmetrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stationmetrics (
    station_id uuid NOT NULL,
    integrity_score double precision NOT NULL,
    pharmacy character varying NOT NULL,
    supermarket character varying NOT NULL
);


ALTER TABLE public.stationmetrics OWNER TO postgres;

--
-- Name: stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stations (
    geom public.geometry,
    station_name character varying NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    status character varying NOT NULL,
    area character varying NOT NULL,
    address character varying NOT NULL,
    station_id uuid NOT NULL
);


ALTER TABLE public.stations OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    email character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    phone_number character varying(11) NOT NULL,
    is_subscribed boolean NOT NULL,
    status character varying NOT NULL,
    image_url character varying,
    profession character varying,
    token character varying,
    password character varying NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    code character varying,
    points integer,
    referral_code character varying,
    total_spend double precision NOT NULL,
    level character varying NOT NULL,
    updated_at timestamp without time zone DEFAULT '2025-03-03 09:30:00'::timestamp without time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: useraddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.useraddress (
    user_id integer NOT NULL,
    area character varying,
    lga character varying,
    state character varying,
    address character varying
);


ALTER TABLE public.useraddress OWNER TO postgres;

--
-- Name: userfeedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userfeedback (
    email character varying NOT NULL,
    feedback character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.userfeedback OWNER TO postgres;

--
-- Name: userfeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.userfeedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.userfeedback_id_seq OWNER TO postgres;

--
-- Name: userfeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.userfeedback_id_seq OWNED BY public.userfeedback.id;


--
-- Name: withdrawal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.withdrawal (
    amount double precision NOT NULL,
    email character varying NOT NULL,
    number character varying NOT NULL,
    ctime date NOT NULL,
    user_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.withdrawal OWNER TO postgres;

--
-- Name: withdrawal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.withdrawal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.withdrawal_id_seq OWNER TO postgres;

--
-- Name: withdrawal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.withdrawal_id_seq OWNED BY public.withdrawal.id;


--
-- Name: gasprices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasprices ALTER COLUMN id SET DEFAULT nextval('public.gasprices_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: userfeedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userfeedback ALTER COLUMN id SET DEFAULT nextval('public.userfeedback_id_seq'::regclass);


--
-- Name: withdrawal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.withdrawal ALTER COLUMN id SET DEFAULT nextval('public.withdrawal_id_seq'::regclass);


--
-- Data for Name: gasprices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gasprices (station_id, oil_type, amount, ctime, id) FROM stdin;
\.
COPY public.gasprices (station_id, oil_type, amount, ctime, id) FROM '$$PATH$$/4422.dat';

--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM '$$PATH$$/4233.dat';

--
-- Data for Name: stationmetrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stationmetrics (station_id, integrity_score, pharmacy, supermarket) FROM stdin;
\.
COPY public.stationmetrics (station_id, integrity_score, pharmacy, supermarket) FROM '$$PATH$$/4423.dat';

--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stations (geom, station_name, latitude, longitude, status, area, address, station_id) FROM stdin;
\.
COPY public.stations (geom, station_name, latitude, longitude, status, area, address, station_id) FROM '$$PATH$$/4416.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (email, first_name, last_name, phone_number, is_subscribed, status, image_url, profession, token, password, id, created_at, code, points, referral_code, total_spend, level, updated_at) FROM stdin;
\.
COPY public."user" (email, first_name, last_name, phone_number, is_subscribed, status, image_url, profession, token, password, id, created_at, code, points, referral_code, total_spend, level, updated_at) FROM '$$PATH$$/4418.dat';

--
-- Data for Name: useraddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.useraddress (user_id, area, lga, state, address) FROM stdin;
\.
COPY public.useraddress (user_id, area, lga, state, address) FROM '$$PATH$$/4424.dat';

--
-- Data for Name: userfeedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userfeedback (email, feedback, id) FROM stdin;
\.
COPY public.userfeedback (email, feedback, id) FROM '$$PATH$$/4420.dat';

--
-- Data for Name: withdrawal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.withdrawal (amount, email, number, ctime, user_id, id) FROM stdin;
\.
COPY public.withdrawal (amount, email, number, ctime, user_id, id) FROM '$$PATH$$/4426.dat';

--
-- Name: gasprices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gasprices_id_seq', 15, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- Name: userfeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userfeedback_id_seq', 4, true);


--
-- Name: withdrawal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.withdrawal_id_seq', 4, true);


--
-- Name: gasprices gasprices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasprices
    ADD CONSTRAINT gasprices_pkey PRIMARY KEY (id);


--
-- Name: stationmetrics stationmetrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stationmetrics
    ADD CONSTRAINT stationmetrics_pkey PRIMARY KEY (station_id);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);


--
-- Name: user user_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_number_key UNIQUE (phone_number);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: useraddress useraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT useraddress_pkey PRIMARY KEY (user_id);


--
-- Name: userfeedback userfeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userfeedback
    ADD CONSTRAINT userfeedback_pkey PRIMARY KEY (id);


--
-- Name: withdrawal withdrawal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT withdrawal_pkey PRIMARY KEY (id);


--
-- Name: idx_stations_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_stations_geom ON public.stations USING gist (geom);


--
-- Name: ix_stations_station_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_stations_station_id ON public.stations USING btree (station_id);


--
-- Name: ix_user_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_user_code ON public."user" USING btree (code);


--
-- Name: ix_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_user_email ON public."user" USING btree (email);


--
-- Name: ix_user_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_user_token ON public."user" USING btree (token);


--
-- Name: ix_useraddress_area; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_useraddress_area ON public.useraddress USING btree (area);


--
-- Name: gasprices gasprices_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasprices
    ADD CONSTRAINT gasprices_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.stations(station_id);


--
-- Name: stationmetrics stationmetrics_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stationmetrics
    ADD CONSTRAINT stationmetrics_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.stations(station_id);


--
-- Name: useraddress useraddress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT useraddress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: withdrawal withdrawal_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT withdrawal_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         