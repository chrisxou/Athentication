PGDMP         "                z            iot    14.4    14.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16485    iot    DATABASE     `   CREATE DATABASE iot WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Europe.1253';
    DROP DATABASE iot;
                postgres    false            �            1259    16495    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(200) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16494    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    210            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    209            g           2604    16498    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �          0    16495    users 
   TABLE DATA           :   COPY public.users (id, name, email, password) FROM stdin;
    public          postgres    false    210   o                   0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 40, true);
          public          postgres    false    209            i           2606    16502    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    210            k           2606    16500    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    210            �   �  x�e��n�P �gx
^K�v�9\��@ ;�˽���\a��K_ ["�Pu��7 �T'R�J�7���ё��8��/��^�?����d|_������Y	�cF�I	�B���"�^Φ(~���h�fv@��Lwgs[��a����z���Fs��'�^1xi�1Ҳw�� $�?�W|a�7�mnZ��}1��M���s�RZtWj~r��kCݑ݌�V\ג�W���M��:]��@���I��y�2�ާƀ�.���v�k`�/ϸ���|4.%�Gf�6QK��a��6$	)���NI���en��@W]�K2��6�$�Ї	�e�1�L�pF*L��S���9B���^������v��(R��7���m0Wpi*�m7��`0�%�;���/��?k��     