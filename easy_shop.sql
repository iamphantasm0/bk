PGDMP                      }         	   easy_shop #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) F    g           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            h           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            i           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            j           1262    19785 	   easy_shop    DATABASE     o   CREATE DATABASE easy_shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_NG';
    DROP DATABASE easy_shop;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            k           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            o           1247    20863 	   dayofweek    TYPE     v   CREATE TYPE public.dayofweek AS ENUM (
    'mon',
    'tue',
    'wed',
    'thu',
    'fri',
    'sat',
    'sun'
);
    DROP TYPE public.dayofweek;
       public          postgres    false    5            r           1247    20878 
   dealaction    TYPE     F   CREATE TYPE public.dealaction AS ENUM (
    'delete',
    'create'
);
    DROP TYPE public.dealaction;
       public          postgres    false    5            u           1247    20884    productcategory    TYPE     �   CREATE TYPE public.productcategory AS ENUM (
    'food',
    'fuel',
    'pharmacy',
    'building material',
    'restaurant'
);
 "   DROP TYPE public.productcategory;
       public          postgres    false    5            �            1259    20904    product    TABLE     �   CREATE TABLE public.product (
    id uuid NOT NULL,
    name character varying NOT NULL,
    image_url character varying NOT NULL,
    image bytea,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false    5            �            1259    20922 
   promo_deal    TABLE     a  CREATE TABLE public.promo_deal (
    id uuid NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    allocated_points double precision NOT NULL,
    points_balance double precision,
    points_message character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.promo_deal;
       public         heap    postgres    false    5            �            1259    20930    report_price_availability    TABLE     �   CREATE TABLE public.report_price_availability (
    id integer NOT NULL,
    resource_id uuid,
    category public.productcategory NOT NULL,
    price_availability jsonb,
    created_at timestamp without time zone NOT NULL
);
 -   DROP TABLE public.report_price_availability;
       public         heap    postgres    false    1653    5            �            1259    20929     report_price_availability_id_seq    SEQUENCE     �   CREATE SEQUENCE public.report_price_availability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.report_price_availability_id_seq;
       public          postgres    false    226    5            l           0    0     report_price_availability_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.report_price_availability_id_seq OWNED BY public.report_price_availability.id;
          public          postgres    false    225            �            1259    20895    shop    TABLE     F  CREATE TABLE public.shop (
    id uuid NOT NULL,
    account_id uuid,
    name character varying NOT NULL,
    description character varying NOT NULL,
    address character varying NOT NULL,
    area character varying NOT NULL,
    lga character varying NOT NULL,
    state character varying NOT NULL,
    stars character varying NOT NULL,
    latitude double precision,
    longitude double precision,
    geom public.geometry,
    point_balance double precision NOT NULL,
    virtual_point_balance double precision NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.shop;
       public         heap    postgres    false    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5            �            1259    20963    shop_hrs    TABLE     A  CREATE TABLE public.shop_hrs (
    id integer NOT NULL,
    shop_id uuid NOT NULL,
    day public.dayofweek NOT NULL,
    open_time time without time zone NOT NULL,
    close_time time without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.shop_hrs;
       public         heap    postgres    false    1647    5            �            1259    20962    shop_hrs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_hrs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.shop_hrs_id_seq;
       public          postgres    false    230    5            m           0    0    shop_hrs_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.shop_hrs_id_seq OWNED BY public.shop_hrs.id;
          public          postgres    false    229            �            1259    20941    shop_product    TABLE     �   CREATE TABLE public.shop_product (
    id integer NOT NULL,
    shop_id uuid NOT NULL,
    product_id uuid NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
     DROP TABLE public.shop_product;
       public         heap    postgres    false    5            �            1259    20940    shop_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.shop_product_id_seq;
       public          postgres    false    228    5            n           0    0    shop_product_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.shop_product_id_seq OWNED BY public.shop_product.id;
          public          postgres    false    227            �            1259    20979    shop_product_price    TABLE     �   CREATE TABLE public.shop_product_price (
    id integer NOT NULL,
    shop_product_id integer NOT NULL,
    price double precision NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 &   DROP TABLE public.shop_product_price;
       public         heap    postgres    false    5            �            1259    20978    shop_product_price_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_product_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.shop_product_price_id_seq;
       public          postgres    false    232    5            o           0    0    shop_product_price_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.shop_product_price_id_seq OWNED BY public.shop_product_price.id;
          public          postgres    false    231            �            1259    20913 
   store_deal    TABLE     �  CREATE TABLE public.store_deal (
    id uuid NOT NULL,
    shop_id uuid NOT NULL,
    product_id uuid NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    action public.dealaction NOT NULL,
    allocated_points double precision NOT NULL,
    points_balance double precision,
    points_message character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.store_deal;
       public         heap    postgres    false    1650    5            �           2604    20933    report_price_availability id    DEFAULT     �   ALTER TABLE ONLY public.report_price_availability ALTER COLUMN id SET DEFAULT nextval('public.report_price_availability_id_seq'::regclass);
 K   ALTER TABLE public.report_price_availability ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    20966    shop_hrs id    DEFAULT     j   ALTER TABLE ONLY public.shop_hrs ALTER COLUMN id SET DEFAULT nextval('public.shop_hrs_id_seq'::regclass);
 :   ALTER TABLE public.shop_hrs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    20944    shop_product id    DEFAULT     r   ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_product_id_seq'::regclass);
 >   ALTER TABLE public.shop_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    20982    shop_product_price id    DEFAULT     ~   ALTER TABLE ONLY public.shop_product_price ALTER COLUMN id SET DEFAULT nextval('public.shop_product_price_id_seq'::regclass);
 D   ALTER TABLE public.shop_product_price ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            Z          0    20904    product 
   TABLE DATA           I   COPY public.product (id, name, image_url, image, updated_at) FROM stdin;
    public          postgres    false    222   ad       \          0    20922 
   promo_deal 
   TABLE DATA           �   COPY public.promo_deal (id, start_date, end_date, allocated_points, points_balance, points_message, created_at, updated_at) FROM stdin;
    public          postgres    false    224   '      ^          0    20930    report_price_availability 
   TABLE DATA           n   COPY public.report_price_availability (id, resource_id, category, price_availability, created_at) FROM stdin;
    public          postgres    false    226   *      Y          0    20895    shop 
   TABLE DATA           �   COPY public.shop (id, account_id, name, description, address, area, lga, state, stars, latitude, longitude, geom, point_balance, virtual_point_balance, updated_at) FROM stdin;
    public          postgres    false    221         b          0    20963    shop_hrs 
   TABLE DATA           c   COPY public.shop_hrs (id, shop_id, day, open_time, close_time, created_at, updated_at) FROM stdin;
    public          postgres    false    230   �      `          0    20941    shop_product 
   TABLE DATA           K   COPY public.shop_product (id, shop_id, product_id, updated_at) FROM stdin;
    public          postgres    false    228   0      d          0    20979    shop_product_price 
   TABLE DATA           `   COPY public.shop_product_price (id, shop_product_id, price, created_at, updated_at) FROM stdin;
    public          postgres    false    232         �          0    20104    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    217   �      [          0    20913 
   store_deal 
   TABLE DATA           �   COPY public.store_deal (id, shop_id, product_id, start_date, end_date, action, allocated_points, points_balance, points_message, created_at, updated_at) FROM stdin;
    public          postgres    false    223   �      p           0    0     report_price_availability_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.report_price_availability_id_seq', 3, true);
          public          postgres    false    225            q           0    0    shop_hrs_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.shop_hrs_id_seq', 70, true);
          public          postgres    false    229            r           0    0    shop_product_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.shop_product_id_seq', 143, true);
          public          postgres    false    227            s           0    0    shop_product_price_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.shop_product_price_id_seq', 117, true);
          public          postgres    false    231            �           2606    20970    shop_hrs _shop_hrs_uc 
   CONSTRAINT     X   ALTER TABLE ONLY public.shop_hrs
    ADD CONSTRAINT _shop_hrs_uc UNIQUE (shop_id, day);
 ?   ALTER TABLE ONLY public.shop_hrs DROP CONSTRAINT _shop_hrs_uc;
       public            postgres    false    230    230            �           2606    20948    shop_product _shop_product_uc 
   CONSTRAINT     g   ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT _shop_product_uc UNIQUE (shop_id, product_id);
 G   ALTER TABLE ONLY public.shop_product DROP CONSTRAINT _shop_product_uc;
       public            postgres    false    228    228            �           2606    20912    product product_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.product DROP CONSTRAINT product_name_key;
       public            postgres    false    222            �           2606    20910    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    222            �           2606    20928    promo_deal promo_deal_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.promo_deal
    ADD CONSTRAINT promo_deal_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.promo_deal DROP CONSTRAINT promo_deal_pkey;
       public            postgres    false    224            �           2606    20937 8   report_price_availability report_price_availability_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.report_price_availability
    ADD CONSTRAINT report_price_availability_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.report_price_availability DROP CONSTRAINT report_price_availability_pkey;
       public            postgres    false    226            �           2606    20968    shop_hrs shop_hrs_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.shop_hrs
    ADD CONSTRAINT shop_hrs_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.shop_hrs DROP CONSTRAINT shop_hrs_pkey;
       public            postgres    false    230            �           2606    20901    shop shop_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.shop DROP CONSTRAINT shop_pkey;
       public            postgres    false    221            �           2606    20946    shop_product shop_product_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.shop_product DROP CONSTRAINT shop_product_pkey;
       public            postgres    false    228            �           2606    20984 *   shop_product_price shop_product_price_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.shop_product_price
    ADD CONSTRAINT shop_product_price_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.shop_product_price DROP CONSTRAINT shop_product_price_pkey;
       public            postgres    false    232            �           2606    20919    store_deal store_deal_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.store_deal
    ADD CONSTRAINT store_deal_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.store_deal DROP CONSTRAINT store_deal_pkey;
       public            postgres    false    223            �           1259    20903    idx_shop_geom    INDEX     =   CREATE INDEX idx_shop_geom ON public.shop USING gist (geom);
 !   DROP INDEX public.idx_shop_geom;
       public            postgres    false    221    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5    5            �           1259    20938    ix_report_price_availability_id    INDEX     c   CREATE INDEX ix_report_price_availability_id ON public.report_price_availability USING btree (id);
 3   DROP INDEX public.ix_report_price_availability_id;
       public            postgres    false    226            �           1259    20939 (   ix_report_price_availability_resource_id    INDEX     u   CREATE INDEX ix_report_price_availability_resource_id ON public.report_price_availability USING btree (resource_id);
 <   DROP INDEX public.ix_report_price_availability_resource_id;
       public            postgres    false    226            �           1259    20902    ix_shop_area    INDEX     =   CREATE INDEX ix_shop_area ON public.shop USING btree (area);
     DROP INDEX public.ix_shop_area;
       public            postgres    false    221            �           1259    20976    ix_shop_hrs_id    INDEX     A   CREATE INDEX ix_shop_hrs_id ON public.shop_hrs USING btree (id);
 "   DROP INDEX public.ix_shop_hrs_id;
       public            postgres    false    230            �           1259    20977    ix_shop_hrs_shop_id    INDEX     K   CREATE INDEX ix_shop_hrs_shop_id ON public.shop_hrs USING btree (shop_id);
 '   DROP INDEX public.ix_shop_hrs_shop_id;
       public            postgres    false    230            �           1259    20961    ix_shop_product_id    INDEX     I   CREATE INDEX ix_shop_product_id ON public.shop_product USING btree (id);
 &   DROP INDEX public.ix_shop_product_id;
       public            postgres    false    228            �           1259    20991    ix_shop_product_price_id    INDEX     U   CREATE INDEX ix_shop_product_price_id ON public.shop_product_price USING btree (id);
 ,   DROP INDEX public.ix_shop_product_price_id;
       public            postgres    false    232            �           1259    20990 %   ix_shop_product_price_shop_product_id    INDEX     o   CREATE INDEX ix_shop_product_price_shop_product_id ON public.shop_product_price USING btree (shop_product_id);
 9   DROP INDEX public.ix_shop_product_price_shop_product_id;
       public            postgres    false    232            �           1259    20960    ix_shop_product_product_id    INDEX     Y   CREATE INDEX ix_shop_product_product_id ON public.shop_product USING btree (product_id);
 .   DROP INDEX public.ix_shop_product_product_id;
       public            postgres    false    228            �           1259    20959    ix_shop_product_shop_id    INDEX     S   CREATE INDEX ix_shop_product_shop_id ON public.shop_product USING btree (shop_id);
 +   DROP INDEX public.ix_shop_product_shop_id;
       public            postgres    false    228            �           1259    20921    ix_store_deal_product_id    INDEX     U   CREATE INDEX ix_store_deal_product_id ON public.store_deal USING btree (product_id);
 ,   DROP INDEX public.ix_store_deal_product_id;
       public            postgres    false    223            �           1259    20920    ix_store_deal_shop_id    INDEX     O   CREATE INDEX ix_store_deal_shop_id ON public.store_deal USING btree (shop_id);
 )   DROP INDEX public.ix_store_deal_shop_id;
       public            postgres    false    223            �           2606    20971    shop_hrs shop_hrs_shop_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.shop_hrs
    ADD CONSTRAINT shop_hrs_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shop(id);
 H   ALTER TABLE ONLY public.shop_hrs DROP CONSTRAINT shop_hrs_shop_id_fkey;
       public          postgres    false    4257    230    221            �           2606    20985 :   shop_product_price shop_product_price_shop_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop_product_price
    ADD CONSTRAINT shop_product_price_shop_product_id_fkey FOREIGN KEY (shop_product_id) REFERENCES public.shop_product(id);
 d   ALTER TABLE ONLY public.shop_product_price DROP CONSTRAINT shop_product_price_shop_product_id_fkey;
       public          postgres    false    4278    232    228            �           2606    20954 )   shop_product shop_product_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);
 S   ALTER TABLE ONLY public.shop_product DROP CONSTRAINT shop_product_product_id_fkey;
       public          postgres    false    4261    228    222            �           2606    20949 &   shop_product shop_product_shop_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shop(id);
 P   ALTER TABLE ONLY public.shop_product DROP CONSTRAINT shop_product_shop_id_fkey;
       public          postgres    false    4257    221    228            Z      x��I�$9�,v��+x$��7ls��	�m.X���#�w��OS5 �3k�%;�4��+"ܱ9` �Mծ�ҵ�9�?�X����G�w���]�����j��������������������������_���o����-�k������������_��?�wB��*�:��o?l]~���8^|�T_CML�r����(��v}�RW�Q�|��z����*Zi�99��oh�_��R��Jy{��_���E���^Q/��`����e�O>Ɛ���qø�雷e�#�����O��C�-���U�k2����6W��㲉�	���蹸J�{�Z��t_�y�NJ�z<w^������ꭜϣ�W5����؝�l��Y��+�UnM7�r.�Y���n��U��������L�^?-���,�q}��h��|�G���_�{/���,�o��|{O}��>�rņ���'�����g�_��}c�������=H��g�]Ɵ|�iw�Kf��Q���qK�/��.���K���cL4��#I��g�e�gq�NJ�I?������Q��b�҉uT�X�V���2^Zm��/�L1K��%,�d���-�e��\]�x^)'�GkM�Z:�{��B���s��Ě}�u�o󧗄�)%��]�������ǜ:۫���2P�}\	� ����H��C친����r@�0��0���ܥ%��xňϲ\LQΗT�_RjY/��#�(jݫ�'����^�K�������v_Z)�w|	�m�t����婨����=��դ�C
���	���i�;�%���cs�x�7�G��|�����\);�gҟ6䟷r�^��u�^����f~#��]����!�����d�J�� ��_�W'Ʊ���q|p�2s�]qA�+Yz0��6�/�Ձ8b��
!`|��b�ne)����/��8������~`t]_q�N��|��a8��Z�����w�O����zz��	����sJLO�K���#�nI=v�K�K�@�q��>'>K���0�RNr�K1�lǆrJ��SA��x��z&9�t�����;Vd#�n�Gy�ډ��8/�N�*�T�y��\F�b.��Ūo�\�f�y�K���}`;��I,�*��7�����^Zd8i8�y�L����d(�B,r<��,�#����!���_Z7��{z�}�UTD{�r���ט�w�"���Vak2BN�o��$������XRiX���[�=��q��G2�{�{w��ʹK=`E#�t��V�<����kHi6�{Y<4.ÓL�\����z@V5�p��`�d�q�!�,CFl2��.F��(�!#B����S�m٣�=�Y'��KF
짜t��Q�k���Guwb�������w�;#p�&���9I�a�6��!�'~�`7��<ꓰrĺ0��z9/����/�����β_�;�5JI�u���r%&�g�b��2�\\��J��u�J:���%�7b��nt�,X�Ikb]yɢv[Z����p���I��zB�//+��|�XӋ��~C{��eϏ~'8Y>�?Y9��_�i@���Ə�J\�˾hǡn���B��2�g�[d�,c�3�lG2�Q��Bx~�EFK����������D��E̩?!�"�;�?G�K���E��bC9�&�<^eV��rxn����^*�EU�Ub\�_+��.������~�t���XB��(�q�rn��ъ�Nl��OZ�/LU���x��f�ܗI:��/�'I'"=���2�lx���g�>����Z�?�9e?�i�O,Te�����L��[B�b�:�[.�/,�l�Q�&�C;x��OI����?>���6�4/%�X��}.��w�_���r�u���߾w��?��u���O���|>��Ksb�~j	��`0��`0��`0��`0��`0�wî����e����/^���>Cw���˧�������'2~��"�v��>[�>:�Z�m��5� '��Gy���Z�>����܁_��e�����P1 �2���hEF�A���o�h'���N��B��Or�����7u���Cuq:�ȉ�d\&\�b#m��Z���uk�����H�.k�o�o�C���^��_��:xPG��B�Tߡo2Z��2�ԫ��!��x��(�P�AJ�P�֥\��U�w�/�W�F�zD�|�^�co�
G��;ϭ����ީ���%�A݋
G�Y-O��K�U7m��h	�'�0c�5�2P��'��:x�%i;H��+�E��� ��u���\W�㔻t���^���7���>��q�$99�0�>G��@>g�|��|*t3bL{�g�Õ���+�'P���A:9t�x�b7T/@$�!��L����^�'��I��C�9��[�T%�/�W��������v��>H>=y��8��=�KL�_JE��衼A݈��UY�[T_"�2�;���� #��k{u��_����eE,
�I�a�tz�GO'u0�=x���.����	���Ѩ{A�:ԉ���[�O{W����r���^G��Ҟ� ����[�<x�ԍ�L�c<�#�D�i���j�'���Q�N��2�.�� ����|��OWʩM�!]wAiQ�R�.��ǋv�I��y��C��A��c$��Eݔ w��n����m��O�S�dvC���+t��J�������K��q. ƟX�:
>ad?��dT$���t�|^�{����ס���q�������e|\߇��e_v���I�{�HX���t������z�
�GY�Pw!�T�n�㹞\�����A�z7A,Kg���,+��q~%�7��LU��������2��N���v� �?A�A�9��2@�|Y��]8ٮG<���p!�Ђq/�.$����9�ꝱ�P킾�Z��#��ɻ���ŢG��+�~O�p�0�PKoWһP>��GdݺC�BΦ��.�udE��-Q�R�HV�/���,�ROe�'*VB� g�> ��Yu3e5��
]W�X����(�9܇�y�ø�la�}��� �S��+�'�9<��,Wı#��񼍋��L����I�C�Rd�[Upt��V>�����{k��!yh�a�.��Su?�����R?G��KJ��1��/�=p�7�Z�߱}��iS�X���&gz���u����J�R�rֳ�<��3�Ϊ�}b?̻������� �ۭ�����~��p��zR�T��m������hw꣪���>����Qu�}T��`0��`0��=��_��B��ۯE��g��ϳ�9�[����İ�������`�]����O}�^����+x_��v���ex�A}s��Wv�����u���;�'k��~���W���|��������R�fI��\��8UJ��/��V����Y�%Ww��	�B|��O���������G�Z����w������7���_��?���q��u�gVx�ѯVK�V�O��b�~~'�t^�����.P��p\��y>A��i�p�xZsp�o1>���dq���6���Q]����|փ�@����{��.gD�Yx�+�1N
�����{|�vJ
'��P򣟊�_0nK*�D���u�~\�~~b�zט^���6�q3b��O��x�I�-�td��Y�y�OXR8��q��v��<�Y��#i��xQ�I���g9�F�i���0N��(Zn�����q�{�v͋e����oƝ���~�ϫ3N[�A��z\v�gN�@�qZ�<?s�{�g$Ƈ���Α�M]�����U�y���Ȳz*�\���8X����ا4���YA�����'��������x狕P�r�����}�vQJO7ɕq_d5G;�(騧�������v��]y�!��#~�U���o���ocv�����Y&���^�}B�j<㔯x���P�K<�x�/>���>�[G=o�9��a�ʸ&/�V��5����A�~u�-���_g���)�������"yj f2V���g��S����G=w�=���˸�k���9���y'������}.b����ށ�~�z?w]����6��%�"�|��^<~3�qO�Z���ϫ[�G    K��k�|S���_��7�e��9���1%]��*�\��p~q�'ΟR?�����t�M~Tw��)��Z����τ�n*� .D���7�g>�,�a)gxޓϜ�^��R���>�R������<D�O���o�w���<\q+O��KL'p�T�O��~��*ݏ%\OV���#��8�ø��T��K�=p~��Ęϗ/>��ϩ�9<�mWc�S�F�R� ��:ȋ�d���{����v�#R|�s�񈛪��6�'�S��k���7)�
њ��ϕXϕOm��xmG��{S�8�5�Nj9����L2T�)�����s�W�����6�2�{e�����̯�u����%Xa�_H�1����y^P����˕nGlč/���a�^�7�9ߧj?�=���MA�G�{ת<Æ�*���
�]]�Al������*����'�{���S�y2�_��ϥn2������s_�^�/xof\��|^��[U�#]x��CN|Ot�R<g�3n�c�7a�.�>T)�6�/;>^jY��Eߏ�[��k��X��P{�}K�����:Q��=�kC�|�u1�J�����~�=�'O}�U�Ӝ|�������<�K'�O?���2�4�����!�2�=��]�.�c��?'Ou�v �ӛ�q����0.|�~��k��Dj�{��ca=
�}���=���/��~'�,���z��I~�'J�#��f~�QwIj׳���*��f�����c��?�zDؿ�>C�E�uH�.�����I���� ��ڮ�BU��;��QԪ�O8+/�&[��<�8��~��u�V��p=$�َ�RO���^h���|}P/a��):^���t�8�[�D�P�:YJ7��5�߉yo��~�����B��aoJ���x^u��a�0�b^}�cb�?SJ-ˮ�磪��8���3��8,,�C~m�q����2��U�������/ �qW;P4?��NjY�k�%���Y���%q}u�ߏ�⮩�l3?�U�5X��^�6��i~�����ޜo�;-�\/�o|S?����x?Wf����z���7D��=x�|I��7�c?c�����>�ײ;�rԛ�M;��b-�|����57���ob���O���m������B{V���s��]�NE�}��L?=� �m���_>Y���O��!X���>��NT���l�w�z>�ޓ�<��9>?Y�ֲ��}���R=
�+r��z���@4�s��@'��u�ϋ.zb�s?:�PA�}����(�w�G���Y.X#���AX�ˎ!���5멊?����]��{>�x����9����o���i�u���_�>�_{��j�0���������U���������v<�s�y���b{_������u��d������t�~bwJ�ۭ>�[F�Sy��:�KGd��'�*�D�\��(s�~���Ə�z@??;�:��'��~+���`0��`��X>H̴�����ofw�h��4=��`0�������P����}�׸�ֽ>����RU�����~ݞ�?�KX��y>��4���[����O�^�?���3�N���+?�X��w�5��%�?��������Cyt�_�����xC}��}�SzDLj/����2�|�<F�����j���ڳ˿N�%��_�7�onꇮ�Qkج8]���G�L��CyQ`��q���9�-�S<�O��7!gE�9ӯY���O�����3�	SC����'S���+Zqq臦�o�g��V^���C�S�u�C���������w` �Ӻ�f�y�	�I�Ӎ񈃵x�KOd�.>��˿/���釾��knM��?��/���l���W���z�8~�ӯ�M��ɓ��>�����[�^�4{�:H�P}��ό�v2�Er�8��+�,���[�qc���V��S?���U���%�/��$U�q*��F,{��}h�f�9Q����2�q�+�}1�^����?�}*뱃�3�������o�k����_�t;γ�����_ȇJ�:[�.�0ۿ��~�C~��
8<�!w@��A�{��WK�[t�޷X���iC�~����������1�yј���YcQ�@�F�����ˋ����]�O���Y<����{�E�G}���u�/H���;�����G�Bk烷Y��ۥ��1��.>HP�4�!��ǩgv�H@��S�|�l��b�%偀WP��?�3�a�V�nUF��(�\6�ݚ�h��5��t+%�ƣ��>��ë�%槝���7^�*��F�ȑ���j����z��'<��XvG�a�&o�����s�eV��@��"R#���%����������{}��G����q��~�/�� �p)-�Wf���xP!x׺~���zG�IM�_�yQ��#j���Ny�eq��^��qq#�:/cV�s�I�w*o���
y1z��C�����O�u��+�_�9/+�2U���yٱ?*�o��5+�[zϨ�9>�kQpI��?��M7��K�K��޵�~>�����M'�R�O�$gs
�q�\�}�RS���v�$�q9�u�}ฐ\��_�����l/����^���lOڹ0����v �N<�a����;N�E�ċ�V^�O�oS��_�B�s��;R��y�� ��ۅ�:��x�O��g{-�H�,RwV��b�c�r~�}�Z7�~Cy����n�hw�ZB{Ⱥ�:.2��y_�O�9���\�..)؅̷"��z��:���r��v>5��<�*ys�ǉ똍� z��'۴[�=J�������_��Oc�����&VK��E���:�v|��`���P�s����|�~�'�����|~��*���<��n�!Ճ��2�醹�C9�~���S��|�ֵ�ܧ�S����s�/��@��ߕ_�񊧎��R��x�+^�0�D�|���~��K�?ϧ�x�O��X�l�4-���؞л����O�P���BM�)�I�k����?�W����7���}��ʿz�C��i�=˓��'u�w)��wa���>���v�_S�#������t;V�K?r!*o���=w}�C�C������
�h�c�e������s���>��X���8ԋ�����`0��}b������~�o��Q���h��w\��`0��`0��`0��`0|䡁�{A�a�Ts$�����<�O�|����Ym���b�n�/�ɟ\�A_�{���}N�f�/TՕ�>�������8�{���W;��)�O9�Ȏ��tf�S7z�H����\�|Zݩ�PU��վ�'��s���5���:9�}�y�R�J�!�����O��5>t�������W��)��[%_��q��{����B�35-�������;��o�S{��6P�ƻW<��|
��qK�G���/�G{ۻ�6y��"ΐ�ό�O���m>'�Z�y(1'������+��#�R��)K>Ho�|���-����\���<S�Ąc�8��F���R������ /D,���F�|o9��ݹ�x�!�x�N���,58X�:C�뉀v)��j\Q�ɕ�\H7�&�K,��'��:EQ,�KhTG���|�5C��}��]ڥ��/��ўb�JV>,�m<$���#�;�)-���W4%�16�W�}Ό�)���1��9�H���t�ޗ�M�֖q����j_�C��
��J?�"x�A��e�?����n�����#=��|\q�[K�p(��k�1_P��ݯ�{�{A�$��I��	�b�z�Ւ��R���y��,��쁔��<�=(�w�EG&��I�J���4���y>����N��ks�Ǹk��>��#l��Q��O��\�����+��N2�"e���u��s�/���y�A��qʑ�����K�;ơ��F���=���iJ��i'��죏8��u`<&Л����u]g4��[ۡ����o�/᫔霰��������#�¥J��zgv����	�rl,���B}���K?���i�Q�+��B�#BB��ǵ�ŝ�8Q>��	vGVg�NF_�}�QK]����l��֍���:(=���h�m�dX�v�߼k{�9�s��������%��_����+Կ9��d���2iE��o:�    Ūu����"L�%?��dU�"��Ӯ�}�wj=e�9i��{��\l�(�׺�`~�-����?�y���"�W�~�Չoɍ�7B¸���J��u�WG}�]����jP����/�-�gϚq�Śx���R]��Mu��q��Y7��: 6?�Gb��;�
�b��q���13S'.̸ݕ����]�:0�=+I�W�ò�촋vVJ����8��DD�xl3.�����2p�и�P�b�\X���ԡ�BH�ɯ�M��,�-�7��-Au@
v����i|t����sX�8M��ʺo뚎��
u��F�x���B;dD,�����<�d�u�<�y�I��P�M�!R��A���ᩃ�C���`?���h�Ph��ou���.�!��A�V�IF�5u���&��Ս����G�O�Q�"��d��Bg��l'_�{$���i<������q0{��_m�Q���;�7��nԋ��;L@Н�.��J�+��B����>��v�������`0��`0~�%��`�Ih{-���f2��^������Cv��w�����g�4��{?�\�~c�8�n�����^]��+�ۧ�ٽ�g�������O���V����[t������/����Nߏ���~�+�Ɏ&C�|��8e=����X�-D)���{R�mf���u��e�����O��7 ��݌G�$'�wu�8;o�^��r������ی%E���|O/_�^��.�ᛐzp`+U��g�s���_��xS�'U7\/_�/P>3nZk-��V�~�=���b42�J�|D�*��q���2��θT�ء<���~|�{]D:���ʌ��i� k��S���`�Wh?��v+�>�5��O�`������.�~����bE.�Ņ��6������F?�MvJ�h��j���W�ƃ�3�/�a1���>��(��w1^��׸bڋ��`׮�_V�?#��q}��!��o�,�
�c�Y)���7*qx��#��xZ�Ƌ4��`0��`0Ä�ϲ����`0��`0�[��!����)��?(�9.��<O�k������^�96�/�&g������5���r,���ZY>�E~Oݯ��Ju��5�f)_౼��zJ���z�=w4v���r�������/�^`�C�|wHMɻk��P������ի��,u���Sf���#e���-�޺�ot0�!������ҏ4N�Ζ7���绁? ��ng=
u@���5�o�z��2xQ��ȋ"����r��O�v	��'����Y�rQsoW#OJ�#���zN~�0+rT]N�I3����/9�/ڟɷXz�+�˙ʧ��Gȯ�a��2N����.�x�<Y�wѿ��ϹHͤ�T�)-�;H�UWs�g��uv�>�'7���.���*�B�Tr�u�_�a�ƍ�B�q��&�E�������ٞyr'x'�)s��J]��J~J��_����ԛ�����š��x?�4�v,��f�e���F��/ElɎ�������	�KRe{�y�7�{���1�uC��s�r�u�۽�r?��{�t(�~9_�]k��;�X���Y��7��qU*��6�qq�^��&��"�	��e^*��@;�a�k�O�8IE���W���A^h�38.9ÁMA�bSڻ�x�<���ٮ��^i�`Pp\Բj�����/�sC�\8�T^X�b!7���U�WFO�=�����r�����z��J;\�b�z�����]O0D8�7�Ì01�:׾��O2�#,U�c~䋺�l!�;���kE\I��~�h��
���˓WK�~�+$�H����]������C�� �}�:�'r�x�`9��.�|�=I���׍�z ���5
$�'�]���Y�=�j����U�I��~W��ԣ�����F��˯����0|����F��ve�s����(\_l�A�/���.��a^��z'����u{�'���o����Q�k���rT�iQ���G�w�0
�����|�?��D*ǽ�����Ʃ+��ڷ���Rߨ�\��Nj��eg����K�0ny�ʷόk��C�#�{+Z���w���s��OX9,@OM��6�a�1Ki��T`�d�Q}��oȇ��B�6��l��x_�����Q�7}(��L{x1�� ��c�9�'xW{�uT��-�)ٞ��W���y��������5\�~>�ÚGَی�x?���.�j6��<��%���zSGV��fK��3�6��/�I}|�Pd�����>�v-�ع����&��E�������|
�>'�v��\����D�鿮k����c����:�|����ύ魤��m��?�>L�s�婃t�O�����-���h��'����G��~5�6��`0��`0|	�ϲ����kt�&�s;�ю��h0��`x{�8X���sǺ,��`0~������g��sO�DC�2���>���K;�\z5�Cf<�T�6"? ɿ�������lC�S��]���g�5��1�����ӯ:��5�Ńϔ�N���r5��G��]���j�,����}����_B�qƃoI>�I�S/^���N�Ad����B�fJ��kZ��r�p�E�+���?o�|�&S�|�<��U>�'OQ>��|��y������œ�(~H'��x��Ս��|S�<�%���/�?��s�ʯ<�jZw`�w��A�x>`!�#����=W��f��Sy~vE�'ߜ<>�]f����0��|#G��S^�|K��O�;y��;���o#�)��.~�5�e(/xJ��ה?uT�;�|�
��{� ]� �� ���IS/�U�;�ϴty�>:�n��$� �:��.쬆��3�E�M��'���i���+�F��YN|�(�N�������u�it�v|�Ύ�`0��`0ï¯�۶����o�<�7fG;�����`0o?k�V���[ړ�G|��=�}1�,��5F��o�g<����=�#�B�#�Oe�=�4�__��߉����h܂:��տP���_�<*�	ǝ�^���/�ċ��7��H�&��"_������q�ԙW�:?G�H�����ѳ�O����6�{�*o����or�s��q��7	6
�=8�\��G���P���*�������Jk��f�.���]6�Q5���o$O^p�xfrw���{u�����y��S�g���O����3΋�Q��6�51.Sd7g\D�aܔV2�s��x'e�q��J~%��=s|��)�,��Mh<𷔿�xY��}3�
�=�:�82�A����� �,ȟў0��Ɲb\���X�v��U��Ҹs+� �4����2��z�:��i����k�1�ߣ��/�x`��"׃�&��	������9�/ȸ[�6�j�g�|_*"d���m���R�k�O�|�N3��`�-��!���i~I���w�߁E2����q
�&`� >��3����Eʩ��9�>��C���l'	����oh�<��o!��S�~�9N�����ӱ�]��w�؏IG�-\��w��q~_k���g��s�FL�]pU�)s����.��>b�P�#��l�2���	�x:h�"��l��]+�5.��Gyi���g,I�w�1<X����M,o��-یo�����7��1�Ng�k�|��P~���{��Y�����}a�1�s��[Z�qA�G3i)������qKu��kW;ޏ��N��.5�<C�Hw:�N�}��sX��0�_���N}�]���G��x��u_"g����s��Su(��ĸwMu-�X�'�S�vq�p}�xuk���J��Vyas_ ����j������@d����g�:؏ܱa�4��K'��5޺�L�u���S�!�7��u��b=������'/������C���x8�W���}�����"�8�!.D8����-������e94�/y���G��:ӏ����(�Ɍ_P���Ay��49ٌ1>�سd�+���q�    �x�C#�g ֨�s��x�d0��`0���`���bv����`0��`0��`0��`0��`0~�?��h���_p��]�_+ί�h��w|+�l�Fg�`0�����[�g��g0�3������fwl�e0���1?o���>�`x�xkv��;������x����Z�_��_�S�Ə�����q�߆�ʯ�[�;��R\�C|��8X���z|�!~�f�_
�:������q�5�<�_q�;"�\����'�!5��Z���}�cQ��������g<�e�£<�u��G9��.���8_�g?�r,g��6^���~$���nd���X��#�����~�ڿ����l7Ŀ���t+��Ͻ܍�e<l�	[�g�5�c��E��G{��9WP�Bb��y�z�8�u�l؟�k�O�:.:"���ˌw�v��W��Ή����c�ӈ��`z�i|EƧ��q��Kꌓ��˳3�a�tk���y�k:�S3���B�3#�C���O馍q �G{��<�-��d|�^+�/}C�C�r��;gyZc���u�Vv2n����	]�C�U4"�禽�n�#N����9�2:�^�;����;o��9���i8���Nq�^�9.*?8n�7s����MǏ�8��N)�GJJ��>x�؉0�����)�ʀ���C�����5vM��	Qٛڇ�r j*��) ������Y�7�����?�>��p��~���Cz!*�1>uh�����J�}����2�k�N�qRa/����V�u�ہ�=۳���^�����ޯ��N���-��_��fwl��X��W�-���x�t�q���Kfw����ʸ�n�.����d��n�]w���x��b9�������<R�y>/�s�����;�����>l�ױ��>�Ci��ޯ��'����̏�݋��3r볝�7y�Q^�[���oW9��Un��]H���)ޚݱ���a�#�	fw���[�;��2�?ޚݱ�����av�`0�l�5�c�,������`��xkv��Y����o��,�U���Y��hG;�}�k<����`0��`0��`0��`0��`0��`0��v�?������������/�y�-�%'w��������g�#�-��s��݅��������?��������˿���*V��E��ǝn���0S��4��k@XI�����k��������Vj�b}�o�p9�C��t��o�8������P�W�},����M��e�O>Ɛ���q#��{i'�������
����3�@�5�����2���V����3��|2�|b�k�Cý=�x����:�\}�|��O�BX�ư�w�?˭�0��W��ͷ�ajl�a��#�B+L�kz�wJ����7~���G�W��,w@���V����|{O}��>�㥄���^��U؉{9���S��7���*~���M>��;g�%�{�(��׸����~�y�6�{���#�t$���̸l�,N�I)�"�س��M��B�W:q���k��
1Y�79�Y�g�YL-UF����p9m�%WW7�W
�;���)�t��Ӆr���0W���2��O/	�SJ$	��a���91��?�@eخ��]�#n꟏"�W��r~�K�:"������|R��u���#>�r1E9_RqXI�]�x�OF���K������+��!��B/��ݗV���_Bg���0Y�q�X��z��m��N^�Rh�O~O8^���L��Q/)V��������>zY�G�����\);�gҟ6䟷r�^��u�^�Ǩ+|��� ��\(2�.L�I��0�ep|�pbKj���.3��$���c��a��ZReq�D�B��
=Ų��R$I�_��q^; ��s`T*A�W\w�S�$߸ǆqN�C��V0>����]ƻ�|9�}}��hwB�=�z����Rc��Ȱ[R��R��F;�d6�ω��j�$�����'�RL:۱�������ƛ��3����ƽ��Ǌl�ލ�(O�@;Q6���_��j81���Ȇ@|�×�9�E�a��g����ʟ�b`��b�`��5��G�B'Ǩ�%�D��K;#���TD��"��{�=��a=�v�K�&�cvbOO�Ob>���h�^ڝ� 5c�i(b(0�l���&#�d�vO2�j��/=�%1��pٷx{n#�`ҏdz���i�8,z��F��&#a5���
R��^��+��ܹ�����jJ�v��ɸ�:C��Qϛ�簋Q:<�}Ȉ��Bj����u[��o�vC�	��钑�)']7u���e���QFƝ؇�v9�m�c����\��(�zN�oX�M{zH���/�Mi4��$��.!�^��:4���?�>���{����q�R�n2�\�	�꙱ر��_�� ש�R�}������fs��X-�]>�kҚXW^��ݖ�q�Gl7ܧ,w󃬞P���
-3�{-�����߂���G����Q����ק	3<g?2+q�/����UΫU��kȬ���x(����L&ۑL{�d��߿F����)�r{�$����x=ѿks�OH�����Q�R�dgg8�aʥ�ǫ�*�S�Ms��c��K庨�J��KbE6�%1���ϔ.��K{�=�<q?Z���~MÙ�I������sh���r_&�8�h�T�I}=�igG^�����Z�?�9e?�i�O,Te����FK�-!]�^�-���M�ԙ����;�a.Iڧ?���!��|�`�h_)�>Oӻޯ��kh9�:m}�o�#l��u?��u���O���|>��Ksb�~j	��`0��`0��`0��`0��`0�wî����e����/^���>Cw���˧�������'2~��"�v��>[�>:�Z�m��5� '��Gy���Z�>����܁_��e�����P1 �2���hEF�A���o�h'���N��B��Or�����7u���Cuq:�ȉ�d\&\�b#m��Z���uk�����H�.k�o�o�C���^��_��:xPG��B�Tߡo2Z��2�ԫ��!��x��(�P�AJ�P�֥\��U�w�/�W�F�zD�|�^�co�
G��;ϭ����ީ���%�A݋
G�Y-O��K�U7m��h	�'�0c�5�2P��'��:x�%i;H��+�E��� ��u���\W�㔻t���^���7���>��q�$99�0�>G��@>g�|��|*t3bL{�g�Õ���+�'P���A:9t�x�b7T/@$�!��L����^�'��I��C�9��[�T%�/�W��������v��>H>=y��8��=�KL�_JE��衼A݈��UY�[T_"�2�;���� #��k{u��_����eE,
�I�a�tz�GO'u0�=x���.����	���Ѩ{A�:ԉ���[�O{W����r���^G��Ҟ� ����[�<x�ԍ�L�c<�#�D�i���j�'���Q�N��2�.�� ����|��OWʩM�!]wAiQ�R�.��ǋv�I��y��C��A��c$��Eݔ w��n����m��O�S�dvC���+t��J�������K��q. ƟX�:
>ad?��dT$���t�|^�{����ס���q�������e|\߇��e_v���I�{�HX���t������z�
�GY�Pw!�T�n�㹞\�����A�z7A,Kg���,+��q~%�7��LU��������2��N���v� �?A�A�9��2@�|Y��]8ٮG<���p!�Ђq/�.$����9�ꝱ�P킾�Z��#��ɻ���ŢG��+�~O�p�0�PKoWһP>��GdݺC�BΦ��.�udE��-Q�R�HV�/���,�ROe�'*VB� g�> ��Yu3e5��
]W�X����(�9܇�y�ø�la�}��� �S��+�'�9<��,Wı#��񼍋��L����I�C�Rd�[Upt��V>�����{k��!yh�a�.��Su?�����    R?G��KJ��1��/�=p�7�Z�߱}��iS�X���&gz���u����J�R�rֳ�<��3�Ϊ�}b?̻������� �ۭ�����~��p��zR�T��m������hw꣪���>����Qu�}T��`0��`0��=��_��B��ۯE��g��ϳ�9�[����İ�������`�]����O}�^����+x_��v���ex�A}s��Wv�����u���;�'k��~���W���|��������R�fI��\��8UJ��/��V����Y�%Ww��	�B|��O���������G�Z����w������7���_��?���q��u�gVx�ѯVK�V�O��b�~~'�t^�����.P��p\��y>A��i�p�xZsp�o1>���dq���6���Q]����|փ�@����{��.gD�Yx�+�1N
�����{|�vJ
'��P򣟊�_0nK*�D���u�~\�~~b�zט^���6�q3b��O��x�I�-�td��Y�y�OXR8��q��v��<�Y��#i��xQ�I���g9�F�i���0N��(Zn�����q�{�v͋e����oƝ���~�ϫ3N[�A��z\v�gN�@�qZ�<?s�{�g$Ƈ���Α�M]�����U�y���Ȳz*�\���8X����ا4���YA�����'��������x狕P�r�����}�vQJO7ɕq_d5G;�(騧�������v��]y�!��#~�U���o���ocv�����Y&���^�}B�j<㔯x���P�K<�x�/>���>�[G=o�9��a�ʸ&/�V��5����A�~u�-���_g���)�������"yj f2V���g��S����G=w�=���˸�k���9���y'������}.b����ށ�~�z?w]����6��%�"�|��^<~3�qO�Z���ϫ[�GK��k�|S���_��7�e��9���1%]��*�\��p~q�'ΟR?�����t�M~Tw��)��Z����τ�n*� .D���7�g>�,�a)gxޓϜ�^��R���>�R������<D�O���o�w���<\q+O��KL'p�T�O��~��*ݏ%\OV���#��8�ø��T��K�=p~��Ęϗ/>��ϩ�9<�mWc�S�F�R� ��:ȋ�d���{����v�#R|�s�񈛪��6�'�S��k���7)�
њ��ϕXϕOm��xmG��{S�8�5�Nj9����L2T�)�����s�W�����6�2�{e�����̯�u����%Xa�_H�1����y^P����˕nGlč/���a�^�7�9ߧj?�=���MA�G�{ת<Æ�*���
�]]�Al������*����'�{���S�y2�_��ϥn2������s_�^�/xof\��|^��[U�#]x��CN|Ot�R<g�3n�c�7a�.�>T)�6�/;>^jY��Eߏ�[��k��X��P{�}K�����:Q��=�kC�|�u1�J�����~�=�'O}�U�Ӝ|�������<�K'�O?���2�4�����!�2�=��]�.�c��?'Ou�v �ӛ�q����0.|�~��k��Dj�{��ca=
�}���=���/��~'�,���z��I~�'J�#��f~�QwIj׳���*��f�����c��?�zDؿ�>C�E�uH�.�����I���� ��ڮ�BU��;��QԪ�O8+/�&[��<�8��~��u�V��p=$�َ�RO���^h���|}P/a��):^���t�8�[�D�P�:YJ7��5�߉yo��~�����B��aoJ���x^u��a�0�b^}�cb�?SJ-ˮ�磪��8���3��8,,�C~m�q����2��U�������/ �qW;P4?��NjY�k�%���Y���%q}u�ߏ�⮩�l3?�U�5X��^�6��i~�����ޜo�;-�\/�o|S?����x?Wf����z���7D��=x�|I��7�c?c�����>�ײ;�rԛ�M;��b-�|����57���ob���O���m������B{V���s��]�NE�}��L?=� �m���_>Y���O��!X���>��NT���l�w�z>�ޓ�<��9>?Y�ֲ��}���R=
�+r��z���@4�s��@'��u�ϋ.zb�s?:�PA�}����(�w�G���Y.X#���AX�ˎ!���5멊?����]��{>�x����9����o���i�u���_�>�_{��j�0���������U���������v<�s�y���b{_������u��d������t�~bwJ�ۭ>�[F�Sy��:�KGd��'�*�D�\��(s�~���Ə�z@??;�:��'��~+���`0��`��X>H̴�����ofw�h��4=��`0�������P����}�׸�ֽ>����RU�����~ݞ�?�KX��y>��4���[����O�^�?���3�N���+?�X��w�5��%�?��������Cyt�_�����xC}��}�SzDLj/����2�|�<F�����j���ڳ˿N�%��_�7�onꇮ�Qkج8]���G�L��CyQ`��q���9�-�S<�O��7!gE�9ӯY���O�����3�	SC����'S���+Zqq臦�o�g��V^���C�S�u�C���������w` �Ӻ�f�y�	�I�Ӎ񈃵x�KOd�.>��˿/���釾��knM��?��/���l���W���z�8~�ӯ�M��ɓ��>�����[�^�4{�:H�P}��ό�v2�Er�8��+�,���[�qc���V��S?���U���%�/��$U�q*��F,{��}h�f�9Q����2�q�+�}1�^����?�}*뱃�3�������o�k����_�t;γ�����_ȇJ�:[�.�0ۿ��~�C~��
8<�!w@��A�{��WK�[t�޷X���iC�~����������1�yј���YcQ�@�F�����ˋ����]�O���Y<����{�E�G}���u�/H���;�����G�Bk烷Y��ۥ��1��.>HP�4�!��ǩgv�H@��S�|�l��b�%偀WP��?�3�a�V�nUF��(�\6�ݚ�h��5��t+%�ƣ��>��ë�%槝���7^�*��F�ȑ���j����z��'<��XvG�a�&o�����s�eV��@��"R#���%����������{}��G����q��~�/�� �p)-�Wf���xP!x׺~���zG�IM�_�yQ��#j���Ny�eq��^��qq#�:/cV�s�I�w*o���
y1z��C�����O�u��+�_�9/+�2U���yٱ?*�o��5+�[zϨ�9>�kQpI��?��M7��K�K��޵�~>�����M'�R�O�$gs
�q�\�}�RS���v�$�q9�u�}ฐ\��_�����l/����^���lOڹ0����v �N<�a����;N�E�ċ�V^�O�oS��_�B�s��;R��y�� ��ۅ�:��x�O��g{-�H�,RwV��b�c�r~�}�Z7�~Cy����n�hw�ZB{Ⱥ�:.2��y_�O�9���\�..)؅̷"��z��:���r��v>5��<�*ys�ǉ똍� z��'۴[�=J�������_��Oc�����&VK��E���:�v|��`���P�s����|�~�'�����|~��*���<��n�!Ճ��2�醹�C9�~���S��|�ֵ�ܧ�S����s�/��@��ߕ_�񊧎��R��x�+^�0�D�|���~��K�?ϧ�x�O��X�l�4-���؞л����O�P���BM�)�I�k����?�W����7���}��ʿz�C��i�=˓��'u�w)��wa���>���v�_S�#������t;V�K?r!*o���=w}�C�C������
�h�c�e������s���>��X���8ԋ�����`0    ��}b������~�o��Q���h��w\��`0��`0��`0��`0|䡁�{A�a�Ts$�����<�O�|����Ym���b�n�/�ɟ\�A_�{���}N�f�/TՕ�>�������8�{���W;��)�O9�Ȏ��tf�S7z�H����\�|Zݩ�PU��վ�'��s���5���:9�}�y�R�J�!�����O��5>t�������W��)��[%_��q��{����B�35-�������;��o�S{��6P�ƻW<��|
��qK�G���/�G{ۻ�6y��"ΐ�ό�O���m>'�Z�y(1'������+��#�R��)K>Ho�|���-����\���<S�Ąc�8��F���R������ /D,���F�|o9��ݹ�x�!�x�N���,58X�:C�뉀v)��j\Q�ɕ�\H7�&�K,��'��:EQ,�KhTG���|�5C��}��]ڥ��/��ўb�JV>,�m<$���#�;�)-���W4%�16�W�}Ό�)���1��9�H���t�ޗ�M�֖q����j_�C��
��J?�"x�A��e�?����n�����#=��|\q�[K�p(��k�1_P��ݯ�{�{A�$��I��	�b�z�Ւ��R���y��,��쁔��<�=(�w�EG&��I�J���4���y>����N��ks�Ǹk��>��#l��Q��O��\�����+��N2�"e���u��s�/���y�A��qʑ�����K�;ơ��F���=���iJ��i'��죏8��u`<&Л����u]g4��[ۡ����o�/᫔霰��������#�¥J��zgv����	�rl,���B}���K?���i�Q�+��B�#BB��ǵ�ŝ�8Q>��	vGVg�NF_�}�QK]����l��֍���:(=���h�m�dX�v�߼k{�9�s��������%��_����+Կ9��d���2iE��o:�Ūu����"L�%?��dU�"��Ӯ�}�wj=e�9i��{��\l�(�׺�`~�-����?�y���"�W�~�Չoɍ�7B¸���J��u�WG}�]����jP����/�-�gϚq�Śx���R]��Mu��q��Y7��: 6?�Gb��;�
�b��q���13S'.̸ݕ����]�:0�=+I�W�ò�촋vVJ����8��DD�xl3.�����2p�и�P�b�\X���ԡ�BH�ɯ�M��,�-�7��-Au@
v����i|t����sX�8M��ʺo뚎��
u��F�x���B;dD,�����<�d�u�<�y�I��P�M�!R��A���ᩃ�C���`?���h�Ph��ou���.�!��A�V�IF�5u���&��Ս����G�O�Q�"��d��Bg��l'_�{$���i<������q0{��_m�Q���;�7��nԋ��;L@Н�.��J�+��B����>��v�������`0��`0~�%��`�Ih{-���f2��^������Cv��w�����g�4��{?�\�~c�8�n�����^]��+�ۧ�ٽ�g�������O���V����[t������/����Nߏ���~�+�Ɏ&C�|��8e=����X�-D)���{R�mf���u��e�����O��7 ��݌G�$'�wu�8;o�^��r������ی%E���|O/_�^��.�ᛐzp`+U��g�s���_��xS�'U7\/_�/P>3nZk-��V�~�=���b42�J�|D�*��q���2��θT�ء<���~|�{]D:���ʌ��i� k��S���`�Wh?��v+�>�5��O�`������.�~����bE.�Ņ��6������F?�MvJ�h��j���W�ƃ�3�/�a1���>��(��w1^��׸bڋ��`׮�_V�?#��q}��!��o�,�
�c�Y)���7*qx��#��xZ�Ƌ4��`0��`0Ä�ϲ����`0��`0�[��!����)��?(�9.��<O�k������^�96�/�&g������5���r,���ZY>�E~Oݯ��Ju��5�f)_౼��zJ���z�=w4v���r�������/�^`�C�|wHMɻk��P������ի��,u���Sf���#e���-�޺�ot0�!������ҏ4N�Ζ7���绁? ��ng=
u@���5�o�z��2xQ��ȋ"����r��O�v	��'����Y�rQsoW#OJ�#���zN~�0+rT]N�I3����/9�/ڟɷXz�+�˙ʧ��Gȯ�a��2N����.�x�<Y�wѿ��ϹHͤ�T�)-�;H�UWs�g��uv�>�'7���.���*�B�Tr�u�_�a�ƍ�B�q��&�E�������ٞyr'x'�)s��J]��J~J��_����ԛ�����š��x?�4�v,��f�e���F��/ElɎ�������	�KRe{�y�7�{���1�uC��s�r�u�۽�r?��{�t(�~9_�]k��;�X���Y��7��qU*��6�qq�^��&��"�	��e^*��@;�a�k�O�8IE���W���A^h�38.9ÁMA�bSڻ�x�<���ٮ��^i�`Pp\Բj�����/�sC�\8�T^X�b!7���U�WFO�=�����r�����z��J;\�b�z�����]O0D8�7�Ì01�:׾��O2�#,U�c~䋺�l!�;���kE\I��~�h��
���˓WK�~�+$�H����]������C�� �}�:�'r�x�`9��.�|�=I���׍�z ���5
$�'�]���Y�=�j����U�I��~W��ԣ�����F��˯����0|����F��ve�s����(\_l�A�/���.��a^��z'����u{�'���o����Q�k���rT�iQ���G�w�0
�����|�?��D*ǽ�����Ʃ+��ڷ���Rߨ�\��Nj��eg����K�0ny�ʷόk��C�#�{+Z���w���s��OX9,@OM��6�a�1Ki��T`�d�Q}��oȇ��B�6��l��x_�����Q�7}(��L{x1�� ��c�9�'xW{�uT��-�)ٞ��W���y��������5\�~>�ÚGَی�x?���.�j6��<��%���zSGV��fK��3�6��/�I}|�Pd�����>�v-�ع����&��E�������|
�>'�v��\����D�鿮k����c����:�|����ύ魤��m��?�>L�s�婃t�O�����-���h��'����G��~5�6��`0��`0|	�ϲ����kt�&�s;�ю��h0��`x{�8X���sǺ,��`0~������g��sO�DC�2���>���K;�\z5�Cf<�T�6"? ɿ�������lC�S��]���g�5��1�����ӯ:��5�Ńϔ�N���r5��G��]���j�,����}����_B�qƃoI>�I�S/^���N�Ad����B�fJ��kZ��r�p�E�+���?o�|�&S�|�<��U>�'OQ>��|��y������œ�(~H'��x��Ս��|S�<�%���/�?��s�ʯ<�jZw`�w��A�x>`!�#����=W��f��Sy~vE�'ߜ<>�]f����0��|#G��S^�|K��O�;y��;���o#�)��.~�5�e(/xJ��ה?uT�;�|�
��{� ]� �� ���IS/�U�;�ϴty�>:�n��$� �:��.쬆��3�E�M��'���i���+�F��YN|�(�N�������u�it�v|�Ύ�`0��`0ï¯�۶����o�<�7fG;�����`0o?k�V���[ړ�G|��=�}1�,��5F��o�g<���    �=�#�B�#�Oe�=�4�__��߉����h܂:��տP���_�<*�	ǝ�^���/�ċ��7��H�&��"_������q�ԙW�:?G�H�����ѳ�O����6�{�*o����or�s��q��7	6
�=8�\��G���P���*�������Jk��f�.���]6�Q5���o$O^p�xfrw���{u�����y��S�g���O����3΋�Q��6�51.Sd7g\D�aܔV2�s��x'e�q��J~%��=s|��)�,��Mh<𷔿�xY��}3�
�=�:�82�A����� �,ȟў0��Ɲb\���X�v��U��Ҹs+� �4����2��z�:��i����k�1�ߣ��/�x`��"׃�&��	������9�/ȸ[�6�j�g�|_*"d���m���R�k�O�|�N3��`�-��!���i~I���w�߁E2����q
�&`� >��3����E�����$I��s�+�٤�l�����̭/�^�҇y��"f�{V����)S��TeS�
�s*�z��Wy?T.��QN���o(O��V�o�͈�Te^z��Q�9��s9�Q�q�����`��u`��|���Z���#�$�ϡȘD���)s�����W�a/���~��4���R��H9�V��%�2Yy�G�?��81�����}��3҃5/#������o�&�U������{��;���M�q�CC�˨��hߛ�g��v����c�s��[F������L�#%�􈫃�C��[
�)ޯ]�x?Z�8M}X��,���#�餝j�0�װ�%a����������;y`��K�,�[�>�8�~j
�6���i^���Dg*X͡��S���խ}��q��QY����L*v����/�; _�f����v�ƕ:��a��_��9y�d���K�t_�v����^m�����،N�n��;^ϸ4ƕ�g?���~�o�L�}�ۡ��Q�#Nw�Ǵ9�2��^�C�7+��}�_Rg����<�ҚL>���g���yB4LN6c�g}�l{e0|��,�S�F��@�Q��@���`0��`0��`��j^1;�ю?�h0��`0��`0��`0��`0�ڟɎv����/��|Wޯ��kG;��������4o,��^�l��G������xoz��Y�Ǉ�����xoz��Y���{�;f��ww��<����������O�?s^���y�߇�ʯ�{�;��R\��W�������7�W�7�M~)��8�k����5�<�_<��9��y��~����k����y�X�HS���r�|�ɇ��Yx�G��^�/�t�]��M9_��<�vlg��6^���y$���Rn$���-�q���"�q��q�w��k�<��q��`���[�W��n�/������g�7�c��"��c<Dz�
�VH�������m���?mW�OH́ƿy}�|����P�BG�;'�'>�O�����`y�)�"���&5+o�#��N�T\�؞���I˭����ծ�\�f����'#�CVy�L�F��1q�g�Eߜ�G�����7�r�����i������Vv���C������*ʇ�����[�����|;'/���@���1�����)O�C�ۧ�⦾S.*?(7��͔�TU�T~�򔊝R�GJI�i<��D�zf{�zʡ�PpS>t�7\W��ص|�'��7�� k*����*�a���w���Y?~����rξ�z�.L�L���F~���[����B�V�>��e�k�N�<�З����(�:���Ϟ�Y����/W�����W�����{��������k_�j�>a��>I�������du�}��GU���������s�U����(s��b��v��%M�3�u�p�|^�>+��w,���}��c��}��l�}^�OZ��30?�w/ֻN���8�7y�(����������*�~�.���M�y��H�G������xoz��Y���{�;f��w�[���g�w�[���gK�ߋ�Y�j�]��Y��hG;�}�K���`0��`0��`0��`0��`0��`0���Ǳ���c���q��<�u���R������-���s:���=�QBK��p�w�����������������?����_��jW�J�"���o���)���@j�5�Eʻ_RG�5�Q|��3y��w+��z����o�&n|9�����t�[�*�8����ⷌx��K�G�9�?�� �e�O>Ɛ���q#��{i'�Nn��E��;�Bfy���A�_s�+^�q�*yd>�GX|o��'��z2�|b�5ܡ|oO�>�<�y��#η��.�4�"���l���xV\_�V7�v����<y��G!����:=�;�ga|���_X����=�����<`EZ��ڷ��7��� �/-|=��~��x'���c|��/}o��غ/�U�����&�vꝳĒ9=k�y�k��A�5�o:/�F~�1Q}Ē�$�;���#��I9)�R�� }6����b�҉U�[�z+�td�or�Y�g�Y
L-U���p@�BN[�������J��o|Nb7��=�t��b@��+�`=9[����`/�e��]��R^���%�X���EP�����:����|�r�>���^� ���I�����x�+F|s1E9_Jq����.]<��'��v�rɷ�7��~�R7��-��/�}���]�%t�u�dEy�=�<�ۼ�����Rh�O~O8^���L���/iV��������>�.�ݵ��J�a=������������2?F]�]���gWp�@>D�.,�IT��C~��Nȱ̧F9>�vY�T�� �,3�d���UGL�_!�W�)��֖"UH�^��(W�%⼔s -�HGP��vG8�O�{l��p�*�/�����w�w�'�rֻ}���wB�>�z����Rc�|d�-��})zi�h"���sⳌZ*	r�r��DY�J�86���/�-_@�D^�$���{i���H��Q���z�l"���_��j8�ww3���z�} �(=���l�衁��q@��h�U4�o�W��<�
�i�K��a�q���T�A_�f��Oe|��G�2�	㘝�ӓ�X�XQ���A��r��E֟���:�DBN�oy��y��8�D��o���F�`2�dy��{w��f�%�E�hd�n"i����0��5�^������;��{�Ī)�ۭ=$rG;C����M�s��(�>D"�^H���h�e����7�N�N�H
����n�����z���H�N�C�~��ö�!7�3�7�b�sR~��6��!�'~��7e�<��`9�.!�_΋����O�O��,v�}�z�!�h%��!�ەX����h��G��T�Tx_3h�l.q���r��g��&�	���z[F�Aq�p���I�b=�ݗ-��}-�����߂� ���	NyxE�v�C���4 a����#��|��8ԭr]]����\CVu0��H�ʧɕL�#��(���߿Fi�c��B�=w�]��T^O��Z�H^BIE�wh����%;�8��7�K/�W�U����,����K�]Tծ����h�zIԴǾF�3����EBG�k�'�G+yȽ�ה�OZ�/LU��Cyӷ�}�����~�:ʓ�z�ig�#�`$�}�����yN�f����XaiM ]jo	����o���0X6�Rg�'��w`�\��O���!��m��9�Wڟ�����������N�N[�����m6[���.�ѰDο�~�����D��i��`0��`0��`0��`0��`0�_�]��<�ˌo<��y��C���el�>�5n��x��aď�^D�������H-�m��=�NFq�e�$���)��H�~������!QFa_آC�5� �2����ъH�A��߄���L�����0�I.c�v?��������    �yq:�ȉ�D.�k�1l��Z�Ʊ;歩��G2�6�F�v��������vqPGe���i~����&�7���^�
��klhGI�y���n]ڕ���]�ԋ��Z#��|D��`�2��5�+�B�yn54��*�;��X��>���@�#�YmO����k޴�3�FK�|Bf̈oͱ�cœI}q�%�8H��+�E�;Bk�+ډ�M亊8N�K�+���*u3ߐ܇q\)IMy�4?G���x2�6��
�țc�?��_7L_����<�∟N>��!�Y/H�C`@3�7���|2=��?q��#~q��C���/�W����N��sF�v�A?H==y�q�ߒ�g]bB��*�k��7�7b��rU��-�_"�"ɝ���� ��DA_�"��W��d��"rRDlV�ƣ��y �q��#\JI�:$�O@^�Ƽ�WGv�����Sߕ*z}�]����#K{�OE0���=xĩ3oDd�����8mlWC~"�-�^�5��S�q���� ��t�|��OWʩ�|Cjw!Ӣ�¼$r/�'-?�}B�Ƒ_�y�d���7%����;���6��'�T��Y�0�D�rE�,f����D� �Ky�����r!��O��g>,��D�H���ʼ7Hע��:�u(��ܦy~�<�g����}��/���mO���@�}&���.�{���T�<����yROu��@�x�'��6�?dc�� ���ހrjK&Qί���.؁�j�~n�����̌Sg���vX�?�<8	=��,���L�/��'���G��9�#�
-�{i�B���|:g�|gl7�v!��SґO�ɻ����F�ԗW��=�s��a�"[�v���y�uD��y/�l�9�E����|�%���o$V�xu��V�R�̞O�X�D8C��~Κ7S�i>W�jQ��n]�/̣ �p"�1�-�v؇]|�:�X���<!�ã��vE;j���m\l�g�ȏ�y<��y)2˭�pt��,���N����� �*!_�ԡ凙�te;=5�w��u\��?��i����ח�=p�7����q|W�Ӧyby�M��<_��`�Ǖ�J��������\yV���a޵�v����]?��n��O���l����'3���O����>6�������`x�H_����QU�>���`0��`0��#��_��B����E��g��ϳ�9�{���xb8
xnz�����3~W4��E����߻W:���
�״�]�s��k0����+=SO0���n�Wb��d���W?�z���yҗ�����R��,���K���J:�UlEoཌྷ���YjuwOx���}�Q��JQ>B���vWe~���h�>|��
��/��)���-��n�[>yX�mG�Bh-��|��8��N�t^������`���).��޾O��Z N������E���#��9�m�k+��J�9�����@�^�������</z�<�?�4�~����)%��&��G?��@nK*`���uR\�~~��zWN/2�MjoF���x?i��HG�����~�R�������1_y�/�leG�2Z�|Q�I��g;�S#ڴ��w'�7��[�s��5n|o}Q�y�lf��� �\�|��-?�N��N=��z\z��3'z�N��2�ϔ{{F�!?��L;G�����wQ���<␶`Od���9�<��#B��^���j�����;�O6���j_@�A����EK�~9�o���>�e�^���Fj%�Xsԓ`IG?EQ5��ԓ����a���U�'���Q߲��ocz�������I��W�c��i@�'O��;����_�q���~4�/��n��)sR����\3.�֮ڕ_]���S���V_{�3���G�*��k�"O%bf��s��l�z
b�s����qm�~m|b���t��p�C	�=�w�����`0�^��"��X�7����}��:x������I�k}�����=�����w>�nM-}ɯ9�M�Ϳ��o����9�[�1%����:W�O�/����M��h�s�3�����;��T�Ʋ�����[Bv7�� .0�yƅ�x�3���X�����3g��)�T��a��R������<D���+�E�e���pŭ=E�/����S�s`<-��)�U�~,�zFE]�=򹋓?��%��5\f���'�|�|���|N-���9o�yOQ�x���M����M�[��g��ʪ�:��+���o����蟰ϼ7�^��d�I��֌�^x��~�zjc���zTڻ7�g����I/��XI��cJ�}�>����~M�6�2�{�����¬�Z����KD��~�dG�㽟����ח�n6x�lD�y���x����:�:����X�)��|�Z5ΰ�����fW�y��ㅿ���GA�ul����=�^v�G}���/���R7����~o���W�����k��k�v��{��sȉ�h���,u�;�'�	�u���J{��|���R����,�~<�ނ7_��5�B��I4����^�D{�h������+�E�����<��w������h�8��G}��\:�|���}�+COC�o��4�T��ӯ����wq�9�T'�0>���Cޠ�e�����C�_;�$R#�}F���(���e����G}a��s8�g�D/�[}N�C~�$5�m��.I�z���y�J�|��f}o���1����o�ϐu��:��C�r��Ի�w2~y��=]�u�CdU���~�j�'��W�&��e.�Af����.؊��C����/���M{�=�{�}��|	;姨��4��Xq���D��66�di������N��x[����=އ�}S���������ê�u����~��L)�,��S�GU�yQ��ag�+M9,l�C~m9@{��u����~բ�=����~�U�O����D���~	ꇀ�y�礼$�W����*���6�_F����1n�=�և|<~�ߛ��������7���|���se�������{C�o�ރ�ɗ���>�3���?��~-�-�|s���G��W�e��7߷�⦟�`�u�MlRS��)��ܶ�,��K�-�g���o}��T4�7�����c@��U{���uݮ�t|����u�����g�������l��<����z����:���K�Q�_�vZ�N�	�O���5��h����N��u֫ϋ.zb�s?y���m�`~�2�{4���!�m�y�3v���~^�������^�+p|����|?���|�����8x�{�37�K���g�k��[���}Z��I}�߽j}�!xUu�'rp��\f�G>-�8�ף�:뻿G��#9���������A�N)w���{˨�T����#2��o�0��@�)k^�,,��3���[�W�:���s�E�u����`0?��3�hG;~��{��;���-���`0��+���v����P�"?���~2�q�ٽ�����JU��Ϟ~=��?�[X��y>�iy/��������r���O�P�����w�G��[yw^�����Ǣ�����uޗ6���xh��oƙM~��P��q���I�E�����Q��ou �l|�X�`Q��c��xv��I�d��+��f�����f�t��s�2�_����'�ߞS��W?�C��yrV��3���o�~��y�g>C�0�b�?Z��d�W8�/�������~�����Ѓ���:롿��of�{����"�i]K�_�q�ԓ�������"W>��w�����b?Z�~�K�(_skz�W��k���V ���8��^�ǯv�����m��|���i���|I2�i�A:�旋�L�dD'c\����Y�Ɨ��r}�7vL�k��q�G�[�J��q���pR��q*��2�=��>��Y�_�ʻ2�q�+"�b��|U��������ǎ�9�?'�s�a��u�[�c~m��8�����~a<T�?ͳ�����w���O}��0�A�
(�;�~��{���%�    [t�޷X��ӆ��E�-П�<���8D^4�G�v�X4a`�F�����A�����*~��8��P�g�H���O���2>uƝ�����c�Bk�#n�>�nW>5���	�7��1���gv�$`�����*�9����'-i�
ꊯ�Oyf|C�q+�*z���2��[3?��uM>�܊��C�����ʺ����];�׼J�xc�ȑ5�C��BO��x���?�p��>��wD�k���~�y�if���`jD|�E}ɌO�ox}㼾�^�f�Q��~�5�ߌ�}������Y��(G��k�߮�h��4�i�}�_�v!���g���8�e���/�P^�H�A�e��~�7���w��¸���C��)e�)O�u���2��\�5�2U�{˺�85�o��#5kܷ̞Q�S>1k�p)�q�[�0�]j����]��s����DSj����l.�"��N;���3�'53�S� >I�h���������K��oϡ��R�7u��!��=Ǔz.L;�Q?Sdމ����z�i��?�b����3��i��G�(�B�s\�;R��u�| u�ۅ�y^��O�s���Zy"�g�yge�.�?�/�'�Wd�f��иy�Ǫ]��G�;��0b�0���cm�WƧ�O�-WՋ+�х���	z�^?��cǜ��S8Χ�_��ʸ9��D;fc~�3yΓm�-�=����>���_qQ_�����y6a-Q_M���h�g�Q��q��oq\~h�s��C�A�-?�>�>>���We�|?����~H�A0�2�t��ϡs�u��3/�Q?�k��O9g�C��>t_��σ<e���U�W<��(�ǃ�xŅa$�7Z|���p̼N���t��t�@�$�1M�)�?�'�]+?q~'uh���"�lӸ'�_�������������y��ڼoc�_�^�!B{��ߞ�I��g����xbޅ��O\���?׵����y9��o���WގU���5n���=w}��8�G���>W�g��x3_��]Y�y����e���a,}�'�����<%��`0��`��X/��hG;~��{��ߨ�͎v���;.97��`0��`0��`0����{!3����xb��#��g���R^�/��{͛����o6���=�'?�z�Ѻ��Y�U�Jd�����q��<�{��'�v"�8D~��Gv<ߧ3+O���3����r�iug���y?Z����?�x�޾���^��#���E��Ǹ{iee�!x�����2���:}����UǗ���[e�X��������9�Ҵ�?����'vl���N�}��@��w�xF�.��qK��#u��/����w���Oq�\�|&�c>E�!��m>g|���PbN���� nW�ۣ�R��)K=(o�ze��-3~��A\���q��j�i�2��O2�cJ�7�T僼�X>�z��+�C�Q9�+��ȋwR>g����]�3$�� �K�lUyEɓ+��Pn�cM�h(9OJ9�E�`�/�e�:�=D�#����k�0�2.q�ҋ�)��d������԰�{P���2��?���)Ɋ����s&/����sĊ��"�ON�o�/;�ܭ-�~7�5�X�� �
+�y�E�m�e\��C��}�F��o��q�ǒP�+��2?�!�q�2�P�W�=���}Rށ�d���y�I?0�jI�ω��<�+K���@��x���ۻ�c&��I�J���i�����І���;�\�;=�F�M���v��!R��O��\��!�X�+�N2�"�X]�v�ȹ̗�D�t�n��@�r�����G�p)��li�Y~�c����PʺO=�w?�}���yLo>8�"����jg4�ɷ�#F8bF��k~	_��(焦���ȕ}��H0�K�y��;��k��33O��cc����+Ⱥ���S4O�����.�tD䇐��q-lqg;N�Ot{���׉�e��Z�a}n�w�xn�n��Á�COK=D�n�'i�C�q��%����t/���'=Z5	�/��0��ј_I֋��*�VD;���.Z�C�'�`9.�9?�'���t�z-��;׽S�)�I}4x�k��sqp���_뺃��[�����y��0"y�+�~�։�ɍ�7B�\�]o%μu�W��y��3�VC��a@�?΋�u��Y��\���:�.�k"�`��TwQ �Ƀ]κ!�L�a`�y$j�v��!W�/�;�������<qa�vW�v�>��z,��$�_-h�]4`�^lгҪ�5O�c>�Fa�c��؞v�!�e�6�q��Ɋ�s�n+�S��B9N~� 7ͷ(gQo�����4H��vP���K�ԏ�b!r����o�Z���
�!�~���X��Jby�i�����c�$i��0D�q�����̃�#��I�~���1�Ps���]�C��C�
h�'��k�Mb�49/p?xh�8����<�&=�G��i�='�M�:��8�ʼGr߮�ƃ��.Ώ�|�	gP�����{����!�tc�8�����s̋�������B����>��vd|^a��`0��`0?��`0��^˝l&�?��X���s��<��uҗ|���O�����υ�7v�yvcG����X����.\�o_�{��6������O�M~+�����G���7�_���7��-ʻ�~΋�d��P޳��y�S֣h�������H���ޓ�m3�������U���O����F�@7�����o|W���q`��{�/|�Q�o'�w~n�.J����|O/_�^�1.�ᇐzp`+U�����9E>���o�|Ru���5��3y�Zk	~���+���?�Ȕ7�~�`�*��F�,x�L=����=�g;ߏ�|�������o*���S��z/��G�Y0���P^M�V�~�j�<�O�`�k!���r]�����E.�Ņ��6�ig����t���A?�w�F-��զ|�q����<��� _⣔�"_���k���C{�oz��e��3�q���b�\�}S�Ŭ+,����΃߃7*qx"�GZ�|Z��E��`0��`0�a����h���h0��`0��-����C��4��?�8s\���<���鷇`�;ᬯ�:������[�.��v��B}<����ӶV�~�eޯ��Jw��=�fi_౼�C���2«�/�C�kBcǿ�A���Vv�?�>�K�/��!U�;����ky�=~�2;䕬�^U��2���G���9#�ߑi�����޺����쇔;X�����<R���#o�;���wC���ͅ���(�
wd�+ �&���迌�(�g��b�ˡr>%�%$=�g���e/�`��j�����䳞3���0+jԼ���&����_r�_t>3�b��~h�]��x
����A�)r��g�߅,�lO��]�o��s.�3iG-�jEZK~i������=�:��X�'n,�a\�YGո��|�R[�<֩�}�酎��&�� 6xcӿۋs</�ɝ�;�O�r�+�ʯ<��O�3�W�}a~�M�����ȃ�x?�T�zQ&%��ˌ�[q5:�RD��(_�.<��^���p��T����@}ӻ��{3�n�}��2�\�\w���^���c�{��P�20o0����k�{Q����8���xM�I���U�8ʿ�x���|�2����'�v�u��w�zن)�"��9IE�3�7�����B��A��
�h
�+��R�Ŝ���0�Y�
��5l��ZVo3�:���unh<�;5.,wѐ��y̚�W�'Q�!����rg`���~"��z���P{�R��s\OD�P�7����<׾��'Y�AK����c~�y�9Bw��ʯ�
R����1�[+�׌��<�j��_y�d��_zC�#ы̿/���ȏN{Hz߫���=�?hCʽ�E��O�'��F�| ���5&0H�NȸM׳J}����1������>ש������捶|.�����=���7�+k�k��_�Hоذ�N�/\��]��a]��zg��!3��~ONw-���_��6� �  ״\���ż���:*��c�)ln���=����{���m�>V�-��ڷ�y?(��ߘ��2�:�P����#._Ƈ����x�L^�����h�N�ߩG��Ny+�Oh9 +NM��6�a�QKi�W�`�]��V�����x�оM�'ǣ����~\ceӇ����/�30�s,;��>�w�'���G�}\��_��x��^�C��Wλ��[O\�:p-�	��k�8n�'.�~p��]*�t��y�O�K����i�|8b�;��.��s�g�m0�o�I}|�PD
�����>x��S�\��H��v9X���:>�盛���s�;������'�,�u_�-�PO�O4�����?7���>Ƿ�~���������g�{�����'��vh���}r�=jz���|���`0���-X|����ߓ��-��k�юv��G��`0����`�{2�;�6D�߂�`�Y=�+���%��=A�e@�����NB/��ҫ��"d��O�F�H����qt�a����
��.x���(�񩻴�ӯ:3��+��#�)��t���j�i��/v�� X��2>	��Ŋ���R��� r�#ޒ�D'�"���?��4>��|��GT!�fJA<�#�i���Z��+���ɟ��x��H�6�����|\�8E�\��[E�͓.������g�3X�PN.���K���ƛ2��s\������`���>����w-��C�;5�A�<���c%������<�����W�|ƛ3�O�.3�~��D4ߌ7r��rW-�2S�g�;���;��	��oc�Shg]�׌/C{�����OUy5^�£������ �T�q�~��I3_�!V�;+�i��Y�,�9�uw`�'1��]tag54?
>c_t�n"��|�7(������\ٮ0�</�v�s|��AF���g��w=���4�o;�+ώ�`0��`0ï¯�۶���v���՞7fG;�����`0�oe���'����?��_�����
}<x��A�*��p�i7��1�:���T&�A��!������������W���귷���x���N8���Z<x~~�O�(� ��g�6�X.�tֿ�U(3ϼ���sd��?��?�=[��O\�o��׫��Y�9�&���,屣�$�Q����s}��J�C���V���o��*�џ�],��l�Ƭ�m�?%�F�N�g&w�0>w����Y�=O0|	�����W�et�/��yq*�`�A\y�"�9y�CޔV2��j%�I�� �Ԋ��_���)�gG��,�P>�oi����}��|O�U����<hӷ� �΂���9��;E^�����v��U�b)���K��+SX�g\���֔f�ձ|���=ڻ�E�F���h2�3!� �Ng��S~A�n!޵ɝP�M�D���R��1ۋv���ե=��0��:�y��[�ށefƫi}I���w��C���Uy
�M%~Yg�o�'�o��SI�S��
���rA��r� ޘ�Cy�d�2~lF��*��SN�����˱ȍZ�;M������{���&_y&}@�$�W�O��\Լ�{�t����e��ܕ'��tP�E�x��M/����G="�Ѹ4ĉ�'���Ɵ��y���&�7O~�6��r��W����;����mZ��_F�ߠG�ޔ?+���/�S�;��2���&�fR)�G\��N�R�N�~�����:�i��ڥg��o�N'�Tۇ���/	s����v��U�5����u_"gqފ�9Ĺ�S�Pȷ��wM�Z��X�':S�j��:\_��n�� ������b\���gR��\��|~���z0��'o���5��A���R���K'��o]z��:Ǹ�S吼���j{��؏�ft�w�/��zƥ1��?���ot(���'}�e���c��wȏ
q�C\`8����q�}������˸Y���c��:ˏ���I��d���p<󎠽��ar�#?��d�+�����`)�rh4����>ʏ�M��`0��`0���W��юv��G��`0��`0��`0��`0��`X���Lv������~-�_;�ю��^�l�'Ϡ�`�{c���g��g0>2L����{�;��2>>L����{�;��2>>ޛ�1{�`��0�c����	������U~�U~�����D=?̫�>�U~5ޛޱ}�����x���|������n�Ka^�y_#�p������Y��9�`̹��ȃu��|`(�^k=X���S��JF��6v����O>��£=ʏ��?x�(��r`�m��j?牴�`;����:-�#��r#y�'o����������{�_[�yn�����=�ڽ�sowcɇM��ŷ�;���w��7�!�s�WP�B"O߼o�((�n#�f��i��~B�ht0�����;U=Ն�:��9�<�Y�|r�=���|��M��O�7�Yy�y��t������7LZnM5T=�v-�?5�M</4?�1��s?e�6� ���<�-��$?j����������~�lOk$|}\����ezX�'t�WQ>D��M}��O����9y/������w��vNq�{���>�7�E�rQ��A��o������㔧T�B>�SJ�O��w�'��3ۓ�S����򡋽��Ʈ�S?����~�hXSagT� W���O���7����m>�?��p�e?��ua�^`Be7�S�֨ߺ�'��:��-�^ۨw��I��<X��GF��Ao~��:�WT}��'�W}��=���{��_���wl��X��W�-�	SO<�I��8�wߏL�%����>�"��m݅���������m��vG����,��/i��y�#�;���8�Yy~��cy~__��V[po�s?�f���:�}�jo�q��q�{��u2�>�y��ɋGy�o���]���W��w!��D��xoz���ÞG>L����{�;��2>>ޛ�1{�`��0�c0��M��>�`��0�c0��M��>�`��Xr�^���W[�Z���lG;���{\����`0��`0��`0��`0��`0��`0�?��pl������_��/w�����������"J��      \   �   x��Q�n� <�_���L��|@{��^p1�#U���~X����9X=d��XX�,]7��ЂMK[AhK(��O�QJ7=֫���T���H�����q9�wp�%�61e%F��3������Gm�f�@鞳=�v��;��i5}Y��LT�8Kt�ҳb��i�!w�R6gi��ї���0��k�t��
�Bn�=K1I>���7�q�t4�Ab>����q8�?�=<s%� ��}�5M��\��      ^   �  x�ŕ?o�0���SX����ŉI���Ҫ���g0`P�!(	�P���[
�V�ox�#��N�g�+�A4�,˦Η��|Yx	z�_����� ���[����t�Q��b~Q�׹|��  ���,l,�j�o����Q`�h�^W��
�YH-�6��n6db��S�:����ba*�A4u��穡7b�U`�h�f��9�M��鬯���͞����_�����4W!~XΘ(��]�+ʧ���|wd�P�БI 	���uv�@��@��$�z�\�L� �S�Cg܇#=�>��<�6f-Q�f-"6���y-�M^y5��q�X���&��j8E���@�����%+34�K+���H3����DS��K���)�� 4.�_�y(]�#$>=�.�3S`�hN�.6�����jo1]l.��n[��Z�2��ڎ���Q6��j'���2��n9��E�&�E���\����5'      Y   �   x����n�0Dg�+�2H�-oi��@�.�H�l�Il�1��U<���#x87�(���U6yV�+��Ye�M�1��>��}��%\k��k��w�%�0�����-�>_@�! S�L�ƣ��_�;�{��བྷ���*4��&�;v�s誜�&FQ&�?�V��z�5�S���C���<�g�qþ��8�����}f�κ�{"'թ����[I      b   *  x���Aj�0E��)z�%YR��M2Nh�B;�ׯ��0�ࢍ1<���ff)�h���(�*���	p�:�<||^�a��6�#`L�%�y9���t�V��-��_��RI`�9��w��>�P�yη��T��q�BI>����wZ�>�P���=]��D�3B;�P���.~�Z�n�PhX���D�ڜu֨��X����:�����ɐ�p�OҞ�}JWU��
�]D9��s���&-}�FH���T�L	�c�Dͩ>��*�`��7�D�i>��*�`������sz��6�:M9��B��z\�      `   �   x��ѱ�1�x\�5��00�l���Η\��j���$=R'2���3��r�b�N��=�Y�h��pG��r��S���1���?c\$W��LԬ!�g�8�޳3��.�����D���;Ȱ!�c�;�l;�F��ߙu����U�y�y���v�3�>���ϠV"�� ��Y���~C�����l��pzu      d   �   x�u��u�0׸�4�|t����:b���a����Aۇ�|1N���ܢ�!�C̦h�~�|3Q]��� :����$�^(����c����Z>}>o����O+R����蕈Ӫ+�č83GB��7���F�q5lθJ���"%�č\���K.������uƍ�:"��Bx�۲"i߽���yn      �      x������ � �      [   q  x���Mj,1��ݧ���,ɖ�,����x����@f!`dC�E}�Ҝ6�73�d`Z�嬙��m�%�HU��LE�]�@��+�MB]()���v�C��iy��[�e@^�~����>6B���<ޏ���u����|��#�Et��	)K~(��=E�6�J=(��>�{u��Y4� ����;�˼�P9�\��Ka)�œ�G3��yy�����Vn�&�?�!��g�pAr��;PM��N�X���
yᇒ�>�[��`)�[��U��$ԡ�q�',�������d�pK���Q�5]짺�}���<�ޚ�1i��"�L�8�$z�$�=~�S�u�W��$xu�ug�(�4�X��G��Y���m:�}� B[�     