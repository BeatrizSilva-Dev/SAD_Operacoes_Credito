PGDMP     *            
        {            sad_credito    14.5    14.5 7    -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            0           1262    33109    sad_credito    DATABASE     k   CREATE DATABASE sad_credito WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE sad_credito;
                postgres    false            �            1259    33972 
   dim_credor    TABLE     �   CREATE TABLE public.dim_credor (
    id integer NOT NULL,
    tipo_credor character varying(300),
    nome_credor character varying(300),
    moeda character varying(30)
);
    DROP TABLE public.dim_credor;
       public         heap    postgres    false            �            1259    33971    dim_credor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_credor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.dim_credor_id_seq;
       public          postgres    false    214            1           0    0    dim_credor_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.dim_credor_id_seq OWNED BY public.dim_credor.id;
          public          postgres    false    213            �            1259    33988    dim_finalidade    TABLE     g   CREATE TABLE public.dim_finalidade (
    id integer NOT NULL,
    finalidade character varying(200)
);
 "   DROP TABLE public.dim_finalidade;
       public         heap    postgres    false            �            1259    33987    dim_finalidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_finalidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.dim_finalidade_id_seq;
       public          postgres    false    218            2           0    0    dim_finalidade_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.dim_finalidade_id_seq OWNED BY public.dim_finalidade.id;
          public          postgres    false    217            �            1259    33958 	   dim_local    TABLE     �   CREATE TABLE public.dim_local (
    id integer NOT NULL,
    nome_interessado character varying(70),
    uf character varying(30),
    tipo_interessado character varying(30),
    regiao character varying(30)
);
    DROP TABLE public.dim_local;
       public         heap    postgres    false            �            1259    33957    dim_local_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_local_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.dim_local_id_seq;
       public          postgres    false    210            3           0    0    dim_local_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.dim_local_id_seq OWNED BY public.dim_local.id;
          public          postgres    false    209            �            1259    33995 
   dim_status    TABLE     _   CREATE TABLE public.dim_status (
    id integer NOT NULL,
    status character varying(100)
);
    DROP TABLE public.dim_status;
       public         heap    postgres    false            �            1259    33994    dim_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.dim_status_id_seq;
       public          postgres    false    220            4           0    0    dim_status_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.dim_status_id_seq OWNED BY public.dim_status.id;
          public          postgres    false    219            �            1259    33965 	   dim_tempo    TABLE     �   CREATE TABLE public.dim_tempo (
    id integer NOT NULL,
    data date,
    ano integer,
    mes integer,
    dia integer,
    semestre integer
);
    DROP TABLE public.dim_tempo;
       public         heap    postgres    false            �            1259    33964    dim_tempo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_tempo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.dim_tempo_id_seq;
       public          postgres    false    212            5           0    0    dim_tempo_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.dim_tempo_id_seq OWNED BY public.dim_tempo.id;
          public          postgres    false    211            �            1259    33981    dim_tipo_operacao    TABLE     m   CREATE TABLE public.dim_tipo_operacao (
    id integer NOT NULL,
    tipo_operacao character varying(100)
);
 %   DROP TABLE public.dim_tipo_operacao;
       public         heap    postgres    false            �            1259    33980    dim_tipo_operacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_tipo_operacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.dim_tipo_operacao_id_seq;
       public          postgres    false    216            6           0    0    dim_tipo_operacao_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.dim_tipo_operacao_id_seq OWNED BY public.dim_tipo_operacao.id;
          public          postgres    false    215            �            1259    34001    fato    TABLE       CREATE TABLE public.fato (
    id_local integer NOT NULL,
    id_tempo integer NOT NULL,
    id_credor integer NOT NULL,
    id_tipo_operacao integer NOT NULL,
    id_finalidade integer NOT NULL,
    id_status integer NOT NULL,
    valor_transferencia numeric
);
    DROP TABLE public.fato;
       public         heap    postgres    false            {           2604    33975    dim_credor id    DEFAULT     n   ALTER TABLE ONLY public.dim_credor ALTER COLUMN id SET DEFAULT nextval('public.dim_credor_id_seq'::regclass);
 <   ALTER TABLE public.dim_credor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            }           2604    33991    dim_finalidade id    DEFAULT     v   ALTER TABLE ONLY public.dim_finalidade ALTER COLUMN id SET DEFAULT nextval('public.dim_finalidade_id_seq'::regclass);
 @   ALTER TABLE public.dim_finalidade ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            y           2604    33961    dim_local id    DEFAULT     l   ALTER TABLE ONLY public.dim_local ALTER COLUMN id SET DEFAULT nextval('public.dim_local_id_seq'::regclass);
 ;   ALTER TABLE public.dim_local ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            ~           2604    33998    dim_status id    DEFAULT     n   ALTER TABLE ONLY public.dim_status ALTER COLUMN id SET DEFAULT nextval('public.dim_status_id_seq'::regclass);
 <   ALTER TABLE public.dim_status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            z           2604    33968    dim_tempo id    DEFAULT     l   ALTER TABLE ONLY public.dim_tempo ALTER COLUMN id SET DEFAULT nextval('public.dim_tempo_id_seq'::regclass);
 ;   ALTER TABLE public.dim_tempo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            |           2604    33984    dim_tipo_operacao id    DEFAULT     |   ALTER TABLE ONLY public.dim_tipo_operacao ALTER COLUMN id SET DEFAULT nextval('public.dim_tipo_operacao_id_seq'::regclass);
 C   ALTER TABLE public.dim_tipo_operacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            #          0    33972 
   dim_credor 
   TABLE DATA           I   COPY public.dim_credor (id, tipo_credor, nome_credor, moeda) FROM stdin;
    public          postgres    false    214   >       '          0    33988    dim_finalidade 
   TABLE DATA           8   COPY public.dim_finalidade (id, finalidade) FROM stdin;
    public          postgres    false    218   H                 0    33958 	   dim_local 
   TABLE DATA           W   COPY public.dim_local (id, nome_interessado, uf, tipo_interessado, regiao) FROM stdin;
    public          postgres    false    210   #L       )          0    33995 
   dim_status 
   TABLE DATA           0   COPY public.dim_status (id, status) FROM stdin;
    public          postgres    false    220   ��       !          0    33965 	   dim_tempo 
   TABLE DATA           F   COPY public.dim_tempo (id, data, ano, mes, dia, semestre) FROM stdin;
    public          postgres    false    212   C�       %          0    33981    dim_tipo_operacao 
   TABLE DATA           >   COPY public.dim_tipo_operacao (id, tipo_operacao) FROM stdin;
    public          postgres    false    216   ��       *          0    34001    fato 
   TABLE DATA           ~   COPY public.fato (id_local, id_tempo, id_credor, id_tipo_operacao, id_finalidade, id_status, valor_transferencia) FROM stdin;
    public          postgres    false    221   i�       7           0    0    dim_credor_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.dim_credor_id_seq', 156, true);
          public          postgres    false    213            8           0    0    dim_finalidade_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.dim_finalidade_id_seq', 79, true);
          public          postgres    false    217            9           0    0    dim_local_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.dim_local_id_seq', 3888, true);
          public          postgres    false    209            :           0    0    dim_status_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.dim_status_id_seq', 29, true);
          public          postgres    false    219            ;           0    0    dim_tempo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.dim_tempo_id_seq', 1096, true);
          public          postgres    false    211            <           0    0    dim_tipo_operacao_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.dim_tipo_operacao_id_seq', 6, true);
          public          postgres    false    215            �           2606    33979    dim_credor dim_credor_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.dim_credor
    ADD CONSTRAINT dim_credor_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.dim_credor DROP CONSTRAINT dim_credor_pkey;
       public            postgres    false    214            �           2606    33993 "   dim_finalidade dim_finalidade_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.dim_finalidade
    ADD CONSTRAINT dim_finalidade_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.dim_finalidade DROP CONSTRAINT dim_finalidade_pkey;
       public            postgres    false    218            �           2606    33963    dim_local dim_local_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.dim_local
    ADD CONSTRAINT dim_local_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.dim_local DROP CONSTRAINT dim_local_pkey;
       public            postgres    false    210            �           2606    34000    dim_status dim_status_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.dim_status
    ADD CONSTRAINT dim_status_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.dim_status DROP CONSTRAINT dim_status_pkey;
       public            postgres    false    220            �           2606    33970    dim_tempo dim_tempo_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.dim_tempo
    ADD CONSTRAINT dim_tempo_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.dim_tempo DROP CONSTRAINT dim_tempo_pkey;
       public            postgres    false    212            �           2606    33986 (   dim_tipo_operacao dim_tipo_operacao_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.dim_tipo_operacao
    ADD CONSTRAINT dim_tipo_operacao_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.dim_tipo_operacao DROP CONSTRAINT dim_tipo_operacao_pkey;
       public            postgres    false    216            �           2606    34007    fato fato_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.fato
    ADD CONSTRAINT fato_pkey PRIMARY KEY (id_local, id_tempo, id_credor, id_tipo_operacao, id_finalidade, id_status);
 8   ALTER TABLE ONLY public.fato DROP CONSTRAINT fato_pkey;
       public            postgres    false    221    221    221    221    221    221            �           2606    34018    fato fato_id_credor_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.fato
    ADD CONSTRAINT fato_id_credor_fkey FOREIGN KEY (id_credor) REFERENCES public.dim_credor(id);
 B   ALTER TABLE ONLY public.fato DROP CONSTRAINT fato_id_credor_fkey;
       public          postgres    false    214    3204    221            �           2606    34028    fato fato_id_finalidade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fato
    ADD CONSTRAINT fato_id_finalidade_fkey FOREIGN KEY (id_finalidade) REFERENCES public.dim_finalidade(id);
 F   ALTER TABLE ONLY public.fato DROP CONSTRAINT fato_id_finalidade_fkey;
       public          postgres    false    3208    218    221            �           2606    34008    fato fato_id_local_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.fato
    ADD CONSTRAINT fato_id_local_fkey FOREIGN KEY (id_local) REFERENCES public.dim_local(id);
 A   ALTER TABLE ONLY public.fato DROP CONSTRAINT fato_id_local_fkey;
       public          postgres    false    210    221    3200            �           2606    34033    fato fato_id_status_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.fato
    ADD CONSTRAINT fato_id_status_fkey FOREIGN KEY (id_status) REFERENCES public.dim_status(id);
 B   ALTER TABLE ONLY public.fato DROP CONSTRAINT fato_id_status_fkey;
       public          postgres    false    221    3210    220            �           2606    34013    fato fato_id_tempo_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.fato
    ADD CONSTRAINT fato_id_tempo_fkey FOREIGN KEY (id_tempo) REFERENCES public.dim_tempo(id);
 A   ALTER TABLE ONLY public.fato DROP CONSTRAINT fato_id_tempo_fkey;
       public          postgres    false    221    212    3202            �           2606    34023    fato fato_id_tipo_operacao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fato
    ADD CONSTRAINT fato_id_tipo_operacao_fkey FOREIGN KEY (id_tipo_operacao) REFERENCES public.dim_tipo_operacao(id);
 I   ALTER TABLE ONLY public.fato DROP CONSTRAINT fato_id_tipo_operacao_fkey;
       public          postgres    false    216    3206    221            #   �	  x��Z�r�8���@��Ǵ$?BJ�e�ʶJ�=lI���P�����~ņMM�h'Ꚍ�a{/	R|��<�ڤݤt��s�r��F2E�ݟ�d�BR����,��%W���/��dD��5%KF��+N���`ʨwxrp����E�+�`�8��!�]p ���������]2ł�p��8FRv>�2��G%Y
E���a�~W��+����B��>_|;Az�B)���N�e�|����O�Eݞ~,fEg��EE�<ķ[?�p����)��_d���4 A��X�6x�4��~�	F�߶�tZ�l�
�������7��,R��XR߽��U�$�O�'rD6��t��m,�}�U%��Y����{;�'�ł.ll)E�ߎ��iA;т#��E��[��(;K�½9䉿.�WJ\����ҪRNlL"ż�_⥴���7m���ExO7��B<8��1�`�ZǙ6yG}&9��h
5��[��}��}��q��ـ3 �B4�� �����G-�^p��|�BU%�^��9��-[r���/��@K��M�ʁ���w�ӱ��T�1���1�H���B���h������Z�&� �c��D����-X��L����dt�BP"?e+��0�	%���*�������&ɮ�%��o�������c©жc�f♫�U�3rRק���A1���s􌧈߼�=�` ��N9���o+2W�IN���n�kO|��&~���ڂ�w�M����+Ś��3�l]��i���gA-����C����[AY���k���t�{��\>�JrKh������a�R�K�5
l��0�j�5��}��NȐi�=���{���O���&J��}��B��is���s 0X϶��\o���'"���&�$�)Rr�#��b]ی��X��nJ��,t�lo������Y9��ն�.��8��V �1�C/�-DE(}'���>=1�X���Xa��������&9`S�<X�е:OE��D�Ӟ�p�I�=����8I#�[qkzָ�%{a��`�!H����1�#\�u"��2�+ ������\�z-�=g�- ���R�� �zt%����9u��G���2��U���3M0Ԩ?�����,+��"�|o���rB.iaM�����~�N��M˝��ảtf_�B�Vxn#�b�i���Ů�8zMH	<|e�h��Fx�<8o��5_J�];	���`+���J�wR2b9��"B���i���A�$,;�v72z��;y�.6�˪9�ww��Oí�78�\>i��l}���vr3.���1noV˷�2�?X����;��+��m2�U�H4�F��z�U
\�`MCF��䀮��u+֮4���_�5z�/i�(��ϋ�|l�T4R��l i�=\�t�M�.�2y�8m��5��jG�S�m���a��m�%>Bn.i4^��x�(��yv0�0C�oX&���E�r-�tT�O�vP��TҨs�i�M�� C��|1�:�;[W�w\?~���͓Ӫ��3�W���d��E���a���(��R�g�����*�KL0q�=��1�sQ!7BjT7��]�7ՆM���r?�ՠC�4�NG737#09�����cH@q?�I�Qpf���v�2��#l�U8�ad",6ɷo��
\N@�6���={�S��nC!Pܕ�?縕�|k�����8��,e��~e��z�8{1�u��"B�]p�� F�| W��̢�G�8uW�=�<X]'EΜ�X\�q6������q��5,�`²֘t��)�э�@g͘p�p4�%������`=����e�c���D=oBf'#o�p��?�K��������^CR记,M')���r�jg��u��i�g8w=��uӽ�$�4;L�:��0ݤ���jĶ�d�3�L 5�g!Iy�<4p�~w�Ɣ�����ڈ�%��pc,X|�vnm����}[�?�<|90$$����ȓNk�<�����!���y?%û���ڝ޸dp7{�>�32$���vx���{2~��H�1��1_�Cdp�T�-Q�&��#ގL���K��d�,��T�A�Z��y�Z��V�P��h$�~׍���Pa��acX(�`����������h��~�i�:%�?o�F%k�p�~�wi�ӷh-@�{jז��_�T<��%�Ao��6���*'�&�Gd� ��4+~S��<ꟴu��S�}�9'�,|�Ћ�`Z:�C9�.�9]��M<�YɵP�aH���w��
�H�`m)��x8#�k��ߤ�%s;�����ت^�e����)�R�I) %��3��m� �^mt��c��.�Ɲ�!G�_��ī��G|�T�Ջض�h�}�ȇ����dB��`�� Ye]�PA�����쾢�yɯ�����
��Yy�i�$K����O���4��{O7O�d��! ��F7o�[>q��1�m��}:<<�Y���      '     x��V�r�6��O��m�_*e�d4s:;��E&L�
2$����t�<A�in�p�T�2y�|)�gKnR�],v��vA�MU����+#�Z��i�M�~����<�<i�v*�i���X���Ϧ�֪T�q�<B���;.�(D&�J�\�l��:�%�U��k�QY�
���q���{;��Hٿʒ�7n���^�gw�ش,�Wλ,����|���J̄�D��a$ �u*��r��x4��)9�Q�3"�;��?���#'8"��	��r"6�y,˲Kt+��+%��2+�,�E�(�[�B�	P��O�ź-���\��S�496���w:ݩ=�����f�FQ�e�E��;l��qK*r]��Tk�[�|�OUT\�-�5�ʸs����c�s{��V����B�l]���JemBvUH�9׼�+�Wվ|f�����'7b��?�}�Q�q/.l��I�lh����4�g��Z���F�v)��(�s:��	>��]�������y�ac���	�8���TN�N)�@/��˶!{��)�$o|R9#orBi��o��ڴ��J�)p�eJ$�s�-�w�Y��/�}`��V������@��S*+-C;^H��zP��Ļ�������G-˽c�5"32i�2�A9{v��g7mE0a��b�$?��1�| ���6���9ڢ�����s$����7צyFÜI���)��R�f�+c�@��.(p�_8������(p���z�j/������FX4(���rMʇ�#ͮ/��q�Ґ�haH)@M�~PiDv��:[R�|o��W�L���lJ��Z�,D�sX�]��=�zýK!�R(�kꄈe�"��n�Qv �F6�v2Q���A�:+t�<i^h���QEc��֩0�7�{��"A�ˋ��Ra8y��U]̩h�����ç)r޷j~��x@@íF��˺s��r�A��
��g��p�<���C)��ھ�QE�5�El�p�G�Y�Aј���VԾE�+M�mmT�i�霈��� d            x���;{�X�-hc~�c�7�0�J�Jy�*������H
� �	M��;m_�e�q�K#��V���&V��rG�mtg ���bG��i[z���zS�ݔ�W�]��KY��h֌�u5wݲ�n���zW�jSL�����rVNT���U�n��{���ͨ� ��@��j��qR�]�,FwŬk��?�y�����z�]�ż)����A{��5]���E[����׏��{U�m1���w�_��l�ϒ0�����݌�yW�"<�^�5���A�wY<u�=d����c��7��\��[���(�%^g-br���_y������	�vm��'��M�=T��Q�� �/;�����g��5�n&Ŧ�wE+~fyo��������o]��2���V�&�ێ&ƪ�H=�Q���%�b�<.��iYm�9!��ǲ]������r�Xԣ�e3k�Q��V�f9�1a6m��O��FM8�&b�c�j�����7��_�+����E7���c&?7>�ϊ��Mݴ���w_��64�֣���ޒ\�z��TZ"�h��9]��x,�߈�v!�,�g�"ߢ����Y�</��ѕ��yW��yu�-ڹ��<,��m5�Y�r!��(�x-|۬�_�%�œ�sQb���I��T�O������R�i�#�Ƭ٣�U��kQ�ے�iߠE�k1��{���/��pw�Ǵ;4��p�b]5���2��>��ػ��nY��_݀���[�Fz�V�M��澊�fYtk�U,4����jBc�f]5+i���`;�Z�6.07�
/y�t	֕i���~<�/G�ń����W�nMb��h��T�x���R����xZK��@ӆ^�O�A9Z�f�Z���ۯuU��Y��2��V�b����b&?6�.h�o�	"&$̜V�����[<����o--��M`�Mi։���x=��揄ȁ�t��R�dc��+��S{2��HVG��I���X}��_��b�R|�CDD���ǽ%Z��]�g��H��F�Y�Gޕ���gf{�C3�GR�3����|�X�q���Vo��sX���%�5��RA��MA�	|��nU-D0�C��-����}+�1r�fIˋ8��J3PÓ�]�#�o6ݪi��[��cj�|�A�3��S
����m6d����E|��D�$L]��^5����R����0�JK�cP�iWӦ)B@�J�X�3���<�Q�xSщC�'NzY�>.|�3�(�H���>-�2$dMyya���#z�e����6�7M�Pv�I�Ҙp"]@Z)��I)�TeD���n�t$�(s_�j,6=Wo@�䧮h��g芶x�G+���$"F�Ļ���l?@�����~�nXox�|V�+@/ț��|��� ���.?�لU�i?�C`�tq�K��D|���~"�&�3>1ғ;.u�'=��--�]��0ε�H|��i�D,����%4h��H�h�eM����"8���Q,W?D�l�y�|'�Kƃ�Q�˖��cȏ��B�_�^�Bݭ�!⥗�nps�2扔^n�MK���d⽮�{���=��������W�z����ՀH)p���h$3B���U����`q�WvEb�W�)�SU?*��O�j��i��@�w�Mk�ml�\v�:C���[n��H������|3�Y4nWms bk�cjR3۔�#����M��d�v�i/��C"���3�&$��k�7^>~�Z�{��sI�q.j�弘�F1��x*3��0A��b"��D�oh=R{7�
�I Y�ʮK��j��QP�it�'FL��Xu��J��@�s��0ͦR�3b�7�B7����q���[�Ąo�]�4#1��q����1����I���D�oV�LQ�멩W��2"�U�A<��5�7��>���-�2����lh:��2�)]@\� sy2f�D{��`U+�=��/P������΁���I��DH~"��L���/A�4��Ϲ�W�D2�ۛ&��:�����L��}EK������+�ø����s;o�~�hd�^ʊ���ثA+wں���jy�Dpo�J���[2JU[: vK�f�}�۷��ɣ+ ~kN��N�޾-�r�q��޾��� �Z�x"�Ʀ5�J�y���+�X[Ƅ��Ӻ��-��ܔd�u4l�'��7�衔�N@ĖO9��)_��?��biDko��� V{[t�P�M[V����-��=Ɇ\@l����:���VϴۖKsH�qe"�%}�<g���d|�GW��a���E���߲Q��i��G3��A'T@�����9�篪���r]��g�_� ��9w�1�q�����#x��hmi N{Glg�*�M��g�se�����	��a��Mk"T.����-a7�����4�粁�D�gb��wz�_�g�݉���/�7��e�Hj�v�]G��yc��*��������ٻN?����R��Q&/��a�jbQ��Oͷ���GDD_��?�-逨+��Y@ԕqd�+qW�ڨ�ŀh+�>�~���D\������z�N�a�r�5	1V�<���?�. �2⬠�N��x+���g�v`������-�`4�7 �j��[��ŧf)�J"��b�/��U�Q��{��uD^�cXy�!�J���Jeɱ�6�u�UH�A�L&{�LM�)�A����N6���&.�]9W<���f��v���Wm1���oi��q�������&V{p�{Z0��T����{����Y*��tM�y'�q]}�].����l%��ڛD{�E�p�&���V���~c��z�ޣ����jb���ł�����!��YL��ز�W1�D":�#��5�/6 ��`�j4��� ����N컝h+;��w-���8%�9� Ť#M�g��d�E��}�m�>-��/�D�j�d7�e1!�X+[Qk��Y~�Ci���n��i���Z�c�����`D��-�KLpŐ�y3��^d��L�pX��aB86��ᮌ�py�!��|�/��[�֛�<+;X8F�Jm�	��N�=��[>x
���+i��� V����<-�O�MA7���U��$�!qt^��-��Dhap����YqHlXuPIf�f
������Fo*�G�3jF���D����š�r\ig��56?�eɏ$�n�͂�2y3��:Q�
M���s"�^�D��-6�,âC�y�v�6.���gU�{I$G���ZH��$����b���O �`� "�},�AA���ߺRe�!q|��C�H�{Z�F&6!Q������H��}Y}��|>!��e��+D���i�Q���-�L6B���N����0)�e39$z�A�����&
	��P6��TV��XԥB
Cb�Q�Bb�����-���G�Le{"$��o�|f�`�)��!q��dz��}J,���l�}	Q�V"Qk�{�,��R4�B���D�O[��ˠ��g�����F�]E���%�����?��0	nqTvy%@�4�
{��I����HL����C>���$T��������|�!���dHȐ�Ҿ��8\��Z��&�V{
�9�Hycj����["�����Y	��N��1��_����6�#����2(�q�ż\ȨЄb�{�QzʹR�d���64F�qP^��)M�"$\i�4g�UZ��9C��o�!(o=E�A^7E��	�˒ϣ	qu�;,g�ܼĬ/i���ƌQ�x��U��� ��X�]>�GA�)��:�[&��ɼ7�f�&V�䈖����o��"BV�( �A�h#��ye�ql����C 듂�΂�NZi�>6�Lȸ�����9��K���WqgK�A�����I!�"EO���}(�t2"�nVEg��"(D��y["$G����������"�A{�9�Vd�ˠ̀8�F�y�}F?�/^�Vӆ�2e#�p.m��a�g�|�'"B�xn{��.�K�G顃?�c�b��/��0jI�Iޟ#g��T\U"g������!c8I�oBL��l;���    ��$EL@����MyrO&K�D8�\o��Z��8�$���",a���'�Esj��D5{Ww�{2����J!�5�_��+�\�Yr�K�C4k."~J�F
DI�a�-�&"6�3�j��(��-��'u�p&o�����W،��w���I N�ݔ˹��L�A;-L{����)��X7nLȘR��"b�Md�zG4��+����0E�A�k��B`�i�/�h	FDU�5uc�L��.�IW������,&d�?�7�)��+��T[ማ���"kO���x��*"���h�}�%ZjOƹwƳ�w؜	� �c�*��U�]�ؠ��`�@]o`̎ޔ����_��+Z�9���` ���W�d�s�d��,�[>�]��/݌^��������%�k�Hŭ?����c��9	�,vJ8b���c��!���X�DBp�+�DDΩ����N��&��%]�l;>'��O3��;8#�� ��	Q��Zl)�ަ6qL$�z�9ί*��ޫ�j���aۄ��g�J�7ݒ����d�!������I��E|no%��k�+�~!�	�Ǚ�!b0m��$ HA��_#ڇ7���������	Al��|�zfCWiC� ��$��D���"�{���37GYF��X�lPCH�EyZ��\�&	k�H؈5Wz�*���D�^�IP�B�v�&��<3&�Gj��S�]�D6��E�L�%����WL����xt[6�O3yY����68�������m����Q������萌u��=)᳓òˢ&�3��מE���{˷ǐ�u2��>	��<c^.�&�+�dF�0��̢���h�!�$�I�H���Y^�cbǌ2�P%�����3��
���C̑����7v�@#��1)*���]�h7Sa>���<H��
�R5��p�TßE��&cؼn��~�K�����C�9��o�� �ޗUB�u�����i�//��<�u�n����)*��,d�b?Ko������8d��S�nU���YT4N�b�@�$�j���5c�2�}a�����d�&���@4#y�V��w*�pFGAF�c����h��Ƿ�w��9aqTq����^�f�����h�]@�Q�ŬO�G��z��?�~�r)�=��@Qc44g�F�p�˫�k�X��V�����T^�&�}3��C��>����j�r��/V�ā�Ł#I#ݽ��X�dw"9��Z���o��Ln���^TD���u�(�>��FbuC�'��n�u=��I�Hf�*.����rW�I❵#')���^I2C;��V����
8.��X"��C�YL����A>��[lH�^���3G�a�|�Q��ƭ�p����*�tٌw��]�ΜwjȌs��n1�D�6�b2���(<�ՉYH|���!��]e��C,+���#�l��𲗥�����)���C��4Qf�*��匟f7Ć&""�ud`�����#���� �De�U\�Ά깚Uݞ窷$�^*ddU��}��Kٞ�������J����欝�a'c�4AP�
�Y�+��+բI�8G��i�
��v��ɘ��J��;���q��;���{�I�)�᱗O�e8�;g�I�FUwZ,�v��?ȳ@"�j9l�%>�\aި{@��)�%���A���>���ku�%~������ƃ�B����?C��t|Ь!��w�I�{�h��hafќ7���O�3ْgO��wެ�.�8�T�����'��s���^,^��3*t��R�Ȣ8k~�co��g�E�����]6������:�/m�����,7VHڔ�{�n���L��6�ah:#�ވ��g��#|c`�|�[�P��o�!j��9b�W��5�h���s֕�'贄"�Y���u�f5�Qh���|�v��E���\T���8;��� �DP0��ݭe{'�H��;KM�AQwZ �R��@�F�����R��W��b0�֙-��,z��[u2
N�ϕ��1|=�P��M�m��)NxK��~���\�3������r6�/�+�i����z�
��>d��'BX���hF�
+B�=�e�+���@s�����yo�l��Y�@�h��M������ZO�e2�X|&qD�#v�0��rפF�e��W'a�I���G��j,�!0�a���&�`��7Љh�ʳb{��z�ks�*��V�'�^D�FB��~�i ��8�.br��L�Ύj۞�5�D<Y��
�C��eL�6]eL�llN	J��sw}��,>|��Ol;eVd}R�C�Q�4��4��s۬���e?JO�,?:i.�&��o���G��T��j�d/�=d�i���R�Qּ{(����J��`+7"<o�,e@k���)2�d0�vN�nR,mP��vY�>�	�9�a�*�gY���0RS̈́.��,!|B���͗@��*�ے�wAv۲�E�h��-��H�ؖ�d�Փ�e�/ap���D	�#�E��[� a���)�nʐիcD��,[^�H`�/6��q�����	y���>^���%Z��hKx�%�y�;���b�з���UJZ�� 9C�V�Ƒ�A�T���g")z$� H�p�cm浕2��9aG��1q8�!LI���7��F�� 3�J.��Y`���c��/A|��a��:-'$f$�U�r��h�֞@�Ρ�$6I�����}�AhZ>J� ԰d�՟h�tyu!�~A�c�U�D�/�y�6��\�QB�`�1r��5媤Y"BP����T (Z��tr_F([�b�G���J��d��W���F;S��Z�#��0p��!uN3Ϯ��$``�}���l��!`����űNt��BlYbڄ���D�_�y8�~��UP�R~
�}5�������5�ϩ֖���(��Mݻ�[��D����\��$�"V�4#BrR'�DВN����H�P��n-�2�J�H��8^m��ұ�U4�Dﴳ}e 	p�"X.a�.��3���v�xА3�1�/Þ��+s�%CR[��8uI����Zg���+���.�%@T/��!u̺�H[Ӭ�/���;��2��:%���`�I$����þĝ�M��p�<��<0@��|_<��۹�9��f���'�Q�O�l���,�-g9�G��a�	�U�'�)A&�R�̀<cJ���yn!�c�Dec���T�O6�h�ў�ơa�A}�,N��l����ya\�G���I�q�2�]�'��������*D�>�Je�&�A�/7���K��΍%Z��rq^������L�e���͍�^�:��2�C|6�d�j���U�͹>�
�<L��n#O��k�!�J�ϙ-Hfr%Lh0󦖟�u�
�E�
Y������V��z3F0Q���1s�a���}�4���z�b�d����"�}�6���������=ʡ����u!n�G緋3-����9�]1W2�o[��%a���a�ʘ��L.��_X�ᯧ�IjyFs�=�o�Ec+���!��_i��-j�	NmW�S���7ݓ�g��з�h���TE
��#"ݝ�!�G�&FA��7Pٝ�!���
���L2����y��EJP�Ǌ�z%5����T��f8R�V͆�D)���k�w	sFT�g�9���%0���.@8��ZL�7O8w�u8g�����m���N\��e�η_7�to[�c�����3�Nr"��D��G鏉��4�].��	��-6b`�'��}��8b���~��?�nȏo(G7�B�����i�Jڞ�(����g޳����t�>"O��x��S���~21�j�N�0�s�=fpeH�?�8���\�5�k���@"<?����,�[�U�m$¸�6�(A�?�q���xP�;�<j$�%0z��Uk͗�e�E�g&YfʘBGAB�2�H��\���,�o�w�P� Mz���ۂ�V  �wOVb)[`����*�^D£K:����B��F&[D����G�nȢ��E��,����Լ�l�Z1�    A��nZ��%G�D�Y��b�!���C;��*a�o��Z2�☃�w��L�sP���Z��x���eeE`�BND��td�	�����"��d�����]��]��nND�uY"�|״
�ʉ�3p�4�D�	'�Q���z��_~��M�E�+�yD��;Q�'7�%#�"��+���]5s���D@�+���9��/�ԯ�!���z�ĵ-|`��P�_�!�7��.σ��`�%PdAz?1��;�(	��8���A��)���Y�z䌹$�^d\y8f�ۦ@�����q�_e?e�3�[2�Z�Y�1laŶ�h.������(�܌n��'�y���i��_45����|d�wJ0�$7�D�Gc�����yK������]-�	V�.�<
���`h��#
=�ļij�Lͣ�ۯD��-����Y���UH�i_҇=sq���gH�AF9ʑKd�T�-�)܄��di�S�+�S�����1���{�|��sU��ЁWS����b�?�����2c�ϛV�e9ꑳ��m��{T!GOhfv�����t�Q}��	�.a'�G�C�-I���ħ%> ����1���_�~�<	w��":��D��g@�vN^wP�����<������!EdE7F��zUHާ�<�n����˩�9mg$���b�{$��6�H+�����#��Khꟶ3�,�e%��H:��H��!@����+-�)��^�� �x�]��0逰JhMFT�(>�c#�v�򥐧B�D��23̳��7(�f�P��Bȉ�_C�OYӈ�_sd��b�e,��D��M:�� ��Y��	nYyF��j/-/;�r+'?+~�=�9�i}�v�Y#;�����%&�RB��ϴy4�F�T�b%�u�E"��,��O��I(>ˠȂ��"H̐J>� L̦k;�t(�LqX�y7\����B�|�+%b�3F;%��엇4a����F"^|S���Q���51	��C�YN��y6
0��&+&�I�Ԉ��[� ӂ3v�3d���\D�o�բS��	���R	��� ! z�Д�LQ���9�.`%����B�xBe=Jt���c��B��plP-p2��5p�'\B�T�s	����	�a)ZN؝UJ�q�32wzӇ��I1�����͡<x�;�'�\yhn rt�?����!�,�|j�E�	�D��Qht�������d�f5�EHn�MUT��A0nz��
�Y��ۿ��;�R������VK*E�%!��]�/VqȢKJt+a��]��#1ںxc$�N��B�Lnb�oiO��p!���枩�("��=g%ƇP>T��Ôv$^J�q�
rT+=ˈPP�Z5�g��JT�S�B5-��G�s��V�j0������o]��PDA��1QP���B�H���4A�K	D���7�BϺLG�wC�F�n�)��h�ۦ�����y��M�3��� 6jnz(~�K׋��5˚B��'5�}Z���D,0(BP��b��7c�>�R��Pg#\ &�Q�%G�˨Ļ%�Z/�Lo�Q/���eVeM��&`/��kLJ@��1P�*#���&�3'd�#�I�4"��v�Zoa�(KD�.X({M����lc%:`�.�bz(ar[�JB��nKj��;Z������%Z��3���:�"*4��i�/2 �s�X1F�R�7K9u����eA��A���`�װ�)M�CdP��C�b�H��@�Jiu�3�w���P�h�]Q�/O��Q	��c�I�z�X!><[>v���s�3�j���E�PB�5�<k��y��2P���J9;"����od����)���g(+QLe��<��~���Օ�%���܂v}}��8�F�N�E�f��kO(!�=��"zb��5q,ŉ��H���#�o�I!�~�� x	)G�Ą�#Wb�?A�=T�P	�^�ܦ�Bg0�PZ�z��IP��=%B@>���`��_�Q+p������ޕk��/�����~Y���,����'�{GȤ�)�2F;w#PƠg�����%S.���]S�V�OĖ ����%s���[�P�/:1�����OS|Zl�e�m}}����9��P�E)�]��,�3�[�~J�������$~��� R���I��s�y��tJW'�ay�3^��a�P�k��!C�
�S�����:$ِIP�v!e$n|�m:yo�X�G�|�N(��=ڣ��RL�� C��R,;9�� AT@L �B��1b��v=�@)�^��4ĕW��
*�~1TV����)���~��&�R�Wڣ�Q/��������2�^s���z-�U}5n��e�C�.���e�R��̖���T��,7��}��̏��O���d@��`��k]h"q�_�6z���)#V��"
�ct�	�&�~[���X���|bſ�;���d\,睼�=��X?�H)dj�u��##�B�K%�o`o�0Qtߖ�I5f[��� `�����?[������8wFAF�鵷�� rV.�; z�8)�� ^���T¹āFC?4�b(	1�Y��0�\�\.����5J�ʉV����E���O+em���&��c)���em
��7ñ��D�SЅe%_��8P7?� ]��lH���K	�����P���,�A��8h���c�z�%b�A8���k�j�����@=��������_���lgl��۞|��O
Y'`b�V�kQnu.+�����mT����9���*\͵~FUq�^�.�|�(٧�	X�Y�1t�z���A[���ě�B^�4�W%����֢GbQz�g�MK���&�Q��Q~pÀ܆�6���e�Cw�T5{�ۄ��"Xh�`(�= �̓rt�1c���4��iӶ�8c���A0S�c��fɘ1�9q���u.H����QA�\F��^5<����JP�c�B�;�xggb�@�y�ŀx��qpSZX����& ���V��)�(�~A�:*ݺ���p�R�f���hG����f�Q*K}�i�"��� �ټ�i�3F��Q/[������M��z�X�O�����_�S4�%�S���l�u�$��>}�y1�M"���ʺ{�6&b�,�����N��崕���{�ŏ.9���SpUT�0�Hj]5Cf���%��4����v���~�&� ߢ�q�=����rX;���s1U2A�2��ZdP����2)O*��Bw�R柡�=>(�CȠG+�:4h���*�A�82H���㸯��v[86�0tt��C�NH��+ʳ>����in����C���C�ϥ�J%ל0��Yd裤�D	�'d�'�l ���?�	}��j��P��6��&�U�f��+Z�'J�mH������E�b�?�b�ԳĐ��qm-}8����d���)crW���Ѡ?����tO_�����׾���}E��]���Az\6B��]K�uNA&�a�z�����I>C���İM��	�ժ�W�0On$�������ތ8PWi����XuS�5ӣ�m�]/��>�X�[XA�.^�SMa�������#F������E�F�!�-� d�=��C�`�ME��!�pŇpc���� ����d��z��b������u�3m	]�nxQ��Z������ ��;n����qӝv�ơ�"�Jđ��g�ԊaƦ�q:���]nfm_�HB���`SL��۾���S?������A�xWz��̉,'L�}�F��*L��[�|a�&Z��j�$�~�����_��b���Q��#�0I����N�WJ�kW��יr&�s�Jь�$g������χ��Էp�)Wr(����ih1ʷ�c��K�1d��j�uC�l��F?�4庠Գ�e�����)�aj
��a6�L���}���uA3i5�Q�7��U�wjf+F�~�bg��o?��B-��\�2)Ή��Nkv����p�N�@Ff'H#e    ��qka_��w������n�5�֍���u�y���z`�XR��"��q��q�˷D'�P��g�[涛�Bz�+ݓ�x�&�Hw�?��ޗ	���r��6���?�5d2G�qӆ˖��]�7�0D��U���
sV�S��'�[��ett�~W|R�h��a�kk4N�����qz�W�����Y�B6E�q~r�[5/6�O*����T�w$�*����a^KA��7^=��Hz����qk���D.,G���(�:9A�f��É�T�v����-eMV��y����oٔKu�'*����j"i�?�uB��obl��)���r���n�.��Y�B�� =�[Q�߱��Nt���f��I_������l�hWN
"����|c��V�X��"��tȮR��-�N��b�}jX&�{c��n^���Hx��,x�Aj�F	��B;�W���Ev$���~��O)7ر`
��1x��{_L�Zs�DQH����Q~QjU�JTCń��&���v	�[=,�R��Q��h�ק���y	������M)7H<&
�h�(��Rփ������
����L�����צ�o퍨����GF�Z����b٭��2����ṫU�@�P�w�bZ�J'Q⣾�B��@��c)́��(	�zQ�,J�0�� �X�	�$|��`2������t�q�~,�>,�NǞ�5��j�{ڮ8��&J@���}i�����w�f��=P����丈󎇩T)M�Az�ry��2�e�,�ec½�����\��
�C���Y���ܚ6# i�]WE��2�kE1�P�%���g������2F.GY����!3��
�:>���'D9u�+��h�͐VB�S_l��h22Z�}���?��\�E�Wcv�<�8Z�&��ԂPrD;Q��� ׽D��3y�C�X��1���Ӄ�~w���9�O��`߻X@��
D�������BQgzwbUd��H��i {��+,]L>�WoJ<������r�E�뽪�
F_S�i�@s��nkWkP���� 5L�c]}�غ���B�`T�b�¿�����t[vp7�U0��*��Uq(��>��r[��R �z�n��G��"��G�`�E��ǚ��f��5��Tj4�]h���0{�ݴ��l|�ª�%VT����7��Co�yo���x�(tw�q�
 g=>�.,4��U��n�n��C+�Y.�z�����3�����`�����R��g$�.�~<a���߆$[;i!d�6���A�gf�y5`��H���T_�e�b%ŴxX���hU\K]N�+��p
Y�`9h����g�O{�T�I�Vq6k��~6i��,I�M�5�?'d����]5��~$�T5(�Q��=Dƌ�Ƿ�L����8���F�T8Y e�����Mu�>��b�b_���a���Mp�/F`]E���gr�v�w���$�윏@�B�������:��Q&Ͳ�����u����z=ջଛrmSy�K���$�ޛ>zA����88�20�^P��dｆ΀nF��[�s�6�k��ظ%�0q�UUL�_��J��Vdhc&�H25���߇����}`̶���S���׽��T�-zͮ ;���ݕٻ�C]��}YmD�n�����WƦ�R<�(Uo�Jم�xP�\;��x�S�(S���aN*6ꋍQ��^V/C8�����fe; D��t�ڔk1~B�`�/�x�Ti�p9�M[���*窂Y��P'nZN��Ζ�z��}�����c�#�Ѩ����`� 6�	��f�y��R\��̹��l����ϻ%A���IS=��Wўte2�>�Dy�8d��b`�%c������6�$����c�7V���M���/au�iE�`�]X�p���j`V�<��޻����&7�j��|�L��[�C�y�g�#t�oq�z[=�}�{��+�N047��f�6��G�o�fL5`�$�U	�j�����-�0�G�!��MVYK�Z	'�B�
�ZNV�g�#+�t��3p��w����K)	l���vwka�������� 5�ݙ�ej)�a���=]�g�6������} `pp�|��f3f�;BC,M��9&x#��gڍ��" LH{U���
� |�V3�ޑ���:v�̢Yl�7�f`1�ZH󹡹5�&Pi��S8HTo����4prtk��bR Dt���;<�R������8k5�bޟè��k#�wƾ��7�39�JE�N ֏��Q���'J��&����/���z�q6�k�}�H��9�U��3��3O趤A8�	��ʗ�a�\!2�W��{״m�j�>r����ŧ��^|'�O�n�V�{�th�'㓘��j5�S)&��YE"T�vV;k�fWЪk�����^]����,���xHE#��f��Q���])��>g��x��Ä�|K�G�>!7O0�L2����9����Ȁ�ax�/��@�(�X��������nޭ�@Cs��"0��<^�G	���4�����Գr���~�y��	���ZS��tP�����ǘ��_�������w��-�Q�~Q��~��Ж�g_�����_�Wv&�U���H	�p6��+µ�*.?" �6u!��M�sU���;��ǟ�m�e|�Erh!?IM��Gz�*�������@����t�Y�	�5�]�u���ԨFb�*�(cPW@R��n@Z�m/����}w
I�r�0y��(]\�-��f���<N�ԛ�l� ۭ˙�I��N(��$D��rK؈!��v_:ν�yW�w���J}֞��~�d-0�r2*D��l��h]7y�2$F�N��R�]��]?vDX������2,ۭ�"$'H��q�r�\$Ã��
!<&�A�����O�އ�����~B�S�Ď�U�����V�	GV\��,��C�-N(��ԥ��]*����� �x �M���w��y�<-đ
��f�8�vgX�dL���ǃ�ʛ��gԥ�a!�L�`S�SF�v0��*S�`��e�.(bP�lZ��t�22�U!+��Fyd�"dme}�
.��2,��&�G�P���sƈ�1U"�����FD�F��;@j��G����� ?�}�̕w��6��a�u^)?����gi˸���� �.8B��O�@!��icj��|.#b��L�N�eT� j�!��\l��+�3���]�4�,�1:�
�a͎F�D�����'����J�T���LZu���Gӭ�ߋ�w�b�UA$�
�8��]a��;^������ON���܃�Ӥ�wŤ�W����f�ȷ�P�;Z�&�sH����Zu���E��<4�&�"ݍ�*��Ƞd�����lUu�O�` ���uw�}
�%��,Yf;_����5����`���e�� HP�_I@2�?5���zC�ًi���?�J���2FX�ɨ��ZQ)��˺Z(��-�j��Q�v�<�ឈ"�`S�KF���!���2.�6�N�]���ݘ�+���<ˠ���ۿLB����l��mBe=A�y�A5D喜oa+P�d��_u�]T8얁�(�X��ϛ�F}�l�T�m&J#ec��c�A���1�j"�l���Ԉ{���-�*��2*�	6$VF1O!�S0`).�#b|�< ��z�X��]����>���pMC�EX䙸FB�3߻��"z�`��D����N5�T&�Z��ͪy��wcSI~�=(� �K���ߞ���A}^i�`_���"��|
"K�.�O-2�e$�}�j�Aۭ4@z\�Xf�2�#T�Q�9J�6�cI ��9�B��V���±J�X&r��]2p���B����_�;����W;�I��݌kɠlW�Eq��e����|4�*��:�,ɸ�Ǧmj�Ź��f1.C�e��B�P8�/��'e�rg�~��z�N{�]��V_�U�+=9)�]�Bl���D���L̫�O��o�A{��;L[ �^C�=��B�����7��+�F�ٻ���e���*a(�ﴍ�W�*�q�o����p�|Kv�0�    5�[��|[�/Pt�u�Z���/�|��5x�
B�cb�Ke50ڒq��=f�Aɞ���vC�i�2*Ù�f���#�>�ND�8�*!���U^9�9��7$�Xg���
��X�11E0���2L�R&���8[��ĆHD<�y���u�>6���Q{Tv��l*�|�%ސ��08Cf���A({��CZt� H�U��P�r�i�
�7��:����8W�M;N,U��!�JD��k̙�Y�.�d	���'��U�*8PSç���s�qc�G�d���'8�2R
���B�e���k$Tj�M�����;Qqn
&�IJ��y��Z)c.G�J�,��:_W��;������ʈ%�5�)L|�u�@pd����	؜x�N��x��gS��$�K�谜x?���"��r���.�R���<��n��8#k��Vr������12��Ro>!;�s ��-����-�ͤZ�������b_�B;�yo�="2�LӔ �qў��]�׈�7��~�TJ���GY���*��@$��쉞��8��"�d�.V��8磂�AI�k�=�H� �ר���a;�����5�jm����ft����L� �"�}��<����}l��';�D"��7�H���M����`X���!�x�#co�k?���T�#s$p��@� ��̛).��#ty��tw8j�"2;��:oC��r#���pW@����܂&�c9U.T!�is���z�r><�#:9�����ɩ���U��Qrr��;�T���ڕ���$����>@��T�!�ڲ�I���E��pl²{F�V��[1���]�Wqԇ6۸{�b������w]�ˉw1k�8A)��fͺ�5w���0	�CO���­{]إ����P1����NP`A(ƅA4 oC��z�J�8a1��I)p^OO���h[�e�r���/R3�=�JM���7K���[�Y?��wc��B7��m ��y�3p/ �q�4B�[#��l�);��\�ױz*���	�@O�<C�	��)^�q�V���bS�Se�fԲ�M���/�Q�n���n��^�������Z'��)&���,^ܨx/aї�r�C�����Gn��j&������&+��Wզ ��.?Dt���v�!����˲�����9�� ;Q@7�������Y]?��~A���>tC�C��0�cA[��>Y�t�:|B��/��l�T���u���;V�y1	����8��>m�j��5A� ޔ�t^�x�w]����sv��Ӑ`�e�xWI����8zW�qq��n2+����s[�s�mP~rB��{_\�Ȃ`O�K�*r������/׮@�v��@���A��h�.���"���w[b��bEK�5�鎜�}�I���1����gA���i�\�{?0B��9 �(ݬ{v�8_�8g�*����7������bBb\jdx�Z��^q�(�o�FQ���:���ԐDw_�����t]��y�|��.ܭ�uYC���m���O7�V��s�����,���% (��+\tBӝv�ߴ5���l�HdMz��j{� �
X>+��	n��n7u�$hp5y�N`x_/bآ�7nK� 1R+Xw^O�:�Z�u� �&��c$�@j���N�RD)�Dсn�HL�(���C��J�(Y$�c���@�$����n����Zv�8�Q���ka���Z�˥�ld�m�-�H��rӖ�0^4GF��ׁ��H健'����%���&<i38��\�!���D*���.�t��	�Q��	2�� ���(�i@72�娄�K��b��� b����]μ�>��z�_�vG��oXWX��kZ�q}�|Ӽu�N�z۴3i��qJ��C8,>�������쾚z�dA���b��nf��;�o'('P�@��y��(�C��y���8\��sc�=!��O�t&6J�E���BD@ 1J��2�[q�������X$�i��*q0�dȪ+�� ��k��Ъ!l%�؀Lv����&��ʟ�����J@��ͤ����U���0�L*��D��f�|[z@ʂҭؒDYqZ��{7���C��X֦s��I:����@P�f�l\��	w�x���l�v���x�fV�"���M[�{�'bx(wS������M,}s�Z�:�r�}�-��)����W�v^L0�S�=�?���0xɾk7"2B�Km��}���(���@�d>��-|N�IN>��s���a��
5���p|=��t#�hi5�&tDP�-�:P|OӢ�MDM����b�����^C}���e=�%v�Ь4T�v#���&(����(^��~��>�����Ae5>����Hw^� �z-��|�w����;�.�߽v�!B�釟܆�f��.J��ܻ-���}5�Zu��nk�I�|�Fl(bi�ͤp��|"g�B܄�'fv�Ѡp��uj��e]�gd�	���7"@��ˍ�*�"�F�������<e���>"`�T������姶R��8�ت7��.LL�J��D�NĿ���~��ٳ[#��Ƨ�	�r�NLf0���Ŭ~Z��'cs�s�F�e�_3�Y����	x:��|}%]����	�U�$�O����/����q_Fcn4����V�m����}���WHѢݡJ�E�Yb���OT�l���͎|"Q(G�.��A�	uz�5�(��9}Ȕ�D�t=������]�v�)]��li���+̣�*�^����H4/2+�z��~m��9
��'.��u��Zi�ˬ�+���'�ڭ���S��a�֐Y9�7�/�J0b3��{���qVxW�/2�����u�r�#,�0��s�!&����K;�6�<8�>p�f;�})-�yd����§��9�6��Ʒ�X/��ZDՐ��W��h
+bU��˙�N9�x��(� �� s�I0��z�qO��(]o$n@\��N���ؑ�E�;��c3�U#��`�X�4�����%6�^���(�]��,�2�cT�C����t��DU8Əf����L�7���Wέ�,I�D揳��@B�y���G��{��M�\�wg�V(ÅM-V��� �r��@S��	 �v�Ŏ�C������˝���"���nnbmVֹ����4���[J�E�7NT��c�r*8o���E�U���>eT/��F�%'AXD���F��ԡ��6i
Yyg9}��� ѧ���Bѣ>IC�~�Em��9�*9ō��o;<V1'���E������eu����?TE���n$�l/�X �g�t9���ڜ�ʠ�F5"P��ܙ!��^܋f�kh�ji��w�#� B$0��LbJ1ÇbQ)Fv@��#�Q� q�#��M1�!ɐ}q�bE�I�I6g@L�8�zZJ�\�:`FU�}9>�:��}M�֟Uev����X4c�r�4 �����T" �h.#�e��2��U�< �x���$<���@r]R	ˬOi�j��Of��Ɲ��EH۞آEN@���zS�n���l��2�W A�HV�FX�S�z�H���(M��6��%�����/��
^81}R�����ɗ��7k*�]����7/=X^�>��v��Th�l|�U/?/���g}w�!j*��C�����N�с��}C|�����,�A��^]��!K*��E%m{Y��+�tG�C��A>�w�c*7��jVW��op`;�c���:�X"���+Q��=܉��ghyP�J}\¢Ų|^<� �">��2��$\,�?����^���M��8Q�q�fW���E����q�'���R;��R}��z�j����1���#Y<9��G=iw�n8NO,(D/gGB.D~��#����`�f�O�w�.�N~���:!
�^��ؔ�v��i��2IB?>�>1 NN�rS�'P���+�%�o{�}�p/�a0f�!���6Ȥz���$^�B���N�Q	�H����X�iZ��L$V!��;;$bm �����泀Ƚ�դ�;����ꩯF'>��t��B���_ŋ�L�6uc�6D��w�3p1p�SLy�!2���    ��Zhj�}>.�v5ɜ�s��� �6c���>�nK<��]�B�C�ė�Rad��z�%�=�/�B�B���v�8S��2��n��s4]�S��rZ���Q7*��E�T|�����y�6���cs'\�J�.��L�!!}����1H[}�.����/�Fo�����V�{P���eh���OM;�4ndܑ6��Jw�F��p�N�g�ں��k~���T ?H��@	�*��]����?���
����r���O(b"�uW���	FF�Qn�\iУ�c�"�ڸ�����&R�(4�(7٥�@�ߚ4��K9~kS!Pİp`A{����\��0g�!�wQ=8QENr��/�q�S����ɘ����eԈ��P����d�=:|�V����?��M2��y�ia2(`��w���-^��k�;g�ן�n��Y�p��2s8�nR~6�Ȍ�����崫��$��Ng���q/ޠ��9|׈XЦ/�LYEm��Ƒg��"(bؒU���A��,��,O��8w��GJ����(G��/�N���q<��֤�n�K�w�h|,_�>L�"���^8��3*�}��Pp�����]"><)�wQ�Jy���f�:_��}l��O��Hl:?(ID<_Ͼz��m˟�ʗ�Z���#�1�M�"��,����r�)B"�%��.2&�.V�L{
��Cz
{�⊀��������U�Lt�<,�#�r���Q���Oԝ��H(�Z,����w���ja28@��[��^l�]}޴�yQ@�g�6,��fQj/{����I��7��sW�y!�#F
u�x(H�Q~�H�m�}��n�n���.�Bm����	B˰� �$�S��N�6ǁ��� cS��SYeTz\�Of�n&sA��1MAT��h�Ij��+SyG���d�e\`����-�`L!z�L�J[j��Jj�9n@�Qlk},qD&�L��b�����1EgQ�E���<��d�9.�+�Ss�_��uѮ���}�cs s�u�d�i}c�Ǟ��F /�˺�V@h/����q*�?P�!�K���HIvr��[Ll��"��]�U����(m��s�0�5y���Ɔ�)8��[}ݬ飕VJ�+K��G��
Vؤ�������F+bĥu�e����� cҽ3NA�zŰ��Q����{��ï'�0>�2U�@�@
f-�p�Y%��#�)�����5��ܐ^Xp��b�z&�`�Ml��l��\_���nl�� 6GV*��E��aP���[q�R�ճ���P{�81�)T8�0�s����t���j� �'��V��x��"9ѫ���eV����LnKW a��P��ZV�9��<k���Ej7-�Rq�YX{�D� �}W,8}K@ِ�F�O ��?7�}�� ܐc��� 8���ěP�H�e}���Nܠ�0��n�uVM�Y�Mx�%�W��b7&^�ؗ<p�1�<�\�Q��}T	��h�xWݘ��P[�������R�Ǡ�e3i���9)dW����/�R�:3��ˣ�7T���5��{Q1���		��t=��|��z���K�]2� ��M�'�j#�lq2P����]Ȉ��|'�"@����ޢ�y� �[�4�wǞ���p�H�����@��2�q]�=c`\��'�z%<=u
k��ʮ[���ۡ�����℄֠��|q#��i�n�P�F�a�N�������'Ӿ��x�фߋ�Җ<�F�t$��}uRS?p*������2
��^��"RmA`be�~��?@ݣ���������J��(��֣�]8�sR��:/N5t7��.�̒�N�y̅� ������	����N`n�}�tKax����0�<��˅���tv�t�=����ą�8!�Fr�N�����A�p�%b��ګ|��l�9��nd�C�c��@�NY>�j9����F��	WO��6�w�8�HZs=B*����Ѧ$�4���{Y�Ji�H�c��rں�M#��O
�8)�Sg��Deՠ��Z �z��u�����S��L�㷥4�R������)���߮��Qu_�֦�>V�{�@I�����W����u���A����q�O'�S����fR��iA��FX��E9=SQ�s�A$�y=�z�6��������cဌ��Ɂ���|�v�k���j?�qr )s"�qIӻ�] �x$j���a_�٤.k�jdΦ���u��O�Bx=��
yd[L�-�t�o�n�O�i{Ӛ=G��؋�K��	���l����`���X���E&aq߶0�2N�!0� aa_�r�nTң�Q��iW�E�]�����\>��?9��E|?W�IXŗ�U�-[	�|�����a��Y����ƅ�fe�6���F}��Bo�e,�a�#}�۬Kp����7B����i;����X���{�'��}�+i@���s��	�{����r]�����Bhp������m�^"�y���U��/1�L��k8�I��Z���z�u�V�c�+2/̭8'�O���R`t	��C�r�c	+����p��ˇ��N��5��@v��=��Nho���X�2' �ݖA]ߖvƪ[�-�$��Ҥ�yY��^��n��-jZ��yz"�+�T�ʽnX��	����s5�QL�nX콦�M��J��u�B6mYq$-���b"=.�^Wu��+bY�]U��%�I�˽i!�.�x~�4t���ӱ�dZ	Fo=_��L\|Y�wч;U�t¡�D࣑'P;i߻��E�6@؍߉�"�����ֳ��4nX�w
cFzd}�-��=TTqBsٻs�;@P�=R��FԒ�?�<!č	�����M'�X��DU�vkB��]�kq$�x����̌yW
�qū�²��H4�j��R�'9�eypR�%oU���"���*NҠ���&�B�h�C@�Q�vsh��"�,��D�ޛbޱ���B~���mӭ�Ŝ(��w6���f8�F��mV"��4N��P�v�7�^ׄHc_����N �I�VҚB���d�K^np�3�-�n���Fse˗;!1 ��'���L�b�2>��|Ӗ���f�O�G�G[���w�Z�4	�[D~a�M�_��/-�T���囷����db��T�E���u����� 4*���GD�j�s��h�5�Uja"���a�%�h/k�M$�G��]+s��~�.@:f��I��$�����gx��A��<�����0�]�)qƟdY�= )�Ɵ�(��j�Wm��z�����D�h�1QOnHN�EQm�# ��蘿�j
��Iet���\G�>�3�� Vk�:!C���#�w3o�'i��P�}S
��}r��AOZ/>������r ���ְ�u��gw��I�H$���H�����k!NN��X,YXCR����q�kY���ŗ��\����:r_��ŉf��D�n��V!^GW���,���累��=4��/!h��]�i�:��ˉ�,�;i��T\pi�����s�-�#��D�ޚ�ߚ/gq�p��r�avϩ�!_�~,!\*L8��J��In����ϛb�RA߷x��LR����� F8kL!�[<���+%�v[Mh��@�Z:VH����q�	�����HY��hr#�t�XA_' �ex?V�a�_��
����7	���~�½a��)�׎��Ї��/qD[�������SF�6�=����{q6+���)��n+��(�#k�n���)��np:kr�� 4��jQ��m̨e�I)�n���9!Hl����:��/�Ȝp/� >���	i�P����_��ƶ�tl�K&�B��7']���e�a��B�56IxX�u���"�����	J�KJV��J�� ����ko��L=E
)����*��SH�M�^�w�JHL�S�me���}�3~�z�߃01�j��"�z-:�����X�+��
	��H��K����c�^���g�����aʫg[������}r�b[��G��Fh��٭��g��	4��i:A�]$��1��X�իNQ�<7��ޛ����0*u�^6��_��v#��    i�����=�Nu�B��5��q_F.O��vNDlċ�"vG��Fi�Af�Ic�>�Xxi��]�!��[�,c!`�!d��9,}� #�@<�|NCo��A�0��n��A��W%�Fb!�!�H'Qd�Y��&� h��R"����,F{�{b��C�Ā˧N�� L��#P�| �Ih\�kY���0	�*�J\F�}���Hd74��R�e�?��2��,�p�o��vq�A�0A;+���-CX3��2涛�nK=��	nH���%�`}̾�Y�B#�,}T��n-�d��ɀ�����J-0,CJe��XW}�;'�ZY��K��������r�=��K9t֗!s����I�(F!j���̜f��?��,�2/݈�$7Ӯ�W��Yld(�S�,�d�n�7�������ɠ��L�N��g�N]�B0~-igP�˂O-�z/T	�������lv^GR	�鮛��)�=ɕv�Z�sΙ{S,��j�M�%�(�gȸf����d���0�z��k�-����ʧ��)��}�o_�B{Z�k�^�Sn�k�BJEG��*�h/�2/PTEǇ�*nHr*�+{�����}�"������q&:���k����*cˬ�oU���,;��f�\Zb;��Y�ߣ;F�U�=�hZfu~O���5�nP����0������*gzc�S����;@,��׏tX�����9��u^F���t{�3��5���ȅ��]�YX����y羜����u�`�3�Z�����'_6m�����*E(��������*7l1�%�!G.b��2�̑�X�|���0��Q�ݻ�8�o9^fA�n�C����ۼ�{��WM�$��M����;&�%w�u���ۙ����Gp�H�[���b�Vns��Zɽ�u(��F��"��X�''��ΐ�'��#��/�OU�v���@�+�D��ԣ���n-�k��Xx�}@�)ww�4�}S�cM���}v[6��v�Fy`�����]�oK�ɞ���4�5�۩�r΃l�9y��T�������1ڮ��8�ݘ^���U>�TMy��:��S�j9�&Oի�����t��y�S�^��*yh;���6��<��7����ԯ�l_}���q���R�R񯺯�PS�ڊ��NT�y=���Ռ���������r<����K��2]���!�̂����N^!�/�#�ƍ��-�L!�!6�m�j�@�I��s綽s��{Ǹ�UԲM۬���qU�d"��[��-�:iB<sx����~ߢh��{�'P�:sH�p��I�7��h�^�؍�%�/aR��0B�d
����u��|3bwL:���֗D-�M;���D�Y;�}1�:�)�/ҨG��u�����9E���:M&���R�Z��u+���PMGb�`Ag�Yuy["����X�G0��~�6�0S�Ӳ��m��p�L7"ީu�Θ�d)x��ZSKZ&[I���5Ή�~,�uX���!Ŭ�ur�t}!q*��N����B��@���n���'7(�Kg	��rKM3/�*OH����Q��ʼ�!慄k� 'jz�a�V8*��_ۿ�N�
����G7�x�_����vC"��U,�m�S�4�yF|�I��,l�j�]Lf�r��`��ݥ��v�.4^��̻���z&Ǎ$kS������ Q(�i>4�u#i�b�4��`�$(��ж{���3e)�Kg���a�/�
{*�Xi P(TUf�{oۍ>hQHɐ���� �� 	�E>"�q�j{��8�K�}���Y��q��
z�5
E�CY��W�ȣ0ð���C�B��c��a��G�j��#�,f=����O�,`�Ő������_��㣢�B�B�%@��;N�گ!�?L�ISI%^�!�=j�� ��c�ϸ�90�D��}��+�bW�)�E�ܵ�C��k=l@c�ŦS����� Q$F �犞�����
J��1�������� �G��}+�Q�����(��B�U�c�)��~7��C%�Vź�һ�҉��e���&�Q@v\�̢H3��#X)�aA�( J!����9(5�xWGa��sG�9o":�0�V���e?��)�bć.�?:M����?Dc�X�_D1Am|ZPZ|ǜ(b�pq��QL�T#x�3`˖C+�d6j96��O'��gSG�hܓ�J~
��ȴ�ɍ$�^q�8���>'G!���D��@�ZՖ+ΣX� 8���������P�$�<ډf>0�Ѧ���oX����\�D�x��Ӆ�W���u�8� �f�Gq�zp�����Qx�K��rdY��(�'�����Lo�D$l��Tq a�X�@s�� �
����:��Ǡ�iC+Я(o���<'������G*FN4ӷ�H���	�8���g�^8��L_�n�B�	��y1ԛ:�C/"B����ڢ�$PD�ᜢG0?�^�B��"dmđ��GA�}z� �gs�ݺ�h�/^T�;�,�����q��"dƪ?Vс-������Όq	���m����%���;q|Ff�E�7���ɑ�Fxބ�BF8��("g���"��I։&��䛀��;l�'�����0���/���&�?��F�|��iBq��=���a'��['��Aj��1>�'`46U#�lp�}-�$0������r$zÂ�x��	��A��3�ګ��&��x����Q?%Y�N�q&q��F�8�a�H��������j;b�{�[�k��4Л�/@mx�Φ�s��ѣS#���I�k��c�nȍC<��0��$�[w�M�M	��-ց���#-k��.�a)8s[�߷ͩ~����_�c#���5Ƨ�ı����C�g.#��O��",#�����$���=ܼ?�
�	c���\�\��_`9�b��?
�^Q�-d�����FԮ�=f��ap�֍��J���Q:�{˜u��Z�ً }P~���՚�� �-Vw���H���I3��˸�I����%�'�k6Ĉ�@l�7O�u����nP�=ʮAiP̃]�#�b���)�J��S>� v�*�� �a�E(�zS��ۊkV�O�

;Q�gl�k��Q�z���]-�<��|��5�QH�� ����ݮ��XB���S�F�m��
��F(v�b'�p[Q�C�*�}+Q�?
�-����F��=<�wT���ܳ��%3<)��/v���?^.R}�w�c�r�`=6}�T&����=JWI�}�Z���T��]�?���wB!�(�
�D�Hj�2Ii=��^�`�r�r^�Q�cI�䔂�P�����%�,� n��8]���I��	B�o��2���z�-��0������D1�Sx9:
����2���+w?4e��	�^NRCqh2���a�ŁF��X<�dQ�����V��l���ӄ��9�UHC	����+@�.��o
�	��UE
ǉfʝ��J��q��(&]���i0�2-Mӑ�������H�� LM)^��?JMK��22�)�[j�)��r=-<5�u�����\y��>��h_粮|�.!�V��	|�k�ݍbV
f�WM|����+��Wf����t�?��B��ҋ�cG:�z��^}�ܣ��D���	x!���]��O]��8 e�B,��H���ġ�4�tJx��2�!�R�F���o⭒�Ug6�4_f��D��/�e�������tc�>U��O��Nef��ϻ`(ܟI�������}�c�7Dj����d�*�8��u�X��?�PG�vZ�����E߄�����o���;_>�JM<��ە릡�}����
f�c�z�=�D�0ˢ�o�����.�Ң��Qh����RTk"a&��R�i6nV��l�h6���0]�:�����P�	P�Q��G��*4����jgҸNaOP½��M� ���-��w�`.���{��$�X�gZ�w��K����A)iJ�v����_���D��/г[G��)ŕ0`�0)�tZ8�kʅ��    ���c(��J�KZ$�J7�N��I�Hs#��)�h�3A�0�RH���D�x?ğ��R�ߤ������0�)PF� �	c>��E���p��U�R�*���?羅�H�y�v�8hEQ�A+O��_Q ��&�Mu���gS�h�J(T�!U8(��
��F/'���4��7l���!��7'�P{JVP6�\a�/ԕ�%v�H�(WLx_���k˨dD�E���
9-�c[����p��&J���F��[�6E�ꩯ*���ˡ�
�#��l��Ρ��ŎK���ʇ'�L}�ܪ|�oX�'E����5ZG���f�]D"�b��	��h	����P�`�o6'#�C�s:���V.F3j{�����
�7�߸���x3�JBAjRD�=�i ���9N�2�ϬH�Ș�XH�LH����{Z7���S�i��'��Xy�Ƽ����v���Қ0T����{����v*�%Jh�+��[���a�<m����$��?�!�0�4�+妩�/���Q8�����+��3qy�a3Ȉ��;��2��\~&�2s�u���+�J=Pmh�r��.�2]	+�u����tJO60��+�� p��A�ꧡ�y�n}���D��a)!��/(4}��oSP�d蚏;��)}r�*m$�
�����%��X`�hBB�{%�h����i��v�je��ˉ�ÉA�j`�X��m��B!���`�X��������|P�C�$���G�pM��S�n�磆ov�ZP�7�����V�
�$d��EHGʏ���(�oN����U5~��F���@�wۺ� 	�"�N��Å�k�dL�0YJ{�.w#�-���Sk1�ן/�n��,m(!(���I>(�eL�u���������rof_�ۮ>�Sy�l�x�1�n���l18}Σ�6��ď�c=��`���Q�E� w��?��S�$9��b�>��[yQ����ge0��cq��2&P.^5�߹��8�U/hG+L���q����R�<0��l�Ⱥ�'u��cG�8����D�@_�M]�Jx�-@Ƙ�C�'IjƦ�?��������^�pg�]]�|��g���߫��Ì��٣��_#g��>�i���j�����ݩ3�l�(���ۉq,�^p�g�PH���L#����~Dyʂ�&�@^B�ɚI�����ӓ�8���߷�2�d�����n�O�ț���~nA����l�9���@c�cXH���]d 5<u���&�(� ������U�Bܧ�r��"*]<m�����2�i�qۙ	0�$�8�I����̪���OQ��||px�L��UF��g�9�O	D�n0=�1	a�gz^����K����+�V4<���r�N�(��//|��3kvS�̽�"���������x�����+D@e�ӾO*b'��af��M�R�%`�����$l#@���ND��s�\����ƣ��c皙�g ��B��Hs�c��P��N]�;�â���J�S ���A��)����na�#cK��ړ��Z�,��X+������"�U��"%�]�6��ɡ]�~c�Z�fp��i����E��-S���-v�$�O�@��5��MA�'���by1��7��(����|����Le�(O^0���(��\5��l;m)Pp�+!|V��v�Q�sT��%��٩����n=���ŏ-���\���4����e�v��D�g3��_�HN#f<3iO�I:�4u��A-b(r~Y��P��r��M����R�����7Yjw'-�k(��:2�x�x��_i]ы#�����eu2D�ZoD�����0�yp�����$�p8��H@��L�I�S�V��I�YQK���9��naa	d�p��Z��&�D�e������3ӥ�ȏ�&��(CRGs��؞��.�9�<�gg��@�P����@;mG�8h��,.�_�F���;.��d��E��J0Le/U�C 3��u��Y��+üT��жЉ�ƽ�e���125��u��"��}��P�(d��E�I�Z#mW����S�2Ԕ�䵻�����j�R���K��|Y����e`�NU:N�L��k2���Es�,G���tY���4�Д��s��.�� �� ���Е0��}j��סQ�m�.��ϴΟ���\_�{qlx����?�12�{u5�3W~���N�x
D_�Ý�+`���|C�'�_v��P �j8R���
:_�\k�Ʀ��}"d$���z�zEؽ��b�)J*@jn���seZ�9&����cL,.[%�i,[�6s�e��Rc�nͳb$��Z���"�Җ|\����������4hm`� ����~�(�t������l��c�u�m�
/��Mܘ"g`�υX� �z���;� �z����;S��n�
6��!���g(a���[+�KӮP����֕�K�l���S��:v����]�\1����~�[q�ʔ̉?���
�2p⹐O��K��n�v�筜"���8s2�	s�k:s�+�c5=�$9�o�z~��)T}�		eY�/GKY}�2_O��M2̛ɺ|���K�+Ku}��_�{Pf�<�&��LEi��>�o��K��
�����������h�x�5�z���"���m73Z�۾�d��I��O�Fr
y߂�~�=���A����w�\HdK�������B_�#���( ���="�u�^�U���b>;�դfbA;���A$A��r8~�j8,����Mhn�J ��d���2���6_%�	��M/��r���@r��������КV���uf+��s� �9#՝���`����(�`9k�-n��}y�|n������J	���X��|�94������P�8̬t�|���|	��r9����ʟX�g�%B sq�T���E��͒�j�CNq�;��;%ѓSL��רJo3+��܊���Y��9��M�\��������0hS�)F�`��?A�\��EiDư�:��Pٵ���P��1%g����q*$�͋��F��uFfz]\��׻F�8�b�u�0�Û�$��]2 #ڍY�(��"��w�s{�j.�)���Q�p����Q��&a�닱5|1�?;�F@ɧ��J��]7l�`q%��b��D<S��M�+9��Bp�7+����K�S�mu�����r��Y%F��)�~_oif��ya=im��3/�)֫�H�r�ee�e��	z�c����]dDh:���d��@gb�.Գ���)��X��|T�q�X2��z悑���z���K�k㚥���pK�ʺV@P��m䴕��h�Uސ]2Rdp�vר\�49�^�2���H�� ����Y-\G�v}��$,곡xY+��IP�y�Q��6	�>�k���&�)��Q��Qu�p��a�9���61�'M=��s�s`�l��S�q��̅��/�C���d��G���K�@���4��4y ��^u��D=l�>Pf�М��V9!�ߠ^%᲋�6�li��
�mz��({�6]�'^ܜU�qj�9	�}����)p��%/k��w̱圎{�rj�z.?�l��l�Z(m9��1��뺐�b�(ȼ�m�2�+�r��j�b!�� �"������n�V�,d������p�r����ְ�
!,4��{e��Bc����f�C�,�7W�lf����Ry���_�'v���A�
Z��R�b�J�ıٵsue,&�c�2Ϗ�&����جI�O�g(������'�O�)����<*S��ؠ���:��Խ��ԓ��������L���D�J�N���X��A��}�l۠�u�+�������i ���!�����WK��ܹ�ƫ�m�%j��e/U�²��Z�l!��
���Bҋ�o9f���UlZ�����3��_�T�YH|UP�V�m�{�@�:)i5��jP�f-Խ��ΈG�PC��f���J�'X�|5�I�����QSJ l[�z_ClM���o����i�`��f6�lv�Uڼ��m��c��.~���uC ]  \��%��V��P[.��?�
 	�i�O��/r�-Y\�HM.C ��&�l��p�+��%��0oEC+[q����8�d�"h�����Q>8C_JK��>)����֥H.��Y�~�X����JF�Xf@3[�Œ^E���<��X拿;�d��K;W~2����cp�h�����i���\W��]���?��b��Dr�	*�'�YO���@c� Yy��	��c0�	 _��C?ij�w��ɰ�I�� ,�F��3�\�X�xJ���?U��z&L��ƕsNa��]��{�))T`�@_��)x5j8�V��ʂ#�q+�2��(�m�&������O�����8P01d���lwo;
�ҳ����=�u(ك�཮���ӿ����gK�� jv��v��q��-�V�}�;:��O'��(w��Iva���'������S���f;�Op%�vҘ��ʖ�ɣ&���CK��Mf��E�bJ0]H��2Ǽê^ �wGK�F:n��qK9�҉v���1m����I������Fx&9�'	��Ώ��I�s�֠ �����W����ݻ/HU:�	Տ��E-�.���MA��e|���j%P�K������5µ9��O�������3_��+��a�Q��T���_�>�ys�rIڵ��r�h�|lab*��Keɣ~�y��:P�G���4��f-�����7պi�N�����F<�Z���C��L�6�Mğڃ�(��mƫ����u�T37U\￸%��*�ٸ�/�x��2{Br�[��i��V���_O�sg�H�4��-^�S����1��"�FXw؎���bztU|1���w�}��x{��      )   {  x��RKN�0]ۧ�]�j����E�Pb��8J�b'Yt�8 +�9
�bB�ƕZ����͛73�d�^s(dl�h�L������������M{At�S�n���ֱX��y�'[9��tp�����{0[y��d�i�K��t	(���~�m:"�(4����R'ڕ����ZX	<��K���)�A�����M�?�.�.�4�����>��~�L+�c�(���G�A���N��1�%�`�K��EW���y��A��K����m�l�g�,��|:��cv�L0>�,����"qA�dcL27q�+�^�G"�8vV��|�ౖmh�=��Oy*�+�TH��є�:&GŐ� S��$F䦒�?��Ȩ���	��_��,      !      x�M�[���nD���bC������H��	�F�K�j�x3������'��7��_���O�\����y����������~��~>���??��|ޟϿ�/~������7?�����營������x<���>��N�	��>s��ᇎ����?v��<x���}���Ï�~�x�>x������@ ^�� L��0����O����1����@6�k d��@6�k d��@6�k d��@6�k�0h6h�Aà٠���Q(�h��� ����4m0�w�ʴ�`����y�K���,�0�w�������7U�G�}�γ��=��<|��3��Ӈ�>��<~��3���?�� �2��@X ��	2���l�qd��c` ���A�10�2���l�qd��c` d� ��Ǽ�/z�}����}���;xsv�ާ������0�;x�q.��G�����|�����������^�ţ��>����Ϟ/�����/����O�/���Ï�/����ϟ/� �/�B ,�/�� L�/��@6�}c 䋾1���� _�l�/��@6�}c 䋾1��E����od�|���[�`�l���5莣g�1��6�3hw�Ҝ����+s&�q/�Y��.g3Xw��`�A�����I�H��ͣK���O�[��󇟿֤��@�Ia�Z��
�)=8�jUz�KԮ�`��e)�cd'h���Y#K�@C��h��J�F������D�!kd.h��K�FBC��bBh4kd2�q���_-Ѝ��$-�#�1����8��8�;�p#���y��#�#�1����8Ȩ@�#2*�Á�/�B��
�����#`3T ��CҀCT ��DҠST ��E��cT Y��h�HGC���ѐ5*����Q�t4d�
��!kT Y��h��@C֨@��@�Y#��W��vf��r��Y�x��ngV;^!�ۙՎW��vf��r��Y�x��ngV;^!�ۙՎW��vf��r����3ARa�V�v&a�jg�v�v&a�ￆ#��v&a�jga��va�jg�!kT;Y��Yh�w"5�F��А5�����Q�,4d�jg�!kT;Y���h���F�Y����z���ߤ3ѝ('�I����ɤ�I��b2�d�d3�w2sr��;Y���r �/�wLΝ��ȓ�zyG �pP+D2����C$�")q�KDR(�����"l���oF����Y����Y�����N(Gh���Fh���Fh���Fh���Fh�J�@C�Pj��R#�h�h�h4k���¹����&���$��nn���y��ngg;����v�]s����ȫ�v;;ۑ7��vv�#/����lG^4���ՎB��
B!���H0��	��C�#��v$$�َa�j�a��va�j��!kT;Y��ih�w"5�F��А5�����Q�44d�j��!kT;Y���h��NG�Y���h4kT;^8��9Վ���vN��u�S�x�<n�T;^6��9Վw��vN��U�S�x�<n�T;^4��9Վ��v��� !@H��BX��0����Cء�@�!���DX�ڙP�)���Eآڙ`�1�����Q�L4d�jg�!މԘh���DC֨v&�F��А5�����Q�,4d�jg�!kT;�f�j�.���U�S�܅�ɣԸ�;j��]8�Q�(5�����G�q�w4=J��p���Qj܅�m�R�.���x�w㌇/�/�G�p���#�X6 Hղ	D*�I@R�L�
��T1�@��9�,���E�T4�R�\����E�T7�R�\�K��\�K��\�K��\�K��\�K��\.�O{pi���v����>���b$���ͨy�rtu�^�v����F>2�v����R>2�v����^>2�v����j>2�v����v>2�v���~>*�p�Gz�G��� $�j�H �i5A�dZM�&�V(J�ՄJ��i5��dZM��L�	�i5ᢟ�$]��pɴ�p.�Vk��J��"\*���p��.¥�j��J���p���|_�~b���H���V���C���V�o�C���V���C���V�o�C���V���C���V�o�C���V���C���V�o�C_>���H��G�Q�t@�ʧ#�T>�����&�� %@�|*�J�3`	X*���p�|.¥����=I���p�|.¥���g�"\*���p�|&.¥���g��p�|&.���T�lp�}X�]6��{!V�lp#ߍX�M6���J��"܉�w'�j�.��k���b�݊��b�k����Z-���X|�b�v��`,��X[ ��P+���m�fȏ���!�W�D"?�n��D�ia����m,��qu�`�1���ѐ5�Y#?�n�N��FC�ȏ��AC�ȏ��AC�ȏ��AC�ȏ��AC�P�J�!k�����!k��A�Y����uEv����wFv�I�R=�v'yJ��~'yJ��ɸ�<�z�y'yJ�t&�N��L���5�dr�$�ɞ��m�ޓ= yP��V����!�P'e�Cءn��0D�a��*(�uVX�-��`�1���А5��h��N4�;�BC��v�А5��.4d�l�Y#��BC��v�А5��������!Y�b�;���Lڝ�C&�N���d�I>R&�N򉚘�;�j�ɾ�|�֙�;��p�����EYo u;�BX�^�C��^��Cء^�D�^��DX�^�E��^��Eآ^�F�^����Q�zGC֨W��!މ:%EC֨W��!kԫ>А5�Uh���4d�z��F��Y#M�F�F����f��5����n�����Lt'�4�v'�4&�N��6��;I�)&�N�h6&�NRhv&�Nh&�N�gNOn;߹Y� �0Q+T;�0C��p;T;�0�w{�DX��YP�)���Eآ�Y`�1�����Q�,4d�jg�!މ�Xh���FC֨v6�F��ѐ5�����Q�l4d�jg�!kT;�f�j��p unֽoR�f���p unֽmR�f���p unֽkR�fݫ�p unֽiR�f݋�p unֽg��B��
��Br`3d ��!쐁��0D2$��x�Sd ��"l���ƨ�Y#�F24�;�7��F��F]��F���F���F��F2YC����F�F2�f���2�pN�S�f���t;un6�nN�S�f���t;un6�lN�S�fû�t;un6�jN�S�fÛ�t;un6�hN�S�fË�t;߹�B*��B�3a�j��v�va�j�!��va�j�a��va�j��!kT;Y��ih�w���[А5�����Q�t4d�j��!kT;Y���h��NGC֨v:�Վ��@��lx�\��͆���@��lx�\��͆���@��lx�\��͆W��@��lx�\��͆��@��lx�\�;7� !
a���xL��q�8����1�C��c"��ϊǄ"L���E�"?)�0F~P<&�F~N<&��Rc�!މ�Xh��!�Xh���Xh���Xh��	�Xh���Xh����Xh����Xh4k��c�Ѭ�/���Թ���N������Թ���N��/���Թ���N������Թ���N��/���Թ����wn66B*�
�΁!�P����"Q�$��΁"LQ�,���#�Q�4d�j�!kd;�AC���F�34d�lg>h���|А5����!kd;�AC��v惆�����f�lg>h4kd;��q;un6�o�S�f���q;un6�m�S�f���q;un6�k�S�fӫ�q;un6�i�S�fӋ�q;un6�h��M� ��P+d;S0���)���a�lg
��D�3E�"ۙ�"l��L���v�А5���А5����x'R��!kT;Y��ih��NCC֨v�F��А5�����Q�44�5���p��,�ټ �  ���➛ͻp��,�ټ���➛ͻp��,�ټ���➛ͻp��,�ټ���➛ͻp��,�ټ�����fs�?�1�<*�H R�D��e@�T/�����(U�@%P�d,K53p.��E�T5��'�2q.���E�T8�R�L\�K�3q.���E�T<�R�L\.��¥�R�{�>�s���f��>7�{n6�>�s���f��>7�{n6�>�s���f��>7�{n6�>�s���f��>7�{n6�>�s���f�.�>7���G�p���#�6 H��	D*�I@RimL�Jk��TZ�@��ڰ,���E�TZ�Ri\����E�TZ�Ri\�K�up.���E�TZ�Ri\�K��\.�ֺ�j��wn��|����������f�n��W�߹ٺ�j���wn��|����������f�n����߹ٺ�j���wn��|���V�?�x��
@��g"�H���$�Y�I`��� %@�|V��d>+`	X2�%\�K泄�p�|�p��{�.�E�d>K���g	��,�"\2�%\�K泄�p�|�p.�Oå�R�4\.��i�2+�������eŹ��s�U��87�wn�j��f���V-���L߹٪=V����a�ZcŹ��s�U[�87�wn�j��f���V����L��lu�T�(��o�t����!�P����?OӑK�ߧ�P�)��t,��ja���z4d���z4d��@C��1А5���5А5T�Y#?�^Y#?�^Y#?�^Y#?�^Y#?�^�f���zM4�5�5���N���ٙ�N�i&�NRiN&�Ni.&�N�m&�N�h&�NRh=L��$�
&�N�gɓ��wn�B*,�
�΂!�P�,���"Q�,$���v�"L��q',���#�Q�l4d�jg�!kT;�N��FC֨v6�F��ѐ5�����Q�l4d�j�!kT;�j4��un����N�Nc��$�t&�N��`2�$�L&�N��b��h3�wR�s��;����xr_���l? �#�
����0C����!쐯�~�C䫾$�����0E����"l���~�c�_24d�|�w�!k䫾�N�F�!k�_34d��sf���Q�,А5���F�E�@C֨?ih��kb�f��5��F�F��غ��Թ�Vc�;I&u&�NRI�I��D�d2�$����;I"m&�NRH�ɾ�j�s'����wn�B*4�
�N�!�P�4��N"Q�4$��N�"LQ�4,��N#�Q�t4d�j��!kT;�N�FGC��� �F��ѐ5�����Q�t4d�j��!kT;Y��h4kT;^8��s��}s8�:7�^7��s��ms8�:7�^6��s��]s8�:7�^5��s��Ms8�:7�^4��s��=s8���lO�T�(�*�	C���8�*�	D��H�%*�	E���X�-*�F�Yh��BC֨@�H����Q�,4d�
d�!kT Y��k�h��BC֨@6�F��h֨@6�����t;un��oN�S�f���t;un��mN�S�f���t;un��kN�S�f۫�t;un��iN�S�fۋ�t;un��hN���B��
��B�s`3T;��C�s�CT;��D�s�Sd;��"l���0FԟWEC��v΃�����N�_R}А5���!kd;�AC��v΃����Y#�9�����@C֨?6h4k|m�j,R�f���r unv�n.R�f���r unv�l.R�fǻ�r unv�j.R�fǛ�r unv�h.R�f�{�r ߹�B*��B~^|C�!?.>�!쐟�����K�g�GP�)��Ӱ[�'ŧ����OCC��ωOCC�ȏ�OCC���А5�C��А5�3��А5�#��А5���А5���ѐ5����ѐ5�����h��O�OG�Y#?>^8�۩s��}s��:7;^7�۩s��ms��:7;^6�۩s��]s��:7;^5�۩s��Ms��:7;^4�۩s��Es������T(���C���8���D��H�%��	E��ڙX�-��	F�ڙh���DC֨v&�H����Q�L4d�jg�!kT;Y��Yh���BC֨v�F���h֨v�Վ��v���x�<n��͎���v���x�<n��͎���v���x�<n��͎W��v���x�<n��͎��v���x�<n�;7;� !6
a�jg�f�v6a�jg��va�j�@��va�j�ƨv�F�sА5����x'R�!kT;Y��9h��N<2G��7�C��z�f�� ���Y$���A�L���>�����&3y��-fͳV�ͬ{�kv����<ӽ<����Y���ӷg��g���xV.w���|}�7&~`J&�	d�o�>M@S��	l����O���_�}�N�S��<O���	|��P %$���JH	!���ϻSBBH����R		!!�u�B_X!!���B_Z!!���j}q5�B����?���W��Z����ʻkk�|�_ywo�����+�.��s_yws����ʻ�k�\�W��]�� ����?� �w�����[^&~`J�#�|�uh����M`�7�	p��:��Wހ'����>_y� �+o $���BB�+o ��w��BB�+o $���&BB�+o"$���&BB�+o"$���&BB�+o"��ʻ�/�t/��f��<+����fM�f�ov�u�J�.��ZӽZ����Y�ܵ�wk�wk��l{V2w�������lx�t�Z��L�,d�/�M@�ŵ�	l��68��F'�����<_\���k }qm����FH}qm�����FH}qm����AH}q����AH}q����AH}q�B_\��P�Z��������~=a�      %   �   x�3�t��KN-.>Ҝ������X��W���e�際	9���4'�X!�𮤜���b.cN��Ԣ���AJ���%��&�(�V���%r���W�H�υ[������	T��e�C�g�`3������� L[d      *      x�}]Y�$)�����8�{����1�H&�����N�%����W��W�_���/�����_0����R���c�_|���(4Z��U�_$�4*@B����@Z��o�K�3���5��~#���?/��sPS�����6hD���W�̹��}��_�ͻ���N<=�O2~l/i�\�Q�����o�ʹ,`�wJ����{�F�u�� �/+[`W���:���G�P�9�3�/v�
a����C�od�'3���6k"#DE�_�S��"��2OL��_�5Ś�g��$=P�����k��M^{<Fhk?�\t���_�ғ�i�P��C�Ì1��Z�+��w���7��Pd`j/2�td����1n ٴ��%�ݭ��G��-�y=<���B�_�;����|�IFBңk��w���Z���1}^ϢC������i!Ϳ���>/�̣	9mho�`M��>�L����x��0��G'�7a�P��as�-v����>)�C��7����/$���^oc��[�^�9�y�ʍ����wZM�Ai.�]����3�s�_`�y��G��O�:���P1":'���@s�$���ˑ��>�	9��6����A�F���(9���H�A��+��c�A�r�z˷�@�R�Cu����bd\7xN��p�\��s�&T�����F�z�As��J@��4urx޿��yR���;j"m-א��B�4�5��◫P����VL�WS��f�B�������]�l`��h/V��Y���\����d]O꟞'�&C�.�-O�^':��3x�zG�j�ڤh���C����s�D��#�:��iȼy�5����nT��lh<�G9(5�S6=�׋3�Q��:A#�͍�&�)������BJ�?������;�+:�,B�;�=�斔�<�X>���eR7��|"|l$��4��|K�]Hw(����E�O�w��Gq��%v�Q�b����Œ����iA������]hQ�V��ӿ�0�z}��x�C�����qJ��+��+cPŜ�Ф)�4���L�S�(��J%�e�2���'3���ܧ�9���X֝ߟG8GL����1����=��~��Ѥu�GZS�?�[���[S���U��16�en��%��Au����F��B%<�1$b'/�¿8�Mݨ��"�]E�Y,�m��'[�"���������M�\��W�75�h�#���%P��6Xyr�+ٽؤ��'�=���jN}ް�iE���d�m����V&�@9���^1 VC1�@��� ao�Ѽ���h��tGH�|8<{�@bp2T�17M������^eQ���҇�4����@oOJ*�婼h8(��v.��|���?���;4�t{|�8Vm�����3�(����+��I�m�qG&��G��
����3�;��9���,9]I*9o�0j�g7��>9L�}�SXk�>��3�׍����Hv��U?u8��<	�`�$L`�f��sOJ������u*��=-���\^2`��ys�\r_��(n���p�7!l��P�H�9���U���o�ż����f=x� y���6��O�Ȍ	u�X�]�7��YL"J�H*�K���	�5f�/X�@'� ,)Eb���%V ,"�4bћ�O|
C�*P	��GV=+��Yjԝ9v>���|r�Q��#4��N��h6��\'��Q���g��^[Է��r�� �.o\v��|�F� ���	vB���PN�-�l�0�9"n���N�=��B�Q��yy*-3������Q/�a����6�Lr��� "����d���/��H971-%kBs�a��3�˜1����SҚPX&iw�:nҽ^��4�[�,Ή[ '�*�&DCa7�֕c�#u=�p��t*1	���R�5_̞9v��S�"U����d^9sB���+�ME?�O	,��Ds�3
Z3�A�� +���r�w�cA�=C�)8��L5{LMmBQN�VVUF�0�����N&4_�֫�~�=��V��5��L�����X f���3q'���c3֭S�l�_.I�<��Ej[�����B
��qs������f��8�Ҷ��T`3.��JBi�����mT�8��Ӓ��ͱ}���G��j29�<�ڷ
�p��0)#�Tsu���+*���x����E��a�D�s���v5��NcJY�9ò~i�h&s���x��^G�@`Ex��� �V-��؂c�1�n#1�H���X,����r)�X4��Ȣ����\����"Q�4�`�؈J~�t��/�8��~�]0��(��^3d�(`ݽ��� ����PRz>O�1���`��E�؜�G��
{ �
{�nhj�]�D4�xP���u�����OI��,�S9k�ch\�k�溢�)���|�]�p+�������e���"Cd�&N~@��M�V����V�����B��4d���9��
���#��Qչ�1�l�f�k�S�;7��-��n-лGyn{�q x1K�O�6) Լ�ϠrzM�B����8�gj���t��m;�𲻥���U�	�f(�2���>)�I�&k(������D��ykv��7E�>S�1P]6��=΃>9�O:�Ȫ�����Dʨ��<�5d �y!�=�LM>6���:Ž��Hٞp�oZAd��̞��7���A:���6���^~��z��'FA���)��|��!y�$�\*AX5��gR��&RO%O�����5��>��X(� k����#��S���*�Oe}�I��*
�%{�~L���T	��H�4��Ξ�칇|�M�z^�~]�D^�n
��,fq⍸�j����OE��DL�v���4��x�8�#(*�ȩS�|*����5x���߼u\� �'�$-�֬K?E��S��p�����{b��I�'Mp~)zi��� ���lqi�\G3k�Ek�y|RpD���r͠]n��V��T�U�A�{I�����a�L
��+~���q#��+a���ABi���S5�fu�H�R@�E �	���
+Wq�b�Ho�P�*� D�$�C�U���qf6�ۄ�8w��L"S֯%:L|P����$b�0�[���Mh};�I^��	ice+���%�%�S�k��5����6�UlU�.>9�X�OJ���6^����!�\�����㑐"gM�P:ܔ�R^�S:4��~]<�v��A��BJp!J'Ql%j�)��W������엂�i�CQ�Z� �YiI"�ҘQ��M!���x�AFp>F�«�_ք���l�A����A�@���d)8�o(��� �dm���>��kz�	o�����k�oE�Z��-t������_��7����Ai#���=�X��<@���A���'�[�ܮ�C
#P3���[6QYP�Oc��I����~fldq�z:���.K���}̻?y�������H�V����>,<�8u�9��<��4��pgj�Q+�:^��'ߤ(�v�����܌�˹O�y�>�N�;���T?ɘ0��)�'� �z��g_�H5B�[��� Y	`�H��8'�᭬�oW�ņ�AuC�~m[T�`�)@b�`y�rv&b֣�E�>O�1��Zw���{͑�d�*#9���	��r;i81����m������M p�1ѽ�ib�����i��K��������NO/ۚ���h@����z���̟�o��APW��=��3_? ���u��
'��7?��]'�H�p��6o�p�o��!� � �\�H0�� ��?��X�k���e����ի3���P	�J#%��*������*#��^�C�i��c�������2�V�%(�ݩx�������P��]̽�#��^�11:b�ǀ���uP9��m���F9,�U��������3!*?�z�_􁼓�KmM����$����<7��Bs�I��O���?�����J��kG�Pas��$;=O� �V���('rW=#��_,K���
z��"��rۘ�5b�3l�ʪ��9��窼����}�è�c*)�8z������Q
��pr7|��    ��X����Rƿo`ǡ����_��������X��*</���*��V��'>�Ġ^`�D��J�x�y0h�����կ��CL@��>�p�s�ER��U��0��ƓC1�Lґr���z7�����Ğ���-t��Z�L�C�)�6�T%Ě�x�K�kL��7���=������U��ì���^s��:Q��XX{X�2��2�х;��K����N@����4��n���.C6���I�k��3��;�O�d�H��������!���y;�4-�6*��d��Q$Ҡ�~�sz�&dB�ZS3�p��}��M(�f��וfw{0�2ŁP;m��{_#_p��*�	4n�ڿ��Q}ۃ�����
���-j�蚗`������@�6�p{U&z_6d"Մx�I����ϑ�G!Fp��L� ®cրV��dVٷ��>x[o5S�ڢ�@�N�i7����Dċo�Ñ'��T���J�+x�x�e�i�b>��	SB�Z,��꒲yZ���NMM������ƃY̻|�$����SIWS��9=�l���������d~W^�ۺ9^�n랈�0����#�!Yg���)T�eA���Z�Ρ���� �sq���H7"��Cd�ۋ��>mM��w� ���LW�0�*7��a��|sb ��	���9қ
f@zw����7�Փ7�n"7�9!q���"@j��.VZ�/&JF d�Ag^��t�@y���/��	`j�]�� u��-������R�y� ��w���\ ���&�����pj$Y��;s�������!g�P(S8�8��$��
2��!���o�B�t�&���_�������~:R�ۗ1_�!~{7��b�NoWNt����P6��o
a��{�ŗ�Y҅����Q��u�Q����zĐ3�>�K�]-�##����(��3������0+�|�����$���y#�{E�ۘ��l���E�]�r���G��#X/2#�)A��Wk��h��T�I����䟨�����k{*���b4�h�C�S�/A���4�L��a^����,w�+�033T�����ئ�!� ���TF	���3�/�X{�0:�?��UF��Ta�f�f�$�Re~A���]ش����72��E�Ek'�n5�6O���q�7u&��+v @�ݙ����Fe��]*܈��}��Jz�m�{: ��IRh�*AK ��(�$���K`d��>�ND�b@��"�n����_a����Am�ni7G􈰃;_�㔽�S����
#�� `�Wc:���+x���o��e&C�-���+/�z$CsVO���YA��K�OO&>S�_`u�݉�`�b�w�U����$^���X�9}�����6-�!�V��.:�`9�J!�����Tc5u���4�ȥ���_ICL{p���v]�'Hf�͆&��*���T��!oy/1�
��"EH˻-X�v9;���F�N��Ƅ�#�������c�S�W�'Pq{㮧��ܠ��`fK8�z�-�G����E�&��C�VPi�ūB��V0�̣wb��'�Kg�A��5�L0�2rr�Ĳd~]�������n��D���*��4��\�_!xg`�����11��|SJ;B?�����m#Կ�@���[��&iQ�a�O+�i��B�Ģ斴wi=�'#'EPq��_�$�	�3�Q��+��*����yf��'�)��8:)����~3��'Û�r{">��<=m�8�

!c\���5�)؄#�v{� ���f_\�� �u������0Z+V��bbl:���=��n��	I;;���/թun�'�v�mnj�3�B5^�k���V��X<�.$q{���$ 2���vU�4/��p�9�D��x;��㘐�ԯ���5	���,��l���	H��NvԮ�p!%��Oq)���t|qy���X�� �8MLJ)���ef���R�P�������_�RK�Z�I�.T[��c<�}�>0��b���"W���VJXˋY��[!���)�|��0�l�`�r��4V���A��M�r����bM`��D�gI�:� ��(��Q{��@�餶'�A�Dc��y����J��� �ƍ���2�Yr�wP����>' Ǔ�DX��KB��mn���QY�j�?]
 �;/GɧZh+6_��s�Pw�'-��GLH%H_tv��?�@7$P:�{�4j	��*���*���B�R��*�	�-,e��>},����C�Ǩ���]��/+M��Q����F�U���Py�l*�'����<J9��]!���`T]ۜA�BQ��8������t,��ɑC{�Ə ��ViSq�gf_G�~���x�s�v�^��o]bATw�éqC�86�Z��^Ӕ��i`m$�dUUg`��,H��iO��w�����MN�5
g09n��su6T
;`-��7��<M�dS_*�T=��T�uW5ݝ�TDy��� %���|�=�#���\���|���l1&^`*W�D���,��N�"�#�R�}�r��Ո��A���g�'�<�b��g*5G<�����x��`�����%F�ָ��m��ku�a�����*{����_�$�1%��b�.�!I��0fF��K���27��\}����%�c�"��f��!�w{���ci�C��'�Ȇq.�pr��ʧ�@�\�����Z�4l3������|flzȵLq���9�D�$��p�~��ى���oШw��c� D1[���@qȸ0�)=����\��w�Y�c�]M<Q��	M�����pA�s*H%l_<w���K��8��I�Q+�i��B"�=��ROe��~(#4R�f�������N�DN<!�JwK/b��s��+��<�~���k�_f���ص�P$*�(��~��#~�Gi#u�ী�n�V9�
V��_i"�h�Q#�r�tX��U�\��?n�'0�ӥhUCiR��1�O�ݵm���gT(�K��s�Td�7�����+�K&\�iDw��!lD�d�E��ǹ�|�`|�E���P>�;Jā+�C*��뮿���+�*VB7x�w�Z��6t��!�!�K�k}�=��?��@ '|�<F���u䯼퐓@H8o�����q�8�Mjub��x���U_V�0f96�?�b4�b"-��{Sr�����"�'���y����b��O���g&�޴��Ir��.X��U�F1n_A�ݐC%��!�'-ǆ�#ܰ+�iq�/a�YZϧB1�_����aɟ�ʾ�j���z�Dݖ}��|��8�ӽm#a�q��c�_��椴A�葠��[�簛� �[��cEA�Q�ūBB��x,���+/��!9^q�_Ne��z�W���b5C~�*H���i�J4�k��(���d<=$y�u���y��]Rn�:�`���ܠ��۱�wk|C�6�v���AM��ŀ#�F/\*_�ܾ�w]$�ƵJʄ�E$�[1����*#G����u����X��!�bWOi�FڦtXZH-�#���v����!'�ƍ��7	)�Q4ھ1uY>�E�Ü����.�i���J�9�\��<]O
~K���Up�Lt�Z� �U<�HB�4_TƆ�K���'��>�#=��;�(�v[�w�)"f�]ah��[Ő�s�ݨ�iҎ�3�8�1쎰�{c4ړq����r�|��#��U������(;H
���Q:V���^�9B��ag-&�k`L�̊؈qi꾩����Z�6#9;d}u�)=�M�қ�yZՍ!�>e��L���[;
��8#�&�Z��x�������Rd$�]�ҿ!$����1�Eq��6�$�N����~��<T~<mDR��Y:�tK+�f[�I�P�"��:��%�Y����#�1�{ȯX�4V�Kj�ĪE[��ꥑ���x@�]Ɉ�� a���ϰ��춾�[��ZYB���U��sg��?���%֜������bиz��îP_�{ �
9�������"�,���"�i߶#ģ ��E&_�W���ɗ�)��Πq���y�S    /��%���(��	�
:�s�,�l�肼U����9`���
h�����ۛ��D?�lٯuJB)�f�Ų�2�ħ�2�+ľ�2�^j��7�g��yϫ3_��[�����q��h9�f}�$4�;7�h����.P��{��_����tj��n�2�3�^!gA��#���1����I^��$԰!l�nz�Y�-����%m^����q^~��(�E$�;:�M��r�'���e�g��t K/�A���AG����l�A�ٯ��7bN�\J� �x��8����q���kV����Tؑ�/���L�-��U;���0�#��ܱ�5e���Kem�ݕ�\��a{����L#i3̧�A�,����WY��X�l5�-�VrC#`�߾�����_u;����ħ��f��2z����Σ�����h��3��4n�Б�4Pq4"h�E��Z����/H������g,���`�@�F
^K�red��z|��V�'�ɯC���oW4h�O��|_W���S���A@�Z8�ˣ*4�b�:#�qd����F��+�V��#�F����N�fH�}�XˆF"�"�*���~@P�3ySP�d��a�\P$�N�naG9��?:\�yr�J�n7�c�~�ⱻ�"KSJֻ��|p1(�*�3�"ھK=΄�H��)dZ��r�o������u.����]�c&�z�����l0NBb��$��f�SE��
X�R�2�S���~^L{+o;�vy5�xt<ڲ�#�?�2��n�,�H�3�(�3�����®m}�J�x �"ݯ���'MG��`��n"�G�����2����o��0�C����'���-�>�È)����~R"��cS_e-ŴW���n�lM�'��� �?{P�aᠯ����}'8��3��6�������n���i(�n�b��)�T;Cn����N��=���ܥ��3z֙�v�3:'v�?�;H��ѽh�^�둗��o�n6���*n\wE5����v��v6졏�%�@���A�P����^�Ǒ@�����ލ���c��OH!�J)��La[��^hPקZ������z�-���Q�� -�v�.g2*uq��Dx�G�J[ন͵�-���5'���pP�$:�n��W�e�i�V��J�[2��6��hV���-�v=��fk&�th���,����ID�I؁�ǐ��_�VӤE�B@�.��fX���ݞ�g<o�c�hۈ�s�EBdR�sI�÷����w�"�DZ��I	�L�a��>vQ�3�v-����\�d���B'MW�Hn_C�q�O�_��!�q�|qS��������G.ŋT�sO�φZ�'<9��؝��M:���:�)��~�"��Ȇe�M�X�n,R��Xy�9&&�=]��ʸ��NlI)2������E��y�@�ؠԧ0u> [��J�N`��S~>�o��r��Tt�C]2*���(H?{��`�k����\���D����;X�]w�X5̮�{�F�BH��2�ڈ3H����bo���
�8~����9ȋ������w��26~K��4i���9�є��g��Ub�(+�O]W�8@��^P���V1��ƛ	�v[��}��sc�0�m���I� А��e��lȨ_�g:���ڋ��h�Tj�L�֦�܉t�u&��M���"I���>I~��ǧ15/@"80Wԏ�p]�����8N.?��TViҺ"�4�ļ�}�0|P�_��r�f3A=n��b�K�4�����<��̀��zݕ��o<hB0�;x��ř)��ʋ��FƂ���b?�e�L�zw�NFg3eʓ�Qkj#�On��`t ŧC',���&f���*��>�~�P��h�~����U7*ˇF	$}��y:[��{�����Ҕ�&]-�'-����:Pz�G�T]�[H����/��w)IB�:����!���q����h���z`�^�|�� �	Y@kU�P�ľP-W���L]~>�\G�[@]�O��JD��;PTu�]����1VR���V �IE���������:U�/���	��v��)�!��5�_5���`�p�$���T�����Dw:l�+]���{�^�$G,Ck�%�囻7����r��6<(>T�&�S���gnW�.���#'�ԔD?���5�:f���Ė�˧��H��y�:�+�����<�.�4Z�KJ�y�ZyV�0���ޭ��th�T?����:d_}��>�i�D��W�XbDٰ�뙾���6�|�p°�tm<APX~?iJCSׁ]������tW=�*OT�$S�䲛���Lr���$��m&�E�U	�ԗ�?`���=r�zoåM˺a�!^�h���%��3#vj��ҁ��ӎ
���H�������D6hZ|T���ƈn:��}3�����]�Qy�&%����禮���s�ts�R��$�8L2U-���q\��^iR���,��L���ԁ6~]q��ö�W/f��=��t�h�j�؝��+��9��l�{�zrX�_?���h����k�q��%V�R���DG�&�ƈٓ���R���CjTb$�H�@a�8�'o�����)��c��y2�mL)�(sM�[��=��z|ZL������&�;�h/�aY�mLPм^c-9Bht�L)'֤�H_9Z��,���)�Б�4�uN�U�Q��P��B7�fg�;\V���˽.TD��O����S��P���d#�>/�G�q�e[^��j���!<%T��<��-�k�o��C�a����Yv�I�k��W��R�	�1�[o{G5�b_�0I�U��GcP=�\�� Zx�e|+���2�h����S;)6���FƊu�s��u	Ov�Y��<�I��M���D�������b][�5� 뭸٤6���J�n��(��I��D߭*����R�����D�4b?�Ҵ\1�K�����g�wO6�:/��]ř}�����$N~"h�*��� uj0�R̬3#��
}w4�侭P��,�+iU!�Z���L���F4��n�>ڬ6�y���H�JM�6�`�ݛ���X/V�\�U�}p�ͽ쾼�h ��f��z�qw��oo�&6�1���|dhU7 �έ�������]#ft��5��=~��Ι�p���m�G�Q�۸�x9�c�����'�|� i%c{WtX�V#����/��?"�6���ʋ��n�N��'����P*U�7���>��R��u��Q��q3
�ٞ5��g�O��L�\셗eٰ����J���~Pʪ��-.(m4r�qI��2����'�e�N3i���>?4��W5*�� 4G�%pd�_�Q�ݐ��?Ja�N�k�Х٠�v?�2�#�'�����=7���V�
M�����UC{�U^_ �qח�W��}q�#{���Qh)�H'�=
逻M��c;�X���}\P��M�����������2�)|��H��^Hn�~�Q�H���|2��_>���VWx��ko:NB]�O���7ۖ��c"4�hM|��nX#�6�>�T��#��׮qA��;aTE@�$�&A�����-@]6�6LG4x+� D_���9hmr&��ەy���2���`������ݭ �
���=U�_�`B�H�tAη|xJ��,�!�j��d�Q/�k�Qѽƾlb���d����M��^�{�ň�gt��N�=�J:�A6˷�˅`:hs\�ɇ�9�C�[�A���[���w�5Ӟq���h��U��Q����~v�����Z����>�y1����<�i�����eoL���AwG�����!���z	������������[�+aa<�t�����+��C�$�~�����4y�_	o0��mT���_k_r�Pl�����qg�0�R��"�,��k��|}��XÅ�	�ݿ,��G73�r�He�6��:����0����ԯ!�kT��xmYx�;aM@ddbh��~��0F�^mPݙ����Y�X�����X0e���+ӊ|�.°2�<���yd[��5$    ��0۳�"��x�A�o���7���=V^�CpI]�z�쥵��Jc�[�7@}c��)�tt||g�i�6L����A�ڪa��R.Ō��XV��գ�o
=L��`a ZJ7�	�ɛ��W��m������Y��I酰ꩦNnz2��?۔Da��5쭟�})4nn�Z�2���F��2�{�tR8�4��{�E��h]U:K���WK1HU�m�%�=�nX?��]3va�ݰ���s?�&�X�ʷihۍ�pL:��՘	���v;426����H ɽ.!��T���u�2�9"9��`"�LhP�C&3�bP%���2�<��Z�s���0kš�$O��R�N��#͖]җU�~���\L����ZH^=P��ΏHO��Nn5J%5��}�uU&qW_e]�ci��|_�}29��t�僫�fS�i�d$r&)}-����'�e��P�R��@��ܜDD�R��)�!��ɶ����WN�B����U
Ci���*�#�J>/�.Y@�D���|��[��3��WC��;o���/hB�},��.�6�z�M��=gGEihu�� }��M�ir� npoŠ�º�w��B}51S*
��͹�(��g�t�s'��W��w�����<��TC���R���y��p m
��f�.#m���I�\�_�	����%4����L��&�̌{��I��r:�oDc��!{C�4�oc�0�9���Ȼ&,���ҏ��%�Z�n30o$-]!��Mn&�0�ʮtނF�R(���e�ݐ]��6D���"zg���*Hu�����|'���Z-�X?�c�p�d!�o`3�d���ҽ���S#�(�W�F7�CnH�0���=x��E,YcGX�nv�V��y3o�{���b��=sq'�����GtL7��@�����֛�Li���~1���G=qb�ވۓ`�@�WK���Z���
:���C�_���<������OI/	�ej7=}ڋ�$����ߺ���}�a�h�Q!����Ę�7^LHJ��Иpvfl��	�SC#SC����I6�����ңX<�JV�����F)#[��6��)�y#>i,��پ�P`f�(�?�6Ʉ׌�,��\�n<0|jX�2/�)YR��Zb5�.�y�>Ej��P7ȇc�`����W����y�0��Rh���Ba</�h�9tO�G�zG�ؑ�dW9���84���~'Q*�[F���y��F�N�!�'%j�
=e�胎��|�-#�r��$�� *�r�"źو�6�8�a�� <W�T�� |�~̰_����|��)�5����v�c�j�"���C���m�8����8��8>;�R�̪�^v\C�I�	%�(O�/b�~X���N-r51�[��Y]j1���yn��1��mY�qY�	�v�sd3r8 �m���M�}1��A�����:�_~^�Lݑ���HO�k|�qv7����f7eP��b���E�^=F'��K]�I&��g��>��R��\Ƴ���G���=t�Σ��@�lt�Ę#�*:�I���l@޲�]�:�ku�e���=ҴO@�'vOFu�7	�,�"��cAn��J��Ԣa�m���0�`CvPXĨ�eE/��)�P������G�� x�rOOW `䩠���0)W�m0H���I�*a$�+ ���T�)9jq�T�Iu�>�S�+p����'��Ȋ��0mT�b�+tȗ��6���dS�z�;�0���a�D���N��a�ٵ P�������+$��P���9,r�P�a��/�7�J�̛!Y�*�X���b��P�>Hk'Q��NG��z�&��ظ�z�*����B������YF��TٞS�����Ű��=Z�WTg4�������~ź�߁���`����(��9�`�̵�G�4�(���qŲ� ���%۲pE��FƘ�)$���%�suЪﺺ�ud�H��
9a!�(�Ul�~l�t^uRt|���f�4�L��)6��w�G2/}�XI�ޢ����Nt8jm*_�v�!b����Cq�D��)�p��f�|x����Q���Y�VP�z�QPS���4dJ�0���3��k��"`W�Нwʉ Gt*CG�,�Ɗ�f�E�k���v��jC�ː#�c}_�_�C�|�`�;.�� �!v�,SM� V��<?��{����8�rż�+G�-7e1��s�kW9��=0B�:���&|���4Q�ć�F�a�ƕp@�dߐˈ����ap�Ň��d�ֿB�
a�պt0�:.P<nR_q��k(�ܮ���i]�m�z>Uv[�T�ί�R/�jD��]�ȍͲ����k{�"��#q�~m��QgPDoJ-jy� H�_h��}=���b��FǗ��>�U�9�F��Ј��Ǥj����ZD1l7����X/:K'V ��ȍ�_�r桪@��Ԩ�^��xv�G�Q�L�^���N4e	P��4�goiܿ����A�h�c��4�t�K�7�c����9�UTz1�G�<�O�0�Y�����9�	-����P$)&���>�>�)l:A�sV�.�˺چ�iEH�iTR�V�)�,����d�U�7��E�fL���"(�8�� �t����|���3�Z+�Dt���,��~�	���H�F�8V#a�<+�-�����`�����ˎeqH�`d���b�[	������r�q6�H��0YE/�J���a�/=�v��,�9�Ͱ3.c$��vf���h� O&��jw
��@��㠻��6���R���'��zJ�	2�T��a�J�R;�zC)V��02�c6�&���s�����r:ݏ:��ͯz��T�����U��|�r�_N�B��4MO`�g�A�>9�z��Ct���g9�2H��/��r x5[�wo׿��exl�z�&͠���0,0Z�������L��`*#N��"��~\��$4��vnUò�d�.�ǌT[��iH_W;m(7�k�K*�;��.n�������U�3c-ܔ�9�!{���k�%�OK�-s�j4���O+uW�盥 [uo�G�ƝJ����{���
��̳�Zl=�����T�qL!z�\N�~�C�� ���LK��	�>��${&�c4�ߗ-g騱d�%Zimň֋�Ǖ=���ؒ�g���_yf��R��	��]��][��	�p��V=�6x�N$�7ѱ���iSa,�z��&vTv�_�;����������������|�C�#i$EXA�}�P�]��DZ�]�;Y���+���d�=���D���ey$}�h�u��dX=;�_]�c��Ejy &}y��w�0����JSy]��:rXv�S�T�'ʓ{��Ђ	�ʨ�{��P��I}���k��ܓ+K�,X��ۄ�M\8׽`��OWш�~BX8�y�y�7+�ϝ=,x?���J�������*���:Z����k�������c��t�i��P���{�ր�u܃t%�Y�� S��?uu�r������/�H��^�+'6�\5��v�����ʕ@	�]da�/ݣ�R����w�(����F~�	�*CΡ�q�t)L{/��R�(`Ӑd���T�6I�
��͋�sL����FFy�ϰ y$S��X����GDK�F%2���"ى�k �W͆�C�{ݎ��i߬.ȑ�蒚�b���`x��=�x���&��%���tl��uU�-�VzM�&'�ߙ<�׈��W]]��U�&�%���M��_Hs��m���zv����o�]��{Xy|�1��	����vE�o�͔�c��x���V��f��bդ��[h���2�'��艚�_h���v�K=􆡒�� JUWa}��+CV�h���<���H^��q��e��A�$��<���R�a���>K]�U�-B��w������-p@���BP�����*�B�%���a�?w�-��~=o�$=
��E4�8%�^�h����U�D	V�4�)~|�Gn|��uIY�G��=4�'��k,<FK�m7*�З-F�{:#8���9];6	�&��5��{���ܼB�Y�    ��g�*�*��6�(.�o�/������3A}O'�'QL��G�ej�Ao'�d[yP�ȷ���T��'jr-<彝�Gt�y^q_�;v5,���?	�)	�8�y�C���G1�C�-���qĔ��^uksK� \��X����	�T��Y���q�QXNF+*m�"��FC�OmL�H|;���ƹ���p�{JP�v�}A<�Ե�/N�3��.i ���~a��#������*]��_%:5�	,^�}����ϲ��j��V���[N.�e"L���4�U�B�G�on�J�`��"9�H�b��m�8[m��W�Z{qT�(�vW�-�2�y�5Ӱ���h�ՆRXԟ�zT,��ˆ�ڒ������CNJ�5@� �,غ��$�b��IU�esu�0�?<��=�[ܬ;$B��:;��ͼR��x%l�EP[/�0M�@�d�'�-D�/��6#�1`�wd�k���B���k��k�z���{\�Q��^)DP��:.����|��th"�&t���+a~��p�%Y��A!oD2��½ct �iϷ�(o�p�	��]�J�����r�:�g��G�6�m���8���Uѓ���e��P�ZN����s�#!���U���cwP�& v�ݚ�	$�����~.���i����5@�Sg�[��Ī�S����l<I�ō�۔K�y�Q �È^��$�!�V��7�D<����q <�]5R��I�F��7)ho��K�fH��Y
�*���1i����V��x���h��}�����Lm.H):*uꮽ�:Uݘq:nL�E�����(i<���'|���F�34���Ty�}���~4v�Ҥ��/ݰSX(�R�+6A:O%A�t�&�L4� ��G}R���n%�z�[�g1<T`��Dz/E��TՁH�B���e�9�W�j.�vR������R�����|+�jB*�V�X��z�ͦ��!ݵ�T����3g��ľ��lTH�N��������p��<I�@�����^�S
t�a
����6a�k�;���:��f�3��6Ŷ����/�n�R8-leV��V���`b�|��QD<3�1�Sth�w�F@L�b�,���������8�\5��H��n�����#� �$.����44�N�0� �afۺ����1�/�C��Ļ��pI:�_t�",���5x�{���� d�`���/I`ԫ������]��o������?��?m��	�!K��ڽv�`��Y����A(��2��6�>�3��vV2�DE �^���$����q'�I�q��{@�HѱO�ה��`Si�AY*������;�&�:�]������v���Gڌ����椭�!����h_,d�X�R�,R�Y�jET�9�n�]��)�N��i���l�]#�Շ�;V���2�'�9�E�S
�-�z+ћ��e9�q���辑r�����W�cg*���qCݢ�����6N˅r���}�{x|E�E�����m�an�2���`���ON/����y1:�Ҝ�y�þ�[����5- 꾍��<vT�:���.���KQl�UOXtk���(v�b�M��C���u�՛;L9>��Ii��R��2qf�,W����4�O*e����,�nL�`֒.���4B�1�k�^Kԋ ��Ω���<q����=7$K�/Ĳ�|��.!P�̻�1��d7ʢ>p����4(�M��.����;��\�K�b_����9T�YgA���0������2`U�+i��ڐ�5�]��`*y�	S�F�p�3�� �O�����u�n��֢��6�U�z��\La��������媔��b?�"��������H��IO���4V����av��]�=���wt�V�����/G|��{ �����tP_����_޽��C�ө�=�]���.ʻ`��U�a`	++�Ȇ�Vd��G��q��)��\�i�&#7��&Ո������Mō�<o`�4���#f-���K����"�+���z�� ���o�Q�^r��Q�w*D��섌Z�r
�������Q��&��V�b������66���=唈�b(E�6��l��q���u�#��fQ�'��w��ևa�_C�B����,4���PF�Q������o�q+4�:&s�������ҍn+��ε1vئ
�ـ)���O�B�@
�\(6��篼f$���3�-�MI;��4�B�CA�{8�A�d%�����9Gk:����߀��l���jy�oWz��W�����9r�.��@�J�q��5L$&��}�m�\	OgJ-M�E�a�1�e�H�;�`�q�G<C��v�2x��h�v>c%٘dV�!G䘱N�d�f�4�bE�O��x���Ur��x;�a�Wr�9V��.�r3�M�?:`�8٠�).|����59]�@��Ȟ%��R)�_���,��UC��W'�Gbi�2���]���&���}��9���י�[ �4z/�o�?L��ǁ!�sA�V>�=���A����7V;otr�#�梹����S�=їhM��/���	
�',6��4uS���2����*��֐��ƭ(J���_��%�H��o��� z��g`�t�M�t�v��^-rF��т�����i�����\>��`s�f�d� R��%�gI��j��Zc�f\x�����óI�F�[t��~t�|�7�P�`�TV��+=)_�ZK��5�1��P�ު+�ݖ	��:���E1�X4�|O�_ V' �H�Ma}�]�����&:��KN6R*��q h����j��;��~�\b���BO�qЏJ��w*�&��z>`8�S���%�>A��3�&d�Mm�� ����ue�zW4��፵�
���EoR�cU�Z
ϰ2�T�q�BX�>Jk:����<���{� ����*����1�jg8�GY��xS�>�>��M��&�:�>����G
y���cj��%�49��z`G{�ZXmr�Rf�	Sq�7FA���� ��Lp6�EGFOK��I5Tr�I��*}N:q�16�� � �/`����SvB�KGQ���6=��K��ZS��}b�]H�i3�Q#:�~1��A�7�\$�D�)8�P���,�:pD[���"�g��M����@���jQ@��#��*��ޟX���4��
8]'�px[<���G��1;Reg�ħ��VEt9��y���W?����epmϢ��`a[����7�1u	�<\r���	���چ�!H��|Yl}R���BV����v����R�����}�P̒�����e���)�~���f�Y(��h�ƅ�h����>�~�I���u�?���u܅�9�"�1��%����Qd��}.a�����t�*:pU��K��iK��7=v[9κ�������`�0eѹ�b�'�4E��Dy e�1=�jC�`RV[G�A����J�`~���l�(��-�A�YB���i���	ؔ��6e�O�SN��8��c
���i�c�*� �T�>'T
��$�ٚ�m�p����J ��5u�|��Ж��]��]^�p/q���]�S����ڝ��XI�x��ǥ�����\���x��Uo6��������zL��W>qЏz ����KO_u�.��le\7�v�Đl��9�o-vi�.2m֐� �I��uD�.��2#,�F$T��ݓW��X{^��D�aGv?82÷�B���säSܝ��H�Z����ZCG@ػ���TJ��ְ���c�K���N�,��dNqJt���BE6�D��]mdqo���6�qI�)�{m\s9e�X�Q��f�6��\��V�}���&�os�p��G)�9�I\.��pA��\�M)�@�.�B֪�Q-��~QDD�^���[_|�,q�\���#�r��G�v���B@s5�wF
R��R�Z���}�܌��L�>�>M�GS�Ke�ϟX��O�v�TU����{�1B^�Qߠ��.Ja���`����������dw�~B�q�Cu�;+��*��vo�J���[�������v�­}��`fqdʞ�$-`�%��BIB�S���1P��ie    ^�'��H���r%>>o,���I1&� �<ݭ�J��J"H�4/f������imn�(�==��RpOrLA�O?�0Lz\^�)��f���<NGKc��	��Yk����ڛ�&O	=T���)���i���ROK���c�g�H�N8���6���霤UY�t}�"��]�;B#�l뺍��śaF{Ň�|M���Jf��c���c�n&������-OZ�jv�U_�+0֢K�6[�dv�ƱEW4�WtT^�v��=!�#�2��ilO�m���mV�%�3ht�"��,�	5A�w�]�n��B!cR�V�f����	]�N6��nNW�,v_�6�� '-�	�쟓]\��	]�`x�w���Ӱ+�y�Ǽ������.D�G�U�:I���J����4u�<X:`]�� W���	��dXYe2mu� tS��KZ�W/���Q��4�&���r��z)��u}�Z%�q IO�� ���lO=W�����?�O���[s	��Q�Q?�垷�����he���%/���Pw} �h.�.6ث.�G^���sz�����8�A;J��%~B8�K=#����GV�Ը��J"|t+iP=���'h �^��ݘ�|x�a�����H�c�T�:j�"P8.��_��]C��36E�|����/��
V�
9���xZ����)�f%	v��S��fJ+&�i���n��r9:�<(�I�1�m����N��af}uL��B�>�?;��,D"�_��z�EL]j�G��ޘ_���mk�6Ɋ�h]�Z�c�+?܍Lhc{b��YE�����\�'��⺭a:T�r��Q���F :��?��>����Qv�!�! �U��b����T��3H��j2Z���x�����_�v�L���m9�*����A<\Y
��8���z�h�+�l]~�hV��ڼ;I{�%�06��i�אL|�JaLs�\�BCӛ�z0���$��%#l���	�#��_�&I���.�#�E������B����,[W���^����2ݮǱ0d���J��3~�]�l�A��}���zVsIv����|X������A��2�}�YTzc	Y��z�oˈj	طǺ踶/���O`�9��+"5�a-�A����a��L{#�ͣ@?��AJ�S^=i���
p(�ѳ!a˘��Q"����Ie/��d�]�&�ȵ�K�~V�_z��(���X|S�����C��~Q�rM(�F�����BM��L���"*2��>4r����Mt|����)}�,���լP%ږG���A�,�������`9y�������h�q�=!o
�?��w���%Հ����Z�➿��`MwkJj�H7��R͡V�*��й˝of�Rk�v<H;a�&qz���P;I	+	6P_�9�,N��I먋�׶᭚;�˟���Z3�v���[	�G�����t5��� x��>F��c���>%��˴�nK~�9
���i�V�8�{� ��]�H0$u�xJISdC�~B�_ǘ�t{���MIRB�]�k������}�o� �.�q����ў�@���hT�8��|�y��X���	�g��@x����/d}��y�9�/����&�	"�T�X�H_VP�?�������S�b�]�ތ��5*$��o4�ķ=����_q;Jr|�H& 2噋�@�0�&T�%R�{�RC�e.p?H�̐��%ګ���d�;wI�A�VrhT���3[��Rtr��Pf�f�X�i:��h��4?C[�(�����I I��'0I8�q��:X-�A��$��Ks��t���wf� �g�p��ruf&�?��*��i���^�;nn��+�!3�n�!}W��Jr����,n�p�D%���>���m	��rT{�����-S%�~�L�u��x�㸒������lʠՉDdy����	=d��Z٦���{DB:T��=8���?�!��׃C>���g�S��ѐ�~2��YD�?��/7`4���
�]1I�UO��F��ؠ ����
��',p�D7[^�&�ػ޺�Τ:��0-�񼀠vl#RV\��^\=* yplY.��9��
p
���P�xKb��'��h����Z�`�(TO��p�����=�����u����͠i���|xr��Ŷ�leZ��FE1΄>;���3�.�KPz4L�����)��X��՝�"9�x?(��b�`�m&�憐<�����"��_�\-Kr.S���؏tƥ��e��@i��Q�c�Kj"?�R`>�A�ƒ�մ�c��<V*,�<#,�t)\ �yG���pW��P���Q�Gf�Jn��,��|0p�0R��m��w����Zw��Б�f{"My���Hѫ�_�*�u���s=����ѱ��J	����,�_�G����"��Ǩ�̂�0\m��*K �7�® ���c�-]�G%4]*G}��0)S`3��!�e��B�V]�hw��<SG��/��A��!��=�BXs�נ	���a�}�(��d��~�8�(h-�G��B�{n�F"x5�E����&{Iw��$�2��>�.4���)��O�g��{���S���~���[�9-���E�cTr�A�#A�?8|1q��S����L�(Q`�x#D�x��kc�"��U#ز���:�'�G�e���O��{&�]b�{��X�R��=�\�$@�h�(r�9�
�ՠ�N�F�U�kfm���v�tl���&�q�L��;�P�A�+��t�H(e ����ed��%���	�,z��!A�?��L�c��=e�;}KEB�X�t��Z�K9�A��2�j#��	O��S����͚�СpFe���$���Z��t�Ls�R���4o
�K��*��"�fwO�?^�k�v���''ph��>�.����D&t=)EA�gB$��f���l��qx|�f�'}x������	Ʊ�7�G���\f�t��W
7��q�pA޾��ԣ��P�����H�"�b!�([Gؐ�gk^b�n�E���������TI� �`�LQ@S���8��cA�X�SL�"=�vpR���]�U���@�5�T�J��Xz��K6�(2
]#�b�5C�t�գ����	�ShPf˭�\w��_��������=��S�Q����.�w!/ч�4�Ȱ��&E�R�ri}{�R���t[�R$���pl�G9r#cR*U�؏��uP���1�ůJr��@�fp,J8�{J�m�#��`��uw�K���m�:1�ԽK5�\�L�����x@^����z�H���V�	A��M;:D&f�	eu�P�@p��n&���]x�"�G�F	f��ȞR���^�,OAGְX8"R�eY��Z[)�,s��c�/Jձ�2�Ƶִ`��1[{���������(��|2A�A#�X�s&�aZ��Cv��3r���/\�d#NV��������S��Zw���t�.��I�����NmEܽ����.�׷
��9��� A�-w[�H��L���R����\�#�V�V��r;�FQ!�eK!_K��rc�^�	�+��A����n�p��F�GA��
I��\햨\!Ht��9�A��T�%�/b� ׇΐU#��� aX�X�+�@�%zJ�%�R���Q��{�Y:�s��~&����aHZ�w��+տ�x��IG�[�:D��Yz�b!�(|/��Cv�ѡJ,�t�/j�_{k�V�hP�A`}P�Ќ�C}���-ĉD7���^+�|��Ȗd� eEYbu�Q;�hx]��96�0�?
��f�ү��+��Z(V+D�X5�u3��� ����d�y�󮹑�U���|��V8���!RS_Eq,�p!y���W��z|Ҥ�Gj�®�0�����{�� �9�_,���ޱx݈�f�R9-��*�$�-`H��]!�{qr��W�\E�ى���n�V���I����k�nX8�C���V\�� w<^}�HE�3�A@9g$��9�fR��N��vN��^rS��U��LaW�,R���o���R��}B]Ċ+�:�E��m   ������h�&U�7�IÊX�.��9����	\j�S�9t�r�_hM7��}�Ag�� �[8��A�[�)b���Pw��@K_՛m�DWb+J��EC%ybʛ��ۧ���&�y�Q���F�5��� ;�A�cL�g��/ف� ��T�)�V�B�O��Gi��h�QC�iخ�ǡ��"X��"�ˇ�;�q�����ջ1�3����[�]��#8�{N.��Z���z�0���q� ���'!��ڍ��s�'4)َʓ��`Qi�Q�$�慂+��Sn���P-��r�О���h�UJ�w�:P:3�"F��j��Ǝ���qr����^}���]\Ԟ��#�� �Sy^�ej+ܑˉ"��m�Z�|_�ze�k,(���:�D�1+���FΥj�-Q�G��ƚ#����*m���&]��3�R
�yF,�dL����N�|(#�F�7�Q:�:+]aL�]�$Y�#tA��4C�>OdѴ�=
�
w����~��I��[m��%n�]	�]�=�}���p%j{䖤2�����6�Ꮇc�g�����Fw��K��O�g �d9�T�DK�#�U)R\�b7�q�|a˼�w��~.Q!)����%��?�34{��\�!f�~��{@���X��I����O{��5w��0R*���#���V�o���Cؽ�U@ͭ��ʩ^}�`/�rK�����f��q���m�U:
���,���a
1Uյ��&r��Otx�hT���B~4)L���{��6��D�L�L�����=Q�荢-ryR�K"����}�9c�j��Pa��*6���bpiܮ� M�����4K�%�� ���DmHuq�n��C�4I�%���]�/���#�ZR���v\�$Ak���>�%��zW��V�N�k�Y9�la�J ��o8�_|�eAo�w������0�;s����F1>����N"}�|���g>��I��.���~��{2f�E�"���L��w���#�$�h���L�X�.W�����Yܖ�     