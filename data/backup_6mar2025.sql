PGDMP          	            }            hctm_surgery    17.4    17.4     )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            ,           1262    34388    hctm_surgery    DATABASE     r   CREATE DATABASE hctm_surgery WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE hctm_surgery;
                     postgres    false            �            1259    34389    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap r       postgres    false            �            1259    34392    blocked_day    TABLE     x   CREATE TABLE public.blocked_day (
    id integer NOT NULL,
    day_id integer NOT NULL,
    unit_id integer NOT NULL
);
    DROP TABLE public.blocked_day;
       public         heap r       postgres    false            �            1259    34395    blocked_day_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blocked_day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.blocked_day_id_seq;
       public               postgres    false    218            -           0    0    blocked_day_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.blocked_day_id_seq OWNED BY public.blocked_day.id;
          public               postgres    false    219            �            1259    34396 
   blocked_ot    TABLE     v   CREATE TABLE public.blocked_ot (
    id integer NOT NULL,
    ot_id integer NOT NULL,
    unit_id integer NOT NULL
);
    DROP TABLE public.blocked_ot;
       public         heap r       postgres    false            �            1259    34399    blocked_ot_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blocked_ot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.blocked_ot_id_seq;
       public               postgres    false    220            .           0    0    blocked_ot_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.blocked_ot_id_seq OWNED BY public.blocked_ot.id;
          public               postgres    false    221            �            1259    34400    clashing_subspecialties    TABLE     �   CREATE TABLE public.clashing_subspecialties (
    id integer NOT NULL,
    sub_specialty_id integer NOT NULL,
    unit_id integer NOT NULL
);
 +   DROP TABLE public.clashing_subspecialties;
       public         heap r       postgres    false            �            1259    34403    clashing_subspecialties_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clashing_subspecialties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.clashing_subspecialties_id_seq;
       public               postgres    false    222            /           0    0    clashing_subspecialties_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.clashing_subspecialties_id_seq OWNED BY public.clashing_subspecialties.id;
          public               postgres    false    223            �            1259    34404    day    TABLE     }   CREATE TABLE public.day (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    week_id integer NOT NULL
);
    DROP TABLE public.day;
       public         heap r       postgres    false            �            1259    34407 
   day_id_seq    SEQUENCE     �   CREATE SEQUENCE public.day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.day_id_seq;
       public               postgres    false    224            0           0    0 
   day_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.day_id_seq OWNED BY public.day.id;
          public               postgres    false    225            �            1259    34408 	   equipment    TABLE     �   CREATE TABLE public.equipment (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    sub_specialty_id integer NOT NULL
);
    DROP TABLE public.equipment;
       public         heap r       postgres    false            �            1259    34411    equipment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.equipment_id_seq;
       public               postgres    false    226            1           0    0    equipment_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.equipment_id_seq OWNED BY public.equipment.id;
          public               postgres    false    227            �            1259    34412    equipment_msp    TABLE     �   CREATE TABLE public.equipment_msp (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    status_id integer NOT NULL
);
 !   DROP TABLE public.equipment_msp;
       public         heap r       postgres    false            �            1259    34415    equipment_msp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.equipment_msp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.equipment_msp_id_seq;
       public               postgres    false    228            2           0    0    equipment_msp_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.equipment_msp_id_seq OWNED BY public.equipment_msp.id;
          public               postgres    false    229            �            1259    34416    equipment_requirement    TABLE     �   CREATE TABLE public.equipment_requirement (
    id integer NOT NULL,
    unit_id integer NOT NULL,
    equipment_id integer NOT NULL,
    equipment_requirement_status_id integer NOT NULL
);
 )   DROP TABLE public.equipment_requirement;
       public         heap r       postgres    false            �            1259    34419    equipment_requirement_id_seq    SEQUENCE     �   CREATE SEQUENCE public.equipment_requirement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.equipment_requirement_id_seq;
       public               postgres    false    230            3           0    0    equipment_requirement_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.equipment_requirement_id_seq OWNED BY public.equipment_requirement.id;
          public               postgres    false    231            �            1259    34420    equipment_requirement_status    TABLE     �   CREATE TABLE public.equipment_requirement_status (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    penalty_value integer NOT NULL
);
 0   DROP TABLE public.equipment_requirement_status;
       public         heap r       postgres    false            �            1259    34423 #   equipment_requirement_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.equipment_requirement_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.equipment_requirement_status_id_seq;
       public               postgres    false    232            4           0    0 #   equipment_requirement_status_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.equipment_requirement_status_id_seq OWNED BY public.equipment_requirement_status.id;
          public               postgres    false    233            �            1259    34424    fixed_ot    TABLE     t   CREATE TABLE public.fixed_ot (
    id integer NOT NULL,
    ot_id integer NOT NULL,
    unit_id integer NOT NULL
);
    DROP TABLE public.fixed_ot;
       public         heap r       postgres    false            �            1259    34427    fixed_ot_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fixed_ot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.fixed_ot_id_seq;
       public               postgres    false    234            5           0    0    fixed_ot_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.fixed_ot_id_seq OWNED BY public.fixed_ot.id;
          public               postgres    false    235            �            1259    34428 
   masterplan    TABLE     �  CREATE TABLE public.masterplan (
    id integer NOT NULL,
    description character varying(255),
    objective_value numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    uploaded_file character varying(255),
    start_date date,
    end_date date,
    status_id integer NOT NULL,
    log_usr text,
    log_sys text,
    task_id text,
    user_id integer NOT NULL
);
    DROP TABLE public.masterplan;
       public         heap r       postgres    false            �            1259    34433    masterplan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.masterplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.masterplan_id_seq;
       public               postgres    false    236            6           0    0    masterplan_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.masterplan_id_seq OWNED BY public.masterplan.id;
          public               postgres    false    237            �            1259    34434    month    TABLE     �   CREATE TABLE public.month (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    status_id integer NOT NULL
);
    DROP TABLE public.month;
       public         heap r       postgres    false            �            1259    34437    month_id_seq    SEQUENCE     �   CREATE SEQUENCE public.month_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.month_id_seq;
       public               postgres    false    238            7           0    0    month_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.month_id_seq OWNED BY public.month.id;
          public               postgres    false    239            �            1259    34438 
   objectives    TABLE     �   CREATE TABLE public.objectives (
    id integer NOT NULL,
    objectives character varying(255) NOT NULL,
    weight numeric(10,2) NOT NULL
);
    DROP TABLE public.objectives;
       public         heap r       postgres    false            �            1259    34441    objectives_id_seq    SEQUENCE     �   CREATE SEQUENCE public.objectives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.objectives_id_seq;
       public               postgres    false    240            8           0    0    objectives_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.objectives_id_seq OWNED BY public.objectives.id;
          public               postgres    false    241            �            1259    34442    ot    TABLE     �   CREATE TABLE public.ot (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ot_type_id integer NOT NULL,
    status_id integer NOT NULL
);
    DROP TABLE public.ot;
       public         heap r       postgres    false            �            1259    34445    ot_assignment    TABLE     �  CREATE TABLE public.ot_assignment (
    id integer NOT NULL,
    mssp_id integer NOT NULL,
    mrn character varying(255) NOT NULL,
    week_id integer NOT NULL,
    ot_id integer NOT NULL,
    unit_id integer NOT NULL,
    day_id integer NOT NULL,
    is_require_anaes boolean NOT NULL,
    opening_time time without time zone NOT NULL,
    closing_time time without time zone NOT NULL,
    date date NOT NULL,
    week_number integer NOT NULL
);
 !   DROP TABLE public.ot_assignment;
       public         heap r       postgres    false            �            1259    34448    ot_assignment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ot_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ot_assignment_id_seq;
       public               postgres    false    243            9           0    0    ot_assignment_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ot_assignment_id_seq OWNED BY public.ot_assignment.id;
          public               postgres    false    244            �            1259    34449 	   ot_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.ot_id_seq;
       public               postgres    false    242            :           0    0 	   ot_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE public.ot_id_seq OWNED BY public.ot.id;
          public               postgres    false    245            �            1259    34450    ot_type    TABLE     j   CREATE TABLE public.ot_type (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);
    DROP TABLE public.ot_type;
       public         heap r       postgres    false            �            1259    34453    ot_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ot_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ot_type_id_seq;
       public               postgres    false    246            ;           0    0    ot_type_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ot_type_id_seq OWNED BY public.ot_type.id;
          public               postgres    false    247            �            1259    34454    preferred_ot    TABLE     x   CREATE TABLE public.preferred_ot (
    id integer NOT NULL,
    ot_id integer NOT NULL,
    unit_id integer NOT NULL
);
     DROP TABLE public.preferred_ot;
       public         heap r       postgres    false            �            1259    34457    preferred_ot_id_seq    SEQUENCE     �   CREATE SEQUENCE public.preferred_ot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.preferred_ot_id_seq;
       public               postgres    false    248            <           0    0    preferred_ot_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.preferred_ot_id_seq OWNED BY public.preferred_ot.id;
          public               postgres    false    249            �            1259    34458    procedure_name    TABLE     �   CREATE TABLE public.procedure_name (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sub_specialty_id integer NOT NULL
);
 "   DROP TABLE public.procedure_name;
       public         heap r       postgres    false            �            1259    34461    procedure_name_id_seq    SEQUENCE     �   CREATE SEQUENCE public.procedure_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.procedure_name_id_seq;
       public               postgres    false    250            =           0    0    procedure_name_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.procedure_name_id_seq OWNED BY public.procedure_name.id;
          public               postgres    false    251            �            1259    34462    role    TABLE     `   CREATE TABLE public.role (
    id integer NOT NULL,
    role character varying(255) NOT NULL
);
    DROP TABLE public.role;
       public         heap r       postgres    false            �            1259    34465    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public               postgres    false    252            >           0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public               postgres    false    253            �            1259    34466    schedule_queue    TABLE     �  CREATE TABLE public.schedule_queue (
    id integer NOT NULL,
    run_id character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    uploaded_file character varying(255),
    status_id integer NOT NULL,
    start_date date,
    end_date date,
    log_usr text,
    log_sys text,
    task_id text,
    masterplan_id integer NOT NULL,
    user_id integer NOT NULL,
    downloaded_file character varying(255)
);
 "   DROP TABLE public.schedule_queue;
       public         heap r       postgres    false            �            1259    34471    schedule_queue_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.schedule_queue_id_seq;
       public               postgres    false    254            ?           0    0    schedule_queue_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.schedule_queue_id_seq OWNED BY public.schedule_queue.id;
          public               postgres    false    255                        1259    34472    schedule_resource    TABLE     �   CREATE TABLE public.schedule_resource (
    id integer NOT NULL,
    resource character varying(255) NOT NULL,
    value integer
);
 %   DROP TABLE public.schedule_resource;
       public         heap r       postgres    false                       1259    34475    schedule_resource_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.schedule_resource_id_seq;
       public               postgres    false    256            @           0    0    schedule_resource_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.schedule_resource_id_seq OWNED BY public.schedule_resource.id;
          public               postgres    false    257                       1259    34476    schedule_results    TABLE       CREATE TABLE public.schedule_results (
    id integer NOT NULL,
    run_id character varying(255) NOT NULL,
    mrn text NOT NULL,
    age integer NOT NULL,
    week_id integer NOT NULL,
    surgery_date date NOT NULL,
    type_of_surgery text NOT NULL,
    sub_specialty_desc text NOT NULL,
    specialty_id text NOT NULL,
    procedure_name text NOT NULL,
    surgery_duration integer NOT NULL,
    phu_id integer NOT NULL,
    phu_start_time time without time zone NOT NULL,
    phu_end_time time without time zone NOT NULL,
    ot_id integer NOT NULL,
    ot_start_time time without time zone NOT NULL,
    ot_end_time time without time zone NOT NULL,
    surgeon_name text NOT NULL,
    post_op_id integer NOT NULL,
    post_op_start_time time without time zone NOT NULL,
    post_op_end_time time without time zone NOT NULL,
    pacu_id integer NOT NULL,
    pacu_start_time time without time zone NOT NULL,
    pacu_end_time time without time zone NOT NULL,
    icu_id integer NOT NULL,
    icu_start_time time without time zone NOT NULL,
    icu_end_time time without time zone NOT NULL,
    booked_by text,
    day_id integer NOT NULL,
    month_id integer NOT NULL,
    unit_id integer NOT NULL,
    schedule_queue_id integer NOT NULL,
    mssp_week_id integer NOT NULL
);
 $   DROP TABLE public.schedule_results;
       public         heap r       postgres    false                       1259    34481    schedule_results_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.schedule_results_id_seq;
       public               postgres    false    258            A           0    0    schedule_results_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.schedule_results_id_seq OWNED BY public.schedule_results.id;
          public               postgres    false    259                       1259    34482 	   specialty    TABLE     e   CREATE TABLE public.specialty (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.specialty;
       public         heap r       postgres    false                       1259    34485    specialty_id_seq    SEQUENCE     �   CREATE SEQUENCE public.specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.specialty_id_seq;
       public               postgres    false    260            B           0    0    specialty_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.specialty_id_seq OWNED BY public.specialty.id;
          public               postgres    false    261                       1259    34486    status    TABLE     i   CREATE TABLE public.status (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);
    DROP TABLE public.status;
       public         heap r       postgres    false                       1259    34489    status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public               postgres    false    262            C           0    0    status_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;
          public               postgres    false    263                       1259    34490    sub_specialties_ot_types    TABLE     �   CREATE TABLE public.sub_specialties_ot_types (
    id integer NOT NULL,
    sub_specialty_id integer NOT NULL,
    ot_type_id integer NOT NULL,
    unit_id integer NOT NULL
);
 ,   DROP TABLE public.sub_specialties_ot_types;
       public         heap r       postgres    false            	           1259    34493    sub_specialties_ot_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_specialties_ot_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.sub_specialties_ot_types_id_seq;
       public               postgres    false    264            D           0    0    sub_specialties_ot_types_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.sub_specialties_ot_types_id_seq OWNED BY public.sub_specialties_ot_types.id;
          public               postgres    false    265            
           1259    34494    sub_specialty    TABLE     �   CREATE TABLE public.sub_specialty (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    specialty_id integer NOT NULL,
    color_hex character varying(7) NOT NULL
);
 !   DROP TABLE public.sub_specialty;
       public         heap r       postgres    false                       1259    34497    sub_specialty_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sub_specialty_id_seq;
       public               postgres    false    266            E           0    0    sub_specialty_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sub_specialty_id_seq OWNED BY public.sub_specialty.id;
          public               postgres    false    267                       1259    34498    surgery    TABLE     �  CREATE TABLE public.surgery (
    id integer NOT NULL,
    mrn character varying(255) NOT NULL,
    booking_date date NOT NULL,
    estimated_duration integer NOT NULL,
    age integer NOT NULL,
    gender_code character varying(255) NOT NULL,
    surgeon character varying(255) NOT NULL,
    unit_id integer NOT NULL,
    procedure_name_id integer NOT NULL,
    mssp_id integer NOT NULL
);
    DROP TABLE public.surgery;
       public         heap r       postgres    false                       1259    34503    surgery_id_seq    SEQUENCE     �   CREATE SEQUENCE public.surgery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.surgery_id_seq;
       public               postgres    false    268            F           0    0    surgery_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.surgery_id_seq OWNED BY public.surgery.id;
          public               postgres    false    269                       1259    34504    unit    TABLE     P  CREATE TABLE public.unit (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sub_specialty_id integer NOT NULL,
    is_require_anaes boolean NOT NULL,
    max_slot_limit integer NOT NULL,
    no_of_slots integer NOT NULL,
    resource_requirement_id integer NOT NULL,
    color_hex character varying(7) NOT NULL
);
    DROP TABLE public.unit;
       public         heap r       postgres    false                       1259    34507    unit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.unit_id_seq;
       public               postgres    false    270            G           0    0    unit_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.unit_id_seq OWNED BY public.unit.id;
          public               postgres    false    271                       1259    34508    user    TABLE     u  CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(300) NOT NULL,
    password character varying(300) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    role_id integer NOT NULL,
    otp character varying(6),
    email_notification boolean NOT NULL
);
    DROP TABLE public."user";
       public         heap r       postgres    false                       1259    34513    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public               postgres    false    272            H           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public               postgres    false    273                       1259    34514    week    TABLE     �   CREATE TABLE public.week (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    status_id integer NOT NULL
);
    DROP TABLE public.week;
       public         heap r       postgres    false                       1259    34517    week_id_seq    SEQUENCE     �   CREATE SEQUENCE public.week_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.week_id_seq;
       public               postgres    false    274            I           0    0    week_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.week_id_seq OWNED BY public.week.id;
          public               postgres    false    275            �           2604    34518    blocked_day id    DEFAULT     p   ALTER TABLE ONLY public.blocked_day ALTER COLUMN id SET DEFAULT nextval('public.blocked_day_id_seq'::regclass);
 =   ALTER TABLE public.blocked_day ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    218            �           2604    34519    blocked_ot id    DEFAULT     n   ALTER TABLE ONLY public.blocked_ot ALTER COLUMN id SET DEFAULT nextval('public.blocked_ot_id_seq'::regclass);
 <   ALTER TABLE public.blocked_ot ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220            �           2604    34520    clashing_subspecialties id    DEFAULT     �   ALTER TABLE ONLY public.clashing_subspecialties ALTER COLUMN id SET DEFAULT nextval('public.clashing_subspecialties_id_seq'::regclass);
 I   ALTER TABLE public.clashing_subspecialties ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    222            �           2604    34521    day id    DEFAULT     `   ALTER TABLE ONLY public.day ALTER COLUMN id SET DEFAULT nextval('public.day_id_seq'::regclass);
 5   ALTER TABLE public.day ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    224            �           2604    34522    equipment id    DEFAULT     l   ALTER TABLE ONLY public.equipment ALTER COLUMN id SET DEFAULT nextval('public.equipment_id_seq'::regclass);
 ;   ALTER TABLE public.equipment ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    226            �           2604    34523    equipment_msp id    DEFAULT     t   ALTER TABLE ONLY public.equipment_msp ALTER COLUMN id SET DEFAULT nextval('public.equipment_msp_id_seq'::regclass);
 ?   ALTER TABLE public.equipment_msp ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    228            �           2604    34524    equipment_requirement id    DEFAULT     �   ALTER TABLE ONLY public.equipment_requirement ALTER COLUMN id SET DEFAULT nextval('public.equipment_requirement_id_seq'::regclass);
 G   ALTER TABLE public.equipment_requirement ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    231    230            �           2604    34525    equipment_requirement_status id    DEFAULT     �   ALTER TABLE ONLY public.equipment_requirement_status ALTER COLUMN id SET DEFAULT nextval('public.equipment_requirement_status_id_seq'::regclass);
 N   ALTER TABLE public.equipment_requirement_status ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    233    232            �           2604    34526    fixed_ot id    DEFAULT     j   ALTER TABLE ONLY public.fixed_ot ALTER COLUMN id SET DEFAULT nextval('public.fixed_ot_id_seq'::regclass);
 :   ALTER TABLE public.fixed_ot ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    235    234            �           2604    34527    masterplan id    DEFAULT     n   ALTER TABLE ONLY public.masterplan ALTER COLUMN id SET DEFAULT nextval('public.masterplan_id_seq'::regclass);
 <   ALTER TABLE public.masterplan ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    236            �           2604    34528    month id    DEFAULT     d   ALTER TABLE ONLY public.month ALTER COLUMN id SET DEFAULT nextval('public.month_id_seq'::regclass);
 7   ALTER TABLE public.month ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    239    238            �           2604    34529    objectives id    DEFAULT     n   ALTER TABLE ONLY public.objectives ALTER COLUMN id SET DEFAULT nextval('public.objectives_id_seq'::regclass);
 <   ALTER TABLE public.objectives ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    240            �           2604    34530    ot id    DEFAULT     ^   ALTER TABLE ONLY public.ot ALTER COLUMN id SET DEFAULT nextval('public.ot_id_seq'::regclass);
 4   ALTER TABLE public.ot ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    245    242            �           2604    34531    ot_assignment id    DEFAULT     t   ALTER TABLE ONLY public.ot_assignment ALTER COLUMN id SET DEFAULT nextval('public.ot_assignment_id_seq'::regclass);
 ?   ALTER TABLE public.ot_assignment ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    243            �           2604    34532 
   ot_type id    DEFAULT     h   ALTER TABLE ONLY public.ot_type ALTER COLUMN id SET DEFAULT nextval('public.ot_type_id_seq'::regclass);
 9   ALTER TABLE public.ot_type ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    247    246            �           2604    34533    preferred_ot id    DEFAULT     r   ALTER TABLE ONLY public.preferred_ot ALTER COLUMN id SET DEFAULT nextval('public.preferred_ot_id_seq'::regclass);
 >   ALTER TABLE public.preferred_ot ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    249    248            �           2604    34534    procedure_name id    DEFAULT     v   ALTER TABLE ONLY public.procedure_name ALTER COLUMN id SET DEFAULT nextval('public.procedure_name_id_seq'::regclass);
 @   ALTER TABLE public.procedure_name ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    251    250            �           2604    34535    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    253    252            �           2604    34536    schedule_queue id    DEFAULT     v   ALTER TABLE ONLY public.schedule_queue ALTER COLUMN id SET DEFAULT nextval('public.schedule_queue_id_seq'::regclass);
 @   ALTER TABLE public.schedule_queue ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    255    254            �           2604    34537    schedule_resource id    DEFAULT     |   ALTER TABLE ONLY public.schedule_resource ALTER COLUMN id SET DEFAULT nextval('public.schedule_resource_id_seq'::regclass);
 C   ALTER TABLE public.schedule_resource ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    257    256            �           2604    34538    schedule_results id    DEFAULT     z   ALTER TABLE ONLY public.schedule_results ALTER COLUMN id SET DEFAULT nextval('public.schedule_results_id_seq'::regclass);
 B   ALTER TABLE public.schedule_results ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    259    258            �           2604    34539    specialty id    DEFAULT     l   ALTER TABLE ONLY public.specialty ALTER COLUMN id SET DEFAULT nextval('public.specialty_id_seq'::regclass);
 ;   ALTER TABLE public.specialty ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    261    260            �           2604    34540 	   status id    DEFAULT     f   ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    263    262            �           2604    34541    sub_specialties_ot_types id    DEFAULT     �   ALTER TABLE ONLY public.sub_specialties_ot_types ALTER COLUMN id SET DEFAULT nextval('public.sub_specialties_ot_types_id_seq'::regclass);
 J   ALTER TABLE public.sub_specialties_ot_types ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    265    264            �           2604    34542    sub_specialty id    DEFAULT     t   ALTER TABLE ONLY public.sub_specialty ALTER COLUMN id SET DEFAULT nextval('public.sub_specialty_id_seq'::regclass);
 ?   ALTER TABLE public.sub_specialty ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    267    266            �           2604    34543 
   surgery id    DEFAULT     h   ALTER TABLE ONLY public.surgery ALTER COLUMN id SET DEFAULT nextval('public.surgery_id_seq'::regclass);
 9   ALTER TABLE public.surgery ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    269    268            �           2604    34544    unit id    DEFAULT     b   ALTER TABLE ONLY public.unit ALTER COLUMN id SET DEFAULT nextval('public.unit_id_seq'::regclass);
 6   ALTER TABLE public.unit ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    271    270            �           2604    34545    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    273    272            �           2604    34546    week id    DEFAULT     b   ALTER TABLE ONLY public.week ALTER COLUMN id SET DEFAULT nextval('public.week_id_seq'::regclass);
 6   ALTER TABLE public.week ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    275    274            �          0    34389    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public               postgres    false    217   ca      �          0    34392    blocked_day 
   TABLE DATA           :   COPY public.blocked_day (id, day_id, unit_id) FROM stdin;
    public               postgres    false    218   �a      �          0    34396 
   blocked_ot 
   TABLE DATA           8   COPY public.blocked_ot (id, ot_id, unit_id) FROM stdin;
    public               postgres    false    220   �a      �          0    34400    clashing_subspecialties 
   TABLE DATA           P   COPY public.clashing_subspecialties (id, sub_specialty_id, unit_id) FROM stdin;
    public               postgres    false    222   �a      �          0    34404    day 
   TABLE DATA           0   COPY public.day (id, name, week_id) FROM stdin;
    public               postgres    false    224   b      �          0    34408 	   equipment 
   TABLE DATA           I   COPY public.equipment (id, name, quantity, sub_specialty_id) FROM stdin;
    public               postgres    false    226   Ib      �          0    34412    equipment_msp 
   TABLE DATA           F   COPY public.equipment_msp (id, name, quantity, status_id) FROM stdin;
    public               postgres    false    228   Kd      �          0    34416    equipment_requirement 
   TABLE DATA           k   COPY public.equipment_requirement (id, unit_id, equipment_id, equipment_requirement_status_id) FROM stdin;
    public               postgres    false    230   �e      �          0    34420    equipment_requirement_status 
   TABLE DATA           V   COPY public.equipment_requirement_status (id, description, penalty_value) FROM stdin;
    public               postgres    false    232   f      �          0    34424    fixed_ot 
   TABLE DATA           6   COPY public.fixed_ot (id, ot_id, unit_id) FROM stdin;
    public               postgres    false    234   Pf      �          0    34428 
   masterplan 
   TABLE DATA           �   COPY public.masterplan (id, description, objective_value, created_at, uploaded_file, start_date, end_date, status_id, log_usr, log_sys, task_id, user_id) FROM stdin;
    public               postgres    false    236   �f                0    34434    month 
   TABLE DATA           4   COPY public.month (id, name, status_id) FROM stdin;
    public               postgres    false    238   g                0    34438 
   objectives 
   TABLE DATA           <   COPY public.objectives (id, objectives, weight) FROM stdin;
    public               postgres    false    240   �g                0    34442    ot 
   TABLE DATA           =   COPY public.ot (id, name, ot_type_id, status_id) FROM stdin;
    public               postgres    false    242   �h                0    34445    ot_assignment 
   TABLE DATA           �   COPY public.ot_assignment (id, mssp_id, mrn, week_id, ot_id, unit_id, day_id, is_require_anaes, opening_time, closing_time, date, week_number) FROM stdin;
    public               postgres    false    243   7i      	          0    34450    ot_type 
   TABLE DATA           2   COPY public.ot_type (id, description) FROM stdin;
    public               postgres    false    246   x                0    34454    preferred_ot 
   TABLE DATA           :   COPY public.preferred_ot (id, ot_id, unit_id) FROM stdin;
    public               postgres    false    248   >x                0    34458    procedure_name 
   TABLE DATA           D   COPY public.procedure_name (id, name, sub_specialty_id) FROM stdin;
    public               postgres    false    250   [x                0    34462    role 
   TABLE DATA           (   COPY public.role (id, role) FROM stdin;
    public               postgres    false    252   �y                0    34466    schedule_queue 
   TABLE DATA           �   COPY public.schedule_queue (id, run_id, created_at, uploaded_file, status_id, start_date, end_date, log_usr, log_sys, task_id, masterplan_id, user_id, downloaded_file) FROM stdin;
    public               postgres    false    254   �y                0    34472    schedule_resource 
   TABLE DATA           @   COPY public.schedule_resource (id, resource, value) FROM stdin;
    public               postgres    false    256   �z                0    34476    schedule_results 
   TABLE DATA           �  COPY public.schedule_results (id, run_id, mrn, age, week_id, surgery_date, type_of_surgery, sub_specialty_desc, specialty_id, procedure_name, surgery_duration, phu_id, phu_start_time, phu_end_time, ot_id, ot_start_time, ot_end_time, surgeon_name, post_op_id, post_op_start_time, post_op_end_time, pacu_id, pacu_start_time, pacu_end_time, icu_id, icu_start_time, icu_end_time, booked_by, day_id, month_id, unit_id, schedule_queue_id, mssp_week_id) FROM stdin;
    public               postgres    false    258   {                0    34482 	   specialty 
   TABLE DATA           -   COPY public.specialty (id, name) FROM stdin;
    public               postgres    false    260   ��                0    34486    status 
   TABLE DATA           1   COPY public.status (id, description) FROM stdin;
    public               postgres    false    262   ��                0    34490    sub_specialties_ot_types 
   TABLE DATA           ]   COPY public.sub_specialties_ot_types (id, sub_specialty_id, ot_type_id, unit_id) FROM stdin;
    public               postgres    false    264   "�                0    34494    sub_specialty 
   TABLE DATA           Q   COPY public.sub_specialty (id, description, specialty_id, color_hex) FROM stdin;
    public               postgres    false    266   ��                0    34498    surgery 
   TABLE DATA           �   COPY public.surgery (id, mrn, booking_date, estimated_duration, age, gender_code, surgeon, unit_id, procedure_name_id, mssp_id) FROM stdin;
    public               postgres    false    268   q�      !          0    34504    unit 
   TABLE DATA           �   COPY public.unit (id, name, sub_specialty_id, is_require_anaes, max_slot_limit, no_of_slots, resource_requirement_id, color_hex) FROM stdin;
    public               postgres    false    270   #�      #          0    34508    user 
   TABLE DATA           y   COPY public."user" (id, email, password, first_name, last_name, is_active, role_id, otp, email_notification) FROM stdin;
    public               postgres    false    272   9�      %          0    34514    week 
   TABLE DATA           3   COPY public.week (id, name, status_id) FROM stdin;
    public               postgres    false    274   �      J           0    0    blocked_day_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.blocked_day_id_seq', 2, true);
          public               postgres    false    219            K           0    0    blocked_ot_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.blocked_ot_id_seq', 2, true);
          public               postgres    false    221            L           0    0    clashing_subspecialties_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.clashing_subspecialties_id_seq', 2, true);
          public               postgres    false    223            M           0    0 
   day_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.day_id_seq', 5, true);
          public               postgres    false    225            N           0    0    equipment_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.equipment_id_seq', 1, false);
          public               postgres    false    227            O           0    0    equipment_msp_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.equipment_msp_id_seq', 1, false);
          public               postgres    false    229            P           0    0    equipment_requirement_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.equipment_requirement_id_seq', 1, false);
          public               postgres    false    231            Q           0    0 #   equipment_requirement_status_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.equipment_requirement_status_id_seq', 1, false);
          public               postgres    false    233            R           0    0    fixed_ot_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.fixed_ot_id_seq', 11, true);
          public               postgres    false    235            S           0    0    masterplan_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.masterplan_id_seq', 2, true);
          public               postgres    false    237            T           0    0    month_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.month_id_seq', 12, true);
          public               postgres    false    239            U           0    0    objectives_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.objectives_id_seq', 1, false);
          public               postgres    false    241            V           0    0    ot_assignment_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ot_assignment_id_seq', 390, true);
          public               postgres    false    244            W           0    0 	   ot_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.ot_id_seq', 1, false);
          public               postgres    false    245            X           0    0    ot_type_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ot_type_id_seq', 1, false);
          public               postgres    false    247            Y           0    0    preferred_ot_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.preferred_ot_id_seq', 1, false);
          public               postgres    false    249            Z           0    0    procedure_name_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.procedure_name_id_seq', 1, false);
          public               postgres    false    251            [           0    0    role_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.role_id_seq', 1, true);
          public               postgres    false    253            \           0    0    schedule_queue_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.schedule_queue_id_seq', 10, true);
          public               postgres    false    255            ]           0    0    schedule_resource_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.schedule_resource_id_seq', 5, true);
          public               postgres    false    257            ^           0    0    schedule_results_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.schedule_results_id_seq', 9199, true);
          public               postgres    false    259            _           0    0    specialty_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.specialty_id_seq', 6, true);
          public               postgres    false    261            `           0    0    status_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.status_id_seq', 6, true);
          public               postgres    false    263            a           0    0    sub_specialties_ot_types_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.sub_specialties_ot_types_id_seq', 38, true);
          public               postgres    false    265            b           0    0    sub_specialty_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sub_specialty_id_seq', 2, true);
          public               postgres    false    267            c           0    0    surgery_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.surgery_id_seq', 390, true);
          public               postgres    false    269            d           0    0    unit_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.unit_id_seq', 1, false);
          public               postgres    false    271            e           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 3, true);
          public               postgres    false    273            f           0    0    week_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.week_id_seq', 15, true);
          public               postgres    false    275            �           2606    34548 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public                 postgres    false    217            �           2606    34550    blocked_day blocked_day_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.blocked_day
    ADD CONSTRAINT blocked_day_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.blocked_day DROP CONSTRAINT blocked_day_pkey;
       public                 postgres    false    218            �           2606    34552    blocked_ot blocked_ot_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.blocked_ot
    ADD CONSTRAINT blocked_ot_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.blocked_ot DROP CONSTRAINT blocked_ot_pkey;
       public                 postgres    false    220            �           2606    34554 4   clashing_subspecialties clashing_subspecialties_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.clashing_subspecialties
    ADD CONSTRAINT clashing_subspecialties_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.clashing_subspecialties DROP CONSTRAINT clashing_subspecialties_pkey;
       public                 postgres    false    222            �           2606    34556    day day_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.day
    ADD CONSTRAINT day_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.day DROP CONSTRAINT day_pkey;
       public                 postgres    false    224            �           2606    34558     equipment_msp equipment_msp_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.equipment_msp
    ADD CONSTRAINT equipment_msp_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.equipment_msp DROP CONSTRAINT equipment_msp_pkey;
       public                 postgres    false    228            �           2606    34560    equipment equipment_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.equipment DROP CONSTRAINT equipment_pkey;
       public                 postgres    false    226            �           2606    34562 0   equipment_requirement equipment_requirement_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.equipment_requirement
    ADD CONSTRAINT equipment_requirement_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.equipment_requirement DROP CONSTRAINT equipment_requirement_pkey;
       public                 postgres    false    230            �           2606    34564 >   equipment_requirement_status equipment_requirement_status_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.equipment_requirement_status
    ADD CONSTRAINT equipment_requirement_status_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.equipment_requirement_status DROP CONSTRAINT equipment_requirement_status_pkey;
       public                 postgres    false    232            �           2606    34566    fixed_ot fixed_ot_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.fixed_ot
    ADD CONSTRAINT fixed_ot_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.fixed_ot DROP CONSTRAINT fixed_ot_pkey;
       public                 postgres    false    234            �           2606    34568    masterplan masterplan_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.masterplan
    ADD CONSTRAINT masterplan_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.masterplan DROP CONSTRAINT masterplan_pkey;
       public                 postgres    false    236            �           2606    34570    month month_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.month
    ADD CONSTRAINT month_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.month DROP CONSTRAINT month_pkey;
       public                 postgres    false    238            �           2606    34572    objectives objectives_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.objectives
    ADD CONSTRAINT objectives_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.objectives DROP CONSTRAINT objectives_pkey;
       public                 postgres    false    240            �           2606    34574     ot_assignment ot_assignment_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ot_assignment DROP CONSTRAINT ot_assignment_pkey;
       public                 postgres    false    243            �           2606    34576 
   ot ot_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY public.ot
    ADD CONSTRAINT ot_pkey PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.ot DROP CONSTRAINT ot_pkey;
       public                 postgres    false    242            �           2606    34578    ot_type ot_type_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ot_type
    ADD CONSTRAINT ot_type_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ot_type DROP CONSTRAINT ot_type_pkey;
       public                 postgres    false    246            �           2606    34580    preferred_ot preferred_ot_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.preferred_ot
    ADD CONSTRAINT preferred_ot_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.preferred_ot DROP CONSTRAINT preferred_ot_pkey;
       public                 postgres    false    248                       2606    34582 "   procedure_name procedure_name_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.procedure_name
    ADD CONSTRAINT procedure_name_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.procedure_name DROP CONSTRAINT procedure_name_pkey;
       public                 postgres    false    250                       2606    34584    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public                 postgres    false    252                       2606    34586    role role_role_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_role_key UNIQUE (role);
 <   ALTER TABLE ONLY public.role DROP CONSTRAINT role_role_key;
       public                 postgres    false    252            
           2606    34588 "   schedule_queue schedule_queue_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.schedule_queue
    ADD CONSTRAINT schedule_queue_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.schedule_queue DROP CONSTRAINT schedule_queue_pkey;
       public                 postgres    false    254                       2606    34590 (   schedule_resource schedule_resource_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.schedule_resource
    ADD CONSTRAINT schedule_resource_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.schedule_resource DROP CONSTRAINT schedule_resource_pkey;
       public                 postgres    false    256                       2606    34592 &   schedule_results schedule_results_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.schedule_results
    ADD CONSTRAINT schedule_results_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.schedule_results DROP CONSTRAINT schedule_results_pkey;
       public                 postgres    false    258                       2606    34594    specialty specialty_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.specialty DROP CONSTRAINT specialty_pkey;
       public                 postgres    false    260                       2606    34596    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public                 postgres    false    262                       2606    34598 6   sub_specialties_ot_types sub_specialties_ot_types_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.sub_specialties_ot_types
    ADD CONSTRAINT sub_specialties_ot_types_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.sub_specialties_ot_types DROP CONSTRAINT sub_specialties_ot_types_pkey;
       public                 postgres    false    264                       2606    34600     sub_specialty sub_specialty_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sub_specialty
    ADD CONSTRAINT sub_specialty_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sub_specialty DROP CONSTRAINT sub_specialty_pkey;
       public                 postgres    false    266                       2606    34602    surgery surgery_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.surgery
    ADD CONSTRAINT surgery_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.surgery DROP CONSTRAINT surgery_pkey;
       public                 postgres    false    268            "           2606    34604    unit unit_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.unit DROP CONSTRAINT unit_pkey;
       public                 postgres    false    270            %           2606    34606    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public                 postgres    false    272            '           2606    34608    user user_otp_key 
   CONSTRAINT     M   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_otp_key UNIQUE (otp);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_otp_key;
       public                 postgres    false    272            )           2606    34610    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public                 postgres    false    272            ,           2606    34612    week week_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.week
    ADD CONSTRAINT week_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.week DROP CONSTRAINT week_pkey;
       public                 postgres    false    274            �           1259    34613    ix_blocked_day_id    INDEX     G   CREATE INDEX ix_blocked_day_id ON public.blocked_day USING btree (id);
 %   DROP INDEX public.ix_blocked_day_id;
       public                 postgres    false    218            �           1259    34614    ix_blocked_ot_id    INDEX     E   CREATE INDEX ix_blocked_ot_id ON public.blocked_ot USING btree (id);
 $   DROP INDEX public.ix_blocked_ot_id;
       public                 postgres    false    220            �           1259    34615    ix_clashing_subspecialties_id    INDEX     _   CREATE INDEX ix_clashing_subspecialties_id ON public.clashing_subspecialties USING btree (id);
 1   DROP INDEX public.ix_clashing_subspecialties_id;
       public                 postgres    false    222            �           1259    34616 	   ix_day_id    INDEX     7   CREATE INDEX ix_day_id ON public.day USING btree (id);
    DROP INDEX public.ix_day_id;
       public                 postgres    false    224            �           1259    34617    ix_equipment_id    INDEX     C   CREATE INDEX ix_equipment_id ON public.equipment USING btree (id);
 #   DROP INDEX public.ix_equipment_id;
       public                 postgres    false    226            �           1259    34618    ix_equipment_msp_id    INDEX     K   CREATE INDEX ix_equipment_msp_id ON public.equipment_msp USING btree (id);
 '   DROP INDEX public.ix_equipment_msp_id;
       public                 postgres    false    228            �           1259    34619    ix_equipment_requirement_id    INDEX     [   CREATE INDEX ix_equipment_requirement_id ON public.equipment_requirement USING btree (id);
 /   DROP INDEX public.ix_equipment_requirement_id;
       public                 postgres    false    230            �           1259    34620 "   ix_equipment_requirement_status_id    INDEX     i   CREATE INDEX ix_equipment_requirement_status_id ON public.equipment_requirement_status USING btree (id);
 6   DROP INDEX public.ix_equipment_requirement_status_id;
       public                 postgres    false    232            �           1259    34621    ix_fixed_ot_id    INDEX     A   CREATE INDEX ix_fixed_ot_id ON public.fixed_ot USING btree (id);
 "   DROP INDEX public.ix_fixed_ot_id;
       public                 postgres    false    234            �           1259    34622    ix_masterplan_id    INDEX     E   CREATE INDEX ix_masterplan_id ON public.masterplan USING btree (id);
 $   DROP INDEX public.ix_masterplan_id;
       public                 postgres    false    236            �           1259    34623    ix_month_id    INDEX     ;   CREATE INDEX ix_month_id ON public.month USING btree (id);
    DROP INDEX public.ix_month_id;
       public                 postgres    false    238            �           1259    34624    ix_objectives_id    INDEX     E   CREATE INDEX ix_objectives_id ON public.objectives USING btree (id);
 $   DROP INDEX public.ix_objectives_id;
       public                 postgres    false    240            �           1259    34625    ix_ot_assignment_id    INDEX     K   CREATE INDEX ix_ot_assignment_id ON public.ot_assignment USING btree (id);
 '   DROP INDEX public.ix_ot_assignment_id;
       public                 postgres    false    243            �           1259    34626    ix_ot_id    INDEX     5   CREATE INDEX ix_ot_id ON public.ot USING btree (id);
    DROP INDEX public.ix_ot_id;
       public                 postgres    false    242            �           1259    34627    ix_ot_type_id    INDEX     ?   CREATE INDEX ix_ot_type_id ON public.ot_type USING btree (id);
 !   DROP INDEX public.ix_ot_type_id;
       public                 postgres    false    246            �           1259    34628    ix_preferred_ot_id    INDEX     I   CREATE INDEX ix_preferred_ot_id ON public.preferred_ot USING btree (id);
 &   DROP INDEX public.ix_preferred_ot_id;
       public                 postgres    false    248                        1259    34629    ix_procedure_name_id    INDEX     M   CREATE INDEX ix_procedure_name_id ON public.procedure_name USING btree (id);
 (   DROP INDEX public.ix_procedure_name_id;
       public                 postgres    false    250                       1259    34630 
   ix_role_id    INDEX     9   CREATE INDEX ix_role_id ON public.role USING btree (id);
    DROP INDEX public.ix_role_id;
       public                 postgres    false    252                       1259    34631    ix_schedule_queue_id    INDEX     M   CREATE INDEX ix_schedule_queue_id ON public.schedule_queue USING btree (id);
 (   DROP INDEX public.ix_schedule_queue_id;
       public                 postgres    false    254                       1259    34632    ix_schedule_resource_id    INDEX     S   CREATE INDEX ix_schedule_resource_id ON public.schedule_resource USING btree (id);
 +   DROP INDEX public.ix_schedule_resource_id;
       public                 postgres    false    256                       1259    34633    ix_schedule_results_id    INDEX     Q   CREATE INDEX ix_schedule_results_id ON public.schedule_results USING btree (id);
 *   DROP INDEX public.ix_schedule_results_id;
       public                 postgres    false    258                       1259    34634    ix_specialty_id    INDEX     C   CREATE INDEX ix_specialty_id ON public.specialty USING btree (id);
 #   DROP INDEX public.ix_specialty_id;
       public                 postgres    false    260                       1259    34635    ix_status_id    INDEX     =   CREATE INDEX ix_status_id ON public.status USING btree (id);
     DROP INDEX public.ix_status_id;
       public                 postgres    false    262                       1259    34636    ix_sub_specialties_ot_types_id    INDEX     a   CREATE INDEX ix_sub_specialties_ot_types_id ON public.sub_specialties_ot_types USING btree (id);
 2   DROP INDEX public.ix_sub_specialties_ot_types_id;
       public                 postgres    false    264                       1259    34637    ix_sub_specialty_id    INDEX     K   CREATE INDEX ix_sub_specialty_id ON public.sub_specialty USING btree (id);
 '   DROP INDEX public.ix_sub_specialty_id;
       public                 postgres    false    266                       1259    34638    ix_surgery_id    INDEX     ?   CREATE INDEX ix_surgery_id ON public.surgery USING btree (id);
 !   DROP INDEX public.ix_surgery_id;
       public                 postgres    false    268                        1259    34639 
   ix_unit_id    INDEX     9   CREATE INDEX ix_unit_id ON public.unit USING btree (id);
    DROP INDEX public.ix_unit_id;
       public                 postgres    false    270            #           1259    34640 
   ix_user_id    INDEX     ;   CREATE INDEX ix_user_id ON public."user" USING btree (id);
    DROP INDEX public.ix_user_id;
       public                 postgres    false    272            *           1259    34641 
   ix_week_id    INDEX     9   CREATE INDEX ix_week_id ON public.week USING btree (id);
    DROP INDEX public.ix_week_id;
       public                 postgres    false    274            -           2606    34642 #   blocked_day blocked_day_day_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.blocked_day
    ADD CONSTRAINT blocked_day_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.day(id);
 M   ALTER TABLE ONLY public.blocked_day DROP CONSTRAINT blocked_day_day_id_fkey;
       public               postgres    false    218    4826    224            .           2606    34647 $   blocked_day blocked_day_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.blocked_day
    ADD CONSTRAINT blocked_day_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 N   ALTER TABLE ONLY public.blocked_day DROP CONSTRAINT blocked_day_unit_id_fkey;
       public               postgres    false    218    270    4898            /           2606    34652     blocked_ot blocked_ot_ot_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.blocked_ot
    ADD CONSTRAINT blocked_ot_ot_id_fkey FOREIGN KEY (ot_id) REFERENCES public.ot(id);
 J   ALTER TABLE ONLY public.blocked_ot DROP CONSTRAINT blocked_ot_ot_id_fkey;
       public               postgres    false    242    4854    220            0           2606    34657 "   blocked_ot blocked_ot_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.blocked_ot
    ADD CONSTRAINT blocked_ot_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 L   ALTER TABLE ONLY public.blocked_ot DROP CONSTRAINT blocked_ot_unit_id_fkey;
       public               postgres    false    4898    220    270            1           2606    34662 E   clashing_subspecialties clashing_subspecialties_sub_specialty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clashing_subspecialties
    ADD CONSTRAINT clashing_subspecialties_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);
 o   ALTER TABLE ONLY public.clashing_subspecialties DROP CONSTRAINT clashing_subspecialties_sub_specialty_id_fkey;
       public               postgres    false    4892    222    266            2           2606    34667 <   clashing_subspecialties clashing_subspecialties_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clashing_subspecialties
    ADD CONSTRAINT clashing_subspecialties_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 f   ALTER TABLE ONLY public.clashing_subspecialties DROP CONSTRAINT clashing_subspecialties_unit_id_fkey;
       public               postgres    false    222    4898    270            3           2606    34672    day day_week_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.day
    ADD CONSTRAINT day_week_id_fkey FOREIGN KEY (week_id) REFERENCES public.week(id);
 >   ALTER TABLE ONLY public.day DROP CONSTRAINT day_week_id_fkey;
       public               postgres    false    274    224    4908            5           2606    34677 *   equipment_msp equipment_msp_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipment_msp
    ADD CONSTRAINT equipment_msp_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);
 T   ALTER TABLE ONLY public.equipment_msp DROP CONSTRAINT equipment_msp_status_id_fkey;
       public               postgres    false    4886    228    262            6           2606    34682 =   equipment_requirement equipment_requirement_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipment_requirement
    ADD CONSTRAINT equipment_requirement_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(id);
 g   ALTER TABLE ONLY public.equipment_requirement DROP CONSTRAINT equipment_requirement_equipment_id_fkey;
       public               postgres    false    230    4829    226            7           2606    34687 P   equipment_requirement equipment_requirement_equipment_requirement_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipment_requirement
    ADD CONSTRAINT equipment_requirement_equipment_requirement_status_id_fkey FOREIGN KEY (equipment_requirement_status_id) REFERENCES public.equipment_requirement_status(id);
 z   ALTER TABLE ONLY public.equipment_requirement DROP CONSTRAINT equipment_requirement_equipment_requirement_status_id_fkey;
       public               postgres    false    230    4838    232            8           2606    34692 8   equipment_requirement equipment_requirement_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipment_requirement
    ADD CONSTRAINT equipment_requirement_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 b   ALTER TABLE ONLY public.equipment_requirement DROP CONSTRAINT equipment_requirement_unit_id_fkey;
       public               postgres    false    4898    270    230            4           2606    34697 )   equipment equipment_sub_specialty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);
 S   ALTER TABLE ONLY public.equipment DROP CONSTRAINT equipment_sub_specialty_id_fkey;
       public               postgres    false    226    266    4892            9           2606    34702    fixed_ot fixed_ot_ot_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.fixed_ot
    ADD CONSTRAINT fixed_ot_ot_id_fkey FOREIGN KEY (ot_id) REFERENCES public.ot(id);
 F   ALTER TABLE ONLY public.fixed_ot DROP CONSTRAINT fixed_ot_ot_id_fkey;
       public               postgres    false    234    242    4854            :           2606    34707    fixed_ot fixed_ot_unit_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.fixed_ot
    ADD CONSTRAINT fixed_ot_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 H   ALTER TABLE ONLY public.fixed_ot DROP CONSTRAINT fixed_ot_unit_id_fkey;
       public               postgres    false    270    234    4898            ;           2606    34712 $   masterplan masterplan_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.masterplan
    ADD CONSTRAINT masterplan_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);
 N   ALTER TABLE ONLY public.masterplan DROP CONSTRAINT masterplan_status_id_fkey;
       public               postgres    false    236    4886    262            <           2606    34717 "   masterplan masterplan_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.masterplan
    ADD CONSTRAINT masterplan_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 L   ALTER TABLE ONLY public.masterplan DROP CONSTRAINT masterplan_user_id_fkey;
       public               postgres    false    272    4905    236            =           2606    34722    month month_status_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.month
    ADD CONSTRAINT month_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);
 D   ALTER TABLE ONLY public.month DROP CONSTRAINT month_status_id_fkey;
       public               postgres    false    4886    262    238            @           2606    34727 '   ot_assignment ot_assignment_day_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.day(id);
 Q   ALTER TABLE ONLY public.ot_assignment DROP CONSTRAINT ot_assignment_day_id_fkey;
       public               postgres    false    224    4826    243            A           2606    34732 (   ot_assignment ot_assignment_mssp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_mssp_id_fkey FOREIGN KEY (mssp_id) REFERENCES public.masterplan(id);
 R   ALTER TABLE ONLY public.ot_assignment DROP CONSTRAINT ot_assignment_mssp_id_fkey;
       public               postgres    false    243    4845    236            B           2606    34737 &   ot_assignment ot_assignment_ot_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_ot_id_fkey FOREIGN KEY (ot_id) REFERENCES public.ot(id);
 P   ALTER TABLE ONLY public.ot_assignment DROP CONSTRAINT ot_assignment_ot_id_fkey;
       public               postgres    false    242    243    4854            C           2606    34742 (   ot_assignment ot_assignment_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 R   ALTER TABLE ONLY public.ot_assignment DROP CONSTRAINT ot_assignment_unit_id_fkey;
       public               postgres    false    270    243    4898            D           2606    34747 (   ot_assignment ot_assignment_week_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ot_assignment
    ADD CONSTRAINT ot_assignment_week_id_fkey FOREIGN KEY (week_id) REFERENCES public.week(id);
 R   ALTER TABLE ONLY public.ot_assignment DROP CONSTRAINT ot_assignment_week_id_fkey;
       public               postgres    false    243    4908    274            >           2606    34752    ot ot_ot_type_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.ot
    ADD CONSTRAINT ot_ot_type_id_fkey FOREIGN KEY (ot_type_id) REFERENCES public.ot_type(id);
 ?   ALTER TABLE ONLY public.ot DROP CONSTRAINT ot_ot_type_id_fkey;
       public               postgres    false    4860    242    246            ?           2606    34757    ot ot_status_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.ot
    ADD CONSTRAINT ot_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);
 >   ALTER TABLE ONLY public.ot DROP CONSTRAINT ot_status_id_fkey;
       public               postgres    false    242    4886    262            E           2606    34762 $   preferred_ot preferred_ot_ot_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.preferred_ot
    ADD CONSTRAINT preferred_ot_ot_id_fkey FOREIGN KEY (ot_id) REFERENCES public.ot(id);
 N   ALTER TABLE ONLY public.preferred_ot DROP CONSTRAINT preferred_ot_ot_id_fkey;
       public               postgres    false    4854    248    242            F           2606    34767 &   preferred_ot preferred_ot_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.preferred_ot
    ADD CONSTRAINT preferred_ot_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 P   ALTER TABLE ONLY public.preferred_ot DROP CONSTRAINT preferred_ot_unit_id_fkey;
       public               postgres    false    270    248    4898            G           2606    34772 3   procedure_name procedure_name_sub_specialty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.procedure_name
    ADD CONSTRAINT procedure_name_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);
 ]   ALTER TABLE ONLY public.procedure_name DROP CONSTRAINT procedure_name_sub_specialty_id_fkey;
       public               postgres    false    4892    250    266            H           2606    34777 0   schedule_queue schedule_queue_masterplan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_queue
    ADD CONSTRAINT schedule_queue_masterplan_id_fkey FOREIGN KEY (masterplan_id) REFERENCES public.masterplan(id);
 Z   ALTER TABLE ONLY public.schedule_queue DROP CONSTRAINT schedule_queue_masterplan_id_fkey;
       public               postgres    false    4845    254    236            I           2606    34782 ,   schedule_queue schedule_queue_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_queue
    ADD CONSTRAINT schedule_queue_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);
 V   ALTER TABLE ONLY public.schedule_queue DROP CONSTRAINT schedule_queue_status_id_fkey;
       public               postgres    false    262    4886    254            J           2606    34787 *   schedule_queue schedule_queue_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_queue
    ADD CONSTRAINT schedule_queue_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 T   ALTER TABLE ONLY public.schedule_queue DROP CONSTRAINT schedule_queue_user_id_fkey;
       public               postgres    false    4905    272    254            K           2606    34792 -   schedule_results schedule_results_day_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_results
    ADD CONSTRAINT schedule_results_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.day(id);
 W   ALTER TABLE ONLY public.schedule_results DROP CONSTRAINT schedule_results_day_id_fkey;
       public               postgres    false    4826    258    224            L           2606    34797 /   schedule_results schedule_results_month_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_results
    ADD CONSTRAINT schedule_results_month_id_fkey FOREIGN KEY (month_id) REFERENCES public.month(id);
 Y   ALTER TABLE ONLY public.schedule_results DROP CONSTRAINT schedule_results_month_id_fkey;
       public               postgres    false    238    258    4848            M           2606    34877 3   schedule_results schedule_results_mssp_week_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_results
    ADD CONSTRAINT schedule_results_mssp_week_id_fkey FOREIGN KEY (mssp_week_id) REFERENCES public.week(id);
 ]   ALTER TABLE ONLY public.schedule_results DROP CONSTRAINT schedule_results_mssp_week_id_fkey;
       public               postgres    false    4908    274    258            N           2606    34802 8   schedule_results schedule_results_schedule_queue_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_results
    ADD CONSTRAINT schedule_results_schedule_queue_id_fkey FOREIGN KEY (schedule_queue_id) REFERENCES public.schedule_queue(id);
 b   ALTER TABLE ONLY public.schedule_results DROP CONSTRAINT schedule_results_schedule_queue_id_fkey;
       public               postgres    false    4874    258    254            O           2606    34807 .   schedule_results schedule_results_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_results
    ADD CONSTRAINT schedule_results_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 X   ALTER TABLE ONLY public.schedule_results DROP CONSTRAINT schedule_results_unit_id_fkey;
       public               postgres    false    258    4898    270            P           2606    34812 .   schedule_results schedule_results_week_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule_results
    ADD CONSTRAINT schedule_results_week_id_fkey FOREIGN KEY (week_id) REFERENCES public.week(id);
 X   ALTER TABLE ONLY public.schedule_results DROP CONSTRAINT schedule_results_week_id_fkey;
       public               postgres    false    258    4908    274            Q           2606    34817 A   sub_specialties_ot_types sub_specialties_ot_types_ot_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_specialties_ot_types
    ADD CONSTRAINT sub_specialties_ot_types_ot_type_id_fkey FOREIGN KEY (ot_type_id) REFERENCES public.ot_type(id);
 k   ALTER TABLE ONLY public.sub_specialties_ot_types DROP CONSTRAINT sub_specialties_ot_types_ot_type_id_fkey;
       public               postgres    false    264    4860    246            R           2606    34822 G   sub_specialties_ot_types sub_specialties_ot_types_sub_specialty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_specialties_ot_types
    ADD CONSTRAINT sub_specialties_ot_types_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);
 q   ALTER TABLE ONLY public.sub_specialties_ot_types DROP CONSTRAINT sub_specialties_ot_types_sub_specialty_id_fkey;
       public               postgres    false    266    264    4892            S           2606    34827 >   sub_specialties_ot_types sub_specialties_ot_types_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_specialties_ot_types
    ADD CONSTRAINT sub_specialties_ot_types_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 h   ALTER TABLE ONLY public.sub_specialties_ot_types DROP CONSTRAINT sub_specialties_ot_types_unit_id_fkey;
       public               postgres    false    270    264    4898            T           2606    34832 -   sub_specialty sub_specialty_specialty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_specialty
    ADD CONSTRAINT sub_specialty_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES public.specialty(id);
 W   ALTER TABLE ONLY public.sub_specialty DROP CONSTRAINT sub_specialty_specialty_id_fkey;
       public               postgres    false    4883    266    260            U           2606    34837    surgery surgery_mssp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.surgery
    ADD CONSTRAINT surgery_mssp_id_fkey FOREIGN KEY (mssp_id) REFERENCES public.masterplan(id);
 F   ALTER TABLE ONLY public.surgery DROP CONSTRAINT surgery_mssp_id_fkey;
       public               postgres    false    236    4845    268            V           2606    34842 &   surgery surgery_procedure_name_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.surgery
    ADD CONSTRAINT surgery_procedure_name_id_fkey FOREIGN KEY (procedure_name_id) REFERENCES public.procedure_name(id);
 P   ALTER TABLE ONLY public.surgery DROP CONSTRAINT surgery_procedure_name_id_fkey;
       public               postgres    false    250    4866    268            W           2606    34847    surgery surgery_unit_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.surgery
    ADD CONSTRAINT surgery_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);
 F   ALTER TABLE ONLY public.surgery DROP CONSTRAINT surgery_unit_id_fkey;
       public               postgres    false    270    4898    268            X           2606    34852    unit unit_sub_specialty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_sub_specialty_id_fkey FOREIGN KEY (sub_specialty_id) REFERENCES public.sub_specialty(id);
 I   ALTER TABLE ONLY public.unit DROP CONSTRAINT unit_sub_specialty_id_fkey;
       public               postgres    false    270    4892    266            Y           2606    34857    user user_role_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_role_id_fkey;
       public               postgres    false    272    252    4869            Z           2606    34862    week week_status_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.week
    ADD CONSTRAINT week_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);
 B   ALTER TABLE ONLY public.week DROP CONSTRAINT week_status_id_fkey;
       public               postgres    false    4886    262    274            �      x��L2604�H4700����� &kz      �      x�3�4�4�2�Ff\1z\\\ 
B      �      x�3�4�4�2�4�1z\\\ 9      �      x�3�4�4�bN#�=... 
      �   6   x�3����KI��4�2�)M-���9�SS�`<ΐ��"(ǔӭ(���� oG�      �   �  x�URM��0<?�
��*6	�#%΂ė�H]�/�K���_�4{3���̄@`.�Å�}�q��eT|�6@D-=\��}�ĭp/K{ȁ0Ϫ�%IP�y�� ��m!,�r��*�f`aZ+��o]8h}SbZD�F*5���O/}`J4���\d�>�3쨋�Xw^��>�AL�d���������y
��\q���J�����N,�~�q�flE7�j6=i�&�/����^�!�]:�<r${���$�X9�"���.��FR�,�b��n���QI�'���7;�#J ];I���f�L�QȄ�x���e%�KL`;l���0�Q�����Iz���R�	t�<�}E�C0�Y����ΒT����P]�:�H�)��寳�:��0��`��C�J��[�B�G��ߣX�v�����nt'5�>��l�p� ���^w��m�S����[����̪c!Nw�K��#��"�n      �   �  x�UR�n�0��_����g��ـ�\pC/$��� ���(��+9Ù�Y2�_:�'#�Zb�d��9D�lWy�*��0uV3�9u3C�lۑa�f�T�J[
�9$��0�V� ,`K�f�:��uMch�������5���v�T�!z_j%^8Nw��	�%߈f�j�S��3ɚM� G��e�yCt������_����p����k�]������qZa~�5NS��=�s|��7�@!:�_��
R�F�}�����/�/�4;f�~�7�F��׶_c���""8UR9�K{m4)�aB��G����!O���l<�m!�W�7W�Xx����rXdV 'e`	��/VP8o�ߞw�5<,0hǰ���˖;���F<{0�����d2�A���      �      x������ � �      �   <   x�3�-NMQH�Tp��Q.-JO-�L-�4�2����� Iqå��sS���b���� �m      �   =   x����0��x��\Ҥ٥���CB�<�<dJ�0�1���^���Ց��|���S�]���	�      �   �   x���Mj�0��������-�)�l��-�J�@z��&P/����f�a8���g�Q����Z|޼�D$AV�:2��j�u�.���k{�N����N�m������Z��smm���\�@�Yj�2�+l�'�2�e�����.��<��q�����Q|v�t`@�p=�%�N5�2I����4�I�tN�)��Kp�}�}^�         k   x�=�A�0D���0
�.�8�[@� � q{�ݽ?c1R�$;�)�e'WT�I|��A�����5s`E��Υ�_^�򅕗ĳcѲ�O�
���U������s ��&e         �   x�e��n�0E��W���
�N��kJ�ذ��K�:j;��{G�C�Ys���z��_�2�?Z}=�xzn�x�m������(ϳ���zzI�e�Uy1M�����%>����w	T��'>�|�Jaw�����]�h�ᨂ�NA-����l�UlY2d%i��?�|�"��\m�`�����/l~՛��,����S��E:Q��{��y�U��Q�ewm�         E   x�%���@�3�	�_G��T�@؆f;���X���/��*�Q9*�81���nl�=$GYY         �  x���[��E�O�%�D�9�A�3���6I9 �} 6�^�J|S��'�js��?�����_����?RZ�>��$I�[�����?��ާ���bԿn�n�d�#�Z��XT��h}h���}�M�E��f�XKߩ�3?mS�����w+�9��3,#�lTc�k`��ې�.b�'?E�>C��`N>'b�YjGyݢ��m��%m�rξ��f�V�ߙ����;�7�Hڵ�b0(H)cڑPǟ�Sk&�&�����b�Б1Jc}agR>�\��@��B�=BIj�4����$٧�UC�%�T�q�P.>Df�ek2��`j�k��	����T� +E���*:�a~R��PIpY���#1G�e� H���Q�V�F�-�0�QEz��|I_8�CX�����R5i����h�=�@M���,5�$�Ӯ��FnV �T¼߱�Z��l ���cr��$��C/��'eJog���>�G�EEI�X�艤�r��.��ozRs�zR��z2R��&�[@MtHZ�.T�{��&��}ވ=2�	�78�J3o.#WX����4�Hϥ�����v0-8c�u%�nֿ�,��3�P-f��b��c����z����m8�\IՁپ��,�41�CN�8�\��h	GIȻ�VY�y�Q�F<e6�a�+��-6I$]ղ�.��0�4_R{�~�[D���?�R�	�zāy�i
�~u�+3_�2��b5S�2lܽ��#YXݘ�I�2�QK�(���'��5�9���#���O�=_F�i�P45KCI�J����5�u�Mj��A��Z-�mz�z�iđ����d�g�o.VC��Գz�7�&�M=��f�k��Wk��#������#�C��NrӚr	�Ix�������0��&�u7��
�gdK���vh�绦�J���ӂ�O�fJRz)t��v4��IyW�.6C��,[r�#y�x[g�ã4s]�S� ��ڕg�8f��f�-���	O9�L��'��f��p&y,=i�xq�9��<l�*1g2-�H�%���3
������NVH]"S�%�%��	w"ҚL��r˙?Y�
��b^���ogbՄ��Ţ݅���'���6�oE�5iR��rL��eN9�Bm��$�5'W�	J����pHPz��r8�lY����'S�Y�C���+�u.�s1]���Q\SϿrB.�Ɯ�@��ѧ�?��=�l7�8��*�%�c8���9�:z�R���.�m����3A����֣�c�di��Į�ڢ۱X�#4uY\����u�lOPi�␖2� ��(nX�.��s�:��a�p�Z�>�qmBf}ٵ��]�� r�l�Y�u�d\�K��_�
,�����yo6�kK�p%
lD�kOݳ�,��]s�õwMR��Hg��'Q&d�.{�Mc�D���C��'"�5>x6��E�w�:���юU��H�8EC��w��u��E8�KY���{��p�z )�[kl��y�Uأ�':2������>��V�86#)n�"���=eFФ8��ե.#ԚQ3kծ4���~�0usF��7�:�c_󐳠U�c_sC[�V��zP�UK�O-v�@q�/c����M.��~�9�/U���k\��X��mm����0����ݬ�S�b]ۃUX�=׵���B85b��eY�`4I�۶+��R ��I��P-Uiމ$�^�l�h27Ar�D���ʫ��ݺ���\nƱ�f�kݖ��3�vj�ֻ�5�~��=H�z������K+����i+�}�*�J���\G�L*v������$����q��%d���%K�� ep�t=�9��\K~��F���N�H{�D�����[y嘷q�����n��v����<��+U�*�w*���s�г���_��B2�9M��b�N��ꭊ���ǃ�����n;z�����F��z�N�Sv�O���t �I�� �� �S���z�����K�#8��L�H��\�,�]��i������m����(U:Zkw�h�mr ����U��ު���hJS�dt'����;�]lyؑt����)r���J�8[4�)�=��r��΄6ܒ�����S�@y���== ��"b|�v��nf��b~��x8�]��x�~0���c���z�m����-�����6�������Y���@]g^�ZН̘��R+��hί���gX ��Ǭ���D/Nxb]��|��
Q^9fy�L�,��i^�J�(�q[�D��3zۮZ�|���/4�Q)h�\3ؐ�?�M2R������y��J��c�Z����H��\f�`x�~�|�C:�;R��u�`Ƭ�OpSMi�����*$a���w'���`<�M������8�c��U�X����95�	SR�C����������s��]m��yo�n<�As^[�Y+�wK�q�x���K\���|�ދ��#��8ӗ�[p&?����,8�_�eiBa�*���}j��H���R۾P������j] ��ksD�ջ*���I��87�\���VX�ì��g� �Sk�6]KW!�Sk��s�� A�?�z�b4��q��M�YP����;6
����Q%���tz�`K~$�}�f&��q�f%&>��f�@������^�~{�Mz$��&-�Ax$]�i��Უ0}`�҈��X��`�g/`����dw�ε'',g��X��D�8�Fj>iˎ�쒺ax�d�`-bQ6Xl����+��_L n��3��3Nm��/�����9D�G�+�?�x���<�Yĳρ��iĳ�	9��O���b Q표 j}1�x��/_�$���}�g}�C�>8��ɸfr`�C~�h��KT�p�r`�6�.�dbp#�籣����𳉡�x��p��Ԏ��N<��9�x0�z>1�� �̀�Y��?�x@�~D�pvK�(�^O�/����rpܔb��i�S��C�Ŝ��0_*�E {�bRQ�1��fA�*��ð��gAh?�����:_L+:�	Ï+�ݫ�
.��W<4�X��\�OO,�]*
�/FC�,�=hj��١��y�zj�í"����pt&	�K����#�Е?��MY�b�� �;�����]�W=� ��>-ߥ�C�x��_s�B��kLLݥ�m�ጓ���b������;`�$r�����=yw8Sz��pP~.� "�sm!A�$��P;��G��! ��fg����cc��e0� X�5CO��2�3˕o�\aj�r����nI���3���6`u@�I1�u��:�iLLf��d��Lc�Ѭ0]�*)�� {jA�11,��[�$wN6.��2/u8(������(�	�P�b:CO0E6R���L���C�	�Ù�ؤN��b�֥����,�y�'u��3^�i	u��a�j�s3��s��U���:�m�yZ��69_nu97Y�u�s�`b��>Pt@��b�}��u�<LLP�{y�I1qo�X���0>�@�a���q��	��إ7yσ�&��.���rO�T�[�M��rsq߫2Ǫ�3{��Y�݋?�,���<����24y��)/��<��2���y��Z\�3Z�����zM��k3�)�����9}p��c��=ؠ��9�~�	*7���슥!ן\f��v�,������sv-`�Ɉ����獧A�j�����L��~����0f�U�~���w��lbx�/�n�)�=�(�\�����\�'R(�[~�W	���)��]���8-���I-����clmp�?�����c0t�      	   ,   x�3�tO�K-J��2�tˬHM�2��))Jt�IM������ �8
            x������ � �         D  x�u��n� ���)rڭS�$mst	K� B�U��?�ܪ������?��䒬��]�ㅣuM-�-lH�R���jZ���ɹi���yj\�->:�A�J,��'I.�zkz8h�B*�V� G�f��*ً�%�[�\��#�t��\���BO0(��酭��p�ht�w0�Q��:sX䅓pԾ���.E�( ��wAv�|[@�.�TfS`�6=":@m/��s-ު���_�ׇ�Z�}���#���f�� �@�58 iu���H[{,�vi]��ZC�-m9��L^���!\/�,g���dbwU�iU�b7�i���g � ����            x�3�LL�������� $�           x���=n�0�Y>�/ C�%�Zt�b�T;�Ho_�I��S�� �GpO��1E���� #�q`I�����J�F���rZ��W{��m�S)�m����xpJ�S��K2�{e	~ά0甂Fw���ϔ!H��܇8"��Pd��R鞊�?T���\�_T�r��4'�2,K�s���u�B�#k�Y�y�f��
����\#{���,�M���a51����j5����Nu����>�,�|         %   x�3��UHJM�44�2�pt��9=�=... ��	�            x�Խ�r互&�V?E��V�6�O�U3S��H)By#��-��l�l��f=3�~�H:�8$C�ڦu�.e^~p���.[�py?�!��Z:��ùu�mՃ5�A6����?d�p�������ս�~;������������������������]ߎ��nڇ��Ә?����B(���~��p|��s���_`��4X
7.^�����yw��~��w��#@-�T�7��/�Qf���������"ᯆ�	�v����e��F��������6�B�BԈkю����o����||Q�o5*"��ֶ^�+W!|��^�#�x2��p<�� D��������Н�����g���v<����=��	�)O�P2`8u>����_�{@��`����;��3�	�����{���0�#+�Ȏ���B��9�:D�g3HD���f\�u������R8�B	_���k�<h~o���widh����Ǹ�]��6F`�?�pǅ��������]�=�ݯ��e��O#��!D�����u䨅۩ʳ{���R=8�����z�>�\4��M'R�t~M��W�O:�ίA�������t�ݷ�]�ٝ�;��;�zk܃]'���J
���?D�@�g$D�u��XtANS�S�F���v���{y�~��%�d)ѿ �����8�,��̷̊�h����P�V�\�|��:p�S�� x,!a%�QD�$�3�x������;\�����\�.�sd��q�}��3\���pMƇ�ڬc����>�6p�(@K�I[�� �"�@[��~q}�|9~v������R�k��٘�øu��{wy<�It��M"�@�@Q%Hxr$ZDL�f\,����k��3��qw~�����t�~y�&Њ�E��%h���@��k@릺�J�����
>��L��@���H����͸X���zOV4M��CkF���o��"H�-��6(t?`�B�U��a1%�u��:���Z��_�،�P�O�O4�' �F�4����6�!\���@�x��>=��+m�l�n��c���U��H�Y*������ �#������5'�[O������K J]@�u��H����͸X��J�:+�U��=����	İ��,�-a3�n�m��/��T�����+_�׷�K0�^_��9�~)��%pT�[lloG�CĴ�bRJ�*Sk\tH�u�b��0zV���hĢ�#��2;�l��1�Ÿ��b�7�tT/������{V �}���غ��)��P6H	lF����b\��/]w�­|�u//k��m��A�S�Ks��p�	_kч��>�8��q� '%�N��"��
S0vL+֚�u����~f����VC��$&�CĴ�b�scjwa0�ex_]t�$���K�~�̍?�iǅ�˸0T��6S�BS3�#b�6�q���鈍q�^�l���� ��4�B7�H��_7K1�\����B���9����fJȰq3y5⦦���ǘவ&罓"��W��ux;t/�������S�1 2������v���`�o+Iε6��H����������"n�b��@�f���#|�����|,��B�%!R%"�5���Kt�~\������y��/�;��/�k�e��A������3�h�!(Z���E��� �DԈ������������DZK0�l�G��HG�xP۞>s\���N�����Kw���$r+ID�����-t�y��rmܚ���p��!���#lR�#�"�RS�~tO�v�]��QV���c%d�/n]�z��2��~�/����x>�������t��_��9a�[���O���4�+�o�A�~�3�:0��1�A�\q�k�0�*��L�\mF���	,	�Ak���|z�{y���>|v��}��ےT�I.ѡLLkP�����m��u��/�v��Kw��k���FԞ�V[��Y�ĢP�.ed� ڿtu�}�{'��ڝ>F���7Q#bZ��zm5ZL�T�[�$\CJF/f~
�k�l�|�31����������̹��S	�6)ۘ� �����R���`0,����8���^�܄�������3��L�RA+	��;`8���ֽ��n<��	!�y��:�Λ�-1��R��wÛ�D~"A�߁&�:�&zE��
�����5Z8=�q�Y9n���-Ae�L?��$�OD��ym��)( �~�{�`��/b��AR��=�}�^h���[�� ��FE��4}��_��^ �y|:�		@���v\��^+��r*X%v!�����Qt�%���ǧ!l � �ڍ����UJ���K�=�՝���x�P���27�_SZ"jDL�v\��Hy�ނN��������B]��G�K�=d��[>����`�����@~E�Չh1���X��8oec�_l�KS���3�ff��ʿJ�+�j�#?u��ǽ�;������=��h���d\��K`�J��pV����&�EDXKx�q,�-�iu#��$P�!M�}��EX�"Va�U��t��V<���)�>��݄N�N�Go��C^�[11��H�Ѡ��f��ij=�y]���95t.A�:���p�W�{�o�
�)�9� ���5�$�8e�v����qn��X��&����� �=0�����OQ��~�;~�G�y|�PԟM�O���<r�z�3�[����;��l�S���2�;�E|MD��iݎ�U�k�Mz��K�=fe$y�P��|�MؚG��Ǒo~l.�U�hw7q�{�H����PhN���8���1a8��IJKEܜS�v$gŰp�
�]P�6!ZD���`�v0j�3R������@�K�r�`Z|.�{����#�{��#:���k� A��ɚm�(�,�qI�l�.X��$e�N�v��& �;+U�Ԥ.#O�JsZȽGH���VY":D��+8Y�Q�� ���s��S��2���T~ ���+�UJ'6ͥ-���E[@�"�- �K�<�1�����֝�s+��t��;S��D�a>��#%}`�iR��!b���Ñ=�����T�(�8�c�ˋ�y�J��
�BUA��z�!e"Ǌq8�9�"�Sd\�ݯ��~����Q���҃��\�\���¾T�.^�C$^Px���W������|�� k��q
��}{��������/��W+Ux�J�.B������~��8j%�NF4�3�x��T�I��˘K9DT���M�����y,���ŚV�`�L��3M#�j|S�!�̴���b��L��&pK��|�E.~��ӎj��s	=<��S���gZZ��f�����xɚƘ�4ڲd/j�k�c�p�<5$$#"�n�:x�Ŏ���_���9� /����v��4u�kԦ���ؑsEY�(2�����dZZzH�~ﮯ�砂�`�j��a�2#~��Rۛ/��ʌ�[n��|�-�r��
@�Eq�A\)]'�8L
>��-G:�p�-A8x\R�R3;���'RF�hi	�{�]ЭϽ����%��;eW�{�}S\�|��sz�OΩ��5���_^�9����L���9s�%�;�� 2�Z�^�e,ǉQ��s�:<R3R�a� &�̴����u�@s��=h�ܭ�(3ʤ�`k0� X�qNg��["[֙��*�,�WH�"QtJzG������E������1�w���N�11�E�o�c<8���EC!�]�EWf,r	�L�b�1����ݵ��u�R���n{�F��K�ه���e�)�G1�e,#�~����};�g������|+��Q*���=^��g49�II؜�%Xc$�5�T����r����iw|��q��r,$U�p5V;����a�BL9��&���*�f�Q.���dZZ�qq	��1������:��ҍWZn�N�KU�3��Y\j����h���	:�q�N:ؑ�t`+k��C��#O����Ƨ�&Ѣ��}#E    ~[%�FU�Vֵƨ(Z�`$�O�+�E���$��L�p4�q힃�~���KYŅe� ��UA�R�N���l�����%^CZ���([X�pG��%Ԛ\�1��e���:S4�|_��1t��^�K�Hy�9�<�a)��q���^�-*�\�
l��m\��f۸�Y�3�ĳ7�V��207�A��a�M������ͼK5�: ��#Yń�gb����-�]��!�6���������)^+���\�/���[l����]�w���M����"�)'���u�n\̍	�=�k�}���o/T��~=�ך�,ײ�nkQ��������{��g��\]
������64��d�Y�42(���PpÑ�g�L�~y�~
�7��
��cY����n(�)��qH�]p\:^�]���g�A�H-�
���ƹ'W�

g93K6��2A$c�H���	��pL���������rˢQanHbm�z�-NWy7��夂b;��VJk���H��>�t\s�p��p9��j�z1t>�"����jrYY��М�v>�H��e8��5�=��O���+�d�Zw]��.0�|���n���ήfi!����߆�s�7O3*j��-j�$*�g��u�R]Z��-�"詷�0 >)@��๜bs�k�k5�x;���꘵M�̵��\Ԩ7��D-O��u��O�X���>�_'�Lh��xh��}���Qb��'c~�穰�$cqI�����r|��$lcP@�&H�>(N>�߶�+��n��b%������t8����h+�(�,2}�+�{N���3�6��`���T�N]��b�b7hIUuw�Z��[��i"�D���R���1����=� mF�l���t�-���~���-��/;�1y�g�n�`���"����"��{�7����~�IhF�u�b�t�b�vs3�7�c���]��q'��s���u<��C��D���>�~�Xx���f3�j�� |���t�8m�%���Y"������P�FH���s����^����`.T5>��¤_�g���yId��(�R:6��,��5'���5���A�T�,��g/Tz�"LCodU�<�������d-���j��ӆE��i��� �ԝC �4�b�����v��/�����K
����7�-�0��mpr5�ԫI�^A���$��D�B�Ky�K��V>���:��^!h�ﲻ^w�D4�iU��I��Ԯ8-L+VE���#��)�Ԓ����W�G��\[6#�}P��|n"9�s�099��,݉d������I���X6C�3W�b�b�^�+�w3���w1��p������\�U�m���-�3mP`�8BByN��69�"�����|��#�����"���0M$Z�������L��G,�3V�.:3V`E)�}�XQ\��^k]��U3s�����[r|P�h�m������)����w4�{���{�V�]�2�2T���v\��nwڿ�W���1%�����t�Qk�˵���?Ez����2kUM�W)&��l�Uٵ��5���+����w���E;�=��㹀_��	ku�&e��/���a/tѲ �C��I7X��h�,⒋9]keF	����t��wm��>X8��`�L^�dƈ|��L�e�ڜ*���ˍ[�
����'��7�thtaU� �����o<ӵF&�S�>�Rb�f�!���2�b'�]���4�iU�� �?_��]Խ�z)�������wL1g+bk�^͢'-���ۢoW��L3�V��,�߮V��2�(���ើ7pfs|��.�)L��V�h�/�cе���`�=�'�R�d�/%� ��*��}�[�9� c�a�<���MXf����j�����H�2ꗕ֛���T!�{�]��[� �j&�%�i.��	�4N�u��!ӊ/
�ȩ�Pt̤�զ^�A꜏Q�muv���^��`���K����#--���׾g}����-�}b�`Z8�a�*}���'��5����sAcT��:�9z� f��DK�x�����x�Xi���/���xq�xb(2C@��:�Y@/L���ԝ`����+=�d����>ދ�ɼ9���9w��/E�x�h&�`G���Y�~|"���S��Iv���Z��Ũ�5�1�����d/'Mr�;a.��LK�J`�cpR�uT�k���1[���ޟ���T�ʿ���/Ee��܆F��X\4����N���h lt���~�6��D?^UA�-��7�@
|���6�`)�t�If�A���9#k� y��M���z��Kv�8))b17��1�N3�&͸o4�n�3]O�_�8�;��k11��ځ�/_��Ќ�I��+���0MgZ�Z��}�_.ct�W8p�����TlE����m�D$���5�"�j�#�T���:w/�8�f�H��#��=lET�	'ۄ�R�N[s/����8Bnɍ��E�7�VN�f2-�S�t��R��@u���S_ƪ����-�s�$�[��tT֠f�A�X���g�����ch��c3zNj=R(mb3�v�9A�p;�9�h�+��ޑ*�R3Y���1_vBj/��J�^�z�	�r���Y�!M��>�D��2�w��Ǭ^��Kq&�_���Bǭ�ً�L_Bxm�(�U�BL��V�)d�L�L����E��f�c2us���gb��/	7o�İG�ae��`~����&�ژ�,9��E3���Z�9���-�f��ؘ۶[��4[�b��OHz�D~.�t�=�'dN>��RY+�h����+%��1t-^Ji2lz����B��I+��i���q�b7�߃%c&=׌!`�|���ܖU��l�UAB�>�-`�i���SKQ���Sݢs�0��0MfZU�4c{�=�U�pD��x.ʐ�"�-�Ĭ�Ǌ09��L���K�:L�[k�j�͒��Z��-R�A"nK�T�bL3���⺙���ď��C6���Y����TkQ�P�16�lU��fj�n+�D1�Z���R�	�,� �O��n�>�4�iU�񂇒S!��O�:u�s�U45���H}+n��#���-�CL��V���c�'3���U<]�8�uszc
����^�o�+*M��B10H�t�9�\Kd
�QU
�lk>0<C�u��v�V�̯�^�h��ם?v�5<&�o$��p<)EïEq	C�Me,�'�_|v��y�K���|��#v�����

?%�d�<��Jzm�� ^��`�K-�[��o�r�Ã��G��!9&yf��[R����L��Y��a�0�KV�TQ�tl�st���葦3�����1�)�P&p�-rW��=X�	���*������8�5��oa��4X��~��c���Pd:�)�Z�J�H��f�bE3��H_,�2��c<vO]���o]x��������to�f,��P�#���Vĥ/h�D&�lH�O.�zIN.�9��L�PT�h���F���}�Q]�{.b`L���qD�]�J6�,��>]z��e�@�TӚI��1^�/���Ư��b��,-mL9:y	�Rӗ��`�h4f��|0Ӄ�h�� ��8XkWM�h��@c[+�@�S�L,8h��2s� e��[G���pvV
��x,�<�=��I�F��v��Q���A�.���i����_�?vo���}	�P&�@�b�/acdK�M���.X���ă�
 ߺ��|���p���/����ק'�p�<�D���u<�>��7Q�v��]��-aJ`�-�j������f5x1h�,ߍ�R�W�f3-UU��o�n�z�UREm�< �_���2�ep��D�BU�i�~T���-)h.������l̈́����V�a+2��V�4�i�[�c�z�u}��}��Q��W�����Ok���i����)��K	<��L���A����zq-�9��K7f}��a�{�J�{G�	C���qz�S�Gݷ����i��6���Ǘ�c*��}��}6������]�:-���H S<p�pA�gw��c�ʹ��>s)�N;�=I����.�w�:@���,��ݎi2�    *w{�Z#Ԍ;�iM@]5CX!�ʦ��x�K'�"��7��Y�!<�46t�����>h�m쁸y'��r{�Q�zv;T�Ӹ	}Жf���t��|���j�;��ߊ��"��X���8�7ڏ���8|�"�E���L�R��q�~��������^p�6km_(�y/Ȅ��'i��L?g�4�4�hu312͌�����0lӌ͇��7zޜZol�&�К��_g:���E�5�g3�L�υ�zbS:�]^&s��`O4Fz'&�-Ü����x��σ�fnꄴ1{K��6�
���������S)iv��LSyW�-����`fP�A��qf��sϥ��Q^��#�nl�b���./��`n݁ZUt�J�W��=P�Ŋ!�q3.�9��c��4v���#P+�6I�/[��od$��e��NM�"�x�>Ȍ�h�m[E���h]Z�7���Gm�"%h��K���@e�4�iU�(���lNPf4E z���GHg��\W(A>y�l���k�]ƾ6�o�� ~%ճc��4�ϼ��V�3*Va��oLf�9$(\!��{ Y�EX�Tews�`�76�J�s�+�d��Q?���G�i&Ӫ~��j�L�en�BtP�e�}/�υ��k0�JmM��&-Lb�+r�nh섢��ylE괟L�������t'���_vY5�����&ZpW�RO�KI @�n���8v�pɉ���|�2�E��sf)P&p`�3Jf�/�+��h��� ��Q��I�1�����0������Ǖz�4��U�L��Vu�(ϻ! �V��Y��1}7!q$aGS	���b��4f,��9g)c�.����n-��d"hz<��ZLCG�J�����!Fy߈"ka�J�s/�-7����=��;~>�#��l�O�n�G��4XJhw0�r0��K ɶ�Y�曦��ٳ+K���٪�l�U�x�l����� ���Zx	����O�3�q����2�ʄ����~#�F��ޯ��VQDLE�-����N%^Q�\#ۆ�u���x�!2�����1@1�eZe�Na�p4hw��m>@�����3���|c�T>z9>�3y�ί�����4�iU߁��������C�&6;���& &h��lv����l���8��c|�g�-6/@9��4�i�c,d��M��&�\�I�r*�f� J�>�(����q���%\���^��ݩ�ʉ��1=�3���L��i��S�
�[��<�w5�����q���)��������lq�=s�=�k�� f���9_d���v�����"�Sm�9/�4����L�������q�r���5��=�����VO�ٲ���-(���b�V,3&�]ъ�l�U��o@��I%bP�� ��'���Z��ń�[v������9l�e�y+R�Q"b�l՝��>s�兆�ϗ�����p��Vr���aؗn:��ʦ��l�"Eׇ���z���/����}i�~��&DLk��;��tQv��ư����^�{�d��FJ�+��r�Z`P�ā�6,bOO�P��=~_�z/�.Š@�g8����'��wW��U�L0AT	����ǫnLɵ�̇	�UU;!:D��گ���Ǻ�ױ��[���6v4&x�"���:u�q;��S
D@%���������(
�S�d����g:��K��(�fN��i��"V>t(T;~~v�� 6�s	��'�mmHY���H9��y:h!?�?�j�8�'(����Q]�!b����b��q�$*M1nB-܁�ŷ�-����y1Q"bZ��ҝ~�~v����P����N�1s��t��2��[q�i�SО�f��#�o�h2&*������ƛ֗�D_���izJ��$9h�37�P��!b5~c�0�<c�/).�	�)n���o���&O<�E�!D���Ϩv���W�#��B=q c�O��t'D����j����,�.6`���d�HPx��yPxQ��wE!D���M���6p�^ӊrv�m������*}�"Pļ�W��E�*s�zo
�\7�8<��m��v�EB����W�u4���(�h-�����S�
�=__w��+��Lڸ���k��~=��~�fy \ ��Pp_��f��*K�"VybK�?��DC�|��&~B_t\��?q������jP@�=����o|QK�3��G���ہ�8T�N[����"V��7�;3���֫����y�*u%�:$��܁/��h�
9�������q�S=�J�i5��D��Y��Ø�� c"JDLk�{�ϵi�⮞q���q�EYD��b�a-(�	,�Z���<{�k~l����ڏ���+�s��{��mUv㵧���s��O�����"V��|��IGuz�-���N��F�������T7v��������ΐ{<�����f�|lC���fUO˩# �	���zŭ(�z|�Қ��p�I���M�h���z
rUU�!!>��+�����}[#,�u�É�7���V���e�yX$�Uc�B��6m�ZlޕEXZkm&>��z�,�sc�����M��B0�6���yO�ll�r^-� �6ĞnD^H�Ɲ�8#�hbg9�`�E�y�h�^����sL��K���g9���1g���]v�q[�f�[r�gtҪ�0!�m7A9�1���'DLM-:�.?����1o��߁ f�����m��ʔ*��BՒ�[r v��OH"z�}��͓ƊW�q@vbu�sE����v���ax�ڳN��$���Y((��H���i��4/�ӕF7];�b���t�r����x{�*d!~M�M�����cs���.�N�P�&�j"ڗ�����~oCP=vE|�9�Չx��K��A׶��Ŭ��>��=���"���o�@?������-�%�{�_��f~�l�j�)�����|}*�����F�y�K0�h���Wm�8���9Sc0��q�,0Y*���M&�5�T��_w�C����ؓF��wx=%��sk�_�8S�z�r�Z�дj�U6�	qڢ�8b�P��s\�qq>>���1���h�'��Q��[8���$pw�r�ZO�4��Bt@Y�	�h�یs\�q�'�����Hn�A���m� ��?������`3b�LÏ��'��D��ym��^��5bw�v����������@_l�2v�X|:BY���簖���v\��+篯%��Y歊s�6����������A4�� P�ЏD��i���zf̽tJG�r�|	k�0�'�߈ �u��6 �21��q1�L��aP�`����a��f<����XSyM��ހ_�}T�·��o��e�e��������
��5��	���~%�/���u&�Z6�O�޵����۬G=8
݄��Iä���Ɯ~5J�DT/��0�b��z�p>�A�I���PK��	���-�8j��4�D����ַ������De<��g�5�s��5,4a�s��졪��	�kk���g0<K��K�I�42�ݥ�	3޸ğ$�τ�孀3�m歀+���p��Ŭ�"��#j�N����(���<}��	yF$F������G|�.�#�!"�����&�)��-�a�G��P���W}�Q"b�٫{;>�ԕ�#��%f�,A[e�+�]���T����(�r��K�Z%km�چy,���Arz�Ţ�J@�
�ځ�mj�|��8������h��y����O��|���C� ���r��.��r/�S�������q3#�F�[<\�V&��"���Č�$�R!�C�S����#4aoKf`A+elp�ۯ����)(4:B�x���:B��X�Յ��ˏ��k�[?t?J[2Zm����Ѷ����OҺ�BKPkǯ���q�MI߯�.����X�L��:ț���iS2.a7�6��k���z>>ƚ�k��ϊI��D��U��ܷ����]���t�񮮥[�v��&u���D�������8lh�{�}z�bסϱ�.�e��52���r��JB
s�ue(LO��z����#"z���׏�=� �c    w��ۯk�#B(���ӌ�G%��~٫��%P�1�吮}]e��l�(UԺY���L`�C�������3��r�����@��#���P�k����#�6%�l�yt�_���{*�
�L=�q���+%/y�l`a�I�g���&�.1���S�%�3>���я�5X�x �w)�*��`q��_�7Qo"�N&
�e��U��u��Aܵ[�8��YCp��5�G�0�������, 3�Y�ڡ�i=d��\')4C�1[��7��j!JD�f��"����9���v���f�]�0���tr������g���%��e�.{z�Z_?¿�f]GR�Q`���}�yu�P����Vo�Gu��p=��c�VF�հn���qt�ݷ�z��s	j}GD�E�a[U�4�94��v~���|�Ӻ��n�/�שi�ѱ��l9�8_Z�[�<�>�@�)Wb��0-"�:VL��=-03�g�tA�R&7��B,P�A&�ܟ�`�x��~�÷O�ݡY��� e���(�L�8��gX���'�Z�_My����@�l3��Qg"����.R���A�S1?�ʹ��/
e$5��<a�5;>������(Q�UXqt��-fa�B��x���M�Kb�D�W6a�pe@�3�Ԣ�)�JLlI�:"V�3c�؊Z�s�{�p,t�$��0��`�J��l�t�#D��U���׾��K}�!�����W�lR)E�u�#%���#1Q�Dt�k	�����w�|0o�`I�o����y:�~If��
[�J+g�	�|��8�\�23�qL��X���ןf����6_�^��-�=A���o�bΣ碨҆�nB_�2���\9��x�늸��� )'t�u�� t=������oo��Rؠ�m��`�A�x�4��7DO�־9!��e���HYCF-�����;�9�ng���鷼�c^S�_E����ü�*��1�!b��8�[x�����yߏ���].������8ۊm�I��r�����z]o��8��Po2/�Y��u���,ĝ|�W�]h�ٹX��]a\�c? j�O����B��XU�___��h�.��r8�]��m��S�2e��u�6dGmr�"�DD����Y���{�8�y�����SJm�B�gJ�mR��p��v�Qe���7)7�s�K�%5W�)�9�(
�Y������3�Z#Z�⬰�ǟ8�[ȟIg��=>��N�p邠վ<������X\)��&�Yk! Wx(=��M�w�oG�ӿ_ߺ_��:h�9*�r��LLk(�y}=�z��K߁�lW������|u涢.`:��p!�D��(�<�f���G0�lc�Xy�E質�5T�T��9��>�wx4f�S�`�Ѷpf-���<�Z)8����K�}k辒[��?z��ֹ&��زd4�J�y
^#z�2�sމAg�Ր(�c����TC��/��O��
bS�HР}{,P]"JDLkˤ�
�Q ����۲������u�%�)��^�;�f$@��׶J��nr���.��N���fE�vwǘ�s?N���c���G{�M��9�Cz
��7����
����[����^L��NwSd-/]��&K�Ҳ��vAO�W���{W�ڲw�ڰl[ʜAR�Ti!�ۨVA��A�����8]�ɜ,�r���qr`9��N�U�n��)�>�X�a 9�ͨTm�21�[�� <W�Ѓ�t��´\��d����b&a~%z�r���
�U7,ʌ�43�]4m[��A'��Jo'��,3�\	"��1��=��/�8���
mY3|�U�]8����M~����'��$��=04�O�a���=�u3���]�)]*ҫ��(�	�����k [��a�ۥB��ی�M8n������'$I t��{��p�������_���/ێWS�nuE�٭H۰�M�ɩ�����$\�S�
��]f�]�Tl4 
�}k�E�]���&(��js�7���;3�!^Z�m/�T������-�'�xc��o�q���X��b�(�8xf��>�E½�p�޴A�u�ߢ����i�pkfC�T�DT�����p�^W�`�YV>|��������'T<ͭp�C�Ʊg�X���mWg���|
@�0�F�@v�HԈ�������*���7�*tQ7�8��d*�^4h4&��h���x�8�åy;�g?��ގ��gW�ŏ�60.�Fy������,8G�	�$��7C�#="���9Ϩq���ƹ�w�t8����Wk��ϡ�-��߉�G�s.`4�[0,��9F�s&���!8�^�U���߆�%�^&�:&��Z�MQ�CNV:�m���"U�"!�p`����saU���\�V[���0f���P͋~~ā���3��L�k��NT���}�Xu�Z;��ʶ���k�}�Gz�L�c�\_O�������{���ǿ�a�r���������\�|��8�q�o���ݩ�|����jГO�%�˂�M�6!�ss��
�j��)>��I�1��[��?��xI*8��M�Oq�5��XF��m�� Ւ^���_��Nؼ9��3%P��*�U d�4�Q}��� �����g.�>^�Ѡz�#&�*ՠ�e|e"��4��[XQ��R�B
������F�j\�2�ly�c��6�M��� �ӌ@���lN����F2,N����B��E>�gР2��a(���w�@kx��V@"�,�\����dI�Ph������E�W=	ᬔ�^l�W�{�O(�E;���V-��βȌ����f& �~dO���A#iM~B��_�����}�wWg,@�jw���KC�B4��]`�.i��6�E��Xj$�i���W4e\��KPs���1Oo�K5�@�H�Ì#�� ���	0��vd7����	?�rJã)e��;�)gn�	���A�"�Mc��x��@S
����(s���f�k���-�h��3��/�҄���m�lRb�%�"��j�(r)��x��5�k60�9y��c�a3��F�`��-O��h�!����]s��)D����-�5>�oR'D
X(͔�%g�k�ID��i�e���q}��ݢӓ"�l0�B�̭C����E�\�
�%Ȝ�ƀz��E'�����6J��k�]���~�Qn��00u�q0y߀�H�N\0;�L�d��P14O�A��Ʌ*��'(�M`�U�U������T��f���F�t]tϜ2��璔~�?�)��>���jLt�XM��9�.0�Rӄ�������G�@C>�f٥H%�]
��=��5��K�����f��[�!��4����`���$��Azr�k�I�����7��n�ALc��De*�O �͈AQ��=PGO5��O���Y�>~�Ȧ<�ɟ[a��"m.�J���&hMԍ��kNwr]K
˓o/�~)��s�d�)aO� xX]�X����،�l ����@R�S���"�rGE����{<~tI���__/%d��A�;L}!/��fk3�,�I�O=�qg�j��ק��ġmb�ĖcO�����|���8h��h�Q(�Y;⺾���nkc\J5�YN<� �|ֆKY�
AU uְ+�2�筊�'6=P��I�-�z�K����aLu|-"�Z6���Zik���m��)���T?���Q�O��
�!��.#�aU��߸�⥘�R��8l�k�Zn/Ay��~E�a������2�=�_�~3-ⴎ%���t�55_�;���3�L���^�c�|Í�E���(�X;/<#ugl��Vج3�U_�z�R�(`M�}a7�E���7L�(ַ�3'l�x�Bq�S�}&���_��ݜ���h�s�����E�����7��52֦�-�8�����fp-��tyOD��i�����"X-E�꾽0�fpȒg���N]��ŏ�C���c��s����H�Ҧ<����U5��i�	���U���ߪ"����s�w�P�`�*e��X̭�:;����������t.� �m}6a��~�5g#�6֟    S�/Td���S��g�<�|���*���9(k�N�9�jU]3�M=ڬ���>��p|��U�G:�F�߽��T}�PZ=��΄X��Zc�!v�WO��,΁p�7�X���xB�~��b�Ɔ=�<ɟ���DKL�s؃��{���?��ݯ� }��ϻ��R���	!
D���o����׷���w��?�^P�"�9wc��+�L[8�'4tO���lIU�D�fr��E�Ņgf�5V[�;	�X���g�
���4k��Y�FzTw�ο'np�5�}7�2sq�;�$K.u؃ڵ�к����Uݝi����QHݏ� ���!ܜ�/�2hd+\�_\�w�E}US�	�[�#�I�q��5�-�EЦ- ?Nc���b�� �>�wX&K�z^��������K	c�q�q�/��1��l���N5���x���F���y̒�<������f�S�0��C�>[Y�&+�&�{���V���d}zq�XZ�����؉�U}�z�����Af���\.��\��-�.�9���m8훮sa��Xѫ�3��͚�3��1�N�k��'{��Bl��Ě9+^�;�g�V
��l1k]��/���BFƬ���� /tv���w=����|;�T?���-|�Ku�������+:ғ|�$7/V���;5�Y���A�i_7{m��ct�[���N��kM`�2$��W8�V�N���uw>�w��g�|�>O��eKm�*�ז^e����.r��3�DрS ��9�ڌ�	�q��ڠ�j���.̭���)bM��+w��@<�� ጊ
�&I5'��t�q �a|.: �x	�5�2�i�M���W�� �.�.�)�i�����h&i���"C�����vw$�3�~>�O5�[`U������/�T낐�ݽ>v�.(�]�[��H􃿛�h��R�K]�(ՙ6$�cM܃&�3P&�Q��rU��d�MR2�;�ߞ`���7�2�J� *4PPh�����~�㚠�M�7� ���(X��*&f7�勤(6�n���&�B,~��oo�0��o�l}h�7u��s�E�~+8��5��@��jd!�?}T�_����~kt�w��� 5�üVL��x��E_b��??Ψ��)��s���7�˵�жִ�z�r������){��.0m~u x��f�^Ġ��Nۨ,݌�l�v<��!ѡ�d���O��=��z�h�֌�)�L�k=.��n	36ê86�^��R�)/�+�@�6�D������@���<�/r�a�jM
�\\{U���j2�4��@���D#FBDy΀��?Z��4Xׄ��l��H!QA�y��02%"���m[z�����NTE��}���V�"�1�(1���X�p��$���>[,�.DYo��7�r}|�U�/��i�Vae�X-�>oL��'�t	W2��j���iݎ���AfV{ն��_6��*�(PO ��b�w����[lH��Zݴ����k5Y�s#c��:[P�JD��i��g��k_d�o�ҷh4��mh*P�T�+�^f��z"DLk��Kz���{yn�eiYCzԌ3Ns��Y�g"�%H�E��!\[��w����*oB���!�-��f���:�-�E���:�
�{�|��ׁc��V��#
�K�j֞ Ut�p�"�:��۶�i#�E��ޢ�Ն�B���0w�msb2n��[%����p�r�9�R�y�2�4H��j P"�u����L�r�y��+G1��Gvn8�4�)��(,M�����2-O؜f'z���G���H��l�٭6I7
��� 59E3���ͮ56h�v�dR�RsHC1j����4�&�+p�%uȜO	)��Si�jW䒉P�O�=
���37��;z`|���^���}t/�.Ԯ:��q�mv��^	I醧ɣW
F�̗*l�r�kh�9����o���z1�&!�������M�o��z�F|��]�f����	���%2q+������`q����N�mJ�%��yCWRM�5"�5���~�p.����`J��U��cP\���.��i��.�c�b�M�o�LQ�@��/�9g�����;	�1��W�&�E��&X��3pG�����1���?v�^v�˵����TnW��:�5lA�W��5���y[�j��R��g[́�J6�,���)�䊧�L��Mr�9-Q�FӮ+�/l �����eSޚQd(~F?t�	W���W���$KO�����ڽy��k��Y�HY�Q�=���T��\��)�zF#�)\n҇�m� Hr�R����E�y�TV�]��
f3C@��&<m4D�=
����	6_�~�6���5A�y�r�m��y��� �9��8u�y���s����n��
�,.�ʥ �׍���s62+��	�FY��O
����.h-�#h���j���������Ŗ���9d���`�<�vXx傝Ib�/c�EDXǞ$nx񩫷،��WYc�[�e3�jn��7���������z�hֱ�[v)���RX[�p��uy��	0=]�r�Vp}3ֱ4̭~���^o��㧳�nErn9��ü�V,���0@aE�N&�Qg�y-�8�����+)bM�e&�$���\V�2�6y����+PO9��P�y�[��|y�ki0��A�ڄX*��C9[y͹g�(����Ss!p�L�D	
زI�����6��[����k����kOW��5�c�N̲��y��N�}
�L�A׶������M;�$�&FE5�;�\(紀�i|�D��"�s���|4�뚒0^�'��87�&�ˤn���<Ւֱ���sk2�W���7�¦�<5�G����(�﨏[%�8�\+�9ת{^�$c��ǉ�V��V !�δ��b���	�\����~�+M��ۈA:I"ZD�������q�Qa����g���i~UQ��	�����3zna�M=��
��K��a�,<Ou��|��6�:Ϯm��>%2c_��}�:�4��J�f^��A�yV-�҆������}8}GH@��?�����L��S�)��������{@��:�QQ؞���.�වY+eR�����,z�@���ǁ'h� �IVs8�,����;�'�9�J�����aoe�!���	s�е�&k����{BVU�.Th8�I�0���5Ď˺ \kd#`�Ep��"QS���j&p�Q�Ğd[�gm|�����!X�ǎLR�1�z0y�FA��&�Pl���f�t"⡪iO�<L��a�ي0�= U�g>�F����x�ct��ix�ޯo�SWnB�+3RH�g�m��}�h 4���.��HiQ+]mкd���E�r;�	A�5� p,��c�6!DLk?.��.1!��bw��+*�=�ҫ��-~W�|z�����b�-T�@�h	��2��y��G{b`�?15W-"�:�?�E�)��U�>����O�/u��p�c���\�u�$�qb�<`f����-o.�DOا}�X�6j���ц@�64��ý{�����'+|�5�5�:qb7z.ln��u�&j��Q��r���v��M¦�Y�hI�7�	SCk�c��f�-��9.�*�yZ�܋Ŵ�.(!1��ny�wJ8��x�}V8Q#bZ��\�j1m�n���"��/TQ�a�(ךz���@)p~�F��m���ԔǗsO��Mhi�m6G� l�̠�j����/��p���
�W�l~<~�����=�c�����
4�	���J���m3�A�2���r�C�wz�21���`
q
���ֶZ=��&I��T�hשz���v3n2)��ۄ�``�4�9'�m6�� kY�l�+Z�V�ܽl.V�Si�h�#��
��<LD�����u���ִ>��M�X�P 9;(L���nT��1'��6*���J��1��m0#7�=�� �p���ߑ��{R{�Tc����	_�]�fy�W_̎���2��l�c��m�Kgm�[�x��Qs����=���>ה��,�f���5n�%(G�*
��e:�3q�;�BS}�����o�䣾Յ�YI�,H�{��O�Ɔn�:    �\qBk���t������A�}G��`���ng�1�D��(�b f�Ԋ�`�Ԥ�qF����u��&�E�7�i�v'��|����e�����f�!�k��Њ�q�z�����Km�-��6�b�����I]��1;mk]�;뎑S��3T%m��Vϔ����M5�a��"Qi�.�{�ēҊ�Vlr^F��t5:�#�xw��k�u1�m=��M~�٨�R�'#Ǿ�D4��֐ t{��S���~K����E�z�f�m���Cv@����~(Xf�El.�mZ}pTe�nO��I�=���l �~�~	'%�f/��=�=��w���l�*ra��?C.c���Spw��A\783�B'K�-��ϗR7ggo��pb��&�k%�*%l+��6�����|O�ی�55ݘ�h�ͷ�8w<ؕ�S~N�;�mMO3��֚����ES�̀�ɻ5�'�%�UX�U��Y��p3-�Cz�z�G������	$%��_����gz$JDLk;.V��Zqs�Z'�:�E�q?�[3����O؆���D��U2s��=Ph�����p�4;�����*�F��̘Yo���D�R
VPZ��h�!�#Q!bZ�qq��*�}I�ݤ���SL��x�h���l�F[�a+�����Lq�����%EP��`�&lV���ϴFĴn��<�1��:��J�T\�(8�>\�e���ʍ8%r��4��iݎ�`pN�?k�L6>f�n��lC�#X4A1T��'�
�e�� Y#� ��������~8V�6fb�z��F�ˤ:*
R��Tt!�@gu$DLk?.&��
��͵��;�m/$�#}}������;��W�KM���[\J�������������h�� [�#l�hcUf���Lee���{�������D>eb�+��J� �l̕z����������܎eR����j8M�E����APx� ��=��!3�|[��Ʋ�g�/�xu�hj���"��:'�CDXǤ�3�bc�4(ae�rqx̛�l3Q8�L����п��1R
� Ku:���^x�i��
�^�_�w���⹼`�]��Nz���Vjk��߅`'=��� �����1��<��(��u��dC��Ҡ��B�Y'�s��� �����9�1%��\�w���0�`=�"+:�g�T����Y6x�$�'\ �Vꌑ^�/lLy8�Z!��&Q*`"*DLkh��p���F���,>�152٠�CO�,��}m���_kf�J�����Ӭ�4{l62:y��hڹN�q�?�	R�V2-�O����Ν�I��jp��D4$KRB���@S �u5�Tá�����|���0>8�9\8ۮ�n3���F��ؤ��x�e���%�]�$�/�|�D�M����v�U��Bjl�MؗlA=v˷���K[��k�L697���c6C�a��O]&�Z�������A!|?zm��ߐ ����5K����m��+�-�(;\��m��>gL~�^S�h�q������;2�__�{E�K�	���:[����O=���iM �����k5�9�m�Ze��Q�s!��g&Qܑ0\4�(@s^9c����7�r�'r�5A�!E���5��H5Ok����B��|�U���]�ǰ��^+~��	�"p�;_�jy�NS@��?�E3�L��Ĵ�1d��� ���a���1����t.gn	@M��D� ���Ӻ�Lf�B����m�>�3�Q�FHd9JVrܔy+�/+����1��>�����-,/]My\MF��i�QD�X�l�LLk?.��/�g�i�F��4��^��4��oM��D���h���kf�����u�4WMɺ���4?=
~W�\���h��R�Y ��ȷ�`Q!��_, q�b1��Dt��h�����R�T8�>�)TSqw9/&2A�V��3A��S�k"F�)6EN���~���X��o��}`�*������T{O�r�����l+T�\��`�'�DrR ������{�}�����n��	�	嬧<��I~%'6��(1�͍Nb�(�sNB�g���p���d�XՓ��;��� �O ]�N��im���!y=亪���Q��!��M�1,<��ōS��hF�BĴv�b!�k�\������d��7�K�=�TK|���P����bNf�3��(Ч{q�"E!0sK���vh!�k���B�)"_�M���L�y�RO���m;OJ
�L��Z�E�*�1_���g@�p������=�#��o� ���v�N0AX�*�okxOzm-�w3�}��(��͐ۼtƈ�1N��;uO����N���3YD���$�/&�b&�Z6K��l.W���L��˄I5]E���('����Ŝi��r>Hu�5v������ȳ���>v��#�G1��ס�a�Onȏz��.����p���5��q��m�j�Ӯ$DТ
�o���5��ؕډ��T�t�/5yP�.�*=��!���&:��S��X�D�1̨eDtm�-r�D���a\hэw/��u��
��|o����pn��1��x�~E�jϢ��&@��S��u�`�	#�,�-�����5�C��;Z�.�v��I���Rn߮����
�h��ږ�(���(w��<���U5��� �Y��>_�H{n�kxW�2L=���D�o��C\�(45_�`�h`0�c��0�&(��(�?���T]�ϜUA�٨�M7���֡)�e�k���VL���4t#�a�օ7� ��z6�S�B&�<nw$����ixN>nz������`(��ݓRwr��9k]SfV.5rƌS���p��,��3�B�q�Lk[]���;RKnu�%|�.��s�G�E����v��'�-��-��d4.>X��^���3�yz�{�uwag�kĆ=`g\S�=3���!�^[;�yv�`�	�� �):�/�]��G={΢�����L�w�ɶ����4H�p7�;+�U��3�X1w�ޖ�WO6q���r(h6�|QQ�p��$��Ĵ���j��ڃ:]��ZL�4���	��LDp9�"Kq\;"� ͉�Ё�d�@@�)�E�qs�pJd�Ah�;��\�܋�56�mlVB]�7 9fm:��g�d�l��nBe45c�r��q�}�2�<�f>޴�T�)�����B�[4=a�y�p��	�ػ�A��'�ͷ�����q�U��D�)S.9�R'�
�LIBMCh�� �d�>ף��&�B�7�.EgvO��e��88�sI��!���p��#P�k��jz���,�4�;�9�t[�1�7gU�b��ߊ;�wwY(7���7ჸ���4�\��(7�m�U�y~�ǜu�#�ۂ���f�b����D�D["�1������E�z�n:��ls��=������?�_�g�m��EB�]��V�`RS���g~r���w�%^&V�:tum�{� ��546u� ����F ��F�sVT��7�d|a��k�k�'�l�I��ظ8w�m��I��QI��O�U�]��?Xg}�
~���ւ5��j�\�8��4Ί����C��jЂ;a8�'�CDXK�4�e�@8�3ۼ���0���$ܫpG�b�U`��³ �x��6eग़�P��e_���I�f�C�*_8�"s��'��?xQ˛�M: ��<X��6�b�z8�����M���L��(�f�ks����7�����_ݗأ��C����k��z�N]�������r�>�K/����o�l��>�aM�V��Owa`��.�ڈX��������t��A��"�t���_��?�S	��>׊6(vA�]	q"pL��3��&������
l
��������A�\�k;0���`�DĴ��?>��;����r���ۮ'��*6���D�ֱ({��`�ƥ�
cv��Ԏ.����;g��1���9o�d�d��O�h�_�.�����<v�}���;�]J���U;��6�܊�L*g����]4�"�����.m͹�5��^�5udV++u0��ڭ�~�T���    E����Z�D����jS����51\�rS�K����&�8���ƫ9�W3�����9�����K8]ϋ�����8�N3*o��S� ����kf��<X��B)�6���q� �/f�-�%�2�V�5��br�=GM��ʨ{Z[���Յ[����	�. ����Ht����X"?�ʳa����A۱��a��ܦ] �&/��$a4�|="Vͷ~�v��<�/��}0��&�\f.DlRk��Z��gT��ݖ��Ĕ)���������J�Y��k]�i��r٬�\��j��_�m���s�븢�c�s]��hd�G��af�[؋QO����|4��/���283�\}{��rK�x����L��X%����i�������T̗a3.� ;�piW_d�l��W�/S$��=Q',֜7�z�b�BĴ���;zr��ߟw�##���8=M�N�8{l;4Yj܋U"�e�Y�2I�Cl������|����r��+]������ ��\q��mM�ՙX�l/x���޹V��b+�4��8f�+R��I��D0��]��ࢹq�k]�ܲ���b�5�I�=3�XJ����L4���~���Lv�� �6f��e�!Ձ=�l̠H��+��3|0�"b5����%<�p��w����>=�B�x�d�O��0#�#ۄtf�hRH�&��(�Y��9�M`��K�{w}}��o���1Z�"
����(�
��FX`���Âx�L t���Р@�hR �4A�0�%a{��8��r�}��"�- ;�t��0of��.��������W�W'��)!�L	y��8ڂ�|���*�*�wI��m��11"N_���QY�,!G6�T�M)�z\��4�U�����h�'F�@# ����5�W"���zT��$&Q8��1�\�4�zxy�=Dэ� �O�=4�1U����W2���R�\q�эzP|q�EJ�Y�>~�`A�ֱQ!t�$D��y����M��ߣI�b-Ӊ�Y~a��b^!gr�h���"�!�������5��涴KBwx��F:D���zm��>?�C�4�ՙM+�ecb��v\P���ʅ)[d�Y�����LP@ʌ��@���χy$JDLk;.z�l�f��՞ӟc.˷�h ���
�T��Ma�����Ժ�?���3���1�ݸ��~�>����}�T1d��l��7�ҶP�2�9~b�VA�4��@��G�Б�1�ݸ��ɍ9o�ؠT�ڑ�f]h���l?�	y�&:D�f���ȃX&ѶD�lW�K��c,��ٕ�1MD��iݎ�	5�`/7���RG�J�E���||e&���8���GӺ��_��U��L^�m�h=���M�/��l��H��Aw�MT�O �jЭ�-@Ĵn����sL�?������n��49�mx��?ŕK\�����@�F�AĴ��"�;����{+!r=�TL]/���}<�*y����P	B�"���w
�~�Ex��ţ*�Π& Gu�Z@,�4�N3ֱ|����Lذib���v�TY�j����=;��X* �F�5 ��9 >`ė�L�<�=Z�R\���:9�_pK@�V	�xb�5�T���X��Wiޫ��/Ԭ�V��� ��jUl�h�Z�51�!"����_��������kx.ǧr�zN�s���=�GE��jM�� b�@,b	��Ō�Ɍ7�Z���:�et|��6��h'7��1�N��_��?��������Т3�2a}�[\��KE�7�U>&4��^�}���!ۅ�@�`Bt�k	�u�7���.ï4�MX=�	��3��~���)�(��u�Pu{7��FCopD��" �/��<�-��/]��~s �e*����NLO�Q�8���-�B�%�i�L�k=.ގ�׷�Ǯ-�����Xbg�`��p��~��x$(8G`��l�^��������r����:��c�5�����~_`�g���"����t��i(NG�(�=��`*h䟉i�������+���ww辕���T*.�8�c�ϡ��&�a���cT&�+�����h�Y@��
�|�������w���������]�?����_��w=�@Z��Ľ��N��}��lt�S��)��G�.�LD����0��ӎ����^����&Ԋ��M+���͛0��yË��� [}bkryr�9����vqTܯ �?�A��rO��0�l��+�Z�'8V�~�ȋ�ڂ��?&D�Z��[��p�^��3AO�PǴd�!}R���֜���)O��u�6&ZD�r����?4�kP�bM��?�?��P�f���%]r�V�5�M\A֐A�mI=�%"V:綤8���7��ɡ[��(�M��!�^C��+���X���t�L��9/�r2�+����z�~ˍ�]tjHx�.'fg4�	�43,<���ԍ0Q!b��`�Q)��V!�Ɠ{���n����{�7�s�x�Q�1a�E�*�iZ�$�`&���ٰ�˪��i�?��q�7>���ˡ��;�;���(��p.4ݒZӴB�嫢֛Up5��D�5��l�����=hUE-&ZD�����9�Y�gZ���}7��ޭA?�؉���;��E�%"V=`�X8�4�������u}�����8uC����H�-�z���Jm�0��6�*Q5��{�N�_����a���<�J�!���ԧ��]�J�e�.�V5E��*	Z�_��G/Q�r��2�����}랏�^�K< 7��.��d4P�H�b0p�Q�����[�-Q"�!)��}0�!b��z�])���M0�c���*�*]*F��s;e�\pL����v��uwz?G�tyFjE4l�4�H�^%Rَ�
�Ѣ��"���]���5"օw��ڟ���/�����v�CQ���2����������b+�A�Vl���k�[R��)��CĦ|t�&:D�"Tw�z"�I9!��wזLi����9=$�s�&&�LD�q�|莗c�ZB{�^1-q3A�lx�қͷ�Nǖ�P�����|L&E$3���VG_�v+��%;�F��<f��(یb�Cĺ�(��vs ��zj�m}'�lÞ�e��$榖�0�8��Ā1 ��(�#�Ť��k����2i��*�ը!�{<+�SQo�d|"
D����Ǘ��!��φ�:�Rz��#J�8'éͻ0����H9 ���U��a�"�L�9�� ���g�������<�1�]�e��~�;���&jD�ϼ^v� �S��������������V�e�u߶9�k����x�~��)��Q����t�վt��?dH� �����3k֜f"#�b���1Fj[�SѯR��2#�	#��O�J��>�A�5=��ZEna�BBU*{�r6��W5-q)�Q1���+%JU1��xQ��f���?��D?���W�/� l:�.�����q�Y��b2/L��X�[���=�;�(��\V<���h[^b�F¦���t��(l�����
$�`�C�3�h��!5��+R�?*qc������ǺZ��i|PF�>8[W/���0�UC�D�ӭ�}<n`�ަ��:b���S�#�N��Ƃ�4�␮hj�r�����@�B��0V@�n��x��b���W�p9�Lfa;9>�N��E�W`���"���0����t_�2O_����pmG�������^���`�D�H������~�_�D��'�gp����wE(���`�G��|k7��P�������W��+7[����m����̅���Zr`�7���p��!γ�EP��#a�g�K��-)�}�����ʟ��`�]��>����5������H�������_��R�=�먢�G[�ڶ�H���7^�p�N��j�HQ��ם��{�l��b>�x�J��
L�
��\��Z巭h��.CiIZ�-�獅	�8�9��m��~Lo�\�~	%���_�6dzY"�Ý�kH]�')����Mο��� �4OKgNW;�-�    )�A��ǵ�(�p�7���i�5��+T->G ��ힾ~�!%Q���64YV]/�� �l�ٓJ"|~<�����ZI�+p�9�v4�U)A]���%�1���\	�%�[���0'*�)��x8�Ug����D���S�F���"���9E:o��1o�g���Mct�-�]��N^�h�ػY���;&ׅ@��p��A9M��=����C�;�+�わ�]Ko�jó���x����	�����<K%���k����p"��2�Y���YT�kAK7����`q�n������t}2���B�7�m�����~FE�����n= -�_|����*b�(|@^�l-!{$h���i�@c�X�]�jf�YP&N��D�� �7�r���$u��4xع�9i��4'��ۡ9���D�Y�1<����4�F����XA>��CK���X%���M�x��_m�+���y]���e3d!���n^�ӆ.��CF_�$/!�˹�M��gnq�^٪	a;[�h_Gv��1�l����A�"�/�S]*	�@*�^(���柳rz��L�驦d���{�T��<pl��ha5$����륊	����j�
7�몠�k�����6U����TV�itN�D'C�ɐ{[�:L��Ԩb��/�%lUS�.�f�7��$Zn�$���z�n����E����EJb��B�����^c��uo���g��ڡ�n��'٦{��-Q!��ܐ�������t?��W��9�61G�^u���I˯\�ˮ��c�E¦1�J�-A�tް�b��oT�����Jӛp�G��WI栵,�g�~�fW>�c��c�����F�i=���CkH
��������6)�L�`����	|B�*"tHc$>�W%�[kQ�]�p���|ȯE��e��oJSB$,M	-���x�愩�6���J;K?1|����4 8�å��m����eƞKQMc;:e���|��5F���hp[N��H���v�q`�~�Y�_=ԅmM�n���4�S$��Kc�,0A�$����$���d��=7&t�Y)bS7o�B�����`;��L	S�G8Ď/�{�<�Lsܾ	���_I�����x��s��.E�EF�<������l���1M�������8Z�4é���l�?j8["�H�p�am�����	�..p���v�a�V�m՚0ɮ�:�ѵ4�ڤ-��8��
�|E��8σX�>�����dZ�$��z���������ȏL^(��K_�Ӿ��KQ~Fӱ�$���J�7���W]
z�k����-�U�Rn�:�1��+z�n����)�_uA��Tc��h+F�iu�[Y���r�c>نV��K\��B��Mqͭ�ݚ��*9��r{
l�:�N��/Z[C�vRy�F&�o)o��t_X~c�8�%�f�P�5G��	��H�Y�N]��OqN���C΍�S�ڰҏ��Vu>�l���8¼dH��DX�yD�g�e������-VH�?O��P����Y�gZ�h-�������Lc��YA`:P�l	� 6� ��j5Lp�Z]6��,,֜�E�ho�~6�.�\t1*$l��7P2���ٰ��(3�g��c�V��Җ-^���� �����#���{=L����"�s@�O,����%�&"ob{5�1�ڬ�ï�5�t��q~ƽ�6�Z 8XBA�;��M���p��`�E��s�TX萰I�Z/�]MS�G�X��6n��Yg�h��-�z�X萰�f��pWsÕ7F��榴����'���~/�B���{��dp�H���?��y�g �#عl��ov��qh�R+l���ߑPa[�4"��#�"<`3�^|8
���AJ�6�����˿��P�~�P����u�������肕o��3��Vj)�u|������S
�Ǭ�n��P!a�~?���<ߟ����x{�~���0�`��6�?28�L�BU��@C��M�
	�qz>��t��j�K�"e;��Xw�UH���t��M�+��d(�@!A��P#a�IЇ�I�vc,��ġ�EI�J�\ی�`�+�DD�FB&"�%�3�DM�b���}(d�M�	s8h��f��_�o�����C��ju�4x��E����V�.���<k�v*��tAL�F�at��Wn'���t��E\���F��0/2���7rk��C��D���Z^JftwC��vN-��"��~C�q�X�`�8��ݮr_�Ee����qZ�5�<�p���6X1Y�q�~�`�����$�j�A�	Q5h�|���+Lok�����`���_�o`
���d�||�v[�
�x�y*�P�
m�*�L�1�0�ߖ��M��jӷf���Ma�k�����g8�S�	�#B��m�����������G��+�37:�G��9�"��M��@*�=��D(�ARe�u_Xmk��֣�s�ġ}���^�Ҽ�Ͼ���N�	�:�T�e:Ա�{�*,{U�n�����Ƴ=�S��e��F�F�F#���/]~*�:
/��*���M���-AU�@��~��>�V��}@}����BKFJ�A6���$P���zU&�@��=E�8�Yh�0'�G\��M���X��W�<)��˸��V��j
��E¦�o�)gL�`��ǅ����:��a#9��.X6�,1|$�����=aw��^Q���5�p�O���l�YUu�,^�v� ++"�j�J��_k&�ƨ��bi˫�3W�f�H��Z���I����Ņ�,4mŹ��sm�����S�5�;�ku�WDh�����Z��y<��U�½�(C&B(Ĉ�j�w�Mn��ʯ�E�\�eL��MP{�P�����ƫ�!M�W(�* .��e��YC瀉p��C��͏L�^b�v[��oOa��_�����1�ʇ�ӟ�w72�����Ҫ?N���?ר�͌&�{s�>l�K�k7ks��S�7�Ui
*<�%�K�{���1د*ʾ��伀R�8/�����q�Y�3n�S�q�^ݞ��b�A��j��	�aUA����SH�2X>�ǰ����.�c~m]r�OSd�u7t�S]1X�]����a�uoM6,6���u�)��(d�������5�V�>Ǵ��ؖ��G�V�~^E���/��{z�έզ)���L7��e���$j����˺-����m'�m�\�Zq�I�`�o��C`�
:�s��M���C�[��k�GU�C�s���i+b@#�v����k�}o�����2��4��>�MW:+�冗��}ϴ[I@i�ts��W^�5��X��a�e��7f��`Js3�k�g�a�<���&s�C�&!��9�M�p�+6S���T�%���R��W?��9'����f�~�k~�َn`����#�P 4%�8Zxj}�ә輄��Y_�����2p��� ��LB��0���:v�Y�-��!��4WY�Pl��k�Bx-�U��� ^�9�4f�t/[P[��lvosKrj$�q<�[�Z�AK��qAq�<4&7?Ru��2Ku�_�,��)�J��me��n�J�+Q����J�w��gbj1����A� 7[�φt#pmP��,�W3p�!?�Ε�C0���U�#q�U�Yao�j����,�z\t��AQ�� 2��B�h���@��"�c�+K�k��@%Y������}L313�e;w�uVv1'�5���왟�u�3�i�P!av���&G�s}��p�n��C�� 6Y��v8,���sH�|��o�~�c��=hU$t=�cHX"�U�t�%��q�S�^3r��� ��3N�Q��i�6�ױ�
�!A���	��^l�C��N����@u����%�[Կ��ϰF��ȕIh[�i+�d�b6'�bF�ڴʯ�}{�)���	��
?^����x����[ӥ� �5u�8ܱўk��,�֤J��f_�0s��"�f�ʥ�g����S����\O�m��ZT`[�NK5z�X@��-6�D��p�1T�:���"���-���\� ۮ%�a0� Hr    a;�v��[�V�;��p�J�Q�T���v�
�z8�۪cm��IEx�k.�	�x�\��/C�&�J�Cx�z_���P\S=n�Z
���ş�WL�<"�H�����.os90>n���2lk�j�p���Em���S�z�)J�X�7�C��.�9ɠ�ܙ��N��.�T�Ô����hig��Ί��;g�{M�g@Z�5�Bq� ��f���B��M��������y������4��g�e�r*�
l|�����bŬ���ݳk�$R,�h�$�nU�$�zg���W	�Ae�ïEcR�S'��hX���IF��La@����ŭgP[NT	ia�O�3�Q�v��V��&�!��c��gba�cK_y4X��b��~�����"tH�4x��N&�.x���WC��V���@��Q�Ek	�����\��&��M~�¶�ZF
>gBx�EBU�^�n�����|+�~\�=~��#2Wy%��cla| 2W@ˀ��(R� ����o��4�ک�Y׺�ϥQF��2R\��b���a3���B�Ѿ;�鷂��a �&�'��QHT��� �n�LC����QG�����	C�I`-)�*�v��%��b����(7nD2-�3p�&�L��A�JA~z�IІ�a�G�&������Ua,�t�z<�^��)h�4�f�zI�6q�4��8�8,�H�$����	|{�'������&����~�U���@�4Dy�:�?�De�+�P��P��[���9߸rX�2��X���n�7؂���>"�C��1���oH���a�4�����-�aI��*ӀQ-�1���3G|��;m��j�6�Ǯ��XG*�Ŝ������K����U�i�K�
	�V��=v�k�>�J��cs5)�6y��jkZ�i��yv�,?��a;�_��}��ƥb�EB[ǥ^����y�v~���SԜ밥.;hj�p�;65�ߡ�%�bT����6�=���g��?"LL����J�=#)H[��K��s���D(��i���gڎvP>�K���`g7����E �`�MF�0k�a��LF5	\�F��'���e�ϒ=��T��#aC�n�o�C-u�֌< >U�Kk���[�� ��Q@�B�0w'�҄�����u���α��n(NO~�2�Ґ���Dm�v���3���FԜ��q4g�1 �� h�f�v<���/?r��p�_M)��Y`Z�(c�0׃�x:46�؛�oPG�tn�^%B��M���1L����Wȸ�{N%��FX�͌J�r�j�g��gԔg���������8��Y��=طL{@I��a%ro����Ix-���1�=c�ߟcC������"��c��gN.�B�`�qgU,�3Mie�_t���~q_ޖ��[�Ώ�;{�ܡ�KK
pq)��j�9��~6��-˽�������S"�4olk����L���:cbK�|�H8�_�wڦgni�:]�Rۇ���t��dLd��5�������?�c�h������Y������K$`��y��XPb�f�W@�V9^\���8��)�������4�c�"a��Pp��3_����L�8���Xj,���Hu��j���_���<.<�ܨ� ˁ�X���	���j:L�qN�M�d�)aa��(JI�	�����	sCH05�'�ip�-)Y�j��n��w����3t$����?OAM��/A�?>�.��xy�Op���Dh�0��_�sV��}��E\ʼp��h\4���zJ4��<�3b��D,tH��'�~=��r�2�T�֔�ӲX�ڦU� K�N��u�u_��焰��g�;����+:�ʾ��m�s��P4�~z����#��T��Ng�u/�71��B�H���$�_��N�U�fo���	��nv6���4cvo*V��.E5��ݓ"��Q���"�q~�<8)�=h����9va�0қ�¤4�{&Eq�U��P��pݤ��BcU*dOI4�\KK.�k6��+�d�m�6x-6�k;j��"�5�"�����6��T���/C׵�۳��4����n#0����>ށi!�h�� ���ݧA�.�}l:�n�ty�\AgV�5���tf	�p����TT��DJ�xj�$/C�}3g���.��)��}�L.�TY�6s�1�K��i��;�+|RP����4Y��$�O�/;��y&�yw�x>����V}�m1��5�������[��˫][1Zy�o
����P�H���"�q4���T��5"��ѩ��US�����߾��꿌��dt�e��� !���<6��譕N��7����B��&�Xw�|2h�l�$�H��2�O�m�퀵;�����*笿�*3ݓa`2��a�d��y���=���P3��O�����h-E5h|I���8f7YQk�l7!(=`������9��WR��٘��	S����x��aQ�_�υK)��O�gN"�H��<��/�֜1
�6b��W2�
(�th��jt���Ȑ�=Ţ�s��sZ��/����R'�G�<�i@���m�X \���4�w�w�$�^ͽ(��p�N?_ߞ������c������H�:D�i���t�۶s'��њD{���̴��(NE�,˶<P�"���+8��c�Y}�2��ƾ?��_�o5P��6�#��y.m�ٴޒ�b&��"���>����x=�* ��x�/�&���&��%�=���*m���q1��
�v_�y	?���s�����rC�i�6�C8��5ۛ�:�[�x���Q�����{	sSA�h�-�I����f�7A&��i��	s>Cn�~dB�ώ��ȨcB�瓱"2��g���H�́�	�:�Gf�1�T�C�Ƽ7#��U'�s|+���m��|84	L�\-�P���;Ik �P~�����ę�H�]]箌��7��˯��+���5[�sT��,S����J�;HM'4Vˣ�~h~���7�h;$�㾋�L� S�	ite��,��+�$�`���k�'�ѕOG1"1����<�i���t>چg.v�Z����;s-Œ��e�7m�e,THشZ��T���.����n�5��j�����V��mc㛫�`��QIep�ǎ��3��商E�rޙ���:$l�)�O�6����
]�d��āI��A�yZ�y�(��ڀI���m�Z�{ai`B�B�W����!��}v� 'x�?`�l���(U4j�z{6f��L���A�ݱ��y�B��MH���&�:��.��C/�:
*1�1�b�4��1a,{ 	5�8��M6��m)@o��5���ry�_��"��8�=7�F�jl�ɘ3��aOWpc��K�˨�ζ�&���Π�7p��᪴��K7��c��q�z{�3�*�!�Uږ�.H��?��q��D.��Y^ֿm҃Wn<���zܭ�8��V����rh�4Xryٖ�&�&� A���zJ0�z\Y�rL��G�j��Fk�88�e���8$�@�f!�`I���CR�H��dM�9h��T�d�	�Áԇ�x~Q���,3Km*�/����(d���2y�޻Mwn�j�z�[2�~�{�������6��8=���`a�4���j�[�O*�4��胩q��`�h����uI�����5	.	��0ځ�]�� ̓������������˙�����mn��Ʋ(����&�i��-�m����G�"�c�����w&�$�mo*�+Ϙ�=-,�%����"�偰P
�ωچ�ǻ��d�B\����ba��_73��(=��ҥ�*!B����E0���^j�mW5!�(�@�k,���Z���Z��Q9��׼�rgC�De�$*�1���1�e�cl�e��|�AXW�9�-�)_ؚ����5��t�����ؐ�{���S��H�ˢUx�C�,�pͼׁ��]"tH����|x	g������PCmY��A�9`i��7OAb�u5��)�lـc������B����"Coq���Pבg��,��u���L�����F!��7    ���:�u��dCYo�_������}1�N�e����n��R�����!MĪ^{wP�w$k��^���Q���t����6߫�D,)�77��m}u��Z^-��i�G�Ö��p��n��k�����-h�E���g]�֕qf`ϟ�l8M?"kn�� 0��5�b̂��`���&t�C�@a�w[6	6e�zp��7.B����QU3�B�u�,�����_��9��'p:�?��?����O5��V�C�_[{����p�w=��~~2��~Aq8V5+�e�`��G'x�����=�=S��|��-yb立χp�üTU+�����:z�f�?
eI'@��^9
m	f,�Hؔ`�}R�\`#c�#[|��TÊBT$�y�w;ܠ(������1%pPG�a�c�/�H���Q���( m,"d-�v��+�|=7�f*�<��l���P�l�6CLe> �Ԛ�G�}���I)&8UO�;��|s�������Fđ->_y�-?��m�K��{΃n�b�G¦<W��վf�9�M�w�*�W���.�f���7�w�6g����Lh�����t�U���.c�p�8F礯"wwiK��uu��BX6�Կa�Sw����E���A����M]]E�-Ֆ�4��B��yqk\�'���e猔����%;�+���~�a���}��Ơ�	;ߌG�;�ʗ+T}5$ӏk��`�ٶ	�c���1LÍA�����vv�����XF�lf~��@o��y���f3u�Ы�\�]�(�ȥ��f�ߒ��{�1�6������|ݗ]VZtu9�v%���Z�+��yZ���I��){��א��3'�)@�
4�
�f�s���ǗK,�z�X��j�kOY�CZ�zoϷA݄�`J}���s��KXD�ſ����K@��@�] �] �.;_\)����2��1�^���Wv��&�b�ԉ�m�],�Eު���芷�5� � ������YYn�KS�[yCtC�8��
(C��������*<yco�{g_��@mn�T����q���Ӈ����NNCގ�=G���m��+�m��(��[�&�&��~�Up@~YFo0���t9�wܢ����w���,�!:�á����)K��fWpp9��^����t��,��Q�Gk�|�+z�ɺ��ڴU�����#��B�i��mh�ጥ�oo��^ĵ�o�қ�ib�GgjN�;�w%h[1A�<�����J=�/�R�q��Ю���,���
��U�5Qֿ���m3�˨�.���l�B�Z�����i�d����M�в���ik����s�=��0,�i
W<)��9xL������������1Ûm,Q�����PS�-��}P�HK0��%�(�&�N>��T�1�/��N�v��̦x^�� -X�;�ǿ��.�����H���H3�X�u˺Y�f��L��$�����R)�>��(��@n�Dy��:�A])���%4+��ت]�x�kP����d�4��:���
t�Ġ��4�����+6E@�K���7ċ����.9��fZe�`Ä��oG�%>h�&nL������rYl��[�� �,�>����y�߃�ڮ5c���ߺC���X{���ˠ
��\D� S([ewn�U��R&��������6H5��e�U����R��YI�}c���B�]4T�x�Oɥ�*d�j8ˬ�-� ��8��i�1��JH?n{� \-�A��7��j�7f���:`��sǣ<�nΕ&,YOMV�l���8�p�<�ڱZg����b�C�fY�Fi+��7W������F��z���+�\dی�������R<&��~%�B_������\�*�(�RCBӍ�F�U!D���S%��]�zIӠʪ�"�'-Q�$IJ大��)n�Ǐ��V���Dh�0?���u����k���|�qPU���,kA*�Y����S������
DA���^�֙{��rpי5=tN5�di%>7Wǭl-7�lbT2�ZL2�����U���Ȋ���G�����[S��A��T�����h����qj��|Zn��r'�G�<�i�]��!�f����Taw��g�6k�o6n�����X��D��hf���ջ}���������j��JivL��!��p���;�ߨ���+���P�?��|Nua.��y���-���a��NS-D�Vޙ�Y��[QN
�\��PTˀU��+�t��ފ���� �1�Ȟ�nL����ĬF����u��]�B���o���=t$]�_���0��2[-�CÕ�/��CP*���!� U����Nm�<�m�g�vans�s&�pSc>R��)ؐՂ�߮�6v�D���Ҫ�ي0�Eta��Ll���!�܃Q��
z� 4��7`
Id
0�$2�$�Br�K)p6/!���CD�A�Ͷ{g="���B)��������(��G�}�d��-ũ	��2|��:��cz���YsbE�I,B�e�B�|!��{�*��Ac�}G)Ǝ%(5�d!�,�����AM�\�G���,TH�J�EG[5\΂0��ޡ�Omg�	C1j�n��*�<�q[�;GmL%��Ʈy)���2�� ��Ql��b��7�
Q6�'w2�az�6f�%�6)lt�~��jr?
X9f���"�;&�	m�Ƈ�C{���j;k�cc��ZO�� ̄�	�:��n��k���)�N������Fid:V��X��;���� ��&p��)���}�R�H���1�bL����5�G1<���=,�c���Oa/��>�~+��zB7.��c�{"r�Ӫ7�f�{MXމɼ�E�ba_����?
־���zw��J�IM�%�i��T�D.ゅ��%�-�^���"S��{Z��綞��*GQ�_�)��'���~��n>�e*Ǎ�Yq�-��;x���zC镞ܣ>��:*�me���_$��Y�l�������UY`^�@^� /~���$3вuz���ݡݞkɩt���2
���n���;M��=qӥ����o�K��+%�c��;��$�&3T�k��W�/��ب��Bd(�Q�wF�M�sO�y}r3`�<�#TO�[^��vƾ[�!.[�<�m15��|H�!^�ι�C���NB��y,�`���`Z7Xoc2�<����;ˬF�D�B������0]���溸���ȟ%ȳP!�*���LG��������ٛ��m��0V2S;��)d0�Z�L��΃s�6�գ����\@�d�yZ��ol�2�N�gmp5��uM��u8��b66�z^��zC�ӛ灚�{��=}���	���S�3�E��p�t���jR��>����doR�"�5���D�tܒBvl:�(�A�����7L�r.r��Q�?'�t�<6'\�:5�C]���,�ԉf�	p��J4���O���tNeQo������7��oyD�|,�k�]����~�h� 0�/4膀���@5��uAA���.���3� ���wW���WR�L�	�s�9ۤ�iI���9cڷk��>�wu����W1��V`�4Z3�X�����?��gIo﮼q�����t�ɵoo�q��~����OҌ4�T<1�5�x	�:Ӎi)��,�X�Mp_Y�j��1�ftuV����'��7��_���؍���4�Z� ��ئ�o0�zj���[��K����%Kw�ֺ�4���C7�������"!�#s���tƢ�����nTxU�w홈�r�|��?�M��R�����%h�?�O��������Ӛas$������60S�U�6K�Nw�?|*�#��I�0�et�K����J����Q�SDa��Y�5e��o����p����x|�ޟ���?Ϗ�� �ȋ���}���'bChSEx��i�|;Y�,M�,��^��&�AB�����(ڶ-EF[3���R�k�V��m����.�I��`�hd�h�ht��i,���Bۨ��ޅ��"{*o;^�ZjMw�ͫUS����h�k����,�x�g�Z��AJ+��OPd�&�	JM~���\��kW~%�sF�=�\�*�w�w
�0    �ȉ-�\Y�!�y���5=�֨L������L�K�	��~}����`�]t���e���q����-�"T������J_��k/�̕����d�,�5�Fk�I�TI��b�<�mvO��b����zJ��ږ�S�ERF2_��OO�>)����o1�wA�6�Uc���")�ye�JA~p�#|6�� B��������G'��,1H���n���(j)���@� F�<r汸n*���x{P	���t�.f��^_���l0d]0�:B�ӗ[�D`��3��u����M"/�����X���[��u�x�Ls���C����np�r�-��
��
\z���ԟg�Q��;�ӷ�9�����%E<F�%�6�|���ދ�_n��L�	�B�[���X��]�opm��i@1����zpsH���Ŗ�Y�C��ꐷٻ�1E]�����:o􍜦2�V��X�l����u�\}�A�P�*$�q������i�9QH���U_v��ť�ws�4����3Ι��;YMƢ��LF
���,
�4`���a���/��{F�X�{�\�J�	a��yn�৆��?��6���:���g�y��ʛ���3�+�)xI�-������}Z<�K8�ab^��9�Yh���O\�\,w�0��>}V��v���脙ceo=$��-l��yr����'�廱�#a�w_{r���F�����6��S&�˕=ݯ���=Ƨߧ���o�9��3������:���M�ϟ�|��?�g襞&XЌN��G��G(����� �+K�?)�cJ��DBY_iO���y���$�)����z�r��u�8��#0D�\�Xjp�P!�*nj&M�pd�/�~�x
�I==\M�`|�w^��
F��N�#8S�8(U����܇�s����(��sf���iA�֦���#PS'��+�..��	��2W�����[���!}*��j����Zf�U�H��D���Ԧ�c�F�&mw�4-ћa�wh7*�i�X�ѹ���P��ch�O����:$l
�?��y�z|�����t09�z��J�������8r�Q�\�P��Q;;�Eve�<0�A����;暩��X�E�+ڐ�Ȃ�D��K8����f�i��{�������}"�*�΃DC��z}�|��m�� e�bu�a,4H��!N�_�ߟ���s����?��ׇfbZFT9�v�U�Zcݓ�8�U�j�����Mc�G�<��nƜ��T���]53(!f���/���,k�ׯŞy-~��>���1|x<�֓�����n�B'��=�I��l` ��h�sc!>:Ms�wcĺ`��ș޺3��U+Yu������"m�:$ls=8��L��w��Q��!�/}m��ʨ˦`�G¶(�\�9X�oqg������s	�RE�6گ�w�J��xG=���@�E���A�X葰	�^�lg0]H-E���vÜ�:�L�!jJ���=2�9�FeDÔ�Z2�}��0Mq͌ToL"��+�����_�T"TH��Q��_E5�1���!,j�\�2���	b�&_��{������3$c�9� ^��MB��0�ׄi&�b�ڔ�K�x¶x�"!K?~�"�_̃��t>}��
	�kmʲ	��<�A8�/�e�5�z���&���K<1�p1x��1ϻ�`��K)	
0��P��8��Q�p�>�>B]�$��x{�����~N1Rʏ�0��*O���*��d��)kXh��IY��Wp�c���Ŀ?<O5\.�Y��ǈ�#p9k�&�������ցpXh�0_{`2�}|=��`�|y���)+Z(7Ȼ�"����*��D�������B���r�r����_O)��-�A�`[�L����9���k����L
�p�rINCS��"!�cCwgk�	����\:��a5�O�ߪ��'PV(-<�)YPZx�*BG64=�-���	�Ϥ�r*W��'��8�=x�l` �JU!<:Ş`���
-��EVh�,�2ؾzZ��:'��q�G g��9D��A��!B����qL�]���E>\3�9j�`4�f_P<� ���(a�Y0Jؿ�_�wĘ�χ����!�)���+a��W�G_nI)�E�+Y��a�E�&7no%�� ��1�֪CPӻ���M�=	
]��Ae��4i�yk2]?�y\��۔�hG���3�~8D!�u\,tH������7�"�c	o��\7B5EfM�Ҏ�D�0�El�,L��t���V�<Y��F�"AԞL:$�c����K�X���}Yr���A#k��� �p�� �e��i�8>��|ku�ʫ"2HI)E� ��E �����o1[�GI)�Ǭ+4�I���5���7 x���G�Y�ˆ�>v�m�Z�;h��ZR�\v)}=�L��-���ձ��=�(�$��)��@�_kS�+�&�Z��"�cH��ǵ�>z��.	�(����T�mk��r@\z$�c���tX/�Q1�EP�=���(�b�@7x�x�$��ሄcy2K�)�6)��5��#�.<%��UCT�7AT �"�U4¦cYf�^X��z��T:�ξ�E2jĶ�X葰�vذx�6Q�(3��Y�-�Y�
+���YG��u�$�7a�!�j+.�Z�0]@k��O�l�[u����5pUܑ�Tq�8��m�ٖr����C�ABj�f�������D�j&�v��m&�v'�y�"��gH�b=�V ���9#sFd�k�xЗ�H�������5]j��cY�y�������q	��@�����L�
��t&t#Wn��a�^Cp�9�J6�rA��E�Fd���JQ�y��z�=3
��F�g�V[յw��h%���墨���ٱh�,�EK�I�ep;�y��w��%� ;�D���`	�5	%��da8E{�V��h�GoWb��
��+C�#�f`�J���eaGGv���9��>_�%��Cmk�`�m#L���1�T��C���׺2�ᴀS!�p*�S����%���:��Q�[��x�Ǖa5�0� ��z�[۴僬tb0���2_��Y~W��� ԩA�����	e��vmSP3z4���n���%�f��$2���G��O�x�e[�9�4��,��ǹ:���C%z�+�����|�����v��O1�h�Gw������qc���=+W������=����*l�PW�-����L��[lʘQ����l컋P��(�9��$��m�4�Ǐ�i�b?������Ibr�P����.�L�H���h�^Y߼8�be%-6�l1^�F�	�䰷�������bo�%Dj��12��׶���A�h �r�?:��W��/�&�:_�`Ɯ~Lߖ]ܶ� B����[gז�p�T\��Q��K��T������YO�.��{�᷾~�%�����~sJ��d��o�w��$x;2�Q��8��~N���]�K����k0���`�����$��I ��^9�t
��!���>�{��m�|&����XX��q)n�ف�T��*n3����8�����la�z��W�+i��2�<<�/:�?����ce���gG0C�~�����o\ם�^����� %��ΠmT*�gd�7nm'�֮4��$�w@C�`a!o4C�l�G�O2&��1~��Ӻ�#Y���vE����7���Ƿ>p�[��\�q�ޚlʍ.�lƾ��9*���?��yk��>.�B�`�Zx�����m��C��2�9w��:�}4*��]�\+�u����{�5�{B{���o(}x�=���o����f�0��W�#=�ھ���Q�v���������1�~z}��K-̍e�Kڥ��ܰ�S\f�5�Y�N�F�"��<?h�)b6�l�)n5[�{ô�~��1����J+��A�#���b�~D6���4��<Ǘ��X�o��a0r�<�n��5s�oh�k��m�X�5vܳ�����K<G���})s�q�5lm��60OYX��bo"F�L�f��Z3�_o]�    �����㠞ח�z��A��:�lG
M���u�6S�[P&{�8���[�ki��~�*�1��6�%R�y�96�
L�������|�$�]>�Y�P� XvӟAצ_6w����C�PaC�Ȟ>+�-��>��>�H�5w�RỨoq�w�YA�Zgj�rEVz��KY#�4��R�EJy������O-:��>o�?�A�[j>g�¨ps�Qp[l�c��o.��e�ͷ2����c7���r��`��!�hZ��!�,��������x�+sz~yy%����
�Z��n8jȠ[}r�V�����>}~N��K����u!����6C���U����S��?N����\�a��������o?��?)�|8Z<hǳOU��
~�uc�]����j5�����XA���n=%��o��0s���]��,1V	 Ȯ9���X�
��e�z)8�����y�_o��~�<<,�=d�h���a�C'˶u���8�|�Km�y����\�3wrl��B��o9���O5õi?����
�֑�&�Nq��A�������啢BDSJ�>居���8ƭ�6�l,��3IA�kn����;����4��k[3�v�Y1��������~�u_��/���;Q`�����]�wRm�վ���@������z$l:�l��X�qt�lpNeŷ�:oX���Ͱ��3��)h��G¶�=	)�[�, ��ו���@�iѡ�s���s\�`�D�a>̟�o�����Q$��!��`��۴��8XI�^�-W!�a_������s�����s6E�Q
g��kk;Rf�y#��1c�M�s[�\}G�^I!N��+o{;�w�k8-����)6�z���Sd��j8�͛a�c�tۚ
_\��mX�eS��ܖ�#B��2r_�`v����T��#�'�h&�M.��_a�vBO�6:O=m\�W����f�Sz�z����m;uzW޿)ղ�d#O#�w�{��a\�w�(�3iZ�L僣A��k+53W^H*E�
�"��z��PR�e�;����h�0�!�!�ҭphk�v��_�.�|)�=%�+���R����1U�eŎ�ϭ�T3��F������������M��%+#�˓`�*�����c�O|LAS&_�@l#�̨�[���"فk$�ޟ���*���\�~��8�����8Ʈ�}\t�� �!��˺��Co-�s�X�3�9��Z�3J"w��_'�L�B��',�����,������e[��J�L+�z�AƤ~�{�ʾ*�[�j��و�[�LK��X�9�cݾj;%�F¦S����ߦsV����������5���D��Jw�`\���Y)��V	v�?3� {�{���5��꺨�f?D~��`k�N��r$��d��K�Z�pJ��)M^��%%~�G�-�5�x\��F���kq��'�-�?Ef�.��8=M�i:Z�F¦��e��v�r1��+�oO��$�m-3���Ho+l����U�R#(A�u�J�q)�Z��8�G�"�c0aiT�ܚd^T��;g��Cp!�i�kb��N
���.R���6���kc�N�+�k�Y�b��wW��і�Z�$�w����~�_���bQu��Cu-��������Y�$��X�FrC�lm���{���|Lǐ^	�8Dz�%ڴ�$��n�d��O	�SŽ(�<�R/�(r,c�-p�Zx�N�(U�E0 	���?%�AB�*$�c���r&]kt%X��Ҫ"�]6��`'I<��J�1�X{3����1�Ot\���n��Smܴ=����VEc�kw�'jK��j�c9�
|
՜O���ZY�tp���d�h�"(f��%9��ź�(�k��~
p�l���v�k��p��b&W���L3�i�`�6R�E�6h��,d6�2�$��޻GoH����]k"y��e�V���bfkU��j�mYG�4:KZ	��,��+����g$�⛉�H�5���2��Z`�+��� �~�r<W�"l��Pdðv6q˭*�-�nN��M�I�^�ͭ1ȩ�)���!h,I��┛%?�6�����w��,�����͒�	�xL���3��`L��H%w�S)Vk��Vl�L %[R=M,�H(�"�����p<o���6��C��wZ,��sP��a���_����9m�e�?:��fH]�WԤ�Wi}\9���D@���|��7�8#7���#�&1�iUdp�2�P9�7��n9�X�0qU��rI|\�j�+P�9�Oe�Vw�/{�+��g<otlSVK�	TY�Vw'=i�^@6�Q�Z���۴ݷ�
X.N����BA}$d.�@
O��@�a�1����L�"�(=1�m���c�����}�RxTXX��ET�2�)��L�"�c�o�W<����*���_�=��_.����ɉ�-o�R�x,s
���*$l����&��n�cM^yי����\7xi'O��.�x���tڌ���XTC�Ni;m#?�W�좾5�}�"�4����+����	tף�&~�/_��~����:�+�30ēw�x��/9�Nɬ<Yʸ�Ǘ�Ȍ6�q��<��-s4dp|��?�_�_>O�b�Q������Gc�/9�֮�9�,K�~�"w�����*�RUk!Vk�������h�}]���U�U\�yf���}t�O�/�����U����[��Ǝ�	����O�Xuqf��j���T��&�F^8�̈o����b����ؚhJX���\�U��G]{΍��n����n�l3G�s�����p�� ��<6d��%�GU�v��m�}@cOo�/�Oܷ���kT7��`Yf�,a&��<|�~><<�����Z�r�vZ���$��t¥�ӑ�ۋ4���UТq��LYBC蹫sV����+����,���A[k`3�U�rυh�ޭ~a�ה$G�3\{�ܺ�e���1�M-܃[��O��r�$�Rbo�+��d�5�i�?^?�N_��~���̀.�VL��,[&:f�s�QX!��LYt�-UL�P_�H������<�+�{��������2�� s^H1Tyg�w��������o�q�%=^_�´� ��?0�Oӟ��}y>��R+˄������*�x��V�!�������{�r��΢+�,./���:ˠ:�H�5F�E��c\�#�=�(~6���s_��k�*	��l�̑eY���\�b����2cL0����[�S]��Ǵ�s�T�ɚ���x�\�׹sHi̘����to�%���Ơz��6����o��ġ���^-�l]6����Ŷ2c�-���c�Y*z��ζh���v���]p�T���-'&��at͉��M�r�j���w�*�7Ae��|h&�n`�0�d�6�Q4l ��/h��[1���Wx�7/��[�=z��4�>:��hګ�dsz7�W�H9�m5,�
H&�n�L;���1�5l[�P��� cľ���.�|%&�qR������`R�/��},��t~=#�Q�ֲ�xm�'A��~��v����
 ��������g��_�o�\��?�?�u�Z���+���n_�"�_aE�k+*�.j�c� Jnu\��M��8�[ND2Udy{C[1ղ�`����]!r�� ���SU�2�E\b�]�W�6�F:��x]���
��?�7��:�9�y�W�Ċ�x��E�{�"�T�C�䝻��J�Z31ס��ԋ�ۖ���a��-n�djՇ�����G��LK����FD�@�"�W�����ʲV�wU�t֮}�SG��gg	o^z��Ģ;&��I+j�X��p[ƻp.-���mՙUpm]��`k�i�_�5�l��!(~�����j��K����&��d��p��}�`�#V]��6�ŏR�q�U�4�˕�Q�ɚmԂ�:D��%�Хkfc}Ɣ8������� K������_~{=??�ߒ~n&���Bc�4וZn��\^c�)�,s�Ϗ���������O��ZSLY�b�������-����B��Ð��6p�	�����<�M��Y����������x�'J��lPu���3�T���+7I1<��	�����aRvVuS    �^��nT4X�`�r�R�7���4Qp��4�@ԥhYC%X:�5�B���.ֲ���b
�s�d���z����,קavtq��'�sz���4�^�����ty��W�^
k��c����o��8K�|��k.��������$8��I��si�VE��n�� D���#ɫ�	`8��;��}	`\r
���s�S׫�W1\�cX���t����5����*�	c�Zx�msd�֜����p��.���I1<�ܥr��0f �e��0���M�c̶�qUO����ʅA�Y�ZQ��V� �E�[�L)��x���}����y��#K�8���*���z>/�W4b�*2�L�S"��;dؿ�n�s�q&�A��L��li`������1L�`r<�p���cy�-�ud��Y־}��1�c�c�X?�Z��������g[�KA&�{t�E���+�P1\�b��uՖ�vN��u�%ζ�V��G����}n��X�<���GHo1��SM����k�����B�����Oc�*2�z?>��o��<�������' %˚ɘ/���-����>]V��i��=�A�=R���E�܄�`^*�*O���뫄����z�>��07�ۥF�|��٥�7�F�(����,�E����}�1�K���Ϗ%���I�t���u�rn�SA^�ǱC!�k[�OF�c�I&�,㞘�i|<���vLo6zKą��;�Av�.XэrU7nOŕ�q5�棵��3���H�m;g	�:|-���ceɔ��>c�����S2�� ��[k���c�"VW�+JO�;�+<�>��=[{\�Y��"{ܴ\�h�������4M�)���=$�B}]&A1tM�r���"��LY1�e��\F����8Zn7mY!U�!;�+m�e�.�B:�l�l�r����"�������c����y�mA��jp����$\U�S��
wN,EG��Ş��C�e��`Wۓ��Z���8�N�y�uˇ]�u�b$(��{��*��d��%\V�[�ν�v�}}eE�-�s�����%�yH��m�#.v}�ݶ��Ù���p����>��WR��j���$�ϕ:qE��	 x{�e�`g3��O�nu�u��;z_)��z�������h�h��k"����V�d�$��K�}��0.z�ea���qbA�ż����K ]��q1pk�[0�e�Ț��5.�n��?{�m�Q���M��y!�ne���ki2�<�0�.���.K����G�&�i�b�v7u�e�Ț�7�Ԑ-U�<�`���//�M�[r5ۢU���8��mS$S���G�*�r�f�:���)��P��R���+��@Ei>���Ǎ�Ƶ��:{h�O 6�y�?�m�ŧ�' e�	�q������4�2A���Q������Q�B\�ht-w�y0rk�9#D��-)�w�+��m��C�5�-x�u�+w}�3U*��S��>�v^�4@�F�I�tw��W���*�9׹e�i.�r����۷!�4C ��� �o���˛�!��M���^ea�,�&+h��]\9�1�-���j6��J�y�]��Hۄl`�*�&d�{Cc��Zʅ?���pfkx�HŮ�6�K]Y՚��5�j�־鲶�%�!"��ov�S"a��Ჯ�P��V�s�9Ǻ���W���FZ���o�T�@`��j��s�^6��������\�?�����?�U�$?L�٣�!<��EC�YV���Z	�Y�q�̯��S���Y[�%W5WA�X]l|�'���u��7��ӻeu�%W�F����&u�E�������6R�5,Bp.+�c$�נ�A3^���m�.��,�T{�1%���X��v<\m#��W�(X@���bc?<�_g_�3�h&\�C�!qOIc2on	�r1��ڞ��WӦ�U`3�����h�������]~���+����^?����%o�צ')k%q�H�,�-�3��n7�`��U��lLڧc�æ}v��c.i�׸r�����Fp��U+��tp���]NRql5~c������pZ�����\L���v;�R	{��<���Ω28c�n*���;�e��`��~�;QݚiV�1��44i��[�mP�Z�[��-7��Gnf[�Ny�̶�c�?�M����[�Cr��"��4YN׵�"�egU>*-#�\J�R�8H��;�Rf׃2��QļoئUqh,�E��f��ʶ��� �
٩;&�lucW�5�,Tg��s�+���F�L�MU�U�_�S�h�4�,�N���[�8�W<�l��a�)��D7�A7k��Ò9��.7l�g�q�qM�W���F�\p;��V�b9�}KM�\=��1��������B�[lSk7ɮXf��9ٵ�!�j�'�l-3���@M,Cܮ��K��_������ ��j'Yƅ_��]�b���ER�9t�(�c0Z��ЉV�k��=Mr+Ƹ)���R +o��ژ����\<ٌ�����m����e��'�����h1$�"��0����]�dN1�Ͳٜ]��Q(G�#X���M�61e��9�(���~�xy��x��s�1�����=�����9*d�.k��Yf��2w�ᬵ���ւߥ�J���g|e��׻���a�̲6�n���I`�|�A9�ڬlۓ����_~��;�)	a�����~(L������èJ��={��2r3��I@�7�IgG�̠;&��i:�袨��Kܥ%f,Ԡݵ�h5{`�qO��{l�ysZ}�y��N!�b����K���Ş�7\·~�SAK��|]��V��*/��vx��=�۬A,SE�dn�E�y`$�a�iQ��#�<-��vO|�97~��Y5���e��h�$\�CL�f�|�LD���u>=�
~�y����LfY��>H��=.��Q��y]����8pPv̠+H컒M��[�tS�� O�d1���R������yA��t�Ka����%#�� n�b���9Qhڛ1�G
�ԛ;&���0�0Ծ�(z6�(��9�a���#�F��"%Gy5�o{"���+��🵕�pͲ��!�uf��屶��.ӫ�Ö�,��6�BVU���M�g���D��UsL$ˏZ�s��*�})_�33.DMr����ֹ���5���w��J�j�[��k%�Y�k��H0q���ȋ��!H�E��"H�m�D�t��� ���1� �"k2�ۓP�c,6���QL{��J!�~�*��ݓ ��IX�������]X4�%v@,An��jT�;���L�38�L'n"U������A�	`���J���~���k��(�����g!ü�o(��3��*r�õ��B9��=�V4:g(.�YR�
R��iw�p�O�����j��i�2.�\,2�o����¥ڄ�VJp����T=��Z:��luKR[Q+֊M��Q!�5����B���総������0E�φ)nq��宝�cQ�A������w����|<_"!
�ԒY���t��0RK��k:�&vSi[v��%U�siJ���hZ��NI�s�.�����~�c����瘬�����܏�ILoI ��\��z���\:is��	�d��1����g�W?�ϧZ�9,2Sd9��n*�*�cz{��8��5e�&R��?�Ff��nn �l����{.�7��7/���E6��r[��"�\�
k��Ō1q���&�쿖@����y^��� �dY��� ����b�����|��ˤ�n����v��/_U~n�|�C�9���s���6����9=�P��T�5�G1\��O�^�z�� ~ks1�f���bGu��r|��"��B�L���m��}���oo��yv�`�z�^蠵hJ����5�����S��\�5��c;����÷�c�6��9Wڳaz���U�L�6I����vF\E,a�+2*8�k��Qf��s��&����9�/�n��LY����w��t����0
=�Xꗡ�:��^�~� �XV�Z��Xf��2׻^��5�ښ�����e˽m��`��[`ޤ�_�<}=>D�2uK �~�Ʃ*����`G�uL�r!�P��L�q     ��0���$SE�x�[`H1���iW���u9j�L|�0��mj�Hc	]�m�@��H�o//�&=����ƃ��1�C����K�k �(��n4`�T�5c��9\?�����xo���7�ީ�E�2Ȫ���"kj���xL�\oM���>��F|����*VZT��|,s�X��q�σ�s�0�s��>9���-T��G�˴m��識˧rd��4����ZP�;S��"	X����2�����a�"81��������h�x�/���7����1o��y��X�1���rִqe��n'e���Z4V���zr���Y���1X2�����UX�넭��"�Ov��u9�Cu�*l
�L�eO
z4/_�}z_�d��9������8~���(r>���1`ٵC1`�\J�	��'�u�Մ~�rcE�4]o�,��8�M]oj۬��l31X~8J��L��8XK�%R��P��b�x*��7(��Gd[*hɨ��9�g�vŲ!?��;��-�ϐ��p�\��i@�c�=��kV�mr��4�L'��;�U�u��X)�WT�W����^���5�k^��e![YT��JyA����[	ߪ�4BH�h���Vs�D9y���y1]m�o3���d�~�A�X�]�ʌ�^��u��
1��/�V���-����z�$c��0�U'�=��U}s��R�8l�����4�ҷχ��D����f�m��ڌ��͜�*f��=���J��2�����������_R@��P%d�QF������7k�DhzAc�)����J�Z, i�`��M�.K��(E)�/,SE�\Х�G@z�mSp���U��{��JL���¢"ٛr\X���)ǵ�o�?�t%��y�W�H��v�[�m��*�gbh���g̖���7�\�śH�SBl�~-!����6�䦤��9�p,�E���D<͙Ч�3v�f�`�cc��<1	��o��%��Ы[<��_�6���n���k�i@fa^���ōȀ�O�:�Tv���_d�~���0�0�Zy��"��1�3^���L��g_\VU��"�TO(Ws����
����5s�b}4<)w�N��&�(F��#����v�w�2�Gc���Rc�W���W�����p�p�z{Q!˚�Z��"�1�Ǡx]\t%jK~��=��]�2��qUw�6�2ʶ��i/b����X�۳*wH���B$�a���(\���[���1�N�8��yj�V�H�O�:��by�or��ek�\�7���vw��j��J��)�ʕ�ʶ]�\6�#� �mA������4b����)p���k�<�*�ܟ�ak��?΍�Ÿ���T�P���v�«�L4 ϭ-��ʏ.��ׅH�4���V�
��Y�ռ:��#J����b>��wL��r����W?��U�e`(!�˟���>\d��`(���|����o?�CK[a�03��C�,�ԇ��x� ����z�m��7����tJ����9�o/߿���$4a�*�&��_���Ǡ���6=��J�飹̇���79�yY��2�S���24=M�����h*�z�*�3xs�$��MN��l�7Dgx�����9:c��"��;��ge� ���jZ-�����al�>����H��Hϼ|>��.8ҟ���-?�/���k�ݬ��㥶�)kɇJ�X��
rנ���9V(�ퟞ�6x���zщ��i���t�i4,�թ�2j_�Ca���
�՜i% =*�!hY�����3��K��ӟa������ �5��0x>��ۼ���`�YJʓ�Z���6ZN�*��ˀ�P�f�2��\.y��8@��~Mё��%F�Wrc�x����C �!��`�&�뀺�k��^��Y��.w6{Ոe�Ț�Ʒ�������ӗ�C��y14�ƍ�,L�W�4��IE
�6Ѵ�sq�������o?_>�P=�9=N߈��;8��\xW�l0/S`Vqo���Y����_�3���/�e[L���0ܓ�s12@�1��&�t�v���
����7,3E��}ND}p��� 6��b�e�����&P��l�/��B,`3p$�1����0m+%��C�� Y�?<S*����FV�A��S(�qiC���{�d���K"�Jr�Iy�m������g���Y<�:@���ʒW9����j���"�3�b�<6{]%�=���q�TЂA��d�I�����#�3���)\m�c7 WM�POixLf��i��a=��G�o����?h]���������¬�uW;�2r���*����*�i�� �q��-u���_�yb+���U�&��4&��x��Y��y����ю�vo�d�6e�&3"�T\O#t]�_�eh���S�DD�y1*ަ?���,X�Y�n+��Rk5g�I�elv5G����~������x�W����^@�K	9���8b����&��t�5i�[�RV\o��8��^��e�<�b�7�j��(UdM�Joe�mPp�Ri����Ry���xb{�����������*2��2km�~{��M���χ�;�m��g'��s���y8�����ۢ)��d�li�31��lk�Ǯ:���\a��U�YI)��զ$�r�ï
��4}���4Ox�C!�����e��r4�%8�f^���q��RO�x����ls�=9�L@kc��=066-�R&��L�Ѻ�Ĵa٦�	�t��_n�#"��,��"�� ނ�W)и���e�:���Aw۱�Ȝsr`�Ɂ1'ic��inß\��8�hXUx�ݧ9&�k�$E���x^0T�X������XM����f���4u���h����l�3r\ղ@�sd�����u:]��5e'��J@H������1�z����������Zڲ�����yܧ&�*X=��5� Z�ͬhŪN%5��1�.���<����Sos��q1V.�Ǵ�Q��\rؼ��:r��	l�����`�*�杦na�7���Oy���[����g�D�v�C;��"k�~�Z)��
z��RO��uJh ��A���RKp�9>�>�����{�w�7�E�	N��"�ad�u�S
D�r���/��㢩:ovF��S7���V��<�#��<����:?�<����U�?�"�(nU�lѦ�)��"kz����  C�h����O٢�]�I�|#���\m���70<
��"kx�5=��(�R�>3`r��Y���H��L8,sE�ԁ�U���F5ީ�B��U{lb0��ADev��ŧP1�R��"�����ߧ�������������Dt�f��;�D��`kK�Y�4�A'+&09��D5�Z�[HF/�:����4SY|�np��k�N[7�I7��N�I�\���\�
!l͙�p����l���~š���Aa��e�3�eL�2Z)L|k`����%�6߅��E�Ɛ���͔7!YtL��d�1tLk���m���Z �6����sR� qʥ(�����x=,������e����+Np�s]�4N�C�n����*׸�2Sd9�n��3l{�`��G��Li�1����H�6�_��YS���G�t~;�M�#���%� ��m��PA�t,r@Â���$+��2��@�O�@�,�����y�X���<1̙ϝ�1ճ�U3	�r8��\,C�]󜻢���1rI�x{p�9�h�"�%θ�kM��Rt�NF��P��N���h��vDN������EH�8��0��в�Z�t[��Y	a��	�L��cDc�g�`fu=ܝ�5sw����+L��?�`�Ή!��mJ����Wie3E�>J�ʧl
��q1]���t[q<�d]g�S�2�W'��*� �z(J�2T��3(���T�V�XP�����M��Ճ��'���5������]�#�ul����G]�[e|Y��R�<B�ʒB'[1��zз=�Ǥ��I3���+�]]�VB'J4��������E�I�%(�e|�Pd$͞O�NqJ'u�MƐ�    �J���ոA�lm��ݮWq�S�v~�Ÿ����%$���bl�����b�W�DH��{��6b�yy�c[V��~֗M��Km������3�-��ϧ��<v�gsn	}y�ȺT�$�qS2Ñ���n.�nC �f�� 0n�M[ø�q^�����Sz����^2�r�~�r���	�$i%��$���Z��;��4+�U����&�8"���vf�M�����t��dw�N�1}��� 5�mL}|x��Fy:���8���l��`�� �I$��Dʍ�f�z��H�c�N�gմ��V���X�%��rU���23H���%�#����i ����G�K�h����z��9bt�6�g��-�v,�,��܅�v�"�
�'/��6����̮T�Ɨ�q`�{�
�)_"�l��\� |�$��ƳhF���Yr.<��GJ��J(�5ͦԦ��i6��A-¤�`�0F@Ph�x��^%2� ����C��8**��'��m[��K��)Pi�W�/,�/�r�(�TZ�u<m������2���O�*��C\��>������^�rP��=ā���G�|��Sʣ/���q��,x�]���%�iy�k��6��8����25�e���o銈;��L�5�d�y�dxFgi[AQ�G^~p�]����Z�Y�������vNQ��K
��.翽bDY�"���чS�)64@*��8�D�c�Id�w�A�o:����ʛC*K��ڔ0_ҩ������=Ů�\�d��(���k�}�6mք���ܦ����W�x�|��p��Hl�E��q�g.�o�o�p!\��x�@x �p����+��oz ����l��Y�q�45j���LS[ھ%�oC0mT�&9\<c�,U0Uǳ��c$K�~��ק�����N ��c�u�a���La�e��mطT��!v�jxL��f�M;7l���y�?��?_�O�?��n��_���S'�ę�����Ϸ����/��������1��� 2��d���� 5$?�{�Ԧ� mf����e8���Y�p�kU.bFQ����ϯ��9�u��W��w�����~��ۭ�j��{me�QuŨ!�����Y��� >��ƸD��f��@���<����l���GE��O��	`\4߉%�e����2��2��ݖ�x�Pk'��1�!�F�&�^~����/�����rm}�UK���A��M�n]�&K�ߟ�� ��]�x4���SFm
jtĈkHǗ�w�4q�-�em:�6S��km��{��8C��]�V3#=
����|K���_�����x�j��	خ����[��4�����w�o5�tdi'���C~2�:@
�1�:N��#`�hQ17Hϐ���Hg�n�	��z�pu|ƌ=1�ZC"��}K��n}缏�]
2�[�@[M�t4(4��ݍt;3Zbl�w�Dod��0SZj���m�~vû��d��7	93bl��{?!vKizt�-P�V|@[��3qM`q�^�k4���kP�c�ɉ��t2?(�s]H~���k�He�)����*�R�����l���$X�GC�N��o>���U	����]�d��H]c��
�^�{���给����
(�J�VO��H���)aS�:�c��}� ��"�>e��wo!���38�`���{Ui����H�g?z���b�)k7.ˁ��nv��i�n֝?bw�;B{��[a{�3j���h�*ʭ��NU�[�1�G��o� a]�mm1�e����c���8����N���]��1��=C%�9w������w��o}���o��l+̞wއz�@��s�fM���:�Z	��[ì�ã�#��i�wf�LC��O���/?'>��}�;���9T�-�������S`�a����/}ʚ�Z}�y3��98A�iܺ��Q�V�h�J��k&�ǋ͑H�����+��Hu�3��r�=~r�זV�G�����18���p�KW��V�;-���DD��� ���<�w���aϮ{�h��9��Yf�Ɂ���o���V���������|�`K8́�#�Vя�.jˢUt��o�z�V�=�[����طATa�5��l��fyS��.;���yX�������������2�~��ގ��jI��_S﷡�0�%Ɔ��xg�s
��j�)�%Է�: ]'"Dx�>�"���F������in)(�g6V�Q\��I4�Z]N-�\��y�r�ٗ��M�b,k;-V��^���Wkcn7R�~\�Ά�xY��_R��ɀم�O�蚧5T�j
d�l�ʺ#���UN<^<��AD*YY�])r�b{b���/����(�I+����0��%��Y��:����������5Rha�p��Ǩ�[e�d�m�e��?]�S珄�>���O[��(�d3ZblD���lY���L��j?dƹlJ��X;�cK�R>��O9�BQ�a���t��Z�6O�ܺ���U�v{�e���]%���Y+x���.y2��`fSIH��Մ������FM���Tg]Z�9�s��,�r cWwS����/�xwn;����C�?<�?Y�؊�_C�8�X5_!��Q�=<$��rwc���pp���|���y�ĶR ��ten9J�Ѹczc��,d� ��Ł1�$���ٹ�擭��5�.kQrմ�E�
;q�  �0�Y��vX�����$�	Ƞ�9��Ʌ4�$�V�Z	.�g��d�I�����y�w��I�h��RD��#�{�s>�)y����4�����������r����~��7U{�$���M�R
�4Y+�C/L�*f��Ahd]y��Z7��憏�*2��׷<��}��>����L��D�DV�������kz�)��q9CY^���ڇ��(c��m����g���yz�ѐw��.'c$F\�iq����p5O}��*p�-.���FUp���vKSoz��U��k������类?����_O�מ�(H��&�t-�����c-0��̞���˧�.�Ӭ��f�������C@�>Ӛͷ�!4�*V_5T=I�t�NNg���n�Ͷ�ã����<�.��c��ϼ�⍍�l{�����G������K������!{�t���3�Ո�h+{�;���W߭��J}���"k@����Z�q�~n=i{ZW��M�ۮ�nl5T�uW����D����s�����?�/o�/��Q����_㋛�;!p��i����[֒7<�b,kh֯nkG�܆j����kz�+{K=s;����nM��c&�:/���'���n�
��/s���J �	�Ȟ[:�N���u�bw�yϛ�X���t���#=�ﯯ<�$�{m�Ng�*�!��Ԧ���߫��Vj�O�%��P%H�O{��B���I��i!�8����|�7m�1�e!S!�x��`����K�{�y���d��oS	;xu�z34�	���O^�B)H�w���T;��'���Y���(M!�}׹>kbJ(���;��q�������/�b�xNn�V��K��<����t��5=§��g����ݴ��t�F��y���]vM"��H�-����4����j����6�T��+8=�ۏ<���u��>���Q�	ºh�W���2o���[�l�pj<���x����}���p�B���cz{�=�s-jR�+$k\X�ne����k�}���c֛{�:s�S�S�T9ӣ1? U^�����6�������>�L�����ž�Y�x1C/�rt���r��_w�oo�Q�/����BR�.ԅe}�VMG�2�!`L�'��
���\�\����ê{}YC���g&�<gf����9��>�_���~�Fݚmgܜ
]�v�@ȀN�\R��N���]�u�Fٙ16��b��.1�ޥ���@����MyYmA�1�Ώ/�fDV�8�!JݬN��A]�56�K���\`�%G�U�͹e紵��j����U3��16����������y�{8�l�U�<��J�,27�!�౨ЪO���V����JB��c��~ H |��m[�m�%2U��93jbl��S�x��t��e���7.	ox��g�1� �F��˱@K ��    �������+|ԇk׏����3�kce~�fS���߸Բ�N�ν-�1��Q�`�;����\�Q~�<���֯)�Ow�3ZN���'�~ܻԱ�,�f��
�4֙� ���g3��s���W_(y��<�� 4�E��R'�Z�p6kM��(�45t`
VEn�,�"�S�rOn�Ȉ�@=e0!�r���&-�<�w?~$50���O����9�)�|:�����Ͽ��w�r�}N�3ۊ�_cʿ�ڰ:�(M#U����
�L��L��F�����˩��T��QAW�{�zպ7w�i���ծ���uP�̬���}��]y~f�A ���&�9 6-e���7ݫ�V� r���f�,3�ྚ++��4wkg�z��s�o?�$wUI\9��R�A�,+�Ĩ�����:�s�f�f�vM|��`�����[_���Þu mվk��MXD�S[���������)»��{&�}�<q�'4�ҫcȔ>�U���n�X�*^���|ヨ����0 {�������	hp��)�j�: �4��T��T@�q1�[a�@��O��]��xaSBg�^˵�FM��~��e���W6G�� L���"���{G����tݶ�n��]5�o+U�TW��9Ś�HW��T�
��FK��&E��O����nJi�u��@���`4W5�Y�3�]Μm�f�ק�?h�L�L̚:�J~�"=�P���W�N	j�o�3��:j��~yIn��t:�۟)K}{;��W����R�������pͬ�
&�뻄�8�I~��5blfrTa�08��I�[��28P���eA�V�4��sW�����L�9����/�+w�����ח�眭>}�����Vq<��}{��..5�\�"�%IP�6<�f�3:b�5p����N��U���􀩏b��Ir���#����qǢxT���v��8��U����m�����AT��j%G�� �
ɘ��	��S���ܴ�:g <�k����15Smv4��ʔ�h:*F\�i�>���R��ta�M�j�{L����7�z��+��2$mjD�H^����^ w�x�y����X�����JP~~}��Ts�O�����ǘ_�~818����m���Z��-16"$+n��������\�{����a���K�^�H�z�;�x�E�U�y�w�W0�F�^��t޻��ش�*A��Pu��.�b=ر�Zcx�%K�S7��b��ɛRe.F\C��8h.+C��0V�G��]���J(�_9�yQ$ı��B"*F\G� ;������R
��� ��b�<'��ƕ���.r�����g�O�WF{�[��`�M�.����f�W�/�S]��/���	Q]��j'~��r��9�f9��[%����9���s��vZ��sd�B<g�K��?B��k%�C��@)�4A�Z;@	� fz��v��&��}=�soi5ȇٲì��uj��@��1���E��Z�����y����y@��,�`��Mq,�P*=���X���Ns�v�l�)�o����)y䂯��{��Wnw���j8�m�B*�ME�!��BB���1ܢ �-��7M�-((S5A{o�{zz9������Ni\���9���5��
n�Zsk���de�	ДU�m`L�����~8��ZC��6.��wѱӔU�o�zߥ#����׏����@h�Al�_g��eɷ�FG������e���6o�w���m5/�w4�T�$��hČ���kW��r�A�^Ї�ԃ ��ɧk�00ٴ��.q��~�E�Zd���=�X��Ćh�8d\D�z�+ fU�@@�� E�q��Ii���t\�
�8 A�]�:۲Ļm���Q[�q�ԟ�3�:��tՎu0.ǸK�ũ����G`��)1� ϙ������̌��7�b\[:��/��f=�;Ltn�8�i��R�A`�H����~XE]A9L&�N�b
4ǨQ#���XhܡI�0��dF�J�A5^B�;[��2�l�z~�o/��[�\~>?e�>C^?/�p�kAMjtĈkl锻�hj*�1��1>Du J#a���Zǈ�`��T��&5zbl�5�:MPۡ7gBL��?�5����'��T���$�������s��Q�<���U�D��&����ԚQ5�h������/���z5� �6�Ƈ�����&# ��L p�b,k7-�����k���f�����1��H�˯쯛����;p�L��UtՍWq�-���縰0&_L��!bF��q�a"�����q{Li�����s`��_�qG�3?%�%����Z��D�:$�A!����f[�K*)}���1�1�ט| "��.��9�ZE\j��x��;�_�eJ�
�ˣ#���V+����m`2�~K9���{�P�p1of�4�'8�2kF^�
��/�3i�eiF�Gjdj�WX�S;�M���u΄�Uv�u+:���kWK7,-1���3�f��l�ct�U�#�X�]�1%�[��l��a��yu�3-FX�n�3_%���0�#�D1�U��w �+���,�[н˃���~�Φ�[��W��ЊlPR�ʛ
�����p��Yh���f Z��\&@#�A�z6�*�&�l�`��]c���K��F����꣄)*��jj�~�0[�f��G1�����)����=�O�H���':�:�X������˯8)9f�`;� }�N���l���<p�Ah'�o�m\�-�Y�g)��3���l�B�d������I�v?k��D:����`_�b�����ԁ>�ӹ�[�ܹ3����炖�Y�;\��AJ�舱���j��|��>V��V��������ב�g٩ �?���U��sb�\`m|��t��Q���ZA�?ϙIQ�s�0$���UA^�,�Z,��Y��-��S.e���y����Ca��`�������$`ƌ�q���l�I�-�u�KG����"��@X (\�x�9���Y�՜����恈�} Kc��s��2�lY,i�o;��o;�vߎ�U:Z+�����w� ���˷)�[����9(�� �o�V[%��J���'G8jc؇��	F�m�va���FC������cA�I[N� �6>|��y�o��c$ ��q����
j�)���^��Ni���d5����~,�ߒ�[ؿ%������i�+	��.���X�!�������y�>��=���P�8��0e�YR�N
�7�0��N��-��D�h��Z:���`��<��=��?��6y3Ss���k�{�s}-��T�e�C�f�����(� �}E)�앹:!��NG]:�/��F���]d���{0�}����h��aZ0^&�h��>fw ��J��@b�5�Ö���5�L�p��O�������yƀn�w{}}c>K������!�#~� l��1��c��(=1�ZCK�V5#q6@�2��u�ϦB�z�����lє��=p��3ۏ�M&�^G뢀�Q����u��#��i�!m'\�7Y���T�6�x��qX��o_��oHV�� ��>�h�;��U#�]�ˢ��U2����'FXk }�f�� �\��<��kU��l#��yC;��'^\f�E�q���i�������G5�
�������LW�_�ꥉB�"c3��[�X���*��^ȍ�ס�)���Y�A���@WC�&F\{h$���i��wy��wAr��Ed	�m�\�I�Ō��u���\�Fj>%�ٕ�8��Gǅ�GQ�Dc�1b�u?-��N�GL�jo�	��|��m�����:��� ��څ�͵U���_|�dx_7��&1�̊F�$�k���ڜ4�Z���T*|�6�IDŖϻѪ.�;0�?^��yc��N�0M�9�U�'�l�� �/ӱ�"8�H��AZ,���qZ�z2�aE�j���S��hU�X!�Z�<F�~-���#T�ݻ$�6Lp� d6�#�4�j�#�U����X=��    �F6j���-[A��P�����9s^��݃�_�5eC+d�D	-Q�taZ(����q�������΅�<
!Ͼ1��+@���� dc��\.1��um���b�L_xN���k�*+/��DA�r��=\֊�aYvڭ!K��RQ��|_1�Z�B����9N��Lu�&mc�ppxAX�i��Uw�,^N�$�k�ܜ�yD � ���Lt���/{�EK'��m�k�Z�w*+�d��E��A��p�,2�Lk��!��u��d4Ĉ�~Z� <�xN��'�;�0��w:�ZWo+�mV�|��M�E�Xh�D�'FXk�7���a[���FMw [��ᷬ�H�|��<���p4��k��������.?����BX	X"�m�F�T��5.~�̻����&���j7�*pN6���%��sem�֥w�u��iؠ����Y����hE@M���D�!F\�0]s��2?քfWo��C�i3�5"a�7��q!4:V�������ޫ�apM/8�X}���_h���Z&#���h�j�
Q)��J JW;���i��td�&��6Syõ3�1%�v�e���+"���:p:ץ# k�NϡY�4���.�
B�����i. ��FN��La��g����T�1�L
��Z ���`�I#{Xgh�����f�4�8�(E��͸��b��B0�=0伐��aS���P�?�n�ӯ���^���2iPAﲤm!�*�������=��6���L��M{p&A�R9�m�e�ͣR��6J�	X(�Om��;c2��HW蒳F�($�!��6��<V��2l�0���ڻX��HS�Uta�l��,P�F� W�FO���^�̼z�ˤ���:?ܪ�0+G��PU��^�*�w�F�	Sd�2�tU3�����?OO���������������e��<�at��́)���`��_�]�h�n�b�Ĉk3-�m�R8BЦ=��|Ξ`�q���C?��u��MFK���b�d�	i�90��1)��j�mru�߰��)�0 ����]�)�h�X�tclV�8�32�R��1(՘d8���K�,f���ȁ}����ߟ '�ӫnuIL�5���Vf4�IW���\
����Y5t�sU>�&��ډ
W��
Xf�F��mqf��:u�/�9����\<�X�xɋ96y-4����ҳ��~hp�A j�M��
������_4n��|9��O�gNU/&�#F\�i!Ʊ䁴q�7y�N�"�<�`��M��C-���q��}	8�&8�QQ�8.X_٨TյѸ��z��aE)�8�ϡ;q Cߥ����U_>����V�	�P$�u�� '�q���G1�M���H�\���}G<�!��0c�A������[ �F���z�~];~a�'��B������%�W�\�ZE��#�5��-�������0��w��ރj�
�X�d;���b�~&�j7=1�:��?�4���� ���]�=J�
'Vr�+��BM��1���ü�i^��h�-^�s�3�Z ��Yks	��~����d��e�uFf���3/'���A32@Y�Ӛ��Z��J�*��T��r����I���0��1G1�oyŖC�u��R4{�m�Ǘ��6�};?�����v:�5FS���|qA�T,�L�fJ�A92>�\G`F0�X ��	�ҍ�{`�fתnS=��K���ַN�^;�a��ܪ�r���
<��g�{=�������[HI��;n-�sz�8=KO�R�[`X[��Τ ,	k�MKQ�p�� �X�`6�q�1
��"�h h��81�:Na�4!�0������#���R��*��gf�u�y21٨8��K�W��m�%$�n�j��I[��Ï��&FUR�q�[��������泴��1�B�)�_��򹈥A����J(s,��N�|���>����D�Ba
�h@�Eu*?�kC�#F\G��V���na�W�D�F ���;���>��ڸX���Bnh�Ĉ�0-�/��?���>D��s_�MW$�(�mK�,br��g%��k�Q�0��{8 �I-���}~���3�aZ�i13E�<A���>��8"R7ɮ�f��=i����tV��lԠ.~ �zʰ��@�(Va������Xq��H$����ϧǜȧ��x�.��t~y?����Kl�9�ޅޘc����:ipE�_�-V`1U�T -FXkH�EH�݆��j�E��T���X�����{y����=1�:o6��o�˶"���6�7�?ߵ>R|1Eŀ���EC��� 7K�:"z�:��^�{ۥk�S��O��1�-2gUQ[KY��v`V�C��_8ssm����i}l�ju�=�[!��:ߪ���5q߄�Oe0�B3�ә;����������Ha�C@ ��n���Z~�̥�a��:_s����Hi��Oz���I4t�@�T���
�x:+,@a~D�<+��x�BV�8�Ȝظ������q��M}�0Jb�}:�X����|fd=��v�w���`U��jٵc~L?�
�=�u�Q��&w�V�Z�4q�J��`��7��E� �:�!
{��\�L���\<��KX��4��J�rC�?2T�m�ަ�р��a��l����Q+?�=@���QG�P&��*da����ubT%ßH5�7�^���	x�����Y�*��)N�pG���E�7��ڱ)��!�� <v����cu�crF8`.�8j��k�0WHs�D�[��t:��&JT��>g7 ��^����(M�FK���b-�#�nc;�MocU�uU�m�t@a8+}�N�pEZ�a��y����ͷ�$n)��e���XVN9)#��[���r���A�ZV����ni�m�I��>�X��?-[Ϥ���n<ʣ4�H���*W�a���T��� �G`�����q�-2`��v'�M41F@�.�8�|���j�Y��/�HLY�m��4
bzG���������q7iD
�Sj���U�Z(�*�W���b�����N D��/n6O�<��2Q� �V���qd� ������͜X��Ψ���� �&��X�P:��A��w"Id������_^�<��˻q���*z[�}Cx͝������Ŋ�u��P?���C�nA��bm4��k����S:y��?�?~]N��?�S�@��8pH���-D'G,2T����ٮ[a��ii+��1�إ�8��|��l �e��&FU�H�]�<��pMId�T�[|\���,�@VM��H�*l�q���ȖېL���ܱ٬��Y0�v�VB
�����!s�)d;��{h�j��"X���ag���8>��ޟS^���Y�7
S��@)� g�.T�k 0��
�h�Ĉk�T����0�a�d82h��uD�n�j��#���5�5�������6�x�y�v澫���V��<�]�sHI���J:&��4��I�]���ȵ���;.�gfn��B��ҥ���ֲ��` �H�`k�[�Q�`�e~����������je� �KSk����rv}�U��]���hW��Q���̪��u�<3zb�u�+G6T�Gw*v��m!��� A�N�b��H�z��P2B%�xl�!RM��.��N/V ���6�#�����$�E"���q��E;�첍�z���/Q��`�4nײ���j3����@¹\g�C8�.��i���y��;P��][�k�2c%��x�t�-��Z�a��"ԕ�*q]�i�儾�p��O!G��v�G�����ͭ�SD����V*�!T���%�@М�m��X7�LB��qy��,�c$K�i�X���ZX��7qFC0ݱNP�|�SQX͒D��&ά��3r��kA�3�c@�k�d�iE�:#٣*������y�����_O�s���~zi�6!�� �Eo�� ����o��Zu2�N�`��Wh��NNI�Y�<Du�h�t��5�l�=�w�f�WMRH�Ne��|�� ȍ}L!�v(    �Ǎ�((ʭh��Ҝ&�s��\W�em��r�F1�����������m#��<ŶE���֙I���m讅��1�Wq��f~S9�U�ru��TS�2}t�	ʷc����ܲt�~plC[$Q��V ���O��l�'ʷn�sV��~$Mn�6u���1��p�7�̩� �އ��v�������a�N�^�yar���O�����@]�`��>����n��.��Cd�9�����C�;v�Z�,o�9�B|�y����������$��;i�ݡ�x������|;���k��Xs z���u,�M3č�������'�R8��s��&B��Ѡ�l;"c6��g)e7 ni	g�#�R�][�*�>���X���|�������@����Z� X�����p_,���EP�}�ֿṊ�?`� �����W��Khlz՚��2�!Z�@�����]>a,��MWls�{.OM��L�]��c4bQ}G$L7�ۦ�����[ܽ0"}��Ċ��ul*�@�4G�"�o��j�X�����=��lUeR�UY�#v�:?���?�(��<����r��>�9�����Vw�T6���\`ĩ8�f�6�;l�f\�*�x4a�MȞ�H�Ⱦ��*EL�w��UIZ'9�P&h�����K]�0���|���6���v���2�ͬ�+Tތ��	CDq�J�*����/�s�6�r�HXl�p�|f�l�E���7�G��51�:N��nJ��FeF�A���⨰.�q9��E����Q)���T����d�֙���ed���)���8���4��y�4R������� �Ũ�k ,7�9�vJ­w��u/�Fg΁��4l��)��!�/xß�#�H��"�5�|e�ZN��__Y�G��N]3]����ZC�qq����+a:���Њ���{��63*�hr�kG `��B�� �-����V]��D��k�5x�  W�/��Y��[g�|�mJ��g������Z�]v����J����9��'֑�Y����){;�ix���V�g��:Z�O�>/ϧߟ/�&L:��|H@�8,���rA�<��t�rP��01⺟��|J�����Ji��{PЭ�Яί�`���|����q���
T&N;�xQn/��m�] -v��m_�t�tS������e���ن�|�ؿ��d��Q7��q��8蛻;};aV��3���� m��uӊ�vG2�ru���u�Ź?wM?��8�VI(�&-�u�aA���Й����5���=�iȰ���� .Z������Й0��(����H��3�)�q�)�6p�6���R7{b��f��ü�P����z�G����N��F�js
	��|ٛ:�v��-h��@�ݏ����G��f@�z�)J���(
�� L��0�@��&]s���Ǘ��!E�|A-PI�!������c�i
*�;0����1�r���m��ؘ�)��S4�C�'�`p���ۥY�0��9ul�A�]�Iq�����#�vi�)6�M�IFT�6�
��v!�,6��]�١�e��Q#�H]F�´��)���ޭ�6�3:e[>g�����,TM"o�h���0�-�MH�1Y�7����ri5�!�����\��6��
�xafAZ�\�<2�`q�&����62ҷ�@zazAo:��?��V���*�u�߉��K����+��uh��ͶpV��P�@]^;����qt��VsV�:�h���ղ��u��&�E�l_hQpJ�a4�~n���*@۸�|冀���s�TB�:u�b�u����t��3��3O�z~�x�j^�k�;ץ�>$�6?n�+�۸�-�\7��#�����b�u?-^_���˅�g��n��{�P�Ans���2����@r� ��w����Br|B�ݑ�� j��wl��� [��6��z| mC����MO�K%�	�jΤ��Miĳ�>iv�N+�k���17i����6��e�j�̅�A^Jb���{[��`� �67"���Lt�������z��8����r\R8g��s�~��Q��X(�BLF�Ñ��M[�<v��hՍw8��TE�]I�H:W�% aS�:� Ũ�:ʛ+��;��� W �NH'����CQj���L�Y�nj׹�8�t�Ik��c���|�*�+�5arA�Mȅ�x m����e(7Z���8_QwZ {#�5�5U�<ٷ$2�[�ݪv�*��6�����cE};�����e揠o3�RTE�!kk�6��]C�&F\C��

'�'�!����(��_�
���7��*(�ȑ�[,��-|�㢒�%����e����
�4G�"��Ƌg1?�"�w�ݤy���OV�:{�Ԅ�-ϧ�����8��1��A/�L#�t�:�R�t3�!��~���W�n�D��IW�G
�<��v��A��ȳ����W1}����v�|%�2_X��p4(�Q��C��M�s��R�ڻ�N|?���gm9vf<�w	�"r$'�Ry�Ƒ���2��9f	��aђ#�o�M�3�&��L�?&SA�1�{gUEk����xNy�e�h��H�q�4�Y(�E�io�p��o��|.��XR*�*�� ��(Z��# eZÐ�i"��Pv��L�Sq^�� �R��T�K���˪{��zq�43���tF�9��	ܟV�#2��B�P1�D��I]����!�j�-D7��L��M��2�z� ��6̯�R�%���b���1?���$[?}�)h��r~�y�(���|>���t��l`a&����b�J���ߤ�x�z�c0KñM����}����M_�o}*���=�)��t�*�fk��"�N���F>Ƭ�o��2p�i.e5����r��!�ʈk'ܺ��39�c�=��KZ��Yq���rr������J7U�+6M_�)�SNg>�~��]e���,�����5���\;�Xc���l#���jJ��8�m�7Rx ��51�"�7.x��W�!!=	c������s4h�@��m������#3:b�5ܞ����v2µW]��cSB�H�Dh���R
2.�����|�\9N�}�M
i�Pn?7K�Ρ5׀�$s���7?��dR8��=1�:�����,�I���dU�p�[�bV�،.w�:�>F������VzaxBJ�Tz��@�fq���E_�]�6�]����]͂�9�HZG";ݬ�viySD�u2jbĵ���Z/Mp!�=�̉���QM3��Zj�G��q�Ų�Q/�Np���Km��@��9��ǣl�p��&��<#�*7�n5�Z���w1e*N �9Ϥ'�I)�6|�3�*p���L��5�P��{i�B.#���}� �"���($�^9�,M14b�5H�o&���x�k�}� �Qp�@��Je�
��&=3��ё�cɉJjLk`S.���܅������u��4�"� oUPw� �3G�"si��U�v
�����T.mL�*�;t֩��bm�zNG:M�t�0�Ȱ4�RX���"D�����Eo��G��؊L�ʣ��`��%�f[X��F���&��+�W������X��Q@�*Gw��]�OJ�����l�Y�bgD-C�*N�%�"�#[z���@�'�8�����t���pd`(�*�_ac踈B��h��j�X
���X�nZ,���܄4Ӭ���Re�i��veB����������k����m�6�cibR�֦E|��*��pJF���\��B�od���{��1�����d�!�l���� No=�� lֹ����pU199�o�����*Q,K�GV㇩���7�[�W��#q8�!em\X�X�P82�H�l�#���XУ�DM眻˕	Q+��{J�h/�MstQsZ>�V,�0� FM����M����>��Rb^�N/SP>_f���� �O,�>�n�Sw�cK�|��E����X������j��3/}d��������    ��&����� R�v{�|-#�G�p��� 5�$��h��0fj�f@/L�Hט'���)�ѿr	:+ ��ʟ�;�E=1�:}���FVL/����&VOcc҂h�2X��hb$���\�g?��"�����b�uvj�Y�D]���6��fD0EG��PЌ��cr���ѩ�Ft&�@�\a�P %���%�m�ĕq4�_��ہ�ع.}���m�rI0h�p�� � �)F\���w��#B�.���w�BP�A�_�+:V_�4��{�Ҍ�ୋ�^< 9.�"�Mz��Z��� ���������;��x-.���i�1@%��qȄ7������ƞ�1�;z�����/���x � X���+��nGh�\A`i��+�Pw��e}Zwߎиi�U��t�@���?���~�E��ݲ�w�R�@	�5�ݏo�z�cD�RH:��ﯗ7Ph�^_�\׹������6��Ύ-Ww��S�j�݅i]�*�p��2�]ajQP�$��Â���B��1Zw&��=�ղP	ώ㲑�jK�?F�%bTĈk7-f|:y�`�@�{[o6e� ��r� y�S^Z�پ0eç�&�|�Ė\z=
�q�X�8�o��q�	3Zb�u�׏�Ю��_~0�H}N&�S6B�B�&�B�T{��WU�U[��6��M$���a�Qoh}�c/L�PA���P M���$���N���dς�L�l&�5��5GfmY�����e��HC������_;��
��V���0�^���M��R*������8f���0���I^����w�ohx��b?L�)�HK!�������&w�g�8# b��=#6J����yEr"�H�C��1���
�<Bm�_��l�%i�}Z�\y$�zƨı�k��3խK�>\
���a`����W�Td�9J/�^����eƞa�a������'}�⤏>�`LSn+�)� ?��e�{�(:w(�lH�h,����W1=�#p��	�����[GB�� �d�6Ȧlz�7ο����,�'u�޹cځD��}�qܖa�v��d�� 1zb��������0�#}�]�+�s>x���&�_����膵�����~����9c���o/Y=�HaԨ����j{ϧ��5N?��?GOg�ݷ�3]7.�����p�\5WF�
6D�E�(f周v5blf�-ǋ.�?�JH�\&��IꙎf쯐����$u֘�MF'aXJ��"�4�5�{�ca�~4�h�3�� Q4��[H��5u9�L`��_@r3�NJ������MSA�R!� \�m�����}���v�����Ԩ��Q�����|c.#��K�
?�o�Z��QJ�*��A-C7=�	W��A�a|孏��Ō��4��[�h�����ǘ�O���W*��m��iD�(��̒�c�4��)���g�}�����æ�BөQ�F�W6-`�VM��{�MS�>��? H{0"FM����nMp��Ƿ���1�������ER��ʅ99�}����Tx�a�U�
6�aC16l���[�saoPƫ�W�&'�0������@��LE\^�wd�� ��ry�,�:� �n�8�>�á�y኷��|[���Rb,�� A��$[�rc+0p�~Q�o&�s������BˆAJŨJ��$I�sy���Cy{�۹��UJW���8�t��ۺ>5bl����M�Χ�kN���%�c��VF���%="g�*7��|H�d�}�-%��b�_��:��=%�Ĉk�Y��ΩWkg��P��:�b��m�Λ�1�_���x�#�7̂�b,k81�{��M���S�8��iϴ�a�O����J�w-�J�����WMSZa�Gp�e��w�zBe���B��{iS�Z��P�&�V�)���
��"����o,umG�\}Tֻ���!�M��:��t~��o��Ԩ���:��s�q|�އN�˙|;2q�~�	��nS�w4�?��JCD|oB����1C�끙H`�5-�����} 0��2�q`4[�R�5:bl����������`����m�����D�����~rY�p� �C{G���� ��}���xɓ��8_�M#����ϻ���f68#�b�������^�����0��G���J��z��_O��?�o�3C�_�0*����sr��8�3����8�vp�4}*m�Bt��)!s���S��a�wf�'�`9������[����k=����{oI�V ��GzOO�oOo��A<)GÜ,C�� ��QG���A}s`��jI��X`@���\.?K�K;��j�׶�d	���\�� �H55&�<v��E��'FXkU�u����`T��cJ��%7�� p��U�� �>1E>������gʈ�n������I�J����Y�o��S��t��=��N["5jbl�p�N5ݩT�5�b�,�7�S(z��k:��X�zQ�5�MGjT�X���fq}��($��)�1v���hաm��B"����^'2�7��b�uf�F�.�Jd�4mzJsa�B`g;��4k$~�¦��e7]�Upf3\+e�V�p���~��u�����ӏ������0�lT��L0���o�Cw�;<ʕ�@z��U�o]�ѧF�U��W�\����
uS��mXu� �,�:״�a�Z�^�TJ�3ظ�	[���q�F������&���cL��q4�ܚ����gՇ��7���e7;���J�30`��`[A/j��n#�5��e�I����B���ra~�$2��ƇyKԻ�A�^���C�L2*�˙(決8)��#��i�W���������^K���.�~�@�f��4�U�mJ>��Mu�5`�XK��q����i�%MԈ}6��p�R�r^�2*��@�G�>�m5:>W]D���Y�4)ù�]T+������fh!V��#����MҼH���ɍ!��HԱ��b
�&��1��С�Љo��E8��#�����|���|�8���t�~�`	�4%Cۘ���H�i��QA�@�s-AG��q�a/�Nﯹ(�ga�T4�����v�%8�&0̧�F5������`�sGB�oڧ���-h4���#5X9��$$5zb����2sf�cb
C:�N�w&6�x���z>�$]���s�UG���g��}v]�FK��g����;	3+B�M�N�ۍ�L*�Z����^�~��Q��Ƈ���Ĩ��~Z�[�^HS��yX�{a��U�'ᗦ�{��D�30�������.��)�!% ���r��X��2�{�+��3$������JA�&F]�\��_��)R��lf�͓�V�%��U�&kØ4��X�!FG�����y�����_S��5�z�y���9���w��_ye�wNً#׋+յb����gS��f@�h
�{����{���﹔�]�񩾮ţ����(�Ir[n7TÅd�CW"cS���L��q�`G<��݁��3Ԙ"��R�5)��v�鶅+�OP9�ؙ�Ý��>�ׄ^�HY��!S�!F\C��Tr|C'�i�J�S{��Y2u`>���Eaw�PsK�P��M��%^M�)p4��$��T��r�:9���Ũ��XIN��i�.�`y�����%QA���k���Ȍ��K��Ա�L�ﯷ�x;e��������v�iCh�dUH��\��(F����u�P��FG���������1����N�~�@* 	�X�09X#P_���]��I6�޿V)��N�4���/��@�)l�`��o��#�5����9�]�^�u��k�~�#H�"VWV-�b:�Z7S�0���ܗi�������8��T99bV��|AN��p*9�����kdHy�Mm1���=T��H��/�׸��_	�ո_ޱu/we�k�YW�m4��ʖ�=-1�:�D��S�L3 o�������Uw
&~:��_ -
��X_�u=Ȓ��{�{AI!�wq�Sm�;[�.TX^;�)��k�6휤A=`;�Ǒ�;1��9� o��    �@4� �C0%o�� ɰB��t��4Ap�o�MW�8fU1O3أ㾭ĕi�#F\C�uN�;(!�JG8��u�z������w���ݤIBa<��eS�-g#�3�nX��o�S3�|����Faj@�\���^���޻�0M�Vn�'$�t��ƒ?�\
p�e���I7�2�̿u{aTPł>8fC3�bo�cVegT���~Zm��s�7�O	�l���N��ޱ%�����?A܄ʡʹ���=��cKI�ZeMǨ[()����ZP5��B�FC���������q˞�;�V#
�8�#6�E6s�2��+/�zM$��gVP�!FSH��b��l�Ň�zY�i=n�"Y5�{��Ut�"ZA�SFn��Pu^O=P�pM���P�.)_�C�r��aRU���T�FZ�nf��b&�M	�rY��v{�*��kY�����!M�$)�qo��=�tt,^#�������.�Q��Yֺ[[i�')яO��c0��I,��J���P�5��$�Ǣ�#���gX�d�ҵ���Y�#�Ĥ&n6��,G�Ü���??B�1�#�s�0,d�.٢T�.�$��L�%��M.O4YN{Cv��pC�%F\�i�荄���锠��\��vqj%*ʲ����Zk�P�b�Q��R2�1�=?5.��x(��*��~B��C�RI��2U$�;�ar@~�9����^߯�wDm`Bz�6SVw�N`�ʬlX00��i�-1�:L���RO$i���|jli+}\U�c4��4�%l���4,Ǳ���)�%y��$�51��CR��9O�/�K��yŖ �J�Xx���H�1柎�"�� ���ݏ�s�������v��\X�&����,
�U�^>��8b�趼�;: ӿ�������ҺV�کL�~p�t�����)c�S(˼`�Bh�_4�*Ʋv�r�R�)� ���[e�B����jN�俗��#�j��T�rq���޹�u}+y�=��R��x�J�P�!�Ff�`DCA�t�ϛ��BSs�Sfp(J�;��iWsh-��Nu:O��	GM���]D1�W��Y"�K-��p@�ah��o>�)1��{!*�C�֧2��@P6���Tz/��q��w	�@CT���U5��'̈	$UAqZB�J#1���K��$Qޛ\��z/D5	uL���~]�`(U��(j�m��-YC�<�t(~\ʩ�x>_��%�"�.���nN���rȁ
7�+qX��4�#f����Wihu������O�&�|��%���xV+r�^Ī��]��"���SեC�3�~p$[1�Zʇ��o���e�|����y�(0�Tfc�W�xHP����@�(Ԇ����ҝZ>P4��k�p�6FFAT<�Ɯ�]5;��E�S8Z56��qy��<h�������}���bT�ʀ�<����Y@���������v9��R��!���섶���o��Z�@W�.b����'�f����*�_� y��ц7��F����^`Ⱦ�-4Zb�u�k��VS<\)����|���\��(W�������zZ:-�@n����po}p�z�[2(����.�8圮>ϭ�FcO���@����ܙ��bړ�{�/L�4�#���p�:.�Z��|�r�'�%F\�̶OoO�ߞ��y>��5_�$}��"wca�QM���V.�v:*5���LG]�_�x)-�Yw'&4�hóX[z�~l~���"�k2zb�u�͚��揂x&�K���"b����wO� p�hQ\�6�|���-6.fY��3��,���c%΄*�U��YTʻ�i��X�ñɋ?�4��I1EI�����%���wt}J0���^!8�տ<��]�}�ۦ�����]�Y~7�UF�Z�
S��f�99��*�Hx�F�	_(M���&�n��ŭ�8�Vek�`��51�&4�9#I�1h7hY���݋�� T�! ��QU6+�A���F����{�Y�v׌���s3�?AP䞶jv�We2�e��-�A*<)��C/�qY�G%�ML�1'�m��!y��R���l�Zi`��$�C��q:;@�OAd�xOoO#^9��`� <�6�����[l4��˃���)���3��Em#�����sۧI���mu���1�#��Hxh�%D�����@�V���=��id�Ut�V��		�o��Q�zE�8=�����-���Ooüͷ�A!�p�]�Ux0{�6�EqB���,Lܡ�H��ĝ��@�IIz;E���IG���ۓ?��x���5vQh���kP���iZ)�nw�y�O�^XL:��q�kr|H���Ca�_+��H����s�� �H�E��S�
$[�T1+V^+�k����v��%k`b�[?#Ṇ_�c��v�����np��,�'������Xg2H�H���JYT9���"d�P�.���\W�Up�KH�W�qb���� ��Sܚ��>��P�
��i����4b�u?-�_O�?Q��쮥��]��*�S(��"��N�4 �& ��K�K�5.X��&�kgC.���-����]s�*�=��G�+�h��\��&����5���	�_���b�Ee�v]��H냂����Q#�P';����ʩޙ��s������ZU�;P�y�I�:�Sy�n��Z��8�5I�a�;ւf��7+I�od�mQkեK��n#�2&t��Z�Y��u�n5q�ܭ&�V���3
w�-	��O~i�u�	rI�������F�G_����j�#��O�*�k�X�J�o�s��o��0ՆG^)ou���K��N%Arǘ��SI��(k��Ĵ�b�?m�@�bP�Z�޹�%����b�u�ܣn*H�B�S���7�Z$�U���HiY�:�5�v$�Ŏw:���w\TAS��n�t��/ݽ��ױ�9M�ڪ�6��Ҙ`�{�D��M珫�m��VҖ�8��kS9�DK39A�;dB�}0���vR䆩U@Ց�	���q�3-�4���S�����q�@=���N &]�WQ���b��xb���$���]΂vQT!*�����h45%HWH�"FG����bn�[��C�)���X�.�� ��6��f�_���w��ut����PH�?�Df��/�լ3L__�ү+���q31�ۑ��/�q���o��/���i�mӡ2�^� Oi۲M��c�߭�t�P�=�j쉱%-\��?�?O�l��zt��i��v.Hzgm���r�8������nz���q�ǐ�8Iʍ�|� �������g�ҭ?��a8��6�J�JE�iˆ�Dw��&�aM�|筌3blf�"�C��HAޔ���Is|" �e�S���6\ݷ�]�ӆ__�N�Y7���>`�N��F�Dъ������<]������������������E�t4�9���m+�.�����
�1u-�_�5�=n��١FK�M�N�o{�E:O���_D�Ɯ�P�]V.��.?�^G7=�j����:gL�:�!utB������x�ϧ?�~z>��"<!sƤ��;���D(�8?�� �#c�VNFKͣFO�5O| �> Q.<?����-���5>��`��<ʂW���4��!G�P<��������W9�~>���|8���O�$��4k8l���aC��QTS��2Pd[~��5Zbl����B1v���m\O��9�G��p��h�Ǩ�c�=6�V%���t����v������Z�t�{�e�o�.6.LYb�\<��?N��q�ϖn�3c�ƊV�\k�ѵ�'�2�r	e��kH�^Y����ZEj쉱Q�Y
�#h�Ggұ�38����B�xq*28Ѐ�( �-��7j!5zb���������	�P�����8d���P%���|�W*����mO���(�� "��t$������tzz��	,;J�u	�]��e��{û�aV�Y=�O�᨟�ޖpAI!'��1�j��$��00N�}�������� �������x�1M���w���`z�;�iY7��.�(V�X�ڪ5�ث�:��y��Xt�|��<gQ
��H    3��L=�[2GZ�/�7m�7Q��ON��?ӧ������e��jV"5jblX�o������_�&�Q��O@[�Am	�� \6��FF���8���[B*5zbl�>�B19m��j�� ���̦i��i,P�<�V�-16zXﯯ��4�|�#m#δ}�l5�qWr*
5�e*i��!L��2��vl/5bl����N[�2ژy�����@x�!ե�N�Q�}J
~ΒK�nQrd���1��J�Ó��!������ñ\�nZ����m4jbĵ�����L���J��������D��kXK�c�VV�����V�j?�ϗ�� ����)��{4��`D[i��3�@����0�i��ý������U��r)�d�m��u�����o�������0�ǿ.���Kq]����ݾB���▇�F�$ �����Q������T��cSS�������x*����0FYE�^S5��g)�b��"4�$爳�Rָ�|����=�I�6�ZW ��3hyy�(�Fo$^ގ��txn�
�v6l>\��7�\�MFg�Z��"Uo��ψB��a?d\���� �|�d�_L�=��#�Q�������;����G��������|�<�V��bF�M<�JNt�P�:��*T���	���3���:?'2]m��5��m#�$��'lIe��¡�I� �x3Ui��k�CB��H����W���0�|#�0��K���D>U�6�cPy^>N.Yս^N�������l'ܲv�����塔ve���(5m�=wT�n��g.�;���x��Z�L`S:*Rd�3JP��j@JOx6�I��a�i.un�\��&���y�\��b���,L�6�n��g?�+�<����qZ���n�_���/,M��9�\�QԱ�_M�y5�"_��;��HUϯpd_ɞ�@��Y�B����M P�/dlx�;˅J�ҐȗL�p�8�TN��_������
���]�Wål7O%<�'�� F�8�
B��d���|{ʝ�c�����H���۽��|L�E"N�B[����apڿq�y�\�wx���,s|f�U���:
��J
\~5
�g���oe?mA�ҙwk��>��}������aD�������FR�������k��F��8+Au�߁�-\uPR��b�ƀX��aO'��a��W���	׌|��E��H������RX#G��)c�hX�X�{��L�N�s	��fW�Rba���{�Ŋ����/}�MQ)�{���f�ޑ�������8�j������4�[��"�	rGi��i<
��֐6[5�������@?1jbĵ��sx��Č��.=�K�k��H�k�J=�y��M~� � �����{�S�2�įŨ�����B�C3`a�B��	��0*'s(@���T;�16��
���������R�v��U���{�?�p�o������X�p>@�J���d.��z��NF1��1���uŀ�*���hD>r�����n�ָ�����9�:���9���U`W�t���m���5 $B�	ٰ$i�;?����*���iXW�r̀Bf����|�@�ۿ\�[�������wl��kT��Cθ�B{2~�gl�8�X}�h(� 1��B��V�4���	W�c����a,�{����n
jYnVz�p�v�:�������ӧM�������&�c`�J�,��T�˭������e}�����Ƙ{�u��m�5%�hǶ��B���}�q�B������XW�{��?�
�U���Q�DS�v��5F��0��a߱F��d� ��,k=-���.?���h������M��Y7�z�{��adҁAu?(�n��/?�u�����F�bs��Ф�a��QpP(�`��\eX0��K�.���wt�$��gz2�1����������Bʐ��8ѐ���3�c�"��PV)lf8{`t8�%J�x^o���Q�&e�q� Ğ+झ�G����|��zMa�D�{u�3�f�ZOH1���ဋL�;�ĝ<�vŵ�5���]ycj��@L�5��K���Q+��雛?+4��R��+��}5��]:2j!Y��C��u��c��0vy���(��O�\��Jq�u���r�#�V�W�h��K�o�>\L��'���x�w���k�����C�"�f���)�wP9/F\����:͹����m��s��:��YsECjР5� J�7��#�5��K}�4�&\t�1.�j�9���'_���%��Ɔ2���=1�Z�R��kC�Φ��gQ���B�z�Z�{�P��y;w��2!Ո	o)��0t:�)02�0�8I���Ŋ���d5{�/'_7����{�9,��3
q��V�,`(�a5URѵ����5��ب�-F�e���إ4��wu8�D�<����'�o��lK�Y�<�J�n�k|~�����I��kC�И,7���j�C����Qb�v�F��L�"�*�Qr!�t�WC�9����o�
Y�&i�,�0�7��x�p�l���}��{����p������Y��J9dv�G�Gx �6L��4�6�2?�!�[�`�s��"1����"~�/dAz�>5|oCLy�dXu�(�%c  ���$�h�rA9�f��8������4�g�>�r�es�)UZ�SIꗖ�����ڡg�O�������"/G�Mgʰ�3^��Ö��H�q�rdWs�J��!��zUu�~����Eǅa���I ��Lj�FM����b�37�6�����S�q�y�#���=��^�i�3h��ld�Pֺ���ю�g�̿�[����S�cj�y�b�Q8`g�X>
$,MHX����S��N瀍��1�,�V����7dɞ"_{+u���_o)�����[�c`��;��*]s�ۊ+e��	$�kF;��9þ�z0/kD��v�G��k��p\<����b��q����tD3�v�Gr{�,�N��|J�NW�ɮ�Xĝļõ�r9�켍�t��e�� ��1"�h�a�^u��h��|�c�����Xj�������"�~�D�]� ��8�WA�2.�g��m�6崊��w_�^�E������5gP��/&�r�4�ke�K(����r�AЮ ��/�b���1��o9��i����������s��]�q�����*5���N7H���0�YAk�K��1=S�v�F�q.a�k�	�U�䜈�.�l}��!���	3C��s�f�̉�\A�	����z#t��_[�8i+�'p\�P��3 �!��0k ����I�\a�H�U������w~� ��{�*_�P�?�.����DW?2=uϫz'��+ rj�<.�6�5`��������9{J�]ɣ�i*d��{�k��b�j�Pܡf9��G��I1����H��o;��U�l��UZJ��>\�#�͛`�u����̅
�d�Fw|BƮQ�"�M-7F�v��}G��V�WaJ��UJ��qtN���q��%<잸�>��v���X�y��qj!��j�Н��ә� x7w�Qt�C���y�P��*�[��������~y 0#u\P����]�� ݩ����!uň�8-�$�sX������FG�>o�*�x��r�&��$$��(�)�p�]X@���n�7Ɓ-�Lu�)Ҏf��!���sX��r���+d��B d��e
�"��U1���`�M���+��M	�	_-����6������BG"W���$������&���w�S����uv����8�ߡN3&�|\¯��.)x����[���Ŋ��#����А�����w2b.VT*.�|5�y�6V4ƻN=ܡZHT��_�3��|��VB�榸N[���fU��8�>��F�9[o�eE6,�E�5��Œv>�5-B�[����Y��!�m5�5���*@��&���Xsn�]���w&���{k|v4G1�ib���f�����i�i�B�Wwyt'�z��@�T��ꫪ+$9*',�_�E���3��Z��l��ټ�}�?����V    ��F��������d�	��_���M�(���
�>e$>;~�GQQ<�[�i����@|��C���P��4�m�4 �����C&��Gi2�HÀ�q�p�-�����+AMyUS�Ƴ3���K����+�'�)D��iXT��4|��૎�d�_9��r�-��b�u���f7���-��b8Af&�~���Pȇq��c��~��ӏ,q�c���|M������ҳ^Hφk>�t�r�v��߱E��G! |}�=ºF2��]ς����YQ8蚇u�����_��K��6U��/�8����������B��Uޞ�W��uӯ]�(��݆#Q��H��ƞa��g�*}��;O�<�v���;��c4��) ���ߧ��6}t�Uy�Z:&����?O��A�)��1�p���>O�F��T(�bEY�W�z�A�嶨��<�	oš��#�d���*��N��m|$�b��*F��4�A�?�u��o)|ʽ��(�F��4�����������>
�v�r�.�B��q7i+w�IzD����o�N���c3?0��/���eL��H�T�3$[����px����Re��1)J�>��w�=16�3ԇ:����y�|���Ձ�R7]�81��� s9�җҊ-P�!�Fla�>�^TꞰVu|����"!5��X�q���O�m��ƞ������R[vn*8l�Χ�nӵ�6��6��FO�MNM�>��-<�S�\&�б��G�NW��_S�S1��=Ϝt����w.�� dBB�=-6p̲zF�����t�Ar�Ar�Ap��D=<����/��<i
G�e�^B˶<-���@���-m��w#y�{b��F�D,!��k����ۘD����qܾ��e������}`���ߪ�PcO��jJn�zM������3��ច�0m�D>�8��r����v�%����Pn���?>��i��ӥ���m�z�����{��|OJ ٦�.	��^;�/�9|���;GC�����mI�Ʈ�o�ǗK��T<�@�u1w�g�H � ��z��2��1~,(�?���C_>�?˯�i��/3zb,k���������jܪ����A@��fw��W�M�E�Cؐྜྷ^��Q���6����Wf�O����Wۺ$����Ӓ����,Lw��Sτ� �ݵ�9m��QV_NI�������ۭǍ���ǹ�:[Gk>�S�gJ���U�T��˾��H� �+;=�<{�aGmP� ^�g���0|�����g��&:!L����:��wknpOnp��S�I��F�&�n��!��Q�+8��(���u>��^'uNљ���ůT�	|y)l��J"B������bFg�un'j�;�۾�?�Ԩ��\FM�a5Iϑ8K���V��D���a��Q�X/fPFRR�oL���'�Ez���0����c3�鉮� ��z��7����L=�EOf0�v���tߘ��Y=�з
���D����T�B¦�K�h�:_J�ҩ��p�8�$��*��~�L����	�Et�D���R�31�rߘR�-f
��*:�tZx�aWk�SӛM�
	��셳n�.��W�4��ߌ�����BN�緳�}i|���އ)y�=�����E�|e��ʰ����)�ʇʒ-h�2���ʍ�F�����F]P���ۯ:��P#a3�����������V�6��^�ڳͬ��Hǖ�0d2>�Q�:�c�XS���պ��\S��zq�U���G�I�I��憔�56���AM]����Pu��+�&f�h�)Y�k��G�bR�t3��grN�	���L0�ľB�7Cxid$cH��/r���ѺLW���V����ەמ�	as�y�	{>��`|��H�C�[;�"��:���<[��[KF�K'b�w���Z�p�E��_"�k�>�>g<Vt��0.��G~(�Y m���ۭj������wM6�6��E{�e���2�j1�-fM�f*R�r�y���Lխ�`������	a�t+��x��dq�������t��i_�`��Y:��#�����ĊKgT�kq�����H٦g��$��Y�
	}>z$l�tW�{��(�.|�B7������i��d
d� ^�7XU@�	�����R�Ŵ�����[=�vY멗����ER���jX�{{�hS[ƥ;}��W����Q
=��U��S�s�k�u��-�-�q�k�EcJǼ���M�ضk+���RM@�����|�_/��=>^?^�;O�c��	�c�藷���La��k��/Ԯ�3%��3៛}ZS5��������k�^"��h3�w�����()�"��0�p���a���	;�l�H�u���$��m��pu����}��+������ �!�I +v�j��o֦��,��,���"4H�x�ժY�����?M����F�p��Jj�y�_��[3�+��)'����p���yW�'��^���'�f;�:)��=0M��ș<��k����ë�&?�f֎�Mz�z��J\��cM�|��w4�k�(?\��,�H��'�u��60�e�t]����%e0�&�	������"B��7ÿփj�Z-m+�z�Og>�,���̇
	���	s�ӭ_�Ħ13��t���M��d]���z���%�A¦/y�i�;�:me�´�\� �S�]�6@�w_g�9���;�p[+�K�r�s@��M8��-FbPf@CR�t��SR�U���x�1˥:�43���EBX�R��=�?����څ�M�Lg�r�5�"�+��{�^qNa^���
�1s�����Ql\�8��8�U�JS]I�	��ʭ!'3yAJc��:���l��0}�������.��"�T�c�G¼�i�����`�.vnw�24�_u�¤�{Z����~e�G�kڗk,	�:vg�+�Z7�`#�߶����,ZU1�.Q�����,w�T�d��� �5���)Q���6Nj�S�6�m[9�
��)T_��}
^f�J�3�!���7�N	8k���UNV�ƾ!h%B��A�z�3~4e��n4�9���罙�E��#�fo�Vzp��΍Gp'�6���M��9��lI�������Џl/+�m����M��`�0&X��.��LԀ�C;�n)?�1R���w��\�&'5�:z7G�i�מN�0�6�t��FXiԾ�HS}�E=�O:�}]ʧ�mPe�� ��<D5�&�e��b��A�,tH��"-���St`����:<�Wt�-�AK���Tr,xa�F���z�0J�Ƀ�	]݃:�Q\������x�����>����y
T�0�Ү}��U �����_�S���1!�B"4�K(f�*$l�m<�>ĩt��9�!�a]��⬡X�G��Ee�`NyU�Hy�4ձ��&B��9�~�yё͉v�T:��M���Z(��l��4�њ�5�Dk�[@���B�#��
d��M[�uU�lq�2��àD�	�ym�c&1��킶�fI[��u�X5U�nlЇ��ԯ�=�b#�J5���p�S���p���Rܬ5㧹�ZK�B�5��*q��n�%�����r��@"�H�4 �]Yc`�Ug�5B5�+xm��.�e�$�b�i�H����S�i (��iz�� E6�˖�@�^���{�P$푩�֩�}h�u�P#aS����c8=�~<>]�'j�).�{�oR9�Wo�{03$�益O��>H���B��+΍W��d�^0m��Y1:�yڊ-�����Tӈ����'L!w,ћ!�:NXQ�|��3@}7	�@U�Q�	RGk����Xh�0�ti��O� ӡ���h��y��tpT�o�X���N��B�	�L!5���T�L��U���N�c���QuY�O�m��Cv��.�r�u�n���[��}i+h��OP� � *K��̺B56��	�������6ބ��A�?�o� ��x����}��-�~�X%�n*���h-	� ���o��:ځn��c�N6��Pu��֭���ӝ�ϴh��$]��B�
	�� #Zn��u�%D�!��=�Ku    c)��Ar�,�[0�4]�D��P\C�C$�mg����L܂�Q<f�Gz�޹-�^ⶨ���@�	�)�/��g��&��Q{� �]a��N��9�������Bj+����ex�F0�^>����B�ڡ�}�����U�yN(HB���џ�7�[�23:�]� k�nQ]����]_5�j
�-]v-� �7_�
�_95u��N���k^~E�(^զe�{W�θi*���"a�a��|܋w�u�����3��S��*\_�&���߹*�ʴ߇�k�J�"�[؋���_��ÿ��Ji��՜߫�wtw½w��}�s�g����T��+�՟y�H���z�Щ�P(vmB5W�6s5�� �g^��cNV�Xb8҃��f���DG��c���Y��S6����9܀�o��n/:$lH�6l�%������c�AvCRe�����ar��' w���E�	u���������o�B��.2����,:�6C�i��:�_�}3ৣ��E�$4H����\(�	LhG
-#+�pq�lf��ۂ����b�{8<�\��Fb����.NK��M�.)��H��p ���]6�u4�2h�e��`�.pd�]$� �K���c
^B��Fe�f׍QW�`�G¦��n�%����L�l�-�ٌ\��OA�"()�ߖ����&B�g6՘�?�U�Åf#����h�F++4��>@k8�+
7��Dh��!�_2u�g����H���()@c�і����Y�sw��1|ϓ�O�Y�G⽏:,Aܜ_C�{���v
Q�%�G�!�Xh��A�������� ��ʶ�U�����w\�ݜ�����f��vӵ%�aAw���������y-�b��S�ںn���t�5���5�E>����~Nͅi��4�]ޢ�~�A^@�{��	�˺�n�r�ﬡ�[�u�d;�Ӫ��� I�V��X4���#^����*�,7��x%�p���!�j�[�g��O�q������1Q��[oK��/��S�ƹ܍�8P�N�B�k\L�#.!�	�#4Ɨ��k��+�T��2�U�d�o�2H����1���5�]9mml[a:V�i�ըq�w@CǓ�˟�dj,달/=w���x40Y�xN��YIcKJ�qsJ�2�����8SD͒�%��j���1���p8?>�n7 ��	V�j�ͩ����Ԕkj2�M/���XE�֞��2��<��B�������M/6X�4O&+̴��އ/�YD�S�p�qLV��SIA��X��D�w��E%5V�k3U6� � Hٲ���?��NPk�k'zul�T�)y��`���ZL�\�~����N�ϱ|�U��3�-ܖف��I>��#3&�m7��)�)M�f-뚻�=���%/;M���2Ud���������k��˯Xn�[Y7�� V���k�L��Bw��B����p�s4O.��$�E��J�������Ih(���0��㘫?
�wּu����[5�WƶQs��;��wj�T�;�������4������:FnY9�>Mv}8z��U0o�h����
��
�u���4+^,�Eְ�.�q��4�g8n���7��Ǽ�5�~�h���鄈�w:�9~:�S�-��2�Vz�i�x�>�+�SȡLO����,-V�>S.S��?B��-�?�uc�K�w>z��f�º�`�ժ��U����ժ�j,�fL>�C4_���F�N��gj�7i�԰��[�_�Og��S(�&!��wO�d�.2XƼz��)�T��4i�j�i�CH�|���	������nrx��������5��#�V�;�2c�vp�j�ZB��WHW��ݪFڣ�
 ��/[�v��%V��:�2L�權��-����y�0]#�������3a�����l�9s�w8��+���^vV���n�������p���B��s�=>�k*q�ڶ�\B��u�DJD�z��7Q全̞�ʞS�`��Z�Gi�\o�����o�66�(�V-E�A���oUC���<�e��21�O�� <�e�9�eA$Hcfta�}�)"q����Z��]f����\ :�2)
�(�GkTq\��8w.\�#��#���>rm����>��8����V|^Á�ڰAj�M��ں��M �h:��<�D�����$7TnX���!r��8�N����jfݘ��}�#Sv=P�~�~r�H�W�E���gd����N-SAo��t�}ك���?��ҷ��QK�qN�6���_��^��YT���Ѓe�W�yR�p�3�<����C�Z̊s������p- 0R�p~��="��C���i꒶�mD�&�Mz�(�� Ebl��T��qI� �c,�}>��,a�dy���F�W/�Տ�%R��9Kk!����|��H��bФO�Tsi.�1���qq8��'��Vv�H�4b:��Zq��ꯝ�����g%�onf�u��^ez�	:�H�H�ʻ��!�I-�K[p%CO��Q�q1|<��*�t�ǔ�Cj2Y8�#7��F:��Leu�NV�l�Ku��<>^���u
�%%-�2Wd���剡d����1��B������ksܑ舅r��XҴPeϷ��:�� �
��"�efn�Ֆ�.���k��+�6�]cyM���H�h���$h�9�l�s��_^c�Km��J�^h��w�LU ��F���F�Q�-={��X�(d)rͲ\����#��j�����1�>�	F�~6�L��ZCy�e������K�|���K''���m�X��G�2r2}���J
�G�4ͿŻ���:T��16�'�9���u��E�@����\����痿����Rz-�9>�wߜ�<��;]g�s�ӸB�Gj�nE�j "�1��}!��a�Zn�ftz�	>IQ������xhKIREl��2�~��8�ch��8:���W�/��M�R�U�R��į�KZ�Cͷ)�b=&=�D��cw �?���0��Z^}д#a.t��d�h�_۴��S�ۗ��<_�ieY3�q��e���Td
���$��\Q�R�0��A��S�W�)��S��z8�O�����p�>~�Q�XT� �(��%u�K��  5�(��H�E3m��(juE��yE�>ز�n2i�z������[dr��%9�_��!�:B��	�Ef�g��R��	�����������+h>�/C�=�r0�T��%�/�y�MMsyyո),sE�7!G��տ�Ӗ���3ᒡ�q͊�SUp�M�
�.O��6�E�����T��"�e�UW���b�j����&�f�	甛�m���+��Bk�HU��M�$��"�����{psU������|>�'8��J(�c2BT�����&s���E�,���'[��Ѓ,�K�G�YSV����X2�}��7��jͦv6�G�ɦ������]5֔��im�$��i:�m�8n�'-��@�2[d-A�����^���j�;�MR�Y�k���ת
5$�Ԡ���@$sH������](�v�c���TӐ��Y*�p�_sjr	Fe'�'�'h��d!��^���R��ey	{C{���a*Э�m��]��&����U����|YbZZ+*�h��e�Ț"�������p;�Զ��.li�#��ε|/��e\b�o���U�-��"k�k� bjZx����ܱ�֬�C�g�~��Yt;Z�Eu;
zmb�+2��#�3�L+�?#��LD���P�������=P�Bi���]2y	��_�?�~��T�r.Oc�
�B)����%ǧ7����W+=�9�M��ۿ��H;f��_3�b�E� @}p���g<x�߆���=�r��ʽ�~��Z�O2Ub��������S�
E���k^|4��B�8�	fbW���-��U�X��鄯��8ư)�X��Gk�?7/\�VT�h`�g��B���LT�����$����k���^�I�(;���������� BY���@�h�o��e���[��o���6�����޸xc3l[s�2?��q��1�7��u�:���v���
j�m��r��ܮLW��[>0����}�N�K����    P#a�=�p���@8��r��kN�*�e�1���� �Ӽ%��B��M	u�8�.��]�El�-��\��Nz˫()����8�D���q��O�"ǯ/��U٣^�	���U�=J�#JuÞ4�M"�H��6�Olb����o�]�qi��o�F���-{� �B��v��"2�F�H���7��lnO�Q��!Xz��D�i�]	�X=�G�e�����2����bSW�-�X��>S>��hl�4��*X��F3�}��dW�j� �,]��c �s)�Z:6�F��@�
	���u�w�)S�v����mnB��%\��)5۶�m��֝΄�H׺�Ļ����.���&Wva�	1yh��&c\<�/�sA�ed~���\�p���R#	�t�:H��<Y���h��f��g�����l*��jH�D��۪m; ?��B���"�ut�ժ��w�u#9�_A�յ��@�I� (����c�a�'�b�!��麲��Nfe�adz,���&�s����z���U�ݔ�����Kp�A�~2&e�8	-�Z´��m��˙v6�͒|�m��xm4n�4���d�
zt�!�V�y-���Ig~��a/ru�ÉZF��_u�ĐJp�r�|�ɇ�aD�����\j��,2,�I{�l�,|Sq���4����^��cx� �S` ����e�L\�J�h�ÿ3ڈ�Ax�lz�ueS��|:~=�- 1V�"a[�_�YD[n^���&X��HQ^ ����>����v�.�؞)�π�P��-�Z-��sI�ܒ�kg�[�v`�F�69�5;%�
K���%����Zte����rJ<�����t�1C��uښ.�h� 	��	*�J��աJ:2��=����������P���gi\>i_Áw��.�{	��Oxg�_��p�
��5B��0C�x���е���.�S���� �2�j^�"U���d2ߚ2I`��\�O�2�@:��W���+����
qJ,�����[~8�~��g{�
�e�ϥ�|�SGF2�ɖa-��T�Ɨ�ͤ������F޶'u-���y������?'B��y���Ň[�����8֏��ȵ����9~���l:���?ٛn^���1�bx�;�U�$=�ۿ�p����C�����Rc�A�x�d�=`D'bO��*�p�.���GȪ�)4E6�����Д2�蓉�!a^��X�h��p��u2�=x!\�]��n<��@x�^T%�D����"����!{���Rkazz4Ԛ1G2L<*��$�)�]�xw� `,�H� ��%;�x����{jW}=�X���׍���ĭ�B��������<��'Ss�d�����Z�"P�jP��� ��,}�	�F��݋�	a�R���"ڶ���.��3\k�Z��
~/�oU��Um�]]�� ��Ba^���k�z�^��0X���n�(qU�g��*�7O��qR���B���t��F���^��ٺ�v�H	����m3��w�1�,�M��1�ZN�Idx��g������]���(���Y�z� :$�k���"r���Bŉ�l�=xbxb�o��"�&�j"�H���Dn��d7Rv�ɖJn�hy�&��ۍu)?(#�'������%��w�yO��,�A��%y�oW�����t�_��ݺ����	��XMI���ia�2�|�`v_�� 	=�L������Dn��YW��[ s�簆�C\'r�.(��������T�&�f�,��#�!�K̞��gӢ8Φ��=��7J�z����0j������U�����>[��K���	7�S�a��e?�3�a�N!��	�����h���'��4����ýIQ㶘09�p ߮Ӥ���ϧ��o���������T�/np�t]K�w�Vq��"��>����[�E+K�PKd��F;��7_�3��50��B&9u�[A`g�/� \4՗�l鼘�C3M�^&�6�f�4�^�HE'��}h�H�>�l�>w�?�-GR���B��v��Y�Kߖ�v� R�GnZ(�#���I7��Kg¥�y]�C�~vi��`�m�mg{K��H�!WI�+E%-�ˤ�����J�+�za!$�'T�i�]����or�*&{�5�	X�\���of-�?�����h��M?�Z�����B>Z�Tz@�t/-�j��:�L��-ܳH���WM�O��q6\[NǩB;𸥼�.5y��������z.�K"�H��2-�M��썈mc{P��Z��N f��I�����~|<�¡M�BY�,4H�؏��{�9��g�9�w<�s��,Z�[Ll�$};��槓O���� j�k��նɦ�C¼i��MM]�	i��F{�8nz��ٓ��=˫}wL�0���o��y��/���ؼ��Z�v���w���x��j�d*�n��H�V3귃f�А=I���L���E
jd2~�i�	B>�S�F.���1�1���=��Ͱ,��#m�%��>y�����c|)O��ќ��_�;������D~'Kʾ��yrO����G6C��4�v3dB9��C¼��fkC�j�;�R_�[��mIfj_H&�$�}y��bݔ���~}6�_,o�:s�Ht��fDr�*��-�����w����} �Zہ��n�����j�[����*w�iN�q���$�m�@\:�S�|_�swt}��-��{�9�w7�nlV���띋�ʲ���k6�k�pAU)8�������T<�@�2�������W+��g�s��ZZXm‟;�*^ �-	=�5 ��	c����#r��P�E]K�2�#g���Y)��vo�R���Ә���f���ң�Yc&Gtʚت����&�+Zndb��Sc8��c�z�9�\c5�|9�ś��u!�w]����Λ1����b���X`��T�!yy-fieH�͎�E��FW�����l:U��$�6b*��D̶�5�͕謊ܻp��xG�U]�0N1Jt�ˠ��/�8JG4�)?f�K�^nք��J�*ʫ�ɦ�&�]nA��K���4^d�qJ��'�O�LB�v Ź�ᄸ��\�^.פњE�
��۷����Y$�m�P�Y� 6�ཊR9i~Zuͥ]?���iW�g��y�U�vԑV�|�s�\Z�:�	��d��X	"tH��0�b1�FC��ǩ����MM�jFj�
A�V��O`������S��n��ځ��9���k�]�r+[on[�1y1`�\
�w1���j�e�2Uc�&e�ӧ���I��DܪV�I%�"��WQt���N��;�-�K#�>?�W���=e�Sh�\p�4;�bk�W�K7�)����Ds~�}�JbHtn2'U��8�yG3-���7�I[&{�byu?��$qh;�"����x(�*�y�A�I�5�)��3���6"�:f�VL"Qf���Z�.��xK%����e���%�8�a��ǁ{���g����fqV!�c���ڷj����%�PdI�gي֟`�b�I�Y�	#]8��Zeiń�5��ط4f(f]�i�������/�9��&�������q��'�[D�z���!����cL���8�f�§,�H��2-j�0j�t�w���C;�52�#&���N""B�r#�,"�Č1�"��}P����9�|�-��i�IE[��sǼ�@�	�!//�s*�!��#qv&\��l���*&<T��[\�I(�j�Xٶ�7�k���[���{~�ҵFҘ�Ak�<g+$mQk������k�;�,�'���� @�3&.�c�Θ�U�[8f��0��q�'���p����g�HHf�D�y=�]�o�pՁ�R��*
�M$�+_H ɍ��z��{���i�����v�"\,v`�H��vdC�0��=w5u۞zN�ѯ�L$}�J�&��D]}ѓFnf�vt\�!ec�-�Ѹ��U�nC������1��b?>^�㵌S.�s�l:�}@g�2�u�c�i���|���cuy:S�5�Ltp��|MZ�����M��#h�2�z�b�U~(g�3�a^���}.�    �����ڃ�R�4�'"�5������d�&��Ե��4ߍ��Ї�������g�9O>DM�Ӯl�&�f�V;���PMy]���v0�ҴV|�Q�U��rUw�:c�GL!���'9Hf�'3�A�/��]8�A�7ޣ��*NN��<���pI���^+sN�L�zw�s�?@�6f�C��q���A��=�������9TfqV�_Q]Q9	=�L���$t�f;�B������Z$Tf�����Ԕ�񠺈��~Mh��N�e��%6λ�֙����K�L8�fW�e��91�2Q7��1u?ϫ?-E���P#�.}�v���1�2>|�nW�%s��"O�ek�<#�h��tʻ�SN�Z;�!γ������(w���/K���9$��ľ1��n�������)��&%�,�9@�)|��L��1�ӑ��=��æ��s������~�w�,�藛��u֍��;���9�9�����'�������|8��(�K�	3@ߧ��SI��i:��u{0��1��{�8%W�~��C}�u�?�0�$�07���}�lcG��4��{3t*�"c���s��O����,�H�H'��P3��Nw1;Q��m�j�$�,�"�#��=�-��-��B��`K1�&�C�T�_�k�Bf%f.zM\��s�>SE��΋����A��Y���.�*�x���{�}�l�Nb8{�m,s�I�6���3�o��u�g�|�Em�t��`�D?N����$JerԈ�E�Ҧ��/�%P3܌�����:�����{�u�w�d@EF>W�Q�ޒ2����\�YyO���I<̍j�bKZ[�.O�Q*�r��v�	N�����qu�����]5tuv�xA�C�aI#��q 3;�a��κJ�6;+��!��mS�b�g�j?�;��v~`Ң.���zs(,�[�U^�� �9Q�׿��me`nmD�����ͻ���R���1d85��n(�����dgi?���T�2���)���}Sn� *""ݝ��MY����j&�7�OI�������G��I����P�w/��VܦE[��b�O7�����`z�� ��}@c���z�Q���y�@K�eZ")��:%���x�P�_=���C�'�G�OI�0�eZ,�8��� �y��>�pH]N�L���b�����g���w���Ԑ�9D����Qn���6(��-t#��X�R(9��?���-��:ه��A����tU�I�����p�q����Zl�,��˷�u����J:�C&�PZ8��@�����M�\�ea}[Ћ>�{��Vp>h�W4m^�ܵ��0&~^#��G��?a�J6�I(���q{�?�]�K&|��I-"��E�׾*]�,�5���(X��?�6���P�H�E���\��L����Ϣ�G/���	o�#�Uk�/DP�T,فV]Å������c���:G�����52��pv�J��	߁	N�k�X���ܛF�b��W�K��S�}$Q�u��N�v~�v� �8��!�x�V8b4/gYq�>��n�k�6�9���s�꣭���k�f�H/���F}N�Ms�ݰ�����$�l;`!&ȄՔ�q۔�S��h	`5Sq/�}�%ރ�c��i5���;.�)qѴ�W�"�ޘn��c<8g}l��Ջ� �5Іb:R�Y	#�5�N)����_z2�	��M�^�zl�P�jU�(͛DK��0[�
�o����0�eZ,��knA���*�W���/UZG2Y�9]��6_����`�s'D�n֎���ӟAaΓ����a��1'�$Z����o���������B��y-�����>��V�\���[�u�m��j|ĴL�3�w�k����۳��p�o�?ɤs�o����0!o�`�_���5i\��C5<�jĆ((������Mh�R!�v�n�&���ii��2vᒐ��1�ϧt.���sׁg�����t�C0P���5��0��5\��)��;��C�w��.�t�ٙ|��?#²;�9X�p^ޓ�*�T����`��OA^ރ6�i���̵�tTw�i+�\�?~�V�O��R0��ßooϯ���w�홰!��<еˀ��*zn0:&`���&�%L�B��a�ʶP��$D#Ś�� {϶�ߎ��4�,��5+�~$S6@@Gb�:f�;���\.s�G�p�R�es+^i/�6�S!�QQ%� �|W��9�3������K��+C� h�s^V�E�rJ��g�*��.��Xh��a�~0��m�-䝨���	�rd��:VG�X�ͨi���!aC˷}3�u�f,X�݈*s=��6��-t��(�D뜂{|������u�NB��c�G�i����e$�Q��S+�����z}L'yc8!;-�jŻ��Y:�L)��S�?Vz�m�I�ﱫxc�ܬ���f�7�+n�!�K�Z�UqbU�خ{)4* B���H�����_�x<�)�y/�<m��84�H/[�R���Ŷ�`�\�X萐��nW�f0�~��I���T���	��@�7!�S��{���,ه�a�.�z�4yn��H�)�e����Ҍ�#B|�d�O�q\0����V�����	���|J�p��T�N�4�KG@#��~&֓Kppo�7��vB�c��uZ�5#Yh���i�PѝS�c��D��@��X����h�jA�Vge�2�Wx�~��4��Б��d"�v�::$l&��>.��7c�c�N�e�C�>x�b.4�lM���u��u��1�7�,�u
~v�G B���?�O��L����$� � ���J��9hA�rԖ�'["��d��P�,Դ�u}<�"��H���˯8�;��$�X3��z�Z�#��
�WGB�l>��8��L�+��yO;z$�k�-=V�1eԕ����Ϊ6��J$�*���p��L����~J���A,�H��_b��5���+��z��_�n�U�~��b�������N-��~JW���D�0�at*���X�}����1��Ye�rOu���,�9��܈x�4,����Nv^�u�Rx]�0�eZ�'X��i�7���%M*��r���>�sq场\`h�;�W����T�,�H�@�����X�L���u2BY�v���u�[����I;��@[�"q�� �MG�S��T�U���o�H������
�o�6�2K-��T�yQ�^���vd�	��"�4��h®�vX萰I�ͫI�S
�]��-.[_8���D\ea�w�V�a�G¦�Jb9���t�'3�!|���fy^�Y=��N\��t>�	��mAZ$�(0�U�1J̰��E�`�??uN�D���4C�ʲJ���
��M-Uks�03�ǴH�+�3�<�ͩ�yEl����H���MQ[�"�ԭ��+ѣ����GX���8ׇ��N�\���X��=���e�5Z+�u�^$�C�I�Xh�0�v0��y���ʤ���mNM�벪��s���U�!�qܾ�Ɣ�U��0����N��T�WԬ�m��!a^���ԴDM���j�
������P�g:�E�WVA-d�*5�½�>�p��(׆:*�yۚS�B~�<
dQ�YjwZbf,�$�����/��>mz�u�鲖5j���=�M�f��ub�q�%=�����ֲ_��Ig��'��(0/5��Em~�/:$lr���$���pQR�)��ޭXW��S#r�.tCjh�\���0�EZ�;�� �3.�z�T<�b����VT��Q�]f	�Y+��U�t,w��؋�y����v@��O�n
��a����|#z$l�r$�b��O���B�V!���C�::��`��^��18X����^�	���g0�"���c��f(KP{ږ9b�G¦̱�t�zm�k���}�O�S'�� �����I]�v���օ�I�V�*kq��\�lI�Y��C`�G¦�m��
r���#L)y�j�/�*��+�+��
�T�JR��
��Ӛ鶜Ӟ̛���������j",tHذ-ڣ�q����uTnse3�C?N�')��7�%fC�    M8�1���ԅ�5�����"�:W6RG�����������&'-�.���\=fL�l)���%�>��B��y-ҢՑ�^�pБ̹�ge�g	&0���ɸ�a�/�n���+��a�������]�RVAf�So�)6I�"[u�L�T�,�N�3frB�]�饵D���c����$���X7�Rt����͑oLQ����1�p{�S��9V�7�;�@�^W�E�Y��\�`��5j�1�\�)���F���?�8�s��B4�A,�ʁtJ$�%���*� 3DS:љ��/ Y�'�i�6��׶�`!v����R;��J�.|���B� �'�
x��wD�UD�\�G�	e�.a��8�����܃��i��'(si6��ޘK�s;q�ܛ�֣���v.����{|�13�O`��ه7v-�P�Ժ6p�E@̔ �u�1��� ME2`n�4�x�H��@?�ȅLY�0�EZ�L��� ^w^˘�݃��@�`
*��*���ME^��	� ����D.�S�oǶ���Fk�)��U����#a3��a��Wqmw�T�(�{!M�t'�Z� dμZӍ]�س���z$l8�v~>gp~��]i�Q]��=�¬.!�<e�w1���T�d�G�	�#kK�C-�,�Kj�%5`I�R��z5���t���#g�����2�]�t輸��됣�+5��*���B� h���gl��t˨ٲ�5���7�eMr}d��>4U�(u-��L��?�.�h$5L$�j�����xg�2�2�0�ˠͨ_�l|Z:|жӻ �"4oR
�*m�*3(�q���ѣ��&�@�����s�O����'���@B��@J��e�P�:g�A��^��ƙw�@fF���'�<�.�g�ez$�k�DAh1��H�UC������*�A�]��c�����1��H��Hp~�ş/�O����vJ�F��ٖ8;���c)�d�^���C�:��Q�H��DF���O���J��e��^�Hg���iIH��;��v�B��5��ۑd�4���7�w!<K ��*��1l������ic�B�d+3c�D2~� �89��B����{ ��V�K,Q��m���vo�SW)o�h
�*��D��Bяax�YkA����oAU�bG��C뺩�H��0̴L�gi]�V��	�� �CD�f$^�� ��,%�Y�YJ������a�iY�Õi�``�ޅ�TŢ3AR���uat��`���`u\�S����Ǳ��i�
f�5�i�����]ix�@�t���Q���p�H�eZ��h:�tl�sP2�7>�6g��]�<��91NC>%]��n��XO��w�W��!	�A���pBIZ�	c��"!��$�~�uR���B�
�-~��ۥ�_RCRQ.~m^�<��f�b�?II�/왻"����������x^GR��ub��-�M,�� 1|��"���j�CCwi�F�W~�M��Ơ=]��D�y��=|U~�s9��:ލo�}�83-��
�Ѫ�i���������O݄2�I�1�y-�b�*a��G���k������d�2�"D]��������D۶-�I!���]��LbĄ�k>;�E�)Q�(�E.�6�+L±����y6�}�#�ɵE�u�;3����M��]U?��
����t�̼β�Ρ��u���l<��.Ĉ+�mF��q%�7�{���Y�'8P$��2Ϳgj����H�	�w�IMqI;�Z�����v�7⪯f��B{��-l��q�V-p��F��r��"�@U�XFb�輸g�P����Q���;s+{ #�@�Ij/QP/�f9�y��#a�;�Pd"vӋ����NW�v��.����5�E�o�M>����8��8,��_u{����LO� ]��hH�qk(/��D@y��H0C8�Q=�8��1߃劓l}$	� �������q`}�0�EZl�jHhǱ�w�
W����*��q[J���rs�ѽ��[#�WB����%�+T�����HF=A�O������Lmư��\���d�n?��5��S�=O��<���֛��{�j&���:���x<M$���r_jz$�k��p&źI"������VR�'Ue<�ř�oۘ簪-��Q�H��v�,�Zj����g.Zb�Z��s��>^��<�}�~���׿���%�<\��Ts�V=_>l�4:f�k��y������}�C��>(�Ϊf�D!6�DF�mcg n�Po�,��H gI�9�(	��n|ĩtu?�Pa�� �ƪ�}�#z�yF�A���+����8<j���
2��N�N��.@i��+�K��/P]�(�*=)Q&*�:h�Z%�8;]��zt��%],�4c�2[cL0&�0&�B��iZ,�p�vg�$��(�e�U��n�u%� J��]'䷎��wG�.2�y0��*�!��4��FCA��Pj�Z��Y��爆��ͥG�)F�[A���^����nɮ/]��WX{��3��P��A�Q�(��������e�|m1G-��Yi��S��Sl���3�x��t@r�-8�
9�
��i�d�Z�j��x��e�L�)� ���9�X�rQ�N��N�P�ђwGp-uVy�Դ2������f[���R'b�ijZ���d6QL����P%Q����$B��y-�bu$_ֻu�������`]5Uu�2�4W���_�c0�� H�:Ou� �U��U᪥�ܫ��|���$E������hSZ$�u�l���%aCQ��ކ���ʧ���fb��4M#X��}��۾����):*�bP�$a*T�u0�!�(���	�	�������G����4�.h�]V�ŕ\x{�>\)�-3u�|�eu�u�uk�$߻���_"y����q�߃�=�����p9�ߩ�i��c9~�탒�/tFX(����$�	*�_&B�����)�cJ�GA��؝O�ݯ�+T�C�t��/�)�h4��ۗH"5�����?��O�&���g��?z�M�\]�Kc��1`iR����4��Q'Em�<BF�+j�� s5�f>XñP�҇�}�)���d�GTHP�1����,TH�J�uZpN$:c(�u/��q@�=�C}�E*����/¾~��2%B��ܧ7���::�vJ�ѝ�����ds�=����]"ĝ���k�6\���e�Mm(� :F������%�"\�^_&�6��뚺fJ�㏨�'��QdVҀ����:�P��N��Z��NҲ�����l��S�2�L�%�q�ړ�W�����
�#��f%ʱt��jiW���g[�~�����h�Z���0Qw�E���=���*�<h �kUa�j$�e
��xDB,��Z�L=�k�y���U/)���:�4�$!GI�������?���ik��,���~!-<	�Z6�rj���<��G @�;�+�<����K�D�"�EX�[_�:Z1\����!̰�>�(�Q��<:�j8"tH��"-���-�EׇwHz�c�n=sM<���cs4���,�"�T7�Ps� :B�����E���a��`�c`�F3�rV�]�]�.�%�38���q��8�ٗ���A8�?�$R`r�RE�$�H��2-�$��:N[�}j�C�g]!g�?2��p��]��"�g�t�p��fI��*�n։���������F��߯���t�B���Z� ~������	��	����c��X�{�%�m��8�:�/gTo#�a[z���wj�]P�$ 5�(��V�&[k�ɚ�i��G�<xAA�xJ�Sd�La,TH���e�%��F�Uo?I\��
hݴ���o��#1YKE}VF���w~$4��k��K�6��dx���S���*�UR;����0�"�} Q=.(���ܦY���yw��R�PKN}���v$���|���-�U�J�%4��� lυ	�6G�4��chE]l!h�):$�k�K�E-Eu4>��UA���d�Wf�Շ�%�    �2S_�w.��
ZN-��Ȃ�Hh�B�O՞��ube�ABX�'A{��8�a��V����
��tV�(+�)]2A��*n��Uh|4G���:����1���kQ�̬cEaZ=3��rf�R��pYkgd7����Fx��H���Ie��C���Q�|�Q��������jӇ����K�����R�ww6��c���!*��'I�+4A�5`8ھI(1 �@����݉�L�5ݖB믜Q����!�V*�YU�ܬ�&ub�����,�~}f���r�䴞��u�T:m�mȓ .a��O��9$[���^H�>���P\�/��(��Q�OevP�|�0��E����|���04��z�TL�}���e.�`\Q�7�s���B����p��#����0|L�,	�*���q>m����
H�uZte�kdp�	gWW��B
b�^y{�P�c}��&��������jO�\G��6-��z����3\������e�G¼�i��d��t���i�۪�n�~��j�yYJ��_݆�I�~� B@���n��8��p=��1}$�kI�cn\�q��.N$�1���7�,haQ�J�s@�	�Z��JRK�}���n�>�iX��LK�c�t|y	�����ۅ����{V�`�[�ɘX�Ry��9p@/-Z%S���SIokwSl�[�C�	w�["A�i��o���ʯ��0>%�t̂'������������[�zd�[g���i�G���������][�L�>6�{UU��9P��a&��P�T��Dd�ABX�R��>iږM;���mz���+��if��=�\����!��9@-;]9�X�4Ĭ���T�ZD�0���#_M�dz��.Q�}uK��,i
UHA��ץ�~o�4��xz|�R["�-G��� �f��"�WJN@u� �$�*�궟���e`�r,�Z��3�},۠��0n��Z�-i��ld,��������rA�eh���b����@*�t��9�%�!��&��h3Ln[��x�}����:T�� (T�24˾�\� `[*��VEN$��ʯ�� ɞ�T_��-��%�>ou�Jm_�d�h���]��:;�y�̉��~�6�rr�;'UW�h��K��� �Ȍ������QW��H����e���0��꼏0I* >H�1S�"Fӯl��d[�_u��x�];υ�,��Ƒb��>�ܶ�H���\����R�uԊ0�fF�HM�O���b�M�O�!��B4�ƙ���&Ͱ`(�+�Mj,���Y��oA	���iK�^���ߨ �A�v������M�g����r��k��D�h���2t��H���]���yj	����wӘA�,AkQ���֢�Bk��ߩEbꠜ�3/��f"�{�	NZ(��&[�~��"���Ԙu���(�����ʪ�m���bȺ����z���7+&��%�tR�.H:�쮤@n1q�ք��"Js�`��{(��:[�r��Ύs	�
���4�78A��"�P_7��k��Z����
������f�T�O=��(G�ʞd9�n�b5 -k3��UyR���z��>���Wc:��p��7[j��fH����M�Mb�^���pD�y-`��L�n��^ygM��>3��X`N�5�r}�_�}�S�U����]Uk��Ug	E�]��"��Vq�t:�c���os��_�ʩ,��5�����J�8���]x�&�M��TW�"�\�ݓ��l����§I��:��H��˦��;�͜c��֎�N_��rۮ&�twQ5�W��_W�ٱt�}�8��.t��i�ّ�P���Y%�\��}�ެ���~n�����t�����H�>��Z*�s�ެ�G�]uA� *�tC09�6�=��~��ڵ�O"������+�U�{��ŷ$6cȷ�Ӈ�K�|�k� #ݪ���,s\��	a�>�!F9O�Zf����U��*�DR�3ӡ$^�x(�54��㵴1�2� �fGʊAzL�L�M��X3�+�+��+V(W� W<-��D���q�`���;�����uCҗLb|Zv�K�)��O�kgoE.�{�<_��	9����iY�#c�w��G�T�Q���VMg�bnfE݆<��={̲�]U��>�xJ<�ď������ʛa��.8!�;�H�!-9"�P_Y5�by�ʭ�cz�ŏQThϝ�����|�����%�%�>{�Tpw��j�UUů�2���`�@��D
6$*ؐP�1-f9�mˑ}���W~T`��yU5a�i���AAUC�:��L�^������^����}U��N��9�8Ț�^�l��[��y-�b�j��Gu�v,���s@�;��;4Ϙm���v��>ÜT͘N��o2�d v�e̎�c���y��9#��!M��|P�`qr�Y�>Y��GßnTbh��7�&�L��K�4S!3<UըH�A2� K8�E��"-X�,ǣ�L-�b�]����"uC�Ȥ#��g�`s��>K�����(L,K��c���b"�°i0Ό�ȋ*�H.3��A���z�Y;j�ٽ�m��U�u�Aї�e��J�#V����m^��N>��T�S ��E�yr�Cc���#a^�T��r9j�ZW�ȾW�b��Iu�fn�ª���S���T�a1�+�&�t�j¸�m�Gҁ}�ڪb�R�@+z=��5�D�O��5���h({Ǐ�c�y�/�Z[�5�d��uw�I[�A�UK�}v�jg�7Eq�号
vr�B:m����2�c�Lպ#G�f��.-��+��[{�EY_aJ+�0����&O��̜�2`�$2W̕D�J���;��Z��s�~�`�vBN\�0ӦQ�\���u}׍��m�k�h��jK�?���^Y���  Xll 6e��ڴm��wO�j�xZ��k&	q SM!�{ڈH��{�;�=�S�%�&��^��]���(=�L��68��;Ҩ�p��.j��c�Mm�*:��-�֤ͩ���\Q�q!�����R�P���/� ��r���,�H��H�̖��wR��W#ѫ([U��wM9[�2`9Jo'b�Ev�#M���<��*����Y�0�eZT� H1��[k?Ό�E��M~fI��눩�r��pl�q�E_���St?W[�~siy��Z�R�}�󱋗���1�.I�� "��C��*Y��۫��D\�v�<0�su#�P��a�|đ�,3��u�����Il�pzka�I�w�%;�f��B 8�er��'�o��d9��N�`ȼ�NM��ܭ�YZhƷ炞{SK�$-�w�U]�׋ޞ�7z��h���u��A�� B���8�w�����4��]����n�I���UY��=��Zl���‧�7�Ryx��=�B�Q�]Y������Ԉ����D���X2�T-�R���)=���R�Ƥ�w�u�� �������[�vQ,��\��CbkZ���/��i# e�Q=��"�"�k��(�܇���I��EM��#��<B� (m���_��8�\9��U�T'��F��F���nO]�Z�o`�s��µ��
.��_>�e���o߷4B둳�N��;P ��G�5�w�=l�!1C�i��yf� �|�V�������$���aOz�&��$LyB0�}3'@IU�"1p�"���k�%eK�C�:gdUR�>�z���"K�N��p�ǁ?f�H�-�P��6�6��O�<����0�O�|�o���=��q�Xqn����rh����K�5�(�\dN_�"��7=����U_����8|�Ƌ����k�}Zg&�HA��������?_�Y�����?�q�q�P�`�������U[��0��\ӑ��z>�3�Z�R��+I|�zi��Ќ�����ЏawB�8)Q�C��$�o�Z�(�m��-G�V��k���+2���e��DU��y�B��hlf��o!�'�_K~v�����_���<��N�o�6�%xR��e����@��?����J���P]�e�K5�-��E�^Z����*()���?X��L}E��R'5N.�����2�l�    ��<�"PY��x�Z��|1C�픎5_N�!X�E�?I_�g�Z�p�0�j߇���.Tj��]�� h��}4���X>,ё��9:mv�P��O�G��/t6�i*�n�4I�t���J��Ǧ�L
�V�v�R�JB��y-���E4e�̻.����Uҧgrӊ&+k�������k	����Ώ���@R5�y�������+�e�b���"��V�/r�x������{��� �!&��׌q8����x�����'9�b�-��/�
�t 7R���;-lY�[5z�8zcGn�t=b�A���;8o׷����vx
��yrb�f|���u&���s��	Z]�p�<:�_9q9_���!`���Ӝ��t=UV��7���ϕ䝈9���Q���᲌�)�\��b��ٵ���7c1���|�XB���ү��|j�[ M�·+��k7$,am��UN`�>U1��#-[V�R�z��6}D���x���謖�h��Ji�j��{h���̜�3�2b*�����wiaH1r��XN��ƴ�����J��_�e�N`Et����zo�����.u�}��_w<c=��BcF�7
�-ߤ�^`?���N���iv@(V��,�"F�lga�#W*�l�c�;E2wJq[�`�/z$l/��Z�=���Z"��^�_c��դ6���u�n8�l^m�:���k%�*יh���k"B��������p9%_���xNPZQ������lrU�R
�)��!zs�<?^.�q�N�?��t�C�&4x���v<\��SIjѴu�|g���m^S<"eҵ��L�n^תh�=6E��a�CNE��Ԣp�<�N:/�4y��-|�d����)�nN2�I��#a���^^?O�d�֑�-��mb2�Ѷ�+#��ʵZ�¡R-��Yx��8�=6�1Dab���6�0�GLsջ2��Ҽ��N1�5rEW���w�cd����J0aﶊ^-�^�m(�mOgp�N��-Y��� B����Q�)�u[���r��G����ך�^���\��h�N��~nb��&��0[ﻠqU��~��4��BS�鮊��=^����9<_����z$�Dyi�⌫���f�٪�M�9�d���o�5�X�W�%*3���&���e6�W�.���]Ǽ�V����F�	����Ԓ1�Ԥ�a����n��	w*������/5���-���V�p/7ZSK��)�u�����&���/�0%Z�߸l�?Y,<�� ǒއuLj2�ժw-ȑ6H�2�ɐW� XD葐G�n��S�����c8Wj�Zf�Hf���b[��y����ia�-�୽��=��@�)ú��Y��1��@[+����r��g�OZ���g���=�:�m���I��r��ƞE�ژk�uR����j��n�|Wt<D葐��y�I�����p|�sv�d�S/�$�e�c���(~��x]*��S	�W,`T���O_�Ѻ��g����%��e���@B���ƚ~����98j��p��A?��m����=m�Q��Cq\�Q�^��6���1V�a�2,l�">�����!,�W�p��&����8A��%�oϰ���5�>��l�m6�H�;2�FG}e#�903��Ds����%�R �u(P,�s��X�ӈ(�]�qW�=}��U���3T淼w�絟�.j��I�#a^C��!��Z�s��+�h���r����j�!����mP�
m��mPhl���K��k��3.�4ZY���=�2X���3�Kb�tշX�;��o��1t�y<:��H=���������1��Gp"�o��Ӕ��}{%�N���EN�̔��Ǵ��"zOV,&��?>n�O%	��V�Q*o�ֹ�%&���}�SWdBx��;�:U�z����u3sR`���`���B4��!�]H6���\���땊-��}j�є�b��_��x:��8��xD�o��'�	�:��,��7������)��	�����7a� Cmņ�~�y��(���"����u�8�<����z�6ϴ��r���©���C�Ԧî��w����G¼���q����S�����L�ߝ{it0�N������w���q�@+�T�qYEXր�U�gZNh�	�k�����Rz�'ihNqg_ �aYC�����x�u}||=<o�ʔ���W�t�u��/7�g���ܚ��4�?�<��h���|�D(���r3���}��۷���2�OC؉DS�/�Ɲ�7@�l@�U�S��W(o��.2�D�!�:q3�7���Tn �pL��'T[�pxx�$/E��k�T�ʡ����,�.��[p3��a��}��t�M���#\���x8<��p�K-��.��faYCz�v
O<���96���Q��V�6�E�Έq���1�[��/�F�׺6ر�s:#�s��akb����_���u[�,�E���>c������ǀ�og�q�n��v[TG��v���� ��c�E�������U��8MW���TͲ���N}��o�:�뾳�k��P�R�ox�0�d��sѱLY3���{кy�76�~�sn^r]Ƙu�}C�܈p�O��[�m�����ǏE*���|�+������������0k�Wr.ǿ�_��X7�H[Ң}��2D��HF���l�JT�X�=4�E���������m,�Fv�	��"�K�a��ܬ��)h�6�����G�u�Ǥ��<�M�"HSy������Ϊ�qXf�,/;HG?�n��k�`�Gt@��8��8��hͼ��؉������쮘�w�Kj�Ɠ�ROy������="2����7�ԏ,�Y���DL�'�5�^����I������8�,��,z�4!�َ��n��$���w	�&��m=�N�6�A1�sOŜ��sb�+�o�����ɞ���sBf2�#2L���1v��E���1e��}d@m�xm�ʇ\�L��n�`����)xq����kBl�0�>�mO�W[���fNG�?F��8<�Χ �����)����Zh0�8/����8ES�P�q�"�$;jA��<,ܶ_y���3�W {:�m��8|��UIʛd��5��98V*���Y�p&ڪ���8�?���2����HK�1��1.��\
Ǹ3O%A�c�B��>n�U�i �]���c�p|�R��q�P!a�2��Qf��3�ᕆՎs �	1�f�Ű:ܲs��ј1��3��1�����]L��Ơ�`�z��mG��ɣy��b��������e�����'�	��&j����[G�)�yM���Q�2f�F��[tN�k��9����y��I��'��i�L.�c�:�>�&;к�Z'��Y&<��R��/9���7 5�O�������"�o�p	3�
��9�;-z&�{}	gu�]NC����~͔�d�D���EX�&-~>�n5II���{D+C�|��k�AՋ���5`�AR����׳0M	��=�O�n�_���def�Fl�Y�R�wis�<���s�
�R>X�3����O!؎(�	�=��ro�����d�=^Rg`>�uM�b'��wd��Ø+�j"��k��
��|�o}��]���:��xk`2�6��ԒS�����{$���X����xJ!ݷ�p>ޖ�8��SIC��	u�o�E<�_�|��5����I�B٦d�����m��[G�J=�8Go����}�ܮ*oN�.���LԚ���o�Nx4U������u�~c�wv��t�E;��C���^��y=�ݎ/��n"Bz�s�O��{؅��ӝ�U�����ېk M6����r���z�D(����_�U����:�O��=�a>�xV3�(d��$�v�$G���0ĆO�����f �@| �| >дXP�ھk=w����Co�b��Gr9ʇ<���PU��=���,A��E��ef7����� �N\�>�n���᜕ߘ|2������
�XO��Cy�Ds�|��ݔw�m[R�����2%%!f����"��%�� ����>!6p    �C�Ef��٣@� 3RxŠ���o�������W`�O@��,����'@�е���t���+ \��Yc[>����kN=[,�Y���ى�\c���q�~�*��t�ɵi:����4�q�<>~S�zz�K�"� ���ǣ���7l�ڤE0�>bj�e2�p��d7�۳���=@WZ��E��ܱ�ǣ���B��y34�X��c��o%�nك��a� �q?��ܯ)|?��ܻ�!�fu#`a�,s'� ��cD�""(9�p�C����3��&��v�><��Z�)��xJH����)	t\F9|�
W a�O ��2�J8�Jh�׸�D.W�=�B���؃YlXcl�c�E�����qVg��ՙ$<��!�:c�3K�ĲC8W8��,���NB)�Gx@�1?ӘL|��\n��������z��c2��L���cM��Df�=b��� �(~*���
��Υ��J��M沩����Ϗ�\���"�t��o<�sdW�ضf�-�����-�����p����	�:�l���%�3�"�ǚ[��� �%�<��{v��:G��x;=f����8��"a��e�Ƿ����0D��C��"�ï!�PUT�3}"�����` JeP cy�`�ʛ�-N��n��
%��RYj���̓\q{�~�z�z.��b4�����d�[K�r0/��كBb/a$*$Te:s��x}y?���������O��\
� &�ݎ��!�!M��@���e#B�HQd͔ªL ���qVu�^���&����[��ғ�]w*C0#:�2��YX�6-F�����0������2.�Ѧ�Σ�d��=/V]{�p2�U *$����m�ݺXб˭k��7:�§��5�x/���q�{:w���!U9�5OHXj�pH�yZy<�����S����߆�����!Т��񥢓_��dw�b�[O��{p���u)�p��֞)�އ�.����i�$����@|����*-�:��'Y�Z9���o7p�� (:m%&�A.�F3��M��4��<<����%������}�^OS�Q��x���Y�#!�cFt\�}�������G�z�z��֌�Mwx�UJYSo�P�ή�2�M��EE�wDaѧ��&��=�ПhV����6�����<�i�S�έ+�,����g5�HJ���ZyK�ghbfh�P��
��+5u�g*��_@�J�	e��K��/�1�!�@�����>΁�k wD;���]�����YW�u7��Y/cg���u~h1����7"�!���6�b�,¶ ����v�t�k�g�@g�&D>6�f������+w��>i���K�D����8�7���c�! �;֛UV���®X�\��!����Vn#��6_鰑\עHqf~(�L
}��F,��0+��~Ϭ��?�>5-�ɡ�@��6��~r�C-h6�P/���]vi��?,TH�
W�.�����7k!����8@9t>������}d���M�b<��l��<��m�����O,�E�'�u�rU�.]b^�5�N)���'qG �|��8��X��dҿ� �a^�8����'���w2VE�S��Yu��Dl�~�m�:~�w9Gؼ"�H؜������X:���R��F	�iZP8����S��p�s�B�9��ކ{�I}b�D�6�Y9C� �4>ֆh�[x�&`�N͵�Xr!L��t;��4"�������_X��0�jpP�<_�E���Dd��݊�-	/ ��Ǎ�|���u���/Ǖ~�?�ļ����TA�>Y�r=,u�z�ɥ�������A`������_��eä&�i�L��\] 8�]ks��댿�Z3l��{��������~s��ny��5�p\��~Ҁ�Lۇ�p�'�#��X�.���8�&�}im����9Q���<y;�����rJ���kW-�%�{7�*�Lx�\�����g�ԥ��ԅ�����3 ��/��x��^�6��M�GF~�ILE������լ��-��/����m�#�u,�u��v���1����"%�<B�ʔBZ��?�F�H؏�:�f��~RZ�4	�lN�e� ��΅�9��%��N/Կ7�M�P�N�yK�|`"Jth���fv�Tg�8���f�'KԱ!���c��:8'
�D�9Q8'�̉�9Q�s�ٜ�I�`&D��TB=�>3�v�dK'�-�W�&\��ԩ�����gvV��2�=hx-�Fel�rY�k޼�'�����S��Yz'�Br,į�P%psD�D��Z���6I��@�ژ�ZV2܃9q��ƕWD-������Ȣ"^�z��P�Hv	���3�������.�B�������2O�k>�S�WK���D�6��.w�k�|��A_�)��=�s����/K�ز��=�=�3 �>h�~ $�k�dg��A�� %�Y�8R ��2ҟ��$�*�ǔ��8=q��Qe���� Q�$��B#�C���鐎;	�{<µ�,kw�z�dɥ��˪VZ�`�X0Bd8Z��md��$؄�e848�2�-�ÿ�(��V1��~-��o�B Hg� b�%Hg\I7��T2�w�#� <a���Ϸ検�YE�S�Y��W�8�A���*a�d0���w����s"�.�e�b�pq!�e��W�:����� ��~�By�R�Ȼ��.�n4q��lpG�]�M��xk�=v��Z���{P{��:���{��x��҄��y;�w��}��nk@@��Iy�E����S��^r#�B���,W�0ʠH��Y����i�Z07$��+�!��ZKz���%e{N@
yz�M3˧t~{y���;� �/�@����n(zb4#��'�<�~�k�^3A��`��?��¸8���758�`9d���:��4(��D{q�+N^
��b0�|v�0@��Q�`n5~eѭ�[J�̍9��T5���� �d���A����yyx��g���|:͏����WA�B/*��s�t��w3�����Y��Ҹ��;GwN�uUGG�k��qU�6q�t�xP�3}��<�ȅ�e��Vb6�x&�|a����+#�2Q�"ή�	·����������G�oĿ�`\j�{,v��>�g��~���n�W�Vj�%�K�indzK����������_��� Y�|�G\������}e}Ha���]h�w��m}P��n����R��d.��g��bU�*��0N�e��CLy�XP�[ 0�D�%�5�R=������K.6E2��_(�K�ĉ��K*D>><�];�^O��A_C�u�DpI�2�2xIۘͧ�9=q�����M�c�!�K�� �(�����ð�����ҽ�!�:� Q��ĉ6��py���_�X{��G�1K�S���V�a�hQ��q�/����XT���M�5H��&S1��Ȇr�̧�J=�����cHAlc4.^$�hh:�~�X��dX��;��{r�9UuV�ecuX4)hn�`,��n�M��� @�[2&zCp����AXIPr{�5���+���`7hAvÛa�3��QDp`ܪL��@:W�`�f(Z�4��{���	��	��0>����㒲�8�xl�&xd�oe@5��&��B%�����9qv��!����i�'g\\]��1M���-��d�j��̗;@��?m�O��d8�/@g1��U�
�h��>A�c�����4��|#&wU�,�������<j��/]H I��8��x.
,`�Q6ڹ�{�4���ʦ ������m�D\��w�٠�s��)I���*�4PKK�*s�,����QP��"W�	��^�~��he��/"�	�q͵ )g�Y��UVꛦ\^���a3[Z᮴!�8-q������<�2� �Q�Bhr�h.��c�\��{��'&1��a̩�����������!�$�<νX~�[����U�)��= ���XF5���:a%��ؐ�|��"�+\�c=$|    Ps�@9s�~��5uҗ�:��:V��*�q����hZ���%6���y��C#۫$!�2�[�X�(�ą��+�]�Ŝ�8�3����D������v��+����T�M<���,����NB*�:qv��$wj	�~��5���i��z#j�~�����ɰՄ�ral��o'��=9akBg�m6d-ov���.�X�|�Eҋ���@-�k��	�a168=Uqu*�_\l�y��O]Pn ��ql�V1+=CN?�]���zO�U��pt��W]�P��O��Ai�e��"�@!ڼ����>�$�v�e*�M��8u������[��C��^�(qܽ.�e
����e�:9�a�,�d��&���&�I��\�Yl��}���z��� '�j��I�c�v[@sx��Y�sj��Ҏ��X�"�4Hj�YP�M���1U>ͬ���q�߃�xa�(NO�hk������O�o b��(�8�d>��۬H|rY�]�~@k�#4Z�����0锒6�])%M��)4����ḅ^c'�w��3�Q�k&IA�N(���
CB%����JD� J�鉳�{�_�k|�ϧ�̈́��ϧ����骆	�^���Ӱ�E�*%&h`ު�oJ|&%���vg,G�T,�Hƅ���#㒺ZUBnț�Ԑ)��V��)s����O�5��=�i��h=a�
�e��8�֗=(߸A���cK��I#���򆖌:�0���\8��\8,�{`�4Q��O���ǉ�bY���d~�CU�	��:�i�Z�_}�sS���}�@yZ�|_^x�(�8������H�v� �ҭ�o�8�������'">̷-t��\~�OW_�n}�$�Z�w-�8H��W�)b���8�ƻ��"�c�_(�]�sՇ��
ď��б�1��q׋��(�p����ſ�H���Χ��O	��,�͆qT��[��C�\�4�Q8�d��e�u?�|��������kFP��tv����s%M}��J!��L�H�JPm��x��n��q��)Kw�YF|>M[�w��i��t�Qi� 9h5.}��,�|蹴o5a�c^zo7иo��՞�+�#�w¾t9ĐЌ�`E7�Д���+�a*}�N��gNU�=��k�aY|A������ˮ�7��y#�iY�S���<�s%��7�8����g�1�|R���QkI�Ͱ��>�S�M�j;�(�ZF;�c���9Go���۔ʯ�ݍ9=q{ ��ʓY�_�n0���4�����2���=�w��Bw˖�o��70���ȱ�-����eP6�4����չ("�.1t���qP����/��t�y�3~ֲ��8�pp�b4��^;.�{�Ɨ�ĵb�͍z��o�i,D���DD)Ix�?�צ�)�8�c�K&Ozs�Ӭ�7��Ó�SgO�:KJ�zɜ�[r��R���W���{����v/'��W+:.����^��^�X�]eEͮ��(�$i��5��aU΀�����9CG-�߱��^����8�5撃���c�
tɘ�	�Y&`E�7��QS_tv*�,���F�6+��g���n������á7��%���we�7�����ǜQ�,�'):8:�}�}�k�u��w{���:��ԧ����f�.n��;�C߄z�ʷNİ�W�6�.�{�n���Sw����(���Q6�,���<�y{$et�h���K����-��b�ojYJ���Y!{�����T�c}��Ps�b��,8;������n����E��������`W����?�L��:���1�<��4;S����
�q��҂W��ڌ���ƚ�ߥ�)ո���@�OW_��L��7i?%9i���(W�4q�mՁb�TmŔF�ں$���C
��[�(�(�aX����v�f٩��j�,ۑ0���Yx�����ᷗ�bK]Y�\��i�q�79� :Y[71'U������dk�Q�)�i���v���ov����Z�;]?�0�?�u��l��ǡ#������ǽ2����t���ӵl-܆�~Qd�l-�n�D��n�0�����X�OW��,���I��F�����r����xSM؋�Ц'̍B����.NC�h+<E!�� Dx�kU�^E�<:*z�mX>p�����F%�-G�N�HZ�Ǻ%��v��l��M|k@_A��l,�����H"����ǲ�M8	��V�fQ,B��I��x��0� ��L4`����5�&�������m����R��QH �xX)�[�&E�p���N?��%3��[z�3��D:��F!b"��!^��C��u~��a(�c��m(��X{�~�V�$l����־��_�+P�4�i{}�Gx��br@2�W����A�Z�d��	r	VS@�`���[�Ap_8�����~'�i��L�+���b:��j�e���]p��-R����Bm���[��G��վ��2��+�����VI+���u�vu�7�n��6�N7A��:ܢ�����)�"�[ds�6E��rs7����ȇW΂9
�	�c�mϵ�qW+����j��5�vּN/ر!K���E�J�J"uf^��ވ�U���yҎ�}J�Tl���p~rS0M�`���O(9�x"06�J:�]�+sZ��^���i)a�"F�]\NԊأ�T��&�By��>b��)�����RS���4ĉv�ɸ���OЂN��,n#�e?V9?�mr�|�x��|s9gNC��Ɯw�cۛ ��a�S����N_�&ﲘX#���nW~ �GZ-
�V'�PXI��D���s�����J�+��s���-,������ER����+�l�Sr;��sU�1~I%�֥�s��g$Y��8����#�� �0�	z+�u�J�Ȯ_���4�b��|�_�.�j[���:�V���R�!��|�"�c/�p����d�P��&����XPfVO���ʜ�����������Cmơb����-$��kn�
����}���@��b��`NC���3��uy�%^סa��5���W/�͚x��5��%/�N����0wh�୺[��sz��l���b]��خE��u���\�8
,K��H�t�r�,iC�R.���Y��^��l�ZⷦȺ|�;E��k8^���^O??�/o�������5�n���{<�z5y6��l$��$���M�e� ���	`ݾ� I]5�9����l.���XM��pΏ_3����L{-�����Ň��Og(�OU�:'�S6��2#B�t���c�f����3��֕����觊�Ň�B��}�/<U��f~N!
� ��+>OT �XD����0C�T�,��NZ��gj�%��x�^�a�ъ� �Ss���\>_�������م?�#��'f�d�F�`�#>�	ى	�&��d�3�j�ǩS'�P��x(���0����+������[�K�J�������.�,Μ�:{��e�'NB��.�N�}���qq���Hݚ���̰���H7����ف���^/�7z�)�+v[Ŋ�o�Z�%���u*�P�&ΎG市�(�?���?�.(�Q/k����3��������-���U�#��x�_�Oh�����>���WF�g��:~�A��^����
�9�A�r�&#���;�d'���T��y�t�D��]�%<b0~��K�՜�n�ǛU��3 �ﾽ'.ӡ>&κ:�f�q~}����|���］$��(?:�H�+�-�3����.��ٻ�ku<��	qq:�,6�	4~~?}|$�ʯ�I��=��,�׫?�=h �/aþ�Do��|����dL��aY	kR#�}#.����Yl��@�����2 u�(I>����)f�M���u�,�Kl#�@ +v�����4�Y��P�;Y C� ���Y��b�%��,�_�om�����/u���w��߲�1��6��H��p�v3ƇKJ��p��u�_���/~�� ,����o/�Ob$[�ĹNb�8��������Y1΃�ym�R7�<b�3�G���.�ؼ'���^��_.����
�9=qW��D(6}�&�    n���%HfO��yl������5	���S���'�qgP�O�����0:��"��AB�����6+�%]eR��vq�r�1�!N��޷�dv!�5��0�ij��U�T*�;�=2����\�$t���l��~�O��1�x:.I.��ĉ6`7<�]�%E�q��y'2�����oŇ�	�ŐnF��?b5�����8ю߃^}$��go,*��tk4�D�Ԡ8S������-uS�w�(	�Q쀌1��^�!H���wP�{��<||�C�e�Y�A������,v����Y|(�<��vC|��^U-m:��sH�Z�}csj��Z�ڈ�u����0L&����{È5^|2�+8��A�95qv-�����］z�9���V�� b��خ�-K����`�@��A���l~9��g��q��J�wG�U�xX��3|>VmDĝ��i��Cx�rB�o/� O�U]��/�`p^f�-b�+�b��ur��I0{lZXW���� ePK���� �d�.�(�@��tK�*jܤ��a�K�[��8ц-a1N�{�P=]^y�'�>�c��J�ʀ�X��-'�@-����\�iG�;A����qE��@L�)~�%��R���P\
m1$��q��Ϣ!E��XrPЊ1 ���[ƔC�O�J�_}��g�����22�oiUaa��4���Z�J�5�s�r��m��7|B�|�l�� ?=�A5qN�����vn�-�ĔU^l[��SoR=������%t8�窯��Y*���U2�8xp��b�C�Ufh�����V�un��h�����\w��w�>����Ew�]7_��H�S�Fq�Pا���}u�\wJ?,�24�~F9�ꊗ��N�u(�������2����y�����w��	s)���B,8�x�kxGvw`q��_���ٰՄ�l�I�@C�EvfWg�C6V��%���8�?�L��q����������,��T2F3č[�g]/z�ܿr�NQ;���C�R�r�~��u�u����u	t��k>M>�9-qv��+
!����Z/�!�sڧ��Ϸ��+5b�:?},�8�~�#�#A_�SU� }9�}�l�Xd5��@�)S�� �a���́p)t�8f�2ڕ�i�s�Y���#������_ARC�xp�2g�c4�J��v�}~@JHف��k:~�4�a�0�;Ɣ"y��<T��[��������/T�O�]�+l���2 :Ըk�26�C��k��ySf2�\�����˜�8;�O/����4������h��A�a�Q%�2����'��
�F�]�ɓڃ���|e��2uz��q��2�� {����|錻
����(cs�K\�9���Z<sz����͢=AC;�\�����z$��F��s]4[M����z��P+�pM��8����*�j�ƨ'��Z���Ȧ�(�Q�UFA��hw.|����‫�U<Q������ռ[��&�iY��0���M�u���$�"��m/�q�&��F)v���c�\�k�W�<��S}�.yC���%�Y	��f��&h�����U�hEa ��M��)���u�l�4��ղ��+9�	�Dl��?g��>�b�s_�
�9 W��Q
�V�>l=\�y�~����񁻯 �wFm[��F��Ւ.�?Q�Yvf���XxS�&�����L�P�W� �����y�%�W88i^omKZ}��g��{������g���_���/�&�q07d���U�|�Nܲ1ܛEbcY͋x:x���;���Z1�{֌o�4@[��	�[K���̩���4�g�e-i[�Ж��n�����؉e*UyA久N�@_k�]Xľ5;-q��4���ٞ�K^�'mM�zFwK��S�c�-��HKw����1�#�bc9qG�E�� FP�'E�{�pM�sR�k�p�n@V��x���p��C�y�O1N��2�t����.��m�����!�b�l��3��g������s�(��2e��ҭKeM�n�u~^˒�Dy��$�G�D�q��6�ZF�[p�'�qU��@����}��sѠ.ؠ�@]��,v�������\����(�b �Os%*��׍��ǆ�*a�mV.�z���=�<e��M������}��� ���=�6;
�V��W*L4��̦���_�׺��I}ƀ��(���� b�7-r�=��'-���#YgNC��:e�}�)�����'�i�a�p9����������ƞfj) �B@xE�.f��i��E<�����}X��o�.	�C켷�9v�v4(��o�1V�"���vPI[�b��P�� B @�J�N��F���g �|k_��A�qݺ�c#��_!g�����^��sZ��k{��S�@�!U:�B�3��3����-�"�U�yox�7�Xn��|8��5.|X�P�������d���4�i*�a2�\��>^~��po$7��:�G��� ��6���s%%˗�Z=�uz�����ξ�>������sc�w� �F����H(�r
C&<���鈳�nL�G�4�� �G�mj��F���G2��sj���g�a��d�<'bLxP�cZ�~��ҭ=<�O�p�3g��Yd��M�H����
��V\f�)�V��dv�fE(
g �bݛ��+6+}�#�	��V�m��m��=m¾v	B�8�[<�Np�Y.��78U�~�s��u������7�	��hwL�v�y��Bl��-��&��XC�12z��]��i����g�O����{�ğ��<�O|cT}�p�0�5�O�ǷỾe;|:dqL�һ2�#�bcj��c�����r���:~��Fgm��o�C��y���
 ?��b#@"�:oO�9�uNw�v�������@&A�C5����!�*��w��m@�j�Y����$���bF�:�=fcu�,�$9m=h剸��^%��z�٘�Y�v�fa�_����i���!����,��?�\��W긦�W��s��u�d����>|�)Dԡ.��4�Y쐍��6|Iw���dݎC-_"�К��	\�#T�0�u����\��Y�1����!�� $ۓB�zM�x�4���AS<�I�ϴ~>�Ksz��.E��ñ��@�=�FD����$�8�g�"���ҹK�^Ej?����̀������/�!x�%>��=�2��Цj�,M���C����ir�V:�������M�X���;���������!�=�a�\XxO���}@�(�K�;B#�[��L��N�%5L~��Ӳ(�m���1�qt�q�5��v�ʞVn�N ���\�l累b��^��<�L�K07�x�}/�"���dg`�zm����gm��m"�[��Z�M,�ˠ��W t s[��>�^ij�u�� : :]y�|z��pP#9�<@��?.!���!@�?S"c�MB�w`�h��8-q{������o�b���r�"=���0S�M�x�*���'� /uC���R�&ξn8c�;������U,�L�}�?W&�U�6�^U�[I2l5a���5R~�,BW���j�l\A�:	�!����Ex�t,���L��2#~P�5�̩�S���9�p�=$D�q�mı�zI��r��R�J�bb ���2�����D� KJ"^{�����U��Q�KݍM�\$I_~�<d;hf��c6����t�Kz�vRRa��1S�("O��f:X#U��m�������Y1�����|�]S���Q7%s%67��1�t�L��d<q)N8Ȝ�8�����߲}Q��uH����b�+ǄRJ��q*��=��ݞ�|j���͞�D����1�hA����_�%�(7�FCl�vQ0�̃aCbad�8��{�&w���=�o�^�=�m������va֗�C�g[�o�!��}�\�a3�jQԩ���8�^�ԃR�����"$]�/�4��!�Lߠap!;�~d��e���8�I0��=�Z#��Z b��E�@-=�r�,X�$�3��tV�qbq:�,��    ���R)
#���wy�߄�ӤqOl��ظ5�'��Yl��^s���EΣ����U�9,9�%�>*m-�	$	�uD��8;��*�>H���� oPqn4F G�En��Ic����CH��3�R;]�F>�9=q� ״$5��&"����ܤ1�Ҟ�c�K��ݠ��}�8��4ĉ6P���A6h�\&ĭͶQ�º��4"W�<��iZ�h?��1P>�����"�7�46w�$��J�ys�[r���q!��$�Օ��:�Vb��	b#q](�X�/7������<�8��`*})+[LNR�#�bO�hG�Ҋ���4h�TbZq�g�rzD�Q�R��7J�u*N>� � �;}�O�#��x�e� 1��EB �+����P��xp�X�涇���m�,��5E �	�\�Z��s� Đ�������޹�U�����"�oxR��#�ZD��Ĺ�h�C� d��~?ܧ;IJ`��|9g����95qv�oħ&\An������r#�2ڦ·�/8�������V�k�t���
XL��?�y��p7����<����3����C�r��_l=�݁a��8�P
	 B����e�B+�U@��t��r�A("P�������YXr�����u~�W��z3	�"�M�M��,�$o�뭔9 �k�v'a"��÷�����_�-_�Bi�`NO���̶�ޒ��s/.rQ��%?
AR&c��,����<Pwt2�PႨN�5r�}8�Z,�� {M�ڸ���b	 앚؈�� |�~Y��^h�`z����8�.Kx+A��7ey͠�*�i{-i�()z(�ހ䶢r)�{i�����7(L|���cI�>DڃY�p���ov[#sj��6ǧ�����oP5���w����h�
��0 )��5�.�))p��l7����4���i��Hz���>�Mf�����h�^z�al��֘������U%������`�4�Y�P�Q��'~.<����ɽ*�e�0ĵ &	�O��iX��fde�bp+,��G �?�=Qj��G��C7.Ÿ��� �?'�K����Xȉ^Q2�V~��1�M[�r���X�Y�U��.H����P�#�*�q'B���&�0�
��YRN�f��Cʨ��}&��\���Yo�#$ʇ?��%�q�cNK���y�A�����"���V
�V���EWD�X6��#�M��z#�i;���'ڐ�N�]���tW��E�~�����fBR߅q���aY�.�/���o��=0Ž�	����S()W��F������YU㥑Y�$����t/�^��7-�� ����ۋ���T�9�w�o�p��$�7:���T2 �� �A a22�Ïs�`H�^e��5��<쒾�'h�����M"�-b�	_Eؙ��=J�Iq�,vȆ<���9� �$T�`�'���z��X薎��,�	UQuZ�,6����z呋�*bbp=�gӒ��m~��6S��co,�>��W��G�a^I���=W���A�&򝭮���cr�����*��K/}���d5|~�����Hߔ��C;<at�#�hg�7��w�#/Z��*?��}�a����-�:Zu�ӎA[D�o��2��ٕ���2p2,k�I�[�'�Uly����[7ū��nH�	jSEL�����vо�i�D��Sg'",O������A��Q �>+�"�,�6:M�S��?;q{ʆ<l��!g-��	}�AƱ�rC�246$� ��*[v&�������2ߟ^��X�٠��8-="�X��I�6��	�y���ʩ���8��L�,�b0	�k�窯_��A��/�����)�"�-]cI" �� �VjiFM�9���q>�`#��U��g�H}���THr�Y����$�"5�ud�ecP:*�p��l����T��Q����e��eK߲��s� ���,@ܒ�`����y��RR���bb	~�w��n�i�D�^�[����/kd]��@꣉��g�v����*�
�#���ihG)�wUn��_�D��E��nf�+z2�'ή�2��A�9r�&m����(p�b�bq���$�a��;Z���m)�W��K�B��'�������/���y��wl"��}�%���nb�[�q�E�#�d4�̲�m���,�����s>�]4>����p!���ۭr��j|e+��]�(��f�fEgA�����M嶔�m�4�������5{�2#��|��L�� +ZU��h��3U�s�1P�=Ă����x���� �3�/�58��Xn/s淟EOA��8;��|��Ӆ��zu�����mA��j @����I=��t��� �B[Ug ;q{�F��N��s�W/���w~�+��\viG�M�Ӹ����BȓS�61�#)�ď�-����a����,���k��E���x6Rx�]�)�E;V �� o���c����"7�'���8�O�{���J#d����N�36Ax�4���8;���y��!��؆E�m���.'�Q�&G���#��NO�����x:�����颾#�¾��B��A�Y81�L��dF��'���u����k�\T�a�o�C��1O`
~���1z��.�߬~zb�X2�Hg$Ι?At������ŕ���sJ���;��7��MdCA�o���ϩ��⟋��S�
��[���M��(*a��ՠ�-����v������/,zo�9�2_�=<�?~��s.���̐PN;AZ���o5�vW�"�.ς������w`����
󨾂
Ƣy�h��Q��r� %����i����HnV�<�p�x�S�:h1\��p���9��~��g��C�	�"!F��O�¼�tG���^^��u�Zx��0�'�NRd��@P�� �bW�5<j2���rh��^������鉳S�}�>����_�<@_�_{{��s�.~�My�z� ^9�!ҟEn��6���.��pT� ��6?��2\���2�!�.˻��U�+��hk�װCI��^W��R*�f��7�F����gͣNK�k^|Ɯ���.����d|�hs�AIX���d�#��g��+�@H�p�E��g��ۙ�fA ��x�W_���>����޼!��Jb�k�n�����:Mh��l�x�4�4�qo�c>��X�怇s7�^(�:=qvB���vl�RX� �o���یn�9�/��Ȑ�)qq���{{=�ݿ&���|�H]ϲd� dr,	R|��-Fq� ��ϴ��,�~?�0�s8)B�o�a�_\+$�y��}6�6�NELK�^��z�ؖ��%-���_�2f�q�x���8v)�'�}��E�^O%���B.��]_��t�9-qv+���f@(�Ɇ�Ū��S�a0Z2tC&8�Y�C�.V�p)NO�hk�\��p0Ί��7С�nH{a���N��e����(������v��,6Q흟��@Wf���[o���+��"���q��W�/p۪����m׻Ŝ�8�ޭn���V��I�u{Cx�tZ��K�Sb����@7\��� �p�y����rZ�lP�fJ?jۢS��'��Yq�l{SB`'�z��-5��J/a��B׏��h0�#��эҲQ
�z�Q�ùC��*yR2
ɰp�7py�Sx�����.�!./���Y+�X�q����j�U��ZM�(����'x��9q��I�[Oe����1Z�\|;��4�����¥�����,JPTо	�2�f�q���������	�(h6[����\���svqC��RI��U!��9��;Fh�3z�k��K�lp&�%gq�Bp&��gc��;}�<�&f�6]sp�<�8=q��T�ڲA��;�o�ڥ^�D���d8����?��K��K\�����d�ĉ6D߫�dAW��qmuK4�ɷc�"҅�fi�2�`��Bk$#]f"�� �%��� a|�W���ޖ-.�Tt�9n�v�_��o;��ᚶq�߲[a�d��L,&�:.Pj�ʐH�|U\ڼ�������������p�</"*��    {"E"_ςN�o��8��8mH��Q9�)��=Rz�rY�oP�
c+q���OW_�H|I.���8) S�y��i�F���K�YP�\������%+{@�Jg�J!9�S�������(=��4����iN�Q�˨녅��"���o0B#ˊ��� IH�}dNO�]��h�!X��8�-�Rw�Xy�"�7m�r��,U�-$q��J��8;��Bp��΀����u�`b���цF�d�]"[J*8���Dj�v��
[��Rq��C� o��փ�W���~[],��.�fW$���o��[\uZ��pe�7b�}�����,[ R�m!
R����y�<*��Z64�c����'h|�� �e�a��dNM�hCz������'uAHD{B#-��R	������Ri#tQ��ʡ��#Nf	���;��������Q]gs:��z��t���O?��H]��`Ͳ���!��� �eܻ��rj�@%�Fm�$�og������@%�*�@��V�~���������gVу$���.�b=��!H�l����U�r#v|Y���|�o�3��!a�A��8цN��Y�T%��Pf2.4��A�U�#�܆3�2N��<;�I�pg�@�]�u/w��_ж� M�o/�_A��Wz��sp��oG�^/YL�h���,��v�?�!����;LR�%�Uc7�x��F�P�����Ta�;�Td�Dʄ�8aߥ�"d���yO�h�H�4R�F�G}>^��;'HQ�5�rV*�(��	�R�T�*3�o��X�4kq�Dv��x�Xq�|�s���L�R�nY5#~��J�:���hv�{���~���ϖ��G�"D���x�"g�]��n������>�Cj�7Y��ͧ#�s_A"������]\"A�/�g��օ8Z�b�F�/�'��r9Y>���>.ܖ���e�8k��� ������	�����0��C/���شx�����%���Y>	S�������o�1�.��x��9��$*�.����U��.�'e��l�j�X?��kp���ĉ6���)XUC��G�?�Vc������hPT�TQ1��bf:0�k�f&kqj�,����1l�m�0裨z�AxTl/M����
�����0aL�P���X����!wjT��i��Z��p���������Pƚo_���H"2��̎��vR1x��F�����=�'ChJtC4(��6�!�O}�w���xߡW�'ŘSg�+
s��q����ek��G��!O�x�`��2�T�p"H�cMD��ɜ�8;%Ny"4��.P<�!K�K�mo'Jh���<��+�|�������c~�=�;�e�;}���~l���,��Fah� �r�մJ�|�.!ÐsS\oh���9�ҏlK32q:�,���[��+����6�[����3���!��uC�?mv�.e:
�QJ���.���!m �z��$��~@I���} ��1@�X`��w�O[5Ff��m�9)#��_�1��8|!���T��H������&7�I��-�t�2��H��)�Ң:`�j2���[>QA��jz<O(�rà�n�%s^��Ul�H�W�ow?�����/�,떙*C����!#ߜ�����a/<�@��8���n���?�"�H��Ņ��Ɖ	�E���c6�s��7�=#{�����ӗQfh��
�{Rm���'�Y�ձ�|�'�t5F�N���;K
*�,gտ���̑�b�e�����ۤ8uz������չڀ�A��WZp�Z�iC	;	�4�T���Y����<tvW�$%�6�s�LB�P�&O��K;����$R`��9��9q���gJY��׎8{�t��XO�Q�Y �xC.�'�+�vW[z�NC��tH��VO1�V�9�&Lc�x0�c��
+�1�I�$��B\��Rll�@8`���T2���]���ii>~yi>��6�M̈���L����ey�T�w6��� �H�a(O󯻿Op�?��W-�Fx�<d��T��y��F#ٚAn�dL<����� $���5��5�gٸY�"iG?��w84�FA]�?��0ebQɲ�ƟA%`�kZ!=Mu{�0�Xz툋
��m�#�`��*�څ*��N�-�Fh�5b���+�Hh����t�m�ZV��b����TiDHF �|�w�;<��|Z�D!I�6\����ᖫ�y��C� �?�^ߗ����yz=��X7�Q�\O�m�V�Y)�,lĐ?A.��M[�B�K26v=�<�+�zE%��T���Z͕U�l�^ _X+�R�1�ɜ�o���_O��p��,�ɵ?N�_�]ATg(���=F9Y�����}w������g\Yn[�H%Ro�-��jmn�}�c¡�_`���E���E��)�]U*�T&b��ƀ�؇��n��з��+P�d�_#�G��b���LL�EX*Ok���+昍���:�Uâ'B1����,$󦕘��y)%bh=�B�N���o{g�V��fNK���(�>�=������ZU�FP��v�İpcz �z"��A�cefe�S�h���O�/+3������C�����:PQ�$��ϐ��H���7e%Hu�� a��e�_����W��f!1��/�t���d�j*]�L{dNK�h+̬���c���\�˘a�!��O��� c<�ik�f@��.�sHb��� �O��ž6��^k�lL�ᙯ��~#��ښ�!)�Tx+����'N��l1v�VY�$�-��[3|�n/wF:ջ\���\�J5��@�A���Y��Cʹ���%/=�y�uj[�	�@-�]:c�������C]
��mH}.�+[|�Q��I�����0��,�dc�f� �s��\��39]��:��e��q��=
�?�j#$/�)j�hGiʳ�x�{����������I�n��7�ƖBA�Z�(���v@��'5�����8� �T"���^Y����C������CH5�5d�Mx� ;b]q�,6�=~s3O��
�c�B�ž�B�vB��D��ʣ�?5,d}ϓT��R	��3���qnHJ��>64l�ڂR�X������P���@W��;�=�t����--.1���Tee�-}E��4=	���?X����X�9o�(�ݝv�������9iPw�w�[l�4�8����$�*�G<�ʕ�bч$��R��?��5�9=q�G�b|�?��?�/Kh_E�$� �����-3�wjY�}��4\n��J���P�uw�� �3�I	�$�����c�����)�DF~��A{a�hkr�Gc@*Dap�.Ļ�r�5k�V��ƑH##Hu���1��bg]���S7���9�KaSc��;���7T��iYa\㱑K�3̢AA}A��]�᭯ \JU�0:t���#�8d�!�B���f���%|�Ӑ)o�x�7@��?��r\��3��c~]T��^O��"u:��h�`�<��w?�52.������L�Vn~�������kY�S�|����&>�V���T�1g N�5��7���hL��E��Cw"ې��OJ�S2qMz0��5�./DI�;���?�S3�Uʬ�����˟?�9��|�5A�a���-����r�C�|El�(4���H��@�o'�i����ޒ���HD�8ŏ����!V��d�	�8�����S���zOtP�PG�Q��EWjv�,���u�6��.�5:	��R��6�b6������_q{���p���p�,%I����鉳��8H��-�30��@;��O���;]��o��g(��[����~�	���7��8qv�H�C7l�]�'��@r����Ծ��І����?u�,6��Y;���䱫���S0��o����V믽�uR�kr]�Cwl�=�Sڻ�J?;�2���$�p��sr��0K�9|��鉳ÁH��]ک1�� 7�kUsB{�E��,�u[����+<Kh�5���)�q��=��������`y��_3��    ������16f	�6��7�[L�=k�h���|����|��êE�����-�U4���g��l����:���ğ�����b4UF-�h��پi<���9�z�2��	YG��k����/w�_�p�#���|������h�� �&�j�W��Gǅ]ʍK3l��Lgv�=���c�9��1� �_��[ kdoA�6j���y�|�[��? {I��`%��`�u�s\��%��M�Qց����x�u�
ǯ�8;U~�$��Ҵvg-4-����ka=|mU��p����(i�#$��vހX�e�dy{�X �oO�?^^�$��B�;8��g��l�f��9�4R�����k��D�뭛8�q��WN[T�.�8'����m������9q��P�{s#��FIR
c ��NRk��T��c�g�~|2��m�T���
"��?�[�C�'�ҧ��6��꟱��m����.Μ�8���{,Q�ZΏBo��v���2�1L���D��:���Q X#�E6������}����R}�8�����|�cޓJ��ς��}��k?b��ĉ6�8y�kZal{��.N���y�k���-������=����Ѭn�t�٭�MQ%h-��^�~+g<��RмKau�m
�:�$N���ԃQ�����8�&x�/Ɠ�\������ܖ>��+��g�^��h�H:�p9f���Zz-�2�c1�]y鮂�U��q���&���.1�5�teȕ3 �Q4�Ւ�S�Ws/\�7�b�������-�EV3!�y��S�$#jJ�U5�t��U��}~�9�}J�-���~�̙e��J]��ų��L8�u�Ro�I�l�,�B����ӡ�Pqj�ԕ�,����ڧ�Ҋ��7��Սl˼���1QXl�}�� bt 0��ĉ6,�Š��B���A��oYeB�R"�V�9�h/�F�6���2Pt���O���x�0��}��ʵ�>��O%ó�IqXVbŐK�0�:q[e#����[e����Gϩ^daI1�`s�l�$h�_�H�`�9�A��9�2�׍�3gW7���T	Z��3��J�a�0�X灧YK�d�߱y��7��&��y<��o'�ڵXB]밤@�ե��6�<��1A��WRv(u��5K�>�h�Ԥ�RIr��xK���2)����ϒxP��)�K?6ĵ�@F8P�?�?m����\�umة�v�_?���*��A�I��BrM��a�u�RJۏ1\Y��8��g�¸�wM{�������ĉ�;�a-�b����V�~���r�[��$�S6X��cg�@����p��"	ǘ�K��6�_c��DP/=�o|�v}b��ň%�m�%l��T����x+6FV�6L�Շ�F�/��������eN��,��m��L��=d5ڑ�m��+��׶�@�1|���9}������̩l��%.����"�6Ϻ��kJ=I4n%T-�m����/�0�9=q{������t��k0�/I�p�|�e�6�pM�u<����8��j���]_��_B_su���C,��v�ՄJ�	�d`b@o8q�*�I�r����j(���z?���^��%VF����Ēj<��f���a��!�5A$��6k�
s�D[��������%�����HF�=����ൃ�ulso:ч�ț����Q�������>������|�jDKRg>]R��{����,l��(iq��,x�����:W6}&�O���Y�ll+h�^N!ny�46�z�+��Z(UXf���/+�zRa*�@��V�X�k�x�A�h��77�^F�<Z �1Ro3��w_^�g���P�鈳�U�/\�.4�������J��CK���W�Va5!�Ӷt�ժ�Y�ki��i$�Մ���گN�!m�$�1�^��������,�?�����҄G_� �`b��mm�\��@M�cY�.����`�̞vh�v'h)8c?�H���h��i�V��w�c�[Sa1@T���bX�Ş����w^N��@:k���FOA	z
q����kʰUF�u��Z�쪨H�?Q��y:�1�1�*������<~�iO�TM��7N~�i��R�'N�!���^~-�h���A"a�m�4��N��������НB���#5�3פ��Je�p4��V@�/�"겐�ꤰ���&]%G�J���з��m��pV�b��ѣ$�4������4#����Q�3�US��\�������w<-��D����HF
&����w�'�p�}��d��S��:2��d\_�
ILė���u��W_1Q�E��c�a�ր��Q�־�3�丄�m9�~�ҏK�p}O��ID��d@x�:SZ��
�<i�ng�M}+���Ey���o���4���+�.$����d������65��G�N6��~%��,^�N��Z�+NG�Şx���9����#��}?�0��I�b���b8k���l��<X�`�|���/c9c!]�m ���@P��s��{s��^p�K�&���+g��߬_ó��鈳+U�����:�/wO/h���JP7������r��՞��U[�k�O"��*�Ɓ8;}\�u쭌����7��	`6�/���@�}�@GoK _�j`+8�2@i����{�l��^:ͽt��d�� ��V��%�G�ޛ����޲����h�>������9�]����i���w�h�'/��܂�jQ�5A�!w:7D��ӹp����	Z�$���M�:K�Ș���4������_��UI�8�krt�ܾD�R��.w<VӲ7ws7�e)�^�A�nW�Dg~��3ա�w۵;1g ήݩ-�k$F;��ZWI���Lΐ��y�]5K���ųԧ���9q�����t�����0L��f�#�(599�I2i܎)�Nٰ���/��	���7��a4c�R�~�e��M�|��97E����_U�f)d{�9}� �B�P�愞�Pm��ʠ%�(����i'#�-F-VV�f�Fd���~K.ձ���T��Xb���o/ ��	�L����3T%�q�,�dB���
��*0�����8%y�b�|�,*��P�2�&N][��T�;Jѝs�W���HA�aa��X�=�E-i��ʰ^���+��s�zy��c*g�@�S��H���!��v��	��[w���,��㺶�{����S�|��0����*<�0F��6��a�/�MU���'�pS]�cm��X�h��C�MxwH�H��m�p��uH���F7�*	R�+NM��&1��#��=�ip_����nx]�b%�f��b�r�p���bB״wzE�S�=��y����q}�N��Lbjj֭4\���]m�����N2suG�m�����$�0zh��-}��U���2e�܊�n1:Z2�@�z��}�L$��:��ª��~����a2�_r®��B�:w�^W`Mu�tJ��f�'~����D��@��J�5aκ��׵� x����7�������!7���	ʒ�M)�BO]�qB=f�<<@ypA�T`d�
���2���1�%�bcԉ*1�='������r��T�wi#�lF/R!O�5��^��	ŚD�P���.�Ŝ�8���I�l��4_ ��)� U+3�Dz�p�l�̴H�_N֥>_}T�9�~9���8�E�S�{���ݐΛ�S�ՎQ�y)��3go�U[�W-hX����v���HM�e��(�ɘxC�Q�f�UXޅ��8=q���b�q+I�B/ ��h��!�ԧV�h"[D�`�@�]���7Ќ�=|���Px�3�ga��U,���l�"9%E�۩!֑��͗ů�����-ߦ��j[Dsz�,����y�^ 	W�%y]�d��ǼE����I2H
��D��u���@~R���U����'��� n���zX��:�4LPa�%׉�d���S�
���}<�1��Oʗ$�nҠ�����빂��R�7_�Ȇw�%�)iI����f�`NO������\Y�"��	C�!-��Tq������K�    
���,6v}^ՠ+H^ Gb��LS�B���G]�|��AX1<f�������@�#i�"⪈�+�>.���{{=�ݿ�eI��GN���S�o�?'|=N�xb�y?��Y���m�Ͻ-��b�,_,���«Ӈ�{����eE��uٰ�/�A^79D?�0��C�xGL�.��|�_����� ��tv��RM��D��]|R1���	H��J�&�&k~}gNK���A�-X)�`�,?^O�B[�Cnr*����)C�6Z�|bV��8���*CPb�j:�Ģ ��8Y�wד����=o���Ybbi�]+#s��S�p�a	�oi��/�}��>�H�Z���Ǖ���.;�IP��8������Y ���	)��8�.3j࿕�ִ���J�����Al�E���u^y���_4��N�P$e��Y������Q�r�.�	��8�x+�A �3� 77��eAa/kqv�?p�b�x�V[���u͆�b
�
ERUo���C�ju�&ɢ�̰�VI{y��oo��ɓ�����
�V�b�r�l���E���5/���[���#a��N'�g�>���j��P�\�j��(���R�[9�:�FH2��k�8�	8mA/tq��zJ[u���8Ʒ�9�і[�r��_f!c�"v��-�t��]]��V��V����\�Y�L�%ԏݐDRq��d������9!�����v�A9뺚�������{�Y�%���ǯv��!NK������ O��>�������ت!ecRv����~��qy���߈�9/�T�3G��X�;c����2U��t	A��{.ɐ�����2s�,6r2/��q����g��тF�	%Պ��	��6)�tr�J��+�Xr�*qj��5%�e�E�,]���翐�e���������7l�{�/���`�52`��p϶E��8;��c�>ZP�N�1�㥾�wN�(�a�
��:E��NO�]�f������Η3�1*6Z)��6��Jȿ�doU�+��| 1��Mt�aN˸��LG��ٗ,4��M�I�n%g],f]
cʀ ¢��5���ϬP�Z���x^ݫX��W!.�p��,�^�az���GDdmX0��!�Y�����iɐ[�,��\�o9�(�J�!af�Mu͑%�
y�5f��4M�k��eEc�*�����4>>�sS�ս|��-;�eλ:�4�Ŗ�e�Um1���fNG�]w�ńb� %�,��#�g��W�dm�]��ۛx	�5ٯI�O��J��h�<><|,@��cQT��N�KX\����bE���$Բ�)��g�ь5��Vf�W�}��w+����±5ec�,@S}���n[B��9'1�Q6�Q�dJh?-��a~�,��a�x�q�D�85q��٠��l�}��\Ѽ_e7���9k@ڣg��Y,�+����3�� �[�JC��c�݌�'2��EO�Q�
�Y���j��:긁Q�l��P��ۦx�L�(�嫑�=���sz�,����ciI9�`�byx�X6|AN6���7Y�k��
|s�MB v x�5_2�%ή���ӳ�MԶ���4�Ѿ�5Rp�:����J����#��&��7�'��Fm\1�x�eAY"F�i��d	<A͜�8��UZ���g��z�U+�ƞ
�:�Ms�T�j��|v��\�{��0x� �xܮ�|v���1]6�Jq�'��qU��VٸU�ыq�)��������f"m51]�����[�O�n�C�md`��b�l������C����@�@�E���+$�$�d9�� \����6WJ�0g �K�}t��(�1X��������Kv�'��m�;��-���@Z�N`���%͋2䫃�
/�I"�x�j<�Ü�8���x��l�-����2ˆ���l������R=�jn�r�_�d��9<L��=�MC_6��E殺�`TkVP�����G�#�&�L��8��20 ����ө)#h)�3.N�n�*Fm+���p���*hW��� �<�9X���|����K�Tj��3'�p�~�����z�9-�_�����+Z�Go�A5 �=d~8��A��x��!��3�+�ļ�y��9qviʕ��-���9�Q��LYQ�C�#�TƫsDs:��o����C���l]�$_�L��}ag�6���F泓h8�PN�l�j���1"R��'_'ܛ�L�%vs�_@�E/�q~�bhn��m7J��<�X���H�H���վ[-1{�Eٖg�L�۲� ����bE
�k�n0�ִ�9�z�k�;l������=�	=��������?�]�%��h���*��Mb���ȵ��᭰�""<]�Q�(��W��:˝Ƿ��pI�	q��ဗ(�}�)�[V�'P;�CH���+�ҝ����_�~�Ҿ�p�}4��i����]���8��5�U��-����:q
ҭk�̔{E��0����S?�tKVh*$��ŭ4�9�Ui�U9R�rX�J�|9�,G�i>7�\_�գ�a�$��	�]e�������;`��by��S7�r�*�r���fEf���}�G���<��%01��M��ukE�
15��*��Y�ճ��KF����<k˱���e��� ep�^I!^�F��ѴY��HPr:�.iHP�e.t/sq�� 9l����nA%��Ƕ������4���:=qV���`}�;��b�V�#����E� &qٰ��0௙��%�b��HrNs9?�8��]��}��_z4գ�5Io��� �5�*�T~lRao�a����o[�GZv��qQ�l�G^���̏���y �/[R���ϡ��um��m���#-�Z�0�r��Nn�C,�{.9V�QIJ�;�+L���
	����+kPwI�b������n�x�`0e�^�G?����D.����($��'��Sy��Ok��#��8��'��|�u,)���t�B07z�d����c,2�/AL���8?J`(E�g������Vz��ٵҧ晷��5���:��Ywz�`�СIt_Ǖ\r�:�i��mC��M��~~?�A��{&����鉳Kx�gY6�>��ޫĀ}|�lWZ�,�߲M���x��3g�,���0��f���jA�bvA�[ w�ޖd��&����y�����8;Շ�dtϧ�ʪ���oo�R��� �8����q����d/٬(]��À9qv���g�Ї�����%��$k�{K��(�?��F`�^��q@��8u=l�,���r �-[�^�.�n|�h!p.���lV`dLپ�!4*�:�i8�jõ�{��I�nϘT�m8��z�O��2�1͙=J��B\�4?�><҆�7]JT��T��3�X���� �C���ߵ���C`�AI��Ѹ�=��:K�(c����� +0�åźB։`0�#�N#�?���&7��iN�!g���0��v�Ey}"�]oL!7��۠�YӚ����8���=�M�@�2� �N�EH�O������lC:�p��<t�l���%�7���)��㠀c����rT�.�9�V��Fì�
�&�+��4bh�p&�q��bX�Xp�5��R�f���u��>�p�䩚쬎�2H+M����k\'Z�P���0�R��L�a�tR(�%�n#���2�'N�5�S�������Z�����+��x,()j���կ���� ݎ�u�ln=i���/���Y��$�XV��շ#� B���B�U�5z[���7����y�*���s~ޝ���H�J��{)��6��9��bA���Z�d�����X��g�ۛ�O���{5�sPjЭ��^9/��`�a?��f��r���WlG�K��{�Ό������C�;+e;IF�����蝭�I/\�?i�0}5lC�?)(WJ�ũ�S��ˑ�b��B9=�+��H��)ю��>�ܑ^MX�j��o�KU8���Yl��f�.+ib�&�5n�k��RW�s�]��=�6+��$��pB���~߭�Y~���nA�~{��w�#>].�&��N*    ��()�dj&qX��?�i<�N�i+o��Ԭ�wr�t�슚�Z(�Ō�Ɂ��v�bw���q��)�0�2M�n��,qq��j����iq�m��vi����D/Fm����A
�֎��~�NF�W4G.�Ϝ9=qv��U��8~O����Ԉ��W
��s�m.�_X��gwa�{<�)K��|��x��Zi!�ql6	4�햞�C6���^-��G��NT�8"�l)�Y�
W})<�h�����S&��8{���&�ۖ���f.��@�g�\�ˮ��U�$W�g����Z�ֽ���O�BƖ�.I��=����h���C�k�ݶ�x�?WD��֕��+I�8�R����n�1Ά]��8z��FS��д���&w˜�8��a�i(�[�8�ɮ��_����K��y��;N�}����[���!���H��N���	���挛���Z�¢'M-�P�mX�����Z�yq1�T� m����MRȷ#�����B�\��}�	�5�>b�g���8��.���N�q���u��]W���1�'�bئ��͢;A�b���?w-��R�l���UT��pF�eX�4�Yv�p���w���v�t��y*����i��#�ԁz��Fv�|ħ�{s�a�@�����ץs���L�r��"S$Q��D�uw
�P��m�W����ߺ����ي��l�ep(%�/��~��v[W}��͖l��*��.nW�I���hT�.u���N����s�p��>_}]��X2�Vf@b'f`:0��`e�������i;A:G.��ןY�Ic幡��� X�L��g;M#4�)�;�Q�?��W������1�#مU���M���ňn�����bN��܀�
[n��+�|w�=�e�F���I�Bu���H�>��כ8@��6r%1K�C31��PA�koy����{Ϊ���G��d@�[�̜�8{�F��<ο~%���E��s�:�L s��;b�}	'�\����ׇ���Cܩ~�}��я*�MJ��B�u	�U�F-hP8�RO��w����y����
)��'�:E���g�A�Ct-Bow��QNZ�͆���|���cB����h�-SȻ�tA�V)"T��$�3Y�����-����������-��q�?�U�������6�i���4=͸��P�59��h���j}CP��Y^�&y����Kw^(ݭ=�w����P��=�+�TW���hcYM&a����⪰jcIq�b�&����
.o�(�Tg%�	|��}Cf|Ż1�i`T������ �N�/��ܔ9q[ec!�c�9Iw"� d ���fઢ<ܐOk��p���!��F���Շ&���������2�w��hs@Wβ���x{����m°��\�;:�n��-ӯ��[�:=q��2M���	Zc���w�����7�<��<0	$���u��!�`�u�D[#b�x��h
_i��`M���:'��^��MY��P�s�q��'NO�h�-V�΁as �n�Vu��J���8F[�.0���\b3����@O�����%�h�n�X�`��o�!7No�8���k�������4w�H�9q
�Ѐ���WV���}���0���>�s�pq�\�5�W?~��v�O�LC/H��8�ʄ�L6�>�np�5���
Ģ#W��E_���;F��⏼��'���5h�KT\b�l1���(EcK�P�
��j<T���m��t��5�2?`6/��>��<�H#(YLΎ�B��HU�[4��W.'��7I56zj��dNO�]�sMz��� k1:�=Љ�)��[���Fa�~7��2������SVkz(��g�]��ry�KB���t^��Sk'�GH���S�S�WL,
H�󕆙�6��{[�^p�����[_�ˎ��i�p�]�X\��9����s��������WڋS�����孎1��ם��s6��eha�]��9=q{��:=�a#�I�A,qh��v�B)��*�^<xs,P���� �f{T�Nq���+�ڃ��Օ�;�ams����6g�]�Z��*o�������#�s:LeEH���<����YDxF<�&6N��ČqE�����\>�F�@Q3p�Ւ:Q�'Ξ�iC�oa}x6I�6<�y��:�AcL!��-�Qg �2�����>�6X�c$��|�n���&�N��8\�m}���~~p���������#�����[�o	�t.�!i��|�I��[;}3 �A}����V5,mGH�V!�-�*uz��*F���8�	��QHsie����J���[��z\%JIgE	�Ao9캮uZ�҉J�I�)�4i;��U'�poZ�58v}��&.�!Y�����7F��l�������5<�+>�|��|��V "�x��$>����ϻ����yy���_	�c�3k*LpR�N�:�n�<L�*��K�O��e�@��T8=��#P*?�6���\�2zL�����H�,3�Z�T%��7)��r�qƜ�8��Bѥ��ĢqϽ?�L��3�	c3��/��'㋷\�ϒB���wi�E%���f/Y�Q�BЍ<�ͭF(	��ܼV��j�̏@�KJn�=�<�ʜ�8���?�NsR��{z��L���aNDh��p�� ���U�B���u�	�^⢃s�x!$��sm��|b��7ak��p�2'�i��Kt�s��:��8%8�)G��s�L�9Wa��I����i�R��$4x�Ĺު�6	�M�@1�&`�tW	F ��{œA��
I0Vx�G��s�,��F'=Ϫ���x��.�3�ړ�73�00�� w�u:�����"���B���6V��4�[�U0]U��reQȶ�V�ƿv�H��B��P��	Zc��Q�5=H�4`�Ɖ�j�#x%�}�ͨbX�&(>��>�I���k��ʐo�O)7K�zA��.|@���:CL�f.�&U_��q���=i�J���*me�9?9�tY��z)}����D@Kfc9��H]�F�)�t���]7{i��O�����[�^|�\+��7r�[	R�H��Y��)˘�&�|�6�9/z�Hً;��
~j����i\�Z%f���-��b�@�/������^~Ɛ.9��_���'�-~�OͶ�c�0(�N�W�-�x���K�M�֛T)u��R��z���{~�o1v>��_� ���دH<���Jɖ�M;�6����-��cNO���q��٫;��1���]�z�8���<�_�g�O�R�q�.'[�{�����cII ��v�go��pw�H� ~|�҇�L���1� KdqE��Y�e�z��+B��D>�L�	]�a��y7J�ٵ����F7�J�p�j]Ij]Ij}?8 tw0�u!44o���� /3��gS�ˀ�c����[N����9]x�:=e�1���"��@�0��c {Y�K�01m�ҧt�-�B�z:�lSgp��UN*D�*��e���~h�.3���Fzv���,n �s��8�����
јS�1WqF��������]���1}��4'nĵ}�a�nS���D[��k�%Lƙ�qo.|��H;߈;��ί�O��J���6���p�
�6�}Q�և��MW��ϛ�~�dr�~�tΑ�O�E_���)'�N���x9������\�.��.;�	AG\_�MG�'HB^����N7�s�xѼm{7��KN��A��6�[f��=_���"���U��}w��Q++�#w�>^A2w��(Ѣ�w��>ܖ|�W��Mh�0D�rx���[�~c���BiE�P���m痙�Mh���9�����]��R�-jJ����ԙ}��M����b�mJ�*s����K�"�z:x3����:$� wm}��sE�췘ޓZ6�e���5�[z���\@��H��͙;l�;�߲ʃ�YK��P�15NͿ4�I?��;^~ܦ�ãB��,<c8O$��p�z�U�#��#��GI�m��%Cf��C�����u�p�knߨ�
*�0aSP�Ui���`�y�Ƒ�˓1�oϊ����    jt	 b��ڇ^w��@�e�v�Yf�	��r!4������:�@��;�_�i7�|U9˄�a����#z)�	|Z��{�Ď:S�ڪ�t�x���+��You�F"l����9�Cp���k=�g��:�i;^C��O��L?Y-.3��.�b���VN������eo��Tnöp����	#�X��'�	׶axt����#Io{�#�&�Gׅ'��ވ���9���0㏵3�p�3����x�d�*��@&���,<�ʛ�r7'=N7O?C%�܋�%����$adv�'5nH���4~�u�X�jd�G����f��Oe�RY,��r}���^�B��o�����j�F�tL�<|�I��$l��-���e;��J�1a$�F�-M�O��N67�}�mf�Цap�K�Ug%#n��Nx��%�o�!|�a���	*�E֤MT	�Y��~j@��acD��]^CRSf�$�������G�+�$��"k���6��C,�}�H ��7�q����d�������	�st���lgn��#���jh�Z+�(����,�+�{�!��[éL�5��Fr�H��
6a��B��8��Ծ�p��_7�Ś��*�ÿ�����CY(2f"�Q l)`�zt�w;�GF\+#"�U�'M�tǛ�
Зl
'�]f[y�h��tA�!�����B�;���{yY�'3#���{UEk`����ﰳS>K�6`�|W���Gz����Ijz2,]��0%ƶ/�m���N�FJ2ݮ�!W��\�{A� ?�����H>��i�R;+4F�Bcd����[���0a��i�#�٤.arqeW�Bu�1�V��Iiߟ����ӧ�X�I�m[,<�4�×A�}���y��]K�+�K��K�ˎi>�(l�-�P���qTIG,N�`U�Ws�ä�Y`�s�?��JN����-�-��x��Bzn��4^�m�O~�6�g{z�bK�N��B�*��bl�(��A^�J����R���4�5�����Xb[��������u���-z���3?�����k7/��\L����t?�1��A�2�G��G���WrƖ@Hw!]�"�"il�!����ns[ǧ�3��ʧ��Zr1�"`��"�ܱ�ϲBF-$��i��Q�\E"����(tL�&�E���"�<@Kk?�N����>g�ʙ�w��)����}?��{J{��>.�=C��r����3��/���_��}B��C�m�Eʵ�>�1u�'�������;�=��0a�i�;X��~���f/�h��3��3W	�[5��KTF"l�H�~	Ǿ��es�j��ŭ�����U9�&�Љʱ�QPQ�_s�����=�~1�(�"�OWai��6�0�BaH���s���2i�0ac��^�&!�% E;ɪ��m��goC���j�5�@qˋHmf@�(�\N����	w 1a$B�u � U�mw�szH��u����D4�qa�t_$�s����C�d�饸Pa|�m� ��T�s��x�`(C̃��$Q
�%z"������w�@�r�Y1Z�I�仕ÍW�,��{�d�ޯ03;���gw�4�S|��~&c�m�(�C����� �<E���<�s�q�6:ȄU���������9�}󘃜�.Z*�cz�G��+�l`C��U��e�C�'v�9���3ỉ�|̟!���`�W����x�)�Qr`qY��7������ﯻ�����\��SF����>a�Y���5I�rzO������	l]�	#6p;�>���`C�Z��͂|�+�����z��-�xC�o�yT:w���	���2�c�b-#�N���<bϷ��=�2=�`>PY,2!U����e�>?*r�v�$�d�ЉaT*�X����`+����`���Ƥ�}g;L����^U���1��ב���������X���l�[�!���P����@���w�W/��&�(V���ؓY�J
�JqW�
Vҭ��[_I��������t�.�T �v[2�݄߼��0��؁�|�9Λ\�(��mF���ҫ|��\.�6��Q+gG�	��i�;�ݷ�a�����Mr�9��/!H�]iA�����/s1�{Y_��N~�l$Nh����oYtWfЄ5���� � �7`ß�i8Bz"�q�J��X�VU9���QniM�FmAk�^���Ы�&$���+�:B����!Xn�����!����K�R���z;]�L_�*�O�nu��+y|IS�\����e��֔=�7���>O��'�˹�Ƅ�[#��2���4��G�Rh�
��f�N_i�ֶ�ab�]bb���D*�D�$w_ˬ���
�~:�Cռ� 8M��3��h����_t��=̬��w\��}��4���r��U	3�9�c�@o��Q��������v�D��U._Ε�u5�������w���jxvd��[���n�!���e:�J�9�m4n��=��G�v�r�k^��6f���8���넿��O����������ܣ��ҝ�A�^٨�0!���!��?=�W?��̧3{��nkQ�}2עء~�i���vj�
U���a'���.�����e�7��d����9�"��9�Ä�̢�����a��6�N��0j��ڷ]T#�N�7(7���G�f_H����S���z��jl\�
&ʖR��}�nOr��jYȿ��|2a ¦�g2d8={�`���O�C�6���>q�IW�K��b/	���5w?��&��}��p�8y��0��r�A��{�J��ʍex��B�*b�h��v�Z�"ı^ɸ�n����Y��xy�X�]z�-o2ˎ�nV3dBL�n���P���5?���*�OUds���TȓA8L�E�&B�#e��k�fa3�X�;�c�4]����+>ͱ�B/�����r   9�`�:igT ���=��i���[�:⤗A`@��_����	D�&B]��x7�L����+�c�e�?�Ll�x=�����
��w��ͩȎ]��a���m.�����2�_�o��Ż� ���d�j�%��"K�
�uS�%�v7���&�n�E;D�3�v��e��N s��F :��	D5���>>����tPc�����,� �q(������!�<�3���ٱ3�N>��`�3�}j�KCi7��`R�Y�z+0@��B��%W��Sh�)�p
�A��!o߂V�{o^C����$��PC��`�U����*��]Q����?�����Pe�j(�����(���ёet��W\�Z�mƴ{;��2�8w]V���U�{���*:X�+l -:Ü42�Yq4n�貤���@���� `O �S��"Ѝ	�Y��:�<���/� G����`��!Fh�:��g5�a�~�lUnc���`���>|T���=�el��([<+��j1�^�BK�0FGLǊ���C�%��|kF+��k`�+P=@5���@5��n��3�-4qL*){��a;�.��Z��a�j|m�
F"l�"����k̠����#��[N���:-���RD�yZ"�q����l��ӓ+|Қ�p��&0j���p$G@8�����ۏ�����y�%�<����|���h�\}��aw�.sVcA��5J.�|%��pZ"D���v^$��{��W���f7p]�â�uԀߑu԰�����u\=jU����˾���Rpl#�A�����dq,�'��aq���Ad�(��=[�Z^���`��h%	4�=<�=�8u@�yqߕ�sI�������F��?>7p�~�����1�`���[��v�C��ِ���ں~��ƶ*�����k9�@�l�H
Au�N�BG��Y<���9B�>ڇ|�8�,�)��L�e7DV��`͡�!�3�����9g3=DqLFb�v�,N )K��e��0zS@��|�@'1���b0��M�Ʌ0/�vgf�[�/.�l�b��9�UOJ!�-A]'�� �j ��@ 5��4�YHQxovt.�|���0k��'H�Q��u�f5� �&@5 ���5m__J�L[�y'; s"����<�3@�,��    �k����{ٽv��~����t�k�)0N��z� ye9^|MA�������J�Z@
MǦ�R*��l�1���k%�\�=�*�.�� =C��aA�^�Ö�a{�^�����M&.�<�<�7�i�P@��H@j��# 5�t���X#�#���������2]]�������p�y�j�w����}z�L�fB��ez���)W��%�5��1�U2�tN7�RÛ��r���n%8��u��"��n�u6���^��]�xۅ��� -W5�q����R��\6�&���ѧ����6�N�5\�懜�ҩ���5�(]YN��z9�{�5�lt�K�lZS)�D���҅s�9J/_���cb��l@~K��q��Dv���0�`l�[�y�T#ܻ�+�h��(��ܟ@zL�������j'��?���C��J�������<�D�K?����(XMAe&���?��5f(p��A�143�W�!BS�X,�����2�<�ܩ�iv��e�Q�n�)�u�?�>����ox���JM��i$"4%Sn��Ѕ���t���b�S��ckC�M�n�G�c!�Fu�/�� ��ר&�0
��twT�Q����0ff�·����׵F���5PQGi �P�]M\�Amm(k��^�t��T�.�4_+4�BZ��a��3������>]^�ۤ�Oϯ��������^%�~���]ͦ2k]gi)���a�I�{���Jq���[@Z{�[���P �>���)D(�D�]�5�&�{~ˉ���c���[S�*)�S��#I�>��
�
�RH�
 :��ep�F��c̩�����M�����F|OOD�=��{��/�+�Qp`{��n]r��h�Z�0@X�6�a�>��&k�"Z�hE��6,m<�V��P��Kg �'p=��rv(��G�6�O;A��%%Hl���j_&�Dc�r�m�;j�4���[����Ɠ)'�a*�� �mI��A�P�8!\�w�-����v�<��Zk'��$<�F�=�`��˓��:�ぎ���BO�0NX���Q7Hi��g�N[})�B�����_qd�sk`�	=�8W�ǫV�5r�r��^x�K��9�@T�� �>K�U4/YX�98��`�"�?ݦ�r֫�3���M�5wV�c�-�g�ۂC[D�2S�u�Ԟ������n��>Yi�C��V��M`
V�UF,�
V�Jǐ��H�!g��2I/��&ϐp�n��2a ¦���!m��lp6WY��lN��ùzAYw3��H�m7ӽ�(�=C�m5b�;�Y�Bs�'s�fO$��sG86F��3�}9�!���Ge�&�0��Q���P�]�#�Hi����]��cm�^���
`��k_���5[Md(�����E�cd4�U9��Ũֱ��;8]U�Ow�G��w���Q��,��w���-bq�)�|Z	+GCH�|���*�${H׼�O�Q��D���%��
�a������FB�t���#5}ۙ'.뢐%+�쬭Xދ�-BMT���\zV�n�1��#��a%Q��JSW���
���P���O�`�B���|��u�p�0`�~_,m'>��X-���{o����f��q[/��W����,bԪMs!�9�#O�p�J@~"��T��=�|$�\�U�D+���՝-���7`9'�ZZI�E֤+�S%�5x�x��V����b��?�'~jll��iZ56�9��Kg�w�Ύ�DJ���@1�G_�kTeX{վt[���|�����c�t��4)\���uD���a�/i[�
��IR� �U�D���$#�P����V.����	���\�h:6k; � ߧ!uY\�E��0�@���Gݛ8�j�4LgHǦv��B�H>]gpr�<��@!����&	y?v��dBk�ցb�t��ܱ̈́�a�����銋E������s�)04�0�fj�X�c`�=Ya+쯩���6�����N��|��j$l�z�-��j'=�8G�̡�$�������'��7!���J�rS�����D��q����(B|�G�B�3�=Rq=��PZ��yr>Q��j�Ӵ�⣋�{�f��_��bHt�1BPɑ����"�1��V��@2WX�'��w)UT8?� ����x� 4O�y���H��-#�y�-� �>d�lܠdoo ��q����%>�����Wu�ZEƤ����T��+�c�r��m�����!��:8�;�-Aȳ�П�P���Dӱ�-#d7/ٹX�Z�8���k��u�rΤZ�_0�k�V.m��j��9M�m��Q�VE�ct�T����>�`x���� �pH��{qC7�W�	��"�u���Szz>>L������o��EC�� ���~�Qq+��ϰ>H��*���|�� oJb�Ŀw��
��?
1��N�r��-C��!*e����:ϤJ���	lޏ�V��r�$Z5�s�ϾC�pǡ�1����5��d�@�8�������0PO�ϗ���7i����^<B���Y��ڋ��}�5h��MmH��@s�����9�lfW���������~�W�������)s� h�A�Tl��9Ӂ���0*��2��,i��Z =i҂Mi�ro�uū`L��z�y�6��}$�O��t����r�k���9g��9z���a#�4ã� �7	�C�"�1��3ؖ2@�O0~q���V�W�g���VK���I�"����|������M�v.�z���bu\�����(��Z�4^0D͡�q��+���V�9��㐋����sm���_к:�my�s!�!{>z�7�/b �o����b� ��
	��Ҟli����|l&1���u4]�*��� ����C~Pb�o�69|}�`�b�1fV�N�BL�hN]z5�h�KZ8�s�	TL��P�<)LL�3�>�L�n\�7.*�z�Av@�*�U���]�+pm�o�.�1W%��C����\�A`�52d���_2	���W��([SJ�C�@g�v+K�D���
d궮�2�0�'B�t ������	�?�=��]n֪���!c.��%�׳F���׍�\oQ^�ʄ�q��l�_![܌�u����"�$�Bj�<��M���r����X�֫3wqȮ��aLm�K�z �&�� �ؐlb�Ćd�&^�CDx��	IO�v������ 
Q�u������I/2eC{��2��rC�~e�M]�S�	#�����2���������2��w�pq[_��j�c�[��`a9�����Sy%7�๋>;����i���[ٸ��W�E�D����>�^N/�*��/���!>%h G����B�6�S��t�����]}n��r7q�(��ko��~Pq�O ���d�N�*��һ6.s3�bl�t�f�D���L��jA�4������U/��*��dc��s-�/2~]�1���{�K�7G�N�}}z�_ 1f�.�	&DcٰK����q�S��޳7�� ��Λ�b��? �% v�΁AZ�f{�/�	#6��:�����N�vv��eb��9���O(��&<�'U�[��d��y�Y�p!�,��j�MT{���[�g��������wMӗ�@m-А7ӽ�����醂��.�԰��F�ao��<�C~�wa��
}�V���e������'b�H�M=ѕ��-D�>�g�]ߺ��k\V����nXcba�%cl-�.2��6��ѧ�FՇ��2�=� F v1�}��x,�2U��=�����A�!�M׵�WK0,�?[�Za�К�Ą����@��\v�,tL��i��˭˂�_�M_�9XDZ����M���Moӯ���ͷ����.g�WH[-�~_u�;F
1�,IJ�p��-c��@��$���,�Q��2=^���:u,����Vw7��L舰I������_5Z�K� E�<�La/'ZȚ6�Ҏ����v�pk�&�D��p⎔���o��� �  ���44�(35���~�,�n��,���X0�ަq�a� ����1�q<;<x#Ú? ���5�L��%(8ڊ�9ed���q��4-lht�c�Z���m�k��uQ�6�ms�4E�bO�"�q�n.uk����]�B��}�4ܴA�	��#��/>�:Q�/	4Ea� �➧�>��C���Nsy�٫&p�G]�Q���8{�w�lAsX�mVAl3���9��!�,Lm�q�X鋼�R�C���
�bi������1��QZx�C��,]'�0�%B�=�Χ��;�Yڞ��r������<_��:�<]sd�W���#��Y2.�m;K��d1�����}��-+L�j0�;�%&�Dc�.��/Hk|�N�5^�A6��o^����рƉg5�����&��fŭc����Z��
�d�Y�{�v�l9�e�r�m��&�	#6)������x]�?׸[�L;e����hw���D��E-�m)Z�S�-�+q+�a9^�hs��uO��_���^X5�f ��w��ȄT��)���6�88�ŋ';F��Ƈބ*�-�ou��	��v�Gx��N�l�%2s�;U/^AM��]��wT�Lh�U%���>��J.3;�Gh�V��	�}=[L�L��,`v:"D�aLϯ9�;�)��L_���25��f��6�+�(٪�$7� ɬ�A0O�hz"����sf����I2�޶��+��fPo�%�0!���@���mY.Ң�I�ȥ�}/���C��i��~A�����a��>�����?��u�9a��8��%�|K<�a�b� +��K�,#q��	Y��@?�*��9W!=HĀr"�ݬ���d�zo~��X2Ƅ���:�gۈ[U�ž��PLn{{������J����\� ��h(�w��.�݈4ķ���m����j����v!,�@�*��x|U?Ǆ����+�[迳 ����2���	-���y�vƄ������s�8���T�[yU1��D�W9���	=6��{wV^]����5��B̙3�]���Y�gu�iAE"�����\�����s�}�//��,�<��I�YD�Mb��%c�h`�yj�DH� ��16�@O.��	.w��w�ԥ��<&�H���φ���K�1���aݬi���+F�oZ��ג	56����$�#�fW6���nq�=�TEn90`��`��!_�*?b�ȼ9�c�A �Cf�����Ǐ����8s^W���
��������Τwy�o9���_���u��h]2P�؇|yP.O��S0�����	��!���g��6Y�f4�ۜ?�"8���:��/3V6ܿ�����gg���#��x�%�Z,��q�� �<�5'C�dl�u�u�S����/�-�й�z+�2�j˙�K�`�Sm�� p=�+�,�b��>�+&	�Ԇ��pÎfُ�!�1����R��૪�c���fU�D��!��z�?��}�UJ����N}X��6�{I%B�~B?�i[�b�0������Q֨�{�ǡ��v�E�!��/��C�I)��^*��x�k�g��.�<��vE
�dP�]~�/a?�} �~ގ�lKl�s��3��@�����O�+V�Kԥ"Q��qt��K��8
a�:��|���SKX~ʄ����kku������?���j         6   x�3��r��2���u��2���w�2RA!\��^��A\f��޾��\1z\\\ ��	�         F   x�3�t,K��IL�I�2��K��9R�R2�ҹL8��S���L9��srRKRS��8݀J��=... <�         �   x�-�ۍ�0D��bVa���������,E�pDx$#�"���D9�!30c*��h�K��|��Q~�_�2#o�D�!��*�BE���ۉl#/�g��j���jZ7�2���Y�:yg~�4�b?��׳BM۶5��J�}��/l'J��Q��q���W�FM#/�����������ȑ5�         u  x�UR�n� <�_i��Zy� TIV]���5�V��ی�3H {�h\�e�g�.�(���۔�@�v/xA�k�c�Rj��y@�[�M&��Nz��e��eZ�)��&�Rvf�P`!t�?a�hW֛��i����c�^8��0���4�����Y{��ۇ4��
A-R@t�S�!J?��2m����ޡ�Y�]�RA*.��hN�a�P�'�8�;xהF�-�������%����la!~D[����Q�p�ѽ���l�0Z���`N3K.��԰.>��,�X����!%�U�.�����\T
��y5�q�mPհ/����s4��½��ƹ���鑠j��>��F����lˉ��| �/:��            x��\�v붒�|gw�4ޏ!�m�r$랖W��wt�e��tV���A�P�Ǯ��ft1�%��K����mcU��l>VC��?���?��)��jF�
�'֊����Z�/��򟷖~\2�H7����d��9�L3��v)����l3H+�PH5N�)M ��8�]&I��zٯ����g�����~�$�	�I�&H/3,	����e�j���vG_S.�+�ׂw!ۢ��c��eI�Q��I�>���fӮ�=A����NE�uRJ�]�$�K}��в���P���+l�$=Di��z���
���B{���j�o���WʄX���n֛7:N�����U�*ށPP\�)�����	��Պ �l�>w�*Brl��j�.6#V a�
� !B~st�$�]�܏��t~[��z�=8��Q�`r���6��
c7�t��5��>}����v�}t��4x����Z�BA�3ڭ��v?��m��د�ݪݑ��CO���*A蘿{C"e�i,CZ���a�a	���~�߲$�>����dT������
��ÐC��/x���u��!F�?�
�
M��� I����a�k[&7,0���v��I��7����[�O�����G%�Z�� �Q��.,�a�M�/�����k�:2g�5#y��������$�Y���`M̅'/I�H$��R�ܵ�.Rh�/��y��V��;`�<]Z,o�V#��X�W{z����Z&P�������J�K÷����{���/>��}'�~�/�����")�&�rJ����!󰥇��CM�,��^��t�98\��Hs�>Z��-��:e��E׎ݎnzq�,�S�^zL"��"�[o��n�>�W��_�n\�z�rغ�`e�Bc�l���u�(�w��ic[�Q���G�l%b�tn=�Q�7,H��B�RfxW��{O�>l^������R*+E�Tt�]�&�V�K_>�kޒ�۷��"Ao�W�2���NK9ꠄ̬ݓ�6��1�L3(��Pl����A�nq�[���q����.��<t����p��� �@�4��Ԛ�zM�Ե��❱Ѥ�c�Ҹ\�%Y�%{��v1$���o���\e���侎tJA&�u�ǣ���GJZ|&h]|����7!�_t	#�Rt�ņ��q�$��F>pۓ����&ё�hY>7l���u�eXX1�C!?9I�B�E�����eվ,��r�2�f�!�*, ��Pr���$�=��7
2H��[D���}�Y��,�c|�} ڳ�e�
$�:���K��36�\�WG����[O&��;��a��hwǰ
���_��H"KѼW^��HR�9=g ��e|�19l(���v�2�L�{�0LG�;�
�
Ʊ3t�v9��q0Y��Y����;�7HKR����s=�X�	��h3C�,�II��4)MP �1b�l��^̆\�W`3�Rl6�=��'�u"��ݟ�т�b�(�la}���,-�8YE�v�/�%���0Y�������C�|I�iIg�}�S��$1��6���a]�����{Y�ga���R�y����1Q�o�����+�ވ'W���gBu��6ް�:s��N�&6��6afҿ��n�ş��`潯�B[(���V��BG��꾓��xYac(�K$�u�a�dF��̩���+�vJ�)�4Ba�<F`��8(�����)��׊�H�/A�67�t��+(��e�+�!B�GO�D�B�]�ҽC�C�(dI9�e�N�8�O��_f����l�ʃU),ȳ�fM���j���X�`\nN��%^����C��|����L2�?k4e#�]�E�_`�)�#�v=�4��)���	��,�X��k	f���"�&ixᙐ��w$�%����	R��=ck��P�kE�e6�浬��8�FeU:(��++�>��EPF��0�W�=�ŢP@���i�R1�l"�+��S��]5�|�F*�q���DA� 9.�� 
���$Y��u�׶#ՠ{~���'�Tw���eҋ�d�3b�G�Զ�M�� Z&
�8��Jq-�M�����s�4S,��abkY���Qb ���{��U;�!L}Q��b//Tp�PK�����%��WC�M�˜� �:g�/*��l����%���d�)8����h��������t�t)��c�pR�>5�LGvu��2�����d�~����t���N��:{b��	��f���"8��� SJY����ݳO1�L�;��ҺpH�đȈ�|�`�I]��}���ה��d��������+d>,�QR9Uj�|�O��d5ҥ1��zy���AO*Ea��U<��M�����7iKڂ�O"����L�d�ə S�������m�c;��4��"��)���[MB����Lf��D�������R�N�����i�җ:�.���@�+kC��9ˇm��B�L��c�5�� :�<|��,����\z�L��e�L�'b��[�m�d`a+{?2�U|�_�bק�/�թ�4M�d�*�!��؊�r��n8>iA�2�N�Y�(��7HG��Q�(*�6�\d�����6������_��*B��)j�����u�+&�G`�S��h�H��)�_�_�IBRe�j�nU��i39m�w*eJqy�t�hP���~ r��!j��{��2�H[V~���
Yȿ��<9�j�����?�n۷�m�j�n���g(G6Y2S���`��e�d���'�]ĦS�3'�t �� O-����;����%O���y	AM9�e�5�����˘�à�1_%(zЍQ�Q�\���8i e�2'��0��h�ଃ!,�[P�Wi|R��0�YE�<?1ݿ�E����EG6P��&S�hˇQ/#ٗ<���226���k��W�E�;7r��{f��<��H�(_ZD�8��I��)�M�Adz������5��UWɒ~��+���à��%3/���)qZP�Y$߮�����ITfz�W���>+^ޖk��Zvv���6&�e`3��7�A���476e:?���J���
Spbb_fU����&uq�k���`��Y���d��Y�������^���ӥRa��7p���D���ޝ��!<���_���9�d��T�.�6eq�r�?Bo�W-�;5�\�8N=�ZE�;+ui*���JX�� Z�B��o+(LG��u��fN^F�G(��Q>9?!���g�S���$?��R�Ιz�=~�k��=��s�L-F�Y� c,�V�̧	�EMA܈dv�!���'l�9;��ǌ��ޱ{:F��u3���)���6�HT��ArV�É�,��~`RU�X���t3�3,up��(%�8,0s?��'R�>d:���ٝ�Q�c��ؾ�R��J�Q����s&v�����6g��$c��S�]����:m���tĀ��q-D��O݂_�������݃��n���H�����j�1�$t���gu�X1���|�;E
*��w��Ȣ�,�I;�۾�A_tܦVV
���:D?C��)5=��,p,@�G�J-enL%7y���O6L߽��_��F��;c|(3$oNz���$���1���G!N�)-f�g�\:H{2@A�u's�G0���r����M�؅>W>�bҞ�I���4ʦ&E����.�(D�����Yn�@�����Ip:�'h� ��9oи94�w!��k��$.m��>���q\��;���+�;LI�r7�L�%�m[�2����N-�W�l�
�EFґ��Ȋ�^�Ew@�Mz֟�j�迌	��H[.�nL�~���m��0p��y\�B�W��}z[���j�y��HI����QD9���1VWae:.s����T���3k��ZierZ���"Nz*�^Q�*�	��KRF�	����c��V�����������Q(�P$�jvS��)46y�����os�!N��2�sA�N���!rg� ���g�`�z��v@�E!ԟ�l8<�˔Y%S?�(�~�)x�d6ތ�z�ͧl��2d���7��a*�}31����V*�w s�;�g��۔JR���I�ǫ�J��P� �  _m^(c���4N�.���A�	�d��y�i������iB��?W}'���+r�z͌X,��2pR����/ɽ�FY��8�x�`�u gZziy�XbY��wd r����\�x�,*4�[J�L��5�o{���@������sa���Z� 
�s���\+���o��'iW�W[�7D%��6#OJZ��0]{*.iqR�7��Fpì��0s`n��c��4�'�n�I~��i�L,��i������B>�hw`j2\Ã�(�A��p�i����F�0��s��b.��Q�~�� �;�u�Ϣ��.E����F!S�$q�u���"��y��7��Y���`��E]
c���J�:jc��g��8����_
2W�ܧF��k瓢P�ǁ@�}��)�T�$���[�7<t���4�`�����j�(� �@�~ᕿr�9���͕MW��ؔ��qD�Ѱ.�8=��$}�dV��U���X��6�­H�_�1�a������]���3y�"�M�P9��~)W1�XŜ6`�ڀU�jV?������TLlv��6��CۀWLmV1���s�@�9�Ƚ���<8��%���
�o�'��i��'Ʒ��c��X�z���	n����n���l��Տq]=�M�x� 7P�OrU7�d�,7�s^?����X�z����n��'��/��*F�������n�k�������n,R7�d�d7��rB��'F�i!�f�Y�5����VuSڀ�1m@k&��޹��zP��'�����2�5�D||>��Q�z@h���2�Q��(c�Ȍ20�c{��/P�S� ׎�(������θ'r��nbP]5z
���=�V���>����S,�FA��u��5�f@Y7
��{(��0&�0�cb+�1�sU��@�{F�b��� �¤~ո ��v\`�и V�w�aj������������8TMhk'��ğ����#�q�D	P�% ��a@m�0��n�P� @ww�T��OP��t�c	Y�]�z�Ux�H�:0�;�Ǻ���]=��9y__- ����X��Ip��w�j�F���4,T�^�#�e�׷�m�:��tuN���:r���z�c}����د�W'mU\M8�u�����ׯ_��e�      !     x�m�ͮ�0���S U��ŭ!,�f�2e�QG�O��WC�����?|lG�;M.TK�ۅ@�o���	��o�@y9�y�����+.�^�l��kH��ap�Y���s&�\�S���toт��cb�L��=�TS;���1��A�|'���L����%����|
��BP8���d��	s�"!�.�#�i Y�?�v�I�$L�v����a�r��4��3����������Dnu��P�/xz�E���r����[��F���M�/T���y����N�Ғ�9Ni$6㴧j>�[i������H���:���iɑ�,�(ܔ|+�)�� u	���Z�Gv�BUXc��%l����S��Ֆ�	�9��ݰ{�p����b=���f�����b3��������R����稅���;�[55ܾ_�����ktN`�y�:E^�)^hU��|V��~_Ț� /��-ކ��	܆��)`��3��%����������=�����ݖ      #   �   x�e��
�0������mS�X�%II1���VM�N�4��/(����C+���e��e���85
t�u�u;l��Y���R�R�$�@B�C0Zr���:��&����/�M�����:� S���q-�K���2%C���w����xc�=���`����r��Aӟ87X79S�a�d�W�W<��� �rG�      %   X   x�-ͫ�0Q�"d,�]IH�Q��э��E����]H�"���lb#���!r��\�"��I�xdD���?S���c����� �&�     