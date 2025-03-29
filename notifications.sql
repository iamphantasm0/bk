PGDMP  5                    }            notifications #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)     w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            z           1262    20999    notifications    DATABASE     s   CREATE DATABASE notifications WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_NG';
    DROP DATABASE notifications;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            {           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    21001    new_arrival_notification    TABLE       CREATE TABLE public.new_arrival_notification (
    id integer NOT NULL,
    shop_id uuid NOT NULL,
    new_arrival jsonb NOT NULL,
    "isNotificationSent" boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 ,   DROP TABLE public.new_arrival_notification;
       public         heap    postgres    false    4            �            1259    21000    new_arrival_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.new_arrival_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.new_arrival_notification_id_seq;
       public          postgres    false    216    4            |           0    0    new_arrival_notification_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.new_arrival_notification_id_seq OWNED BY public.new_arrival_notification.id;
          public          postgres    false    215            �            1259    21012    price_change_notification    TABLE       CREATE TABLE public.price_change_notification (
    id integer NOT NULL,
    shop_id uuid NOT NULL,
    price_change jsonb NOT NULL,
    "isNotificationSent" boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 -   DROP TABLE public.price_change_notification;
       public         heap    postgres    false    4            �            1259    21011     price_change_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.price_change_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.price_change_notification_id_seq;
       public          postgres    false    218    4            }           0    0     price_change_notification_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.price_change_notification_id_seq OWNED BY public.price_change_notification.id;
          public          postgres    false    217            �           2604    21004    new_arrival_notification id    DEFAULT     �   ALTER TABLE ONLY public.new_arrival_notification ALTER COLUMN id SET DEFAULT nextval('public.new_arrival_notification_id_seq'::regclass);
 J   ALTER TABLE public.new_arrival_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    21015    price_change_notification id    DEFAULT     �   ALTER TABLE ONLY public.price_change_notification ALTER COLUMN id SET DEFAULT nextval('public.price_change_notification_id_seq'::regclass);
 K   ALTER TABLE public.price_change_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            r          0    21001    new_arrival_notification 
   TABLE DATA           z   COPY public.new_arrival_notification (id, shop_id, new_arrival, "isNotificationSent", created_at, updated_at) FROM stdin;
    public          postgres    false    216   �       t          0    21012    price_change_notification 
   TABLE DATA           |   COPY public.price_change_notification (id, shop_id, price_change, "isNotificationSent", created_at, updated_at) FROM stdin;
    public          postgres    false    218   �       ~           0    0    new_arrival_notification_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.new_arrival_notification_id_seq', 4, true);
          public          postgres    false    215                       0    0     price_change_notification_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.price_change_notification_id_seq', 7, true);
          public          postgres    false    217            �           2606    21008 6   new_arrival_notification new_arrival_notification_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.new_arrival_notification
    ADD CONSTRAINT new_arrival_notification_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.new_arrival_notification DROP CONSTRAINT new_arrival_notification_pkey;
       public            postgres    false    216            �           2606    21019 8   price_change_notification price_change_notification_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.price_change_notification
    ADD CONSTRAINT price_change_notification_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.price_change_notification DROP CONSTRAINT price_change_notification_pkey;
       public            postgres    false    218            �           1259    21009    ix_new_arrival_notification_id    INDEX     a   CREATE INDEX ix_new_arrival_notification_id ON public.new_arrival_notification USING btree (id);
 2   DROP INDEX public.ix_new_arrival_notification_id;
       public            postgres    false    216            �           1259    21010 #   ix_new_arrival_notification_shop_id    INDEX     k   CREATE INDEX ix_new_arrival_notification_shop_id ON public.new_arrival_notification USING btree (shop_id);
 7   DROP INDEX public.ix_new_arrival_notification_shop_id;
       public            postgres    false    216            �           1259    21020    ix_price_change_notification_id    INDEX     c   CREATE INDEX ix_price_change_notification_id ON public.price_change_notification USING btree (id);
 3   DROP INDEX public.ix_price_change_notification_id;
       public            postgres    false    218            �           1259    21021 $   ix_price_change_notification_shop_id    INDEX     m   CREATE INDEX ix_price_change_notification_shop_id ON public.price_change_notification USING btree (shop_id);
 8   DROP INDEX public.ix_price_change_notification_shop_id;
       public            postgres    false    218            r   �   x�U�;�0���W�L
��qoқU\]�!�V����T��MG���9���
 ��L �w �0�(H\�2V3�W��ϛ��<�!rH�4��(�MY�HI���b0f���3<�u:����v��4�U�E�F.ץ�+-˝4%�r^k؀v
�_�z���F!���0�~��1      t   !  x����J1�ϻO��I�	��L��S�W��l������T��-*^Z������?�w@�YqR4{R"<�J�&_���a����}Z��8<�Mi}��B`Y������eR~�2'�\��0���zڿ�L�����������dr^D��ӱ�;k��������) �|���5 "`�.I�J��TH���ʾ��l3�`�S�m��l�0�V��p	��W�k��O�`�8b�"΢��`M����w�d�����
�:*S-){�π�Ց�ߡ�hP7���G������l     