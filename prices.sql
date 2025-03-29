PGDMP  :    6                }            prices #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) 7    M           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            N           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            O           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            P           1262    18616    prices    DATABASE     l   CREATE DATABASE prices WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_NG';
    DROP DATABASE prices;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            Q           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    19726 	   gasprices    TABLE     �   CREATE TABLE public.gasprices (
    station_id uuid,
    oil_type character varying NOT NULL,
    amount double precision NOT NULL,
    ctime date NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.gasprices;
       public         heap    postgres    false    5            �            1259    19725    gasprices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gasprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.gasprices_id_seq;
       public          postgres    false    227    5            R           0    0    gasprices_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.gasprices_id_seq OWNED BY public.gasprices.id;
          public          postgres    false    226            �            1259    19739    stationmetrics    TABLE     �   CREATE TABLE public.stationmetrics (
    station_id uuid NOT NULL,
    integrity_score double precision NOT NULL,
    pharmacy character varying NOT NULL,
    supermarket character varying NOT NULL
);
 "   DROP TABLE public.stationmetrics;
       public         heap    postgres    false    5            �            1259    19693    stations    TABLE     K  CREATE TABLE public.stations (
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
       public         heap    postgres    false    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5            �            1259    19703    user    TABLE       CREATE TABLE public."user" (
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
       public         heap    postgres    false    5            �            1259    19702    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    223    5            S           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    222            �            1259    19751    useraddress    TABLE     �   CREATE TABLE public.useraddress (
    user_id integer NOT NULL,
    area character varying,
    lga character varying,
    state character varying,
    address character varying
);
    DROP TABLE public.useraddress;
       public         heap    postgres    false    5            �            1259    19717    userfeedback    TABLE     �   CREATE TABLE public.userfeedback (
    email character varying NOT NULL,
    feedback character varying NOT NULL,
    id integer NOT NULL
);
     DROP TABLE public.userfeedback;
       public         heap    postgres    false    5            �            1259    19716    userfeedback_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userfeedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.userfeedback_id_seq;
       public          postgres    false    5    225            T           0    0    userfeedback_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.userfeedback_id_seq OWNED BY public.userfeedback.id;
          public          postgres    false    224            �            1259    19765 
   withdrawal    TABLE     �   CREATE TABLE public.withdrawal (
    amount double precision NOT NULL,
    email character varying NOT NULL,
    number character varying NOT NULL,
    ctime date NOT NULL,
    user_id integer NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.withdrawal;
       public         heap    postgres    false    5            �            1259    19764    withdrawal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.withdrawal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.withdrawal_id_seq;
       public          postgres    false    231    5            U           0    0    withdrawal_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.withdrawal_id_seq OWNED BY public.withdrawal.id;
          public          postgres    false    230            �           2604    19729    gasprices id    DEFAULT     l   ALTER TABLE ONLY public.gasprices ALTER COLUMN id SET DEFAULT nextval('public.gasprices_id_seq'::regclass);
 ;   ALTER TABLE public.gasprices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    19706    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    19720    userfeedback id    DEFAULT     r   ALTER TABLE ONLY public.userfeedback ALTER COLUMN id SET DEFAULT nextval('public.userfeedback_id_seq'::regclass);
 >   ALTER TABLE public.userfeedback ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    19768    withdrawal id    DEFAULT     n   ALTER TABLE ONLY public.withdrawal ALTER COLUMN id SET DEFAULT nextval('public.withdrawal_id_seq'::regclass);
 <   ALTER TABLE public.withdrawal ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            F          0    19726 	   gasprices 
   TABLE DATA           L   COPY public.gasprices (station_id, oil_type, amount, ctime, id) FROM stdin;
    public          postgres    false    227   �N       �          0    18935    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    217   �O       G          0    19739    stationmetrics 
   TABLE DATA           \   COPY public.stationmetrics (station_id, integrity_score, pharmacy, supermarket) FROM stdin;
    public          postgres    false    228   �O       @          0    19693    stations 
   TABLE DATA           n   COPY public.stations (geom, station_name, latitude, longitude, status, area, address, station_id) FROM stdin;
    public          postgres    false    221   PP       B          0    19703    user 
   TABLE DATA           �   COPY public."user" (email, first_name, last_name, phone_number, is_subscribed, status, image_url, profession, token, password, id, created_at, code, points, referral_code, total_spend, level, updated_at) FROM stdin;
    public          postgres    false    223   R       H          0    19751    useraddress 
   TABLE DATA           I   COPY public.useraddress (user_id, area, lga, state, address) FROM stdin;
    public          postgres    false    229   �T       D          0    19717    userfeedback 
   TABLE DATA           ;   COPY public.userfeedback (email, feedback, id) FROM stdin;
    public          postgres    false    225   0U       J          0    19765 
   withdrawal 
   TABLE DATA           O   COPY public.withdrawal (amount, email, number, ctime, user_id, id) FROM stdin;
    public          postgres    false    231   /V       V           0    0    gasprices_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.gasprices_id_seq', 15, true);
          public          postgres    false    226            W           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 5, true);
          public          postgres    false    222            X           0    0    userfeedback_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.userfeedback_id_seq', 4, true);
          public          postgres    false    224            Y           0    0    withdrawal_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.withdrawal_id_seq', 4, true);
          public          postgres    false    230            �           2606    19733    gasprices gasprices_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.gasprices
    ADD CONSTRAINT gasprices_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.gasprices DROP CONSTRAINT gasprices_pkey;
       public            postgres    false    227            �           2606    19745 "   stationmetrics stationmetrics_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.stationmetrics
    ADD CONSTRAINT stationmetrics_pkey PRIMARY KEY (station_id);
 L   ALTER TABLE ONLY public.stationmetrics DROP CONSTRAINT stationmetrics_pkey;
       public            postgres    false    228            �           2606    19699    stations stations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);
 @   ALTER TABLE ONLY public.stations DROP CONSTRAINT stations_pkey;
       public            postgres    false    221            �           2606    19712    user user_phone_number_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_number_key UNIQUE (phone_number);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_phone_number_key;
       public            postgres    false    223            �           2606    19710    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    223            �           2606    19757    useraddress useraddress_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT useraddress_pkey PRIMARY KEY (user_id);
 F   ALTER TABLE ONLY public.useraddress DROP CONSTRAINT useraddress_pkey;
       public            postgres    false    229            �           2606    19724    userfeedback userfeedback_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.userfeedback
    ADD CONSTRAINT userfeedback_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.userfeedback DROP CONSTRAINT userfeedback_pkey;
       public            postgres    false    225            �           2606    19772    withdrawal withdrawal_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT withdrawal_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.withdrawal DROP CONSTRAINT withdrawal_pkey;
       public            postgres    false    231            �           1259    19700    idx_stations_geom    INDEX     E   CREATE INDEX idx_stations_geom ON public.stations USING gist (geom);
 %   DROP INDEX public.idx_stations_geom;
       public            postgres    false    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    221            �           1259    19701    ix_stations_station_id    INDEX     Q   CREATE INDEX ix_stations_station_id ON public.stations USING btree (station_id);
 *   DROP INDEX public.ix_stations_station_id;
       public            postgres    false    221            �           1259    19713    ix_user_code    INDEX     F   CREATE UNIQUE INDEX ix_user_code ON public."user" USING btree (code);
     DROP INDEX public.ix_user_code;
       public            postgres    false    223            �           1259    19714    ix_user_email    INDEX     H   CREATE UNIQUE INDEX ix_user_email ON public."user" USING btree (email);
 !   DROP INDEX public.ix_user_email;
       public            postgres    false    223            �           1259    19715    ix_user_token    INDEX     A   CREATE INDEX ix_user_token ON public."user" USING btree (token);
 !   DROP INDEX public.ix_user_token;
       public            postgres    false    223            �           1259    19763    ix_useraddress_area    INDEX     K   CREATE INDEX ix_useraddress_area ON public.useraddress USING btree (area);
 '   DROP INDEX public.ix_useraddress_area;
       public            postgres    false    229            �           2606    19734 #   gasprices gasprices_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gasprices
    ADD CONSTRAINT gasprices_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.stations(station_id);
 M   ALTER TABLE ONLY public.gasprices DROP CONSTRAINT gasprices_station_id_fkey;
       public          postgres    false    227    4245    221            �           2606    19746 -   stationmetrics stationmetrics_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stationmetrics
    ADD CONSTRAINT stationmetrics_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.stations(station_id);
 W   ALTER TABLE ONLY public.stationmetrics DROP CONSTRAINT stationmetrics_station_id_fkey;
       public          postgres    false    221    4245    228            �           2606    19758 $   useraddress useraddress_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT useraddress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 N   ALTER TABLE ONLY public.useraddress DROP CONSTRAINT useraddress_user_id_fkey;
       public          postgres    false    229    4252    223            �           2606    19773 "   withdrawal withdrawal_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT withdrawal_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 L   ALTER TABLE ONLY public.withdrawal DROP CONSTRAINT withdrawal_user_id_fkey;
       public          postgres    false    4252    231    223            F   �   x��ӱ
1��y�J�&������(v��G�qi�?���*�K��x�����wΙ�� b8��}�BV��9�����>����Çz�À�&�>�-Z��p�6X}x�&�!�)��lp��5���������OS��	}z����ӟ�2Zˠ}+��V'�nk[->����C)�v �{��5      �      x������ � �      G   e   x��Ϋ�0P��˖>��	<	�4��O�&�Mzz/�t�\b��ķ�����3)EĀ�Y���x�A����������bx%[���	 >�57�      @   �  x������0���S� ��c'>:N,���ZV�K/�I+�,���o_'�$|�������84j��t\�
��C �F�ʒLu����\��p�Ͷ�C<�����3���d&V��g�>�_�,�̄�oF�}�8;����*�]�wK�X�T/�+��%�n(�9R6�jӀ%0�5(D�(�������~%)]&JY�+e?K(�i_����ľ���l�1�f��@��V �v�2u]JW��K܅[̗�s�C�l�֧kO���L��ߥ)�7!�O�Wdf�O�5�aC׍��a��*��*���
�n���RpG�(0��\l6���&��p컡��RO�P��zs^���Ow�z�;^��Vz,� �T�4����%8�e!����މq<��3,	��OV���&_j�$yR�cL���<�N�T      B   p  x���Mo�0��ï��+��$@rj�.��BZR�J+��mbg����8Zv���B�����<�w
����$^~oh����&*�kP�V�ն�Gp��wz	��y��zq-gЭ�Y�!�Nn�]}��[:]QIl�Z6�b�FZ��p�0��0�3�ar���(~�'��9��0����@F�:n:9��}W���3�Z�P�[U�QG�c��+�L(�����<�,�:V�BOĪY��� N��%�3���[/	�!1Ͻ}q񐹅��V�u��s~7�z�V�D���~$Y��������o2�o�A6\��c��>BxG��r��.+T�
&Wn�2�ZLX�*U~���X+2&�����k��kp/�� {"���f���Pһ��џ�3����rFl�r�'���L �ձ阖��7����O�/caB�Tb}칫�tTFQ<85ŋ0��\�7II�����b�y������|����c�70����+��b5�=���-5�Ă�H�yFt�"m�Ҵ4vq��R��R��n����,���EQ����<���ﻖA�MA�����6�{3V��Rx�&d�1rp��H�ߕ
2��JƗه`�Z�����      H   �   x�]�1
�@E��S������66w�n2����
�&�/���<;'p����t�C��%���MyFB(��ɮ��Ƴ������]���aN!y�2�®��S��q��O�[M���:�Mɚ�����,;��c��"B�      D   �   x�U��NC1E�篘��%�$
DAC3�7xo��y���4馸s�/![_���a]I�{w�Z7�UF���)@�4�v�R��dJg��`����Iz��m�6q�Q=w�偎hg
�u7��m�|�s���$q��O+k�C}NM�<q&Q�uZR��o�r���A��۵�DӤ��\�;�,O��Q�]%F�wF��tC1�]��⮍�m��)J�3���)�.���vs�Ѡvy6���Rp�      J   }   x���1�0 ���K-۩i�xKh"5(iH��SԡR7p:c�{�f�-]�'�GI4�
�Y��v<(�u��0��џQ^���)�B�g[��ܙ����C�U��Α�\J�u�ݩ����_u9�     