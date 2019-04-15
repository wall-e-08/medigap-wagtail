--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: article_articleindexpage; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.article_articleindexpage (
    page_ptr_id integer NOT NULL,
    feature_bg_id integer,
    sidebar_form_bg_id integer,
    sidebar_form_heading character varying(250),
    sidebar_form_main_heading character varying(250)
);


ALTER TABLE public.article_articleindexpage OWNER TO medigap;

--
-- Name: article_articlepage; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.article_articlepage (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    feature_img_id integer,
    hit_count integer NOT NULL,
    like_count integer NOT NULL
);


ALTER TABLE public.article_articlepage OWNER TO medigap;

--
-- Name: article_articletag; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.article_articletag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.article_articletag OWNER TO medigap;

--
-- Name: article_articletag_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.article_articletag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_articletag_id_seq OWNER TO medigap;

--
-- Name: article_articletag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.article_articletag_id_seq OWNED BY public.article_articletag.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO medigap;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO medigap;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO medigap;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO medigap;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO medigap;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO medigap;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO medigap;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO medigap;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO medigap;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO medigap;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO medigap;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO medigap;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO medigap;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO medigap;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO medigap;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO medigap;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO medigap;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO medigap;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO medigap;

--
-- Name: home_achievementcount; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_achievementcount (
    id integer NOT NULL,
    sort_order integer,
    name character varying(50) NOT NULL,
    count integer NOT NULL,
    page_id integer NOT NULL,
    icon character varying(50) NOT NULL
);


ALTER TABLE public.home_achievementcount OWNER TO medigap;

--
-- Name: home_achievementcount_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_achievementcount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_achievementcount_id_seq OWNER TO medigap;

--
-- Name: home_achievementcount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_achievementcount_id_seq OWNED BY public.home_achievementcount.id;


--
-- Name: home_baseicontext; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_baseicontext (
    id integer NOT NULL,
    icon character varying(50) NOT NULL,
    name character varying(80) NOT NULL,
    "desc" character varying(200) NOT NULL
);


ALTER TABLE public.home_baseicontext OWNER TO medigap;

--
-- Name: home_baseicontext_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_baseicontext_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_baseicontext_id_seq OWNER TO medigap;

--
-- Name: home_baseicontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_baseicontext_id_seq OWNED BY public.home_baseicontext.id;


--
-- Name: home_contactitem; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_contactitem (
    id integer NOT NULL,
    sort_order integer,
    contact_icon character varying(50) NOT NULL,
    contact_url character varying(255) NOT NULL,
    cnct_settings_id integer NOT NULL,
    contact_text character varying(255) NOT NULL
);


ALTER TABLE public.home_contactitem OWNER TO medigap;

--
-- Name: home_contactitem_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_contactitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_contactitem_id_seq OWNER TO medigap;

--
-- Name: home_contactitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_contactitem_id_seq OWNED BY public.home_contactitem.id;


--
-- Name: home_contactsettings; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_contactsettings (
    id integer NOT NULL,
    site_id integer NOT NULL,
    contact_desc character varying(255)
);


ALTER TABLE public.home_contactsettings OWNER TO medigap;

--
-- Name: home_contactsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_contactsettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_contactsettings_id_seq OWNER TO medigap;

--
-- Name: home_contactsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_contactsettings_id_seq OWNED BY public.home_contactsettings.id;


--
-- Name: home_homepage; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_homepage (
    page_ptr_id integer NOT NULL,
    banner_bg_id integer,
    banner_qt_text character varying(250),
    banner_slogan character varying(150),
    why_choose_desc text,
    why_choose_heading character varying(250),
    why_choose_img_id integer,
    achiev_bg_id integer,
    srvc_desc character varying(250),
    srvc_heading character varying(100),
    ins_desc character varying(250),
    ins_heading character varying(100),
    prom_article_id integer,
    prom_custom_desc text,
    prom_custom_heading character varying(150),
    prom_custom_url character varying(200),
    prom_custom_url_text character varying(150),
    prom_bg_id integer
);


ALTER TABLE public.home_homepage OWNER TO medigap;

--
-- Name: home_insurancepolicy; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_insurancepolicy (
    id integer NOT NULL,
    sort_order integer,
    name character varying(50) NOT NULL,
    "desc" text NOT NULL,
    facilities text,
    img_id integer,
    page_id integer NOT NULL
);


ALTER TABLE public.home_insurancepolicy OWNER TO medigap;

--
-- Name: home_insurancepolicy_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_insurancepolicy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_insurancepolicy_id_seq OWNER TO medigap;

--
-- Name: home_insurancepolicy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_insurancepolicy_id_seq OWNED BY public.home_insurancepolicy.id;


--
-- Name: home_partnerimgsettings; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_partnerimgsettings (
    id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.home_partnerimgsettings OWNER TO medigap;

--
-- Name: home_partnerimgsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_partnerimgsettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_partnerimgsettings_id_seq OWNER TO medigap;

--
-- Name: home_partnerimgsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_partnerimgsettings_id_seq OWNED BY public.home_partnerimgsettings.id;


--
-- Name: home_partneritem; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_partneritem (
    id integer NOT NULL,
    sort_order integer,
    main_settings_id integer NOT NULL,
    alt_text character varying(250),
    ptnr_url character varying(255),
    logo_id integer
);


ALTER TABLE public.home_partneritem OWNER TO medigap;

--
-- Name: home_partneritem_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_partneritem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_partneritem_id_seq OWNER TO medigap;

--
-- Name: home_partneritem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_partneritem_id_seq OWNED BY public.home_partneritem.id;


--
-- Name: home_primarysitesettings; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_primarysitesettings (
    id integer NOT NULL,
    favicon_id integer,
    logo_id integer,
    phone_number character varying(20),
    txt_ph_nmb character varying(150),
    site_id integer NOT NULL,
    qt_heading character varying(250),
    footer_logo_id integer,
    copyright_text character varying(250),
    txt_ph_nmb_footer character varying(150),
    qt_disclaimer text
);


ALTER TABLE public.home_primarysitesettings OWNER TO medigap;

--
-- Name: home_primarysitesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_primarysitesettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_primarysitesettings_id_seq OWNER TO medigap;

--
-- Name: home_primarysitesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_primarysitesettings_id_seq OWNED BY public.home_primarysitesettings.id;


--
-- Name: home_quoteformfield; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_quoteformfield (
    id integer NOT NULL,
    sort_order integer,
    label character varying(255) NOT NULL,
    field_type character varying(16) NOT NULL,
    required boolean NOT NULL,
    choices text NOT NULL,
    default_value character varying(255) NOT NULL,
    help_text character varying(255) NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.home_quoteformfield OWNER TO medigap;

--
-- Name: home_quoteformfield_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_quoteformfield_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_quoteformfield_id_seq OWNER TO medigap;

--
-- Name: home_quoteformfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_quoteformfield_id_seq OWNED BY public.home_quoteformfield.id;


--
-- Name: home_quoteformpage; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_quoteformpage (
    page_ptr_id integer NOT NULL,
    small_desc text,
    ty_text text
);


ALTER TABLE public.home_quoteformpage OWNER TO medigap;

--
-- Name: home_servicesicontext; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_servicesicontext (
    baseicontext_ptr_id integer NOT NULL,
    sort_order integer,
    page_id integer NOT NULL
);


ALTER TABLE public.home_servicesicontext OWNER TO medigap;

--
-- Name: home_simplepage; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_simplepage (
    page_ptr_id integer NOT NULL,
    content text,
    heading_bg_id integer,
    slogan_img_id integer,
    slogan_txt text
);


ALTER TABLE public.home_simplepage OWNER TO medigap;

--
-- Name: home_socialitem; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_socialitem (
    id integer NOT NULL,
    sort_order integer,
    sm_icon character varying(50) NOT NULL,
    sm_url character varying(255) NOT NULL,
    sm_settings_id integer NOT NULL
);


ALTER TABLE public.home_socialitem OWNER TO medigap;

--
-- Name: home_socialitem_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_socialitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_socialitem_id_seq OWNER TO medigap;

--
-- Name: home_socialitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_socialitem_id_seq OWNED BY public.home_socialitem.id;


--
-- Name: home_socialmediasettings; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_socialmediasettings (
    id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.home_socialmediasettings OWNER TO medigap;

--
-- Name: home_socialmediasettings_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.home_socialmediasettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_socialmediasettings_id_seq OWNER TO medigap;

--
-- Name: home_socialmediasettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.home_socialmediasettings_id_seq OWNED BY public.home_socialmediasettings.id;


--
-- Name: home_whychooseicontext; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.home_whychooseicontext (
    sort_order integer,
    page_id integer NOT NULL,
    baseicontext_ptr_id integer NOT NULL
);


ALTER TABLE public.home_whychooseicontext OWNER TO medigap;

--
-- Name: quotes_lead; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.quotes_lead (
    id integer NOT NULL,
    first_name character varying(100),
    middle_name character varying(100),
    last_name character varying(100),
    email character varying(200),
    phone character varying(100),
    phone2 character varying(100),
    zip_code character varying(100),
    created_time timestamp with time zone NOT NULL,
    dob date
);


ALTER TABLE public.quotes_lead OWNER TO medigap;

--
-- Name: quotes_lead_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.quotes_lead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotes_lead_id_seq OWNER TO medigap;

--
-- Name: quotes_lead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.quotes_lead_id_seq OWNED BY public.quotes_lead.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO medigap;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO medigap;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO medigap;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO medigap;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_collection_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_collection_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_collection OWNER TO medigap;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collection_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_collection_id_seq OWNED BY public.wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_collectionviewrestriction OWNER TO medigap;

--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_collectionviewrestriction_groups (
    id integer NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups OWNER TO medigap;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY public.wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collectionviewrestriction_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq OWNED BY public.wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_groupcollectionpermission OWNER TO medigap;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_groupcollectionpermission_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq OWNED BY public.wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_grouppagepermission OWNER TO medigap;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_grouppagepermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_grouppagepermission_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_grouppagepermission_id_seq OWNED BY public.wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    live_revision_id integer,
    last_published_at timestamp with time zone,
    draft_title character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_page OWNER TO medigap;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_page_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_page_id_seq OWNED BY public.wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.wagtailcore_pagerevision OWNER TO medigap;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_pagerevision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pagerevision_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_pagerevision_id_seq OWNED BY public.wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction OWNER TO medigap;

--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction_groups OWNER TO medigap;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_groups_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq OWNED BY public.wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_id_seq OWNED BY public.wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


ALTER TABLE public.wagtailcore_site OWNER TO medigap;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailcore_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_site_id_seq OWNER TO medigap;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailcore_site_id_seq OWNED BY public.wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL,
    file_size integer,
    file_hash character varying(40) NOT NULL,
    CONSTRAINT wagtaildocs_document_file_size_check CHECK ((file_size >= 0))
);


ALTER TABLE public.wagtaildocs_document OWNER TO medigap;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtaildocs_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtaildocs_document_id_seq OWNER TO medigap;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtaildocs_document_id_seq OWNED BY public.wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.wagtailembeds_embed OWNER TO medigap;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailembeds_embed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailembeds_embed_id_seq OWNER TO medigap;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailembeds_embed_id_seq OWNED BY public.wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailforms_formsubmission OWNER TO medigap;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailforms_formsubmission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailforms_formsubmission_id_seq OWNER TO medigap;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailforms_formsubmission_id_seq OWNED BY public.wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    collection_id integer NOT NULL,
    file_hash character varying(40) NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE public.wagtailimages_image OWNER TO medigap;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailimages_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_image_id_seq OWNER TO medigap;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailimages_image_id_seq OWNED BY public.wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    filter_spec character varying(255) NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.wagtailimages_rendition OWNER TO medigap;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailimages_rendition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_rendition_id_seq OWNER TO medigap;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailimages_rendition_id_seq OWNED BY public.wagtailimages_rendition.id;


--
-- Name: wagtailmenus_flatmenu; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailmenus_flatmenu (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    handle character varying(100) NOT NULL,
    heading character varying(255) NOT NULL,
    site_id integer NOT NULL,
    max_levels smallint NOT NULL,
    use_specific smallint NOT NULL,
    CONSTRAINT wagtailmenus_flatmenu_max_levels_check CHECK ((max_levels >= 0)),
    CONSTRAINT wagtailmenus_flatmenu_use_specific_check CHECK ((use_specific >= 0))
);


ALTER TABLE public.wagtailmenus_flatmenu OWNER TO medigap;

--
-- Name: wagtailmenus_flatmenu_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailmenus_flatmenu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailmenus_flatmenu_id_seq OWNER TO medigap;

--
-- Name: wagtailmenus_flatmenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailmenus_flatmenu_id_seq OWNED BY public.wagtailmenus_flatmenu.id;


--
-- Name: wagtailmenus_flatmenuitem; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailmenus_flatmenuitem (
    id integer NOT NULL,
    sort_order integer,
    link_text character varying(255) NOT NULL,
    link_url character varying(255),
    link_page_id integer,
    menu_id integer NOT NULL,
    url_append character varying(255) NOT NULL,
    allow_subnav boolean NOT NULL,
    handle character varying(100) NOT NULL
);


ALTER TABLE public.wagtailmenus_flatmenuitem OWNER TO medigap;

--
-- Name: wagtailmenus_flatmenuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailmenus_flatmenuitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailmenus_flatmenuitem_id_seq OWNER TO medigap;

--
-- Name: wagtailmenus_flatmenuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailmenus_flatmenuitem_id_seq OWNED BY public.wagtailmenus_flatmenuitem.id;


--
-- Name: wagtailmenus_mainmenu; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailmenus_mainmenu (
    id integer NOT NULL,
    site_id integer NOT NULL,
    max_levels smallint NOT NULL,
    use_specific smallint NOT NULL,
    CONSTRAINT wagtailmenus_mainmenu_max_levels_check CHECK ((max_levels >= 0)),
    CONSTRAINT wagtailmenus_mainmenu_use_specific_check CHECK ((use_specific >= 0))
);


ALTER TABLE public.wagtailmenus_mainmenu OWNER TO medigap;

--
-- Name: wagtailmenus_mainmenu_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailmenus_mainmenu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailmenus_mainmenu_id_seq OWNER TO medigap;

--
-- Name: wagtailmenus_mainmenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailmenus_mainmenu_id_seq OWNED BY public.wagtailmenus_mainmenu.id;


--
-- Name: wagtailmenus_mainmenuitem; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailmenus_mainmenuitem (
    id integer NOT NULL,
    sort_order integer,
    link_text character varying(255) NOT NULL,
    link_url character varying(255),
    link_page_id integer,
    menu_id integer NOT NULL,
    allow_subnav boolean NOT NULL,
    url_append character varying(255) NOT NULL,
    handle character varying(100) NOT NULL
);


ALTER TABLE public.wagtailmenus_mainmenuitem OWNER TO medigap;

--
-- Name: wagtailmenus_mainmenuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailmenus_mainmenuitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailmenus_mainmenuitem_id_seq OWNER TO medigap;

--
-- Name: wagtailmenus_mainmenuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailmenus_mainmenuitem_id_seq OWNED BY public.wagtailmenus_mainmenuitem.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(255) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE public.wagtailredirects_redirect OWNER TO medigap;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailredirects_redirect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailredirects_redirect_id_seq OWNER TO medigap;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailredirects_redirect_id_seq OWNED BY public.wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_editorspick OWNER TO medigap;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailsearch_editorspick_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_editorspick_id_seq OWNER TO medigap;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailsearch_editorspick_id_seq OWNED BY public.wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE public.wagtailsearch_query OWNER TO medigap;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailsearch_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_query_id_seq OWNER TO medigap;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailsearch_query_id_seq OWNED BY public.wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_querydailyhits OWNER TO medigap;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailsearch_querydailyhits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_querydailyhits_id_seq OWNER TO medigap;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailsearch_querydailyhits_id_seq OWNED BY public.wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: medigap
--

CREATE TABLE public.wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL,
    current_time_zone character varying(40) NOT NULL,
    avatar character varying(100) NOT NULL
);


ALTER TABLE public.wagtailusers_userprofile OWNER TO medigap;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: medigap
--

CREATE SEQUENCE public.wagtailusers_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailusers_userprofile_id_seq OWNER TO medigap;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medigap
--

ALTER SEQUENCE public.wagtailusers_userprofile_id_seq OWNED BY public.wagtailusers_userprofile.id;


--
-- Name: article_articletag id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articletag ALTER COLUMN id SET DEFAULT nextval('public.article_articletag_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: home_achievementcount id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_achievementcount ALTER COLUMN id SET DEFAULT nextval('public.home_achievementcount_id_seq'::regclass);


--
-- Name: home_baseicontext id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_baseicontext ALTER COLUMN id SET DEFAULT nextval('public.home_baseicontext_id_seq'::regclass);


--
-- Name: home_contactitem id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_contactitem ALTER COLUMN id SET DEFAULT nextval('public.home_contactitem_id_seq'::regclass);


--
-- Name: home_contactsettings id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_contactsettings ALTER COLUMN id SET DEFAULT nextval('public.home_contactsettings_id_seq'::regclass);


--
-- Name: home_insurancepolicy id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_insurancepolicy ALTER COLUMN id SET DEFAULT nextval('public.home_insurancepolicy_id_seq'::regclass);


--
-- Name: home_partnerimgsettings id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_partnerimgsettings ALTER COLUMN id SET DEFAULT nextval('public.home_partnerimgsettings_id_seq'::regclass);


--
-- Name: home_partneritem id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_partneritem ALTER COLUMN id SET DEFAULT nextval('public.home_partneritem_id_seq'::regclass);


--
-- Name: home_primarysitesettings id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_primarysitesettings ALTER COLUMN id SET DEFAULT nextval('public.home_primarysitesettings_id_seq'::regclass);


--
-- Name: home_quoteformfield id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_quoteformfield ALTER COLUMN id SET DEFAULT nextval('public.home_quoteformfield_id_seq'::regclass);


--
-- Name: home_socialitem id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_socialitem ALTER COLUMN id SET DEFAULT nextval('public.home_socialitem_id_seq'::regclass);


--
-- Name: home_socialmediasettings id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_socialmediasettings ALTER COLUMN id SET DEFAULT nextval('public.home_socialmediasettings_id_seq'::regclass);


--
-- Name: quotes_lead id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.quotes_lead ALTER COLUMN id SET DEFAULT nextval('public.quotes_lead_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: wagtailcore_collection id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collection_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_groupcollectionpermission id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: wagtailcore_grouppagepermission id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: wagtailcore_page id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_page_id_seq'::regclass);


--
-- Name: wagtailcore_pagerevision id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_site id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_site_id_seq'::regclass);


--
-- Name: wagtaildocs_document id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('public.wagtaildocs_document_id_seq'::regclass);


--
-- Name: wagtailembeds_embed id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('public.wagtailembeds_embed_id_seq'::regclass);


--
-- Name: wagtailforms_formsubmission id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('public.wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: wagtailimages_image id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_image_id_seq'::regclass);


--
-- Name: wagtailimages_rendition id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_rendition_id_seq'::regclass);


--
-- Name: wagtailmenus_flatmenu id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_flatmenu ALTER COLUMN id SET DEFAULT nextval('public.wagtailmenus_flatmenu_id_seq'::regclass);


--
-- Name: wagtailmenus_flatmenuitem id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_flatmenuitem ALTER COLUMN id SET DEFAULT nextval('public.wagtailmenus_flatmenuitem_id_seq'::regclass);


--
-- Name: wagtailmenus_mainmenu id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_mainmenu ALTER COLUMN id SET DEFAULT nextval('public.wagtailmenus_mainmenu_id_seq'::regclass);


--
-- Name: wagtailmenus_mainmenuitem id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_mainmenuitem ALTER COLUMN id SET DEFAULT nextval('public.wagtailmenus_mainmenuitem_id_seq'::regclass);


--
-- Name: wagtailredirects_redirect id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('public.wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: wagtailsearch_editorspick id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: wagtailsearch_query id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_query_id_seq'::regclass);


--
-- Name: wagtailsearch_querydailyhits id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: wagtailusers_userprofile id; Type: DEFAULT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('public.wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: article_articleindexpage; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.article_articleindexpage (page_ptr_id, feature_bg_id, sidebar_form_bg_id, sidebar_form_heading, sidebar_form_main_heading) FROM stdin;
5	1	16	Get the best plan suit for you	Find Insurance Plans
\.


--
-- Data for Name: article_articlepage; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.article_articlepage (page_ptr_id, content, feature_img_id, hit_count, like_count) FROM stdin;
7	<h2><b>What is Lorem Ipsum?</b></h2><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p></p><h2><b>Why do we use it?</b></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#x27;lorem ipsum&#x27; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p></p><h2><b>Where does it come from?</b></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p></p><h2><b>Where can I get some?</b></h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>	13	15	0
6	<h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><h2>Where can I get some?</h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,</p>	13	60	0
\.


--
-- Data for Name: article_articletag; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.article_articletag (id, content_object_id, tag_id) FROM stdin;
3	7	10
4	7	11
5	7	12
12	6	9
13	6	10
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	1	3
5	1	4
6	2	2
7	2	3
8	2	4
9	1	5
10	1	6
11	1	7
12	2	5
13	2	6
14	2	7
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can access Wagtail admin	3	access_admin
2	Can add document	4	add_document
3	Can change document	4	change_document
4	Can delete document	4	delete_document
5	Can add image	5	add_image
6	Can change image	5	change_image
7	Can delete image	5	delete_image
8	Can add home page	2	add_homepage
9	Can change home page	2	change_homepage
10	Can delete home page	2	delete_homepage
11	Can view home page	2	view_homepage
12	Can add achievement count	6	add_achievementcount
13	Can change achievement count	6	change_achievementcount
14	Can delete achievement count	6	delete_achievementcount
15	Can view achievement count	6	view_achievementcount
16	Can add Site Identity	7	add_primarysitesettings
17	Can change Site Identity	7	change_primarysitesettings
18	Can delete Site Identity	7	delete_primarysitesettings
19	Can view Site Identity	7	view_primarysitesettings
20	Can add form submission	8	add_formsubmission
21	Can change form submission	8	change_formsubmission
22	Can delete form submission	8	delete_formsubmission
23	Can view form submission	8	view_formsubmission
24	Can add redirect	9	add_redirect
25	Can change redirect	9	change_redirect
26	Can delete redirect	9	delete_redirect
27	Can view redirect	9	view_redirect
28	Can add embed	10	add_embed
29	Can change embed	10	change_embed
30	Can delete embed	10	delete_embed
31	Can view embed	10	view_embed
32	Can add user profile	11	add_userprofile
33	Can change user profile	11	change_userprofile
34	Can delete user profile	11	delete_userprofile
35	Can view user profile	11	view_userprofile
36	Can view document	4	view_document
37	Can view image	5	view_image
38	Can add rendition	12	add_rendition
39	Can change rendition	12	change_rendition
40	Can delete rendition	12	delete_rendition
41	Can view rendition	12	view_rendition
42	Can add query	13	add_query
43	Can change query	13	change_query
44	Can delete query	13	delete_query
45	Can view query	13	view_query
46	Can add Query Daily Hits	14	add_querydailyhits
47	Can change Query Daily Hits	14	change_querydailyhits
48	Can delete Query Daily Hits	14	delete_querydailyhits
49	Can view Query Daily Hits	14	view_querydailyhits
50	Can add page	1	add_page
51	Can change page	1	change_page
52	Can delete page	1	delete_page
53	Can view page	1	view_page
54	Can add group page permission	15	add_grouppagepermission
55	Can change group page permission	15	change_grouppagepermission
56	Can delete group page permission	15	delete_grouppagepermission
57	Can view group page permission	15	view_grouppagepermission
58	Can add page revision	16	add_pagerevision
59	Can change page revision	16	change_pagerevision
60	Can delete page revision	16	delete_pagerevision
61	Can view page revision	16	view_pagerevision
62	Can add page view restriction	17	add_pageviewrestriction
63	Can change page view restriction	17	change_pageviewrestriction
64	Can delete page view restriction	17	delete_pageviewrestriction
65	Can view page view restriction	17	view_pageviewrestriction
66	Can add site	18	add_site
67	Can change site	18	change_site
68	Can delete site	18	delete_site
69	Can view site	18	view_site
70	Can add collection	19	add_collection
71	Can change collection	19	change_collection
72	Can delete collection	19	delete_collection
73	Can view collection	19	view_collection
74	Can add group collection permission	20	add_groupcollectionpermission
75	Can change group collection permission	20	change_groupcollectionpermission
76	Can delete group collection permission	20	delete_groupcollectionpermission
77	Can view group collection permission	20	view_groupcollectionpermission
78	Can add collection view restriction	21	add_collectionviewrestriction
79	Can change collection view restriction	21	change_collectionviewrestriction
80	Can delete collection view restriction	21	delete_collectionviewrestriction
81	Can view collection view restriction	21	view_collectionviewrestriction
82	Can add Tag	22	add_tag
83	Can change Tag	22	change_tag
84	Can delete Tag	22	delete_tag
85	Can view Tag	22	view_tag
86	Can add Tagged Item	23	add_taggeditem
87	Can change Tagged Item	23	change_taggeditem
88	Can delete Tagged Item	23	delete_taggeditem
89	Can view Tagged Item	23	view_taggeditem
90	Can add log entry	24	add_logentry
91	Can change log entry	24	change_logentry
92	Can delete log entry	24	delete_logentry
93	Can view log entry	24	view_logentry
94	Can add permission	25	add_permission
95	Can change permission	25	change_permission
96	Can delete permission	25	delete_permission
97	Can view permission	25	view_permission
98	Can add group	26	add_group
99	Can change group	26	change_group
100	Can delete group	26	delete_group
101	Can view group	26	view_group
102	Can add user	27	add_user
103	Can change user	27	change_user
104	Can delete user	27	delete_user
105	Can view user	27	view_user
106	Can add content type	28	add_contenttype
107	Can change content type	28	change_contenttype
108	Can delete content type	28	delete_contenttype
109	Can view content type	28	view_contenttype
110	Can add session	29	add_session
111	Can change session	29	change_session
112	Can delete session	29	delete_session
113	Can view session	29	view_session
114	Can add Social Media Items	30	add_socialmediasettings
115	Can change Social Media Items	30	change_socialmediasettings
116	Can delete Social Media Items	30	delete_socialmediasettings
117	Can view Social Media Items	30	view_socialmediasettings
118	Can add social item	31	add_socialitem
119	Can change social item	31	change_socialitem
120	Can delete social item	31	delete_socialitem
121	Can view social item	31	view_socialitem
122	Can add contact item	32	add_contactitem
123	Can change contact item	32	change_contactitem
124	Can delete contact item	32	delete_contactitem
125	Can view contact item	32	view_contactitem
126	Can add Contact Info	33	add_contactsettings
127	Can change Contact Info	33	change_contactsettings
128	Can delete Contact Info	33	delete_contactsettings
129	Can view Contact Info	33	view_contactsettings
130	Can add Partner Logo	34	add_partnerimgsettings
131	Can change Partner Logo	34	change_partnerimgsettings
132	Can delete Partner Logo	34	delete_partnerimgsettings
133	Can view Partner Logo	34	view_partnerimgsettings
134	Can add partner item	35	add_partneritem
135	Can change partner item	35	change_partneritem
136	Can delete partner item	35	delete_partneritem
137	Can view partner item	35	view_partneritem
138	Can add why choose icon text	36	add_whychooseicontext
139	Can change why choose icon text	36	change_whychooseicontext
140	Can delete why choose icon text	36	delete_whychooseicontext
141	Can view why choose icon text	36	view_whychooseicontext
142	Can add base icon text	37	add_baseicontext
143	Can change base icon text	37	change_baseicontext
144	Can delete base icon text	37	delete_baseicontext
145	Can view base icon text	37	view_baseicontext
146	Can add services icon text	38	add_servicesicontext
147	Can change services icon text	38	change_servicesicontext
148	Can delete services icon text	38	delete_servicesicontext
149	Can view services icon text	38	view_servicesicontext
150	Can add insurance policy	39	add_insurancepolicy
151	Can change insurance policy	39	change_insurancepolicy
152	Can delete insurance policy	39	delete_insurancepolicy
153	Can view insurance policy	39	view_insurancepolicy
154	Can add article index page	40	add_articleindexpage
155	Can change article index page	40	change_articleindexpage
156	Can delete article index page	40	delete_articleindexpage
157	Can view article index page	40	view_articleindexpage
158	Can add article page	41	add_articlepage
159	Can change article page	41	change_articlepage
160	Can delete article page	41	delete_articlepage
161	Can view article page	41	view_articlepage
162	Can add simple page	42	add_simplepage
163	Can change simple page	42	change_simplepage
164	Can delete simple page	42	delete_simplepage
165	Can view simple page	42	view_simplepage
166	Can add article tag	43	add_articletag
167	Can change article tag	43	change_articletag
168	Can delete article tag	43	delete_articletag
169	Can view article tag	43	view_articletag
170	Can add flat menu	45	add_flatmenu
171	Can change flat menu	45	change_flatmenu
172	Can delete flat menu	45	delete_flatmenu
173	Can view flat menu	45	view_flatmenu
174	Can add menu item	46	add_flatmenuitem
175	Can change menu item	46	change_flatmenuitem
176	Can delete menu item	46	delete_flatmenuitem
177	Can view menu item	46	view_flatmenuitem
178	Can add main menu	47	add_mainmenu
179	Can change main menu	47	change_mainmenu
180	Can delete main menu	47	delete_mainmenu
181	Can view main menu	47	view_mainmenu
182	Can add menu item	48	add_mainmenuitem
183	Can change menu item	48	change_mainmenuitem
184	Can delete menu item	48	delete_mainmenuitem
185	Can view menu item	48	view_mainmenuitem
186	Can add lead	49	add_lead
187	Can change lead	49	change_lead
188	Can delete lead	49	delete_lead
189	Can view lead	49	view_lead
190	Can add quote form field	50	add_quoteformfield
191	Can change quote form field	50	change_quoteformfield
192	Can delete quote form field	50	delete_quoteformfield
193	Can view quote form field	50	view_quoteformfield
194	Can add quote form page	51	add_quoteformpage
195	Can change quote form page	51	change_quoteformpage
196	Can delete quote form page	51	delete_quoteformpage
197	Can view quote form page	51	view_quoteformpage
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$120000$0b4FEFFca2Y0$SaJMQD/iZ1Uhg9x9V/V9rxefqbS1bbxoBClH5yian4s=	\N	t	admin				t	t	2019-03-24 16:59:14.896868+06
3	pbkdf2_sha256$120000$Ub8avtC0mdB6$9ayeFiP1SRw0IBA/OQkc82j+fOUPOdppCdBXWZpyqSs=	2019-03-31 16:38:59.892302+06	t	test			w@w.com	t	t	2019-03-24 16:59:49.30559+06
1	pbkdf2_sha256$120000$v7XExlI3HHMz$VUaINCJEfAn0Zk9T9vNc19lxt1nXXpT7P4dNd4SDX9Q=	2019-04-11 13:01:48.89925+06	t	wall-e				t	t	2019-03-24 16:59:03.84882+06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	home	homepage
3	wagtailadmin	admin
4	wagtaildocs	document
5	wagtailimages	image
6	home	achievementcount
7	home	primarysitesettings
8	wagtailforms	formsubmission
9	wagtailredirects	redirect
10	wagtailembeds	embed
11	wagtailusers	userprofile
12	wagtailimages	rendition
13	wagtailsearch	query
14	wagtailsearch	querydailyhits
15	wagtailcore	grouppagepermission
16	wagtailcore	pagerevision
17	wagtailcore	pageviewrestriction
18	wagtailcore	site
19	wagtailcore	collection
20	wagtailcore	groupcollectionpermission
21	wagtailcore	collectionviewrestriction
22	taggit	tag
23	taggit	taggeditem
24	admin	logentry
25	auth	permission
26	auth	group
27	auth	user
28	contenttypes	contenttype
29	sessions	session
30	home	socialmediasettings
31	home	socialitem
32	home	contactitem
33	home	contactsettings
34	home	partnerimgsettings
35	home	partneritem
36	home	whychooseicontext
37	home	baseicontext
38	home	servicesicontext
39	home	insurancepolicy
40	article	articleindexpage
41	article	articlepage
42	home	simplepage
43	article	articletag
44	article	tag
45	wagtailmenus	flatmenu
46	wagtailmenus	flatmenuitem
47	wagtailmenus	mainmenu
48	wagtailmenus	mainmenuitem
49	quotes	lead
50	home	quoteformfield
51	home	quoteformpage
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-03-24 16:58:15.835368+06
2	auth	0001_initial	2019-03-24 16:58:16.128337+06
3	admin	0001_initial	2019-03-24 16:58:16.208739+06
4	admin	0002_logentry_remove_auto_add	2019-03-24 16:58:16.224673+06
5	admin	0003_logentry_add_action_flag_choices	2019-03-24 16:58:16.237954+06
6	contenttypes	0002_remove_content_type_name	2019-03-24 16:58:16.271708+06
7	auth	0002_alter_permission_name_max_length	2019-03-24 16:58:16.286121+06
8	auth	0003_alter_user_email_max_length	2019-03-24 16:58:16.318205+06
9	auth	0004_alter_user_username_opts	2019-03-24 16:58:16.35715+06
10	auth	0005_alter_user_last_login_null	2019-03-24 16:58:16.392323+06
11	auth	0006_require_contenttypes_0002	2019-03-24 16:58:16.401166+06
12	auth	0007_alter_validators_add_error_messages	2019-03-24 16:58:16.427723+06
13	auth	0008_alter_user_username_max_length	2019-03-24 16:58:16.467276+06
14	auth	0009_alter_user_last_name_max_length	2019-03-24 16:58:16.505932+06
15	wagtailcore	0001_initial	2019-03-24 16:58:17.078643+06
16	wagtailcore	0002_initial_data	2019-03-24 16:58:17.08453+06
17	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2019-03-24 16:58:17.090569+06
18	wagtailcore	0004_page_locked	2019-03-24 16:58:17.098519+06
19	wagtailcore	0005_add_page_lock_permission_to_moderators	2019-03-24 16:58:17.106504+06
20	wagtailcore	0006_add_lock_page_permission	2019-03-24 16:58:17.114089+06
21	wagtailcore	0007_page_latest_revision_created_at	2019-03-24 16:58:17.121566+06
22	wagtailcore	0008_populate_latest_revision_created_at	2019-03-24 16:58:17.129093+06
23	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2019-03-24 16:58:17.136594+06
24	wagtailcore	0010_change_page_owner_to_null_on_delete	2019-03-24 16:58:17.143343+06
25	wagtailcore	0011_page_first_published_at	2019-03-24 16:58:17.149814+06
26	wagtailcore	0012_extend_page_slug_field	2019-03-24 16:58:17.156684+06
27	wagtailcore	0013_update_golive_expire_help_text	2019-03-24 16:58:17.163525+06
28	wagtailcore	0014_add_verbose_name	2019-03-24 16:58:17.170403+06
29	wagtailcore	0015_add_more_verbose_names	2019-03-24 16:58:17.177058+06
30	wagtailcore	0016_change_page_url_path_to_text_field	2019-03-24 16:58:17.18358+06
31	wagtailcore	0017_change_edit_page_permission_description	2019-03-24 16:58:17.207598+06
32	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2019-03-24 16:58:17.248522+06
33	wagtailcore	0019_verbose_names_cleanup	2019-03-24 16:58:17.303892+06
34	wagtailcore	0020_add_index_on_page_first_published_at	2019-03-24 16:58:17.342949+06
35	wagtailcore	0021_capitalizeverbose	2019-03-24 16:58:17.699588+06
36	wagtailcore	0022_add_site_name	2019-03-24 16:58:17.730176+06
37	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2019-03-24 16:58:17.765658+06
38	wagtailcore	0024_collection	2019-03-24 16:58:17.829672+06
39	wagtailcore	0025_collection_initial_data	2019-03-24 16:58:17.855172+06
40	wagtailcore	0026_group_collection_permission	2019-03-24 16:58:17.957722+06
41	wagtailcore	0027_fix_collection_path_collation	2019-03-24 16:58:18.00752+06
42	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2019-03-24 16:58:18.050272+06
43	wagtailcore	0028_merge	2019-03-24 16:58:18.058281+06
44	wagtailcore	0029_unicode_slugfield_dj19	2019-03-24 16:58:18.086062+06
45	wagtailcore	0030_index_on_pagerevision_created_at	2019-03-24 16:58:18.129724+06
46	wagtailcore	0031_add_page_view_restriction_types	2019-03-24 16:58:18.295139+06
47	wagtailcore	0032_add_bulk_delete_page_permission	2019-03-24 16:58:18.31825+06
48	wagtailcore	0033_remove_golive_expiry_help_text	2019-03-24 16:58:18.364479+06
49	wagtailcore	0034_page_live_revision	2019-03-24 16:58:18.416371+06
50	wagtailcore	0035_page_last_published_at	2019-03-24 16:58:18.450137+06
51	wagtailcore	0036_populate_page_last_published_at	2019-03-24 16:58:18.489782+06
52	wagtailcore	0037_set_page_owner_editable	2019-03-24 16:58:18.531186+06
53	wagtailcore	0038_make_first_published_at_editable	2019-03-24 16:58:18.552579+06
54	wagtailcore	0039_collectionviewrestriction	2019-03-24 16:58:18.682898+06
55	wagtailcore	0040_page_draft_title	2019-03-24 16:58:18.839314+06
56	wagtailcore	0041_group_collection_permissions_verbose_name_plural	2019-03-24 16:58:18.857558+06
57	home	0001_initial	2019-03-24 16:58:18.905228+06
58	home	0002_create_homepage	2019-03-24 16:58:18.958474+06
59	home	0003_auto_20190324_1058	2019-03-24 16:58:19.121394+06
60	sessions	0001_initial	2019-03-24 16:58:19.185438+06
61	taggit	0001_initial	2019-03-24 16:58:19.325186+06
62	taggit	0002_auto_20150616_2121	2019-03-24 16:58:19.359192+06
63	wagtailadmin	0001_create_admin_access_permissions	2019-03-24 16:58:19.405317+06
64	wagtaildocs	0001_initial	2019-03-24 16:58:19.459167+06
65	wagtaildocs	0002_initial_data	2019-03-24 16:58:19.514902+06
66	wagtaildocs	0003_add_verbose_names	2019-03-24 16:58:19.572139+06
67	wagtaildocs	0004_capitalizeverbose	2019-03-24 16:58:19.660644+06
68	wagtaildocs	0005_document_collection	2019-03-24 16:58:19.729452+06
69	wagtaildocs	0006_copy_document_permissions_to_collections	2019-03-24 16:58:19.774346+06
70	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2019-03-24 16:58:19.811584+06
71	wagtaildocs	0007_merge	2019-03-24 16:58:19.818182+06
72	wagtaildocs	0008_document_file_size	2019-03-24 16:58:19.848791+06
73	wagtaildocs	0009_document_verbose_name_plural	2019-03-24 16:58:19.871141+06
74	wagtaildocs	0010_document_file_hash	2019-03-24 16:58:19.938581+06
75	wagtailembeds	0001_initial	2019-03-24 16:58:19.99693+06
76	wagtailembeds	0002_add_verbose_names	2019-03-24 16:58:20.010245+06
77	wagtailembeds	0003_capitalizeverbose	2019-03-24 16:58:20.023418+06
78	wagtailembeds	0004_embed_verbose_name_plural	2019-03-24 16:58:20.034417+06
79	wagtailforms	0001_initial	2019-03-24 16:58:20.14385+06
80	wagtailforms	0002_add_verbose_names	2019-03-24 16:58:20.169306+06
81	wagtailforms	0003_capitalizeverbose	2019-03-24 16:58:20.193986+06
82	wagtailimages	0001_initial	2019-03-24 16:58:20.436761+06
83	wagtailimages	0002_initial_data	2019-03-24 16:58:20.444066+06
84	wagtailimages	0003_fix_focal_point_fields	2019-03-24 16:58:20.451403+06
85	wagtailimages	0004_make_focal_point_key_not_nullable	2019-03-24 16:58:20.458976+06
86	wagtailimages	0005_make_filter_spec_unique	2019-03-24 16:58:20.465501+06
87	wagtailimages	0006_add_verbose_names	2019-03-24 16:58:20.472045+06
88	wagtailimages	0007_image_file_size	2019-03-24 16:58:20.478596+06
89	wagtailimages	0008_image_created_at_index	2019-03-24 16:58:20.485127+06
90	wagtailimages	0009_capitalizeverbose	2019-03-24 16:58:20.491664+06
91	wagtailimages	0010_change_on_delete_behaviour	2019-03-24 16:58:20.498478+06
92	wagtailimages	0011_image_collection	2019-03-24 16:58:20.504996+06
93	wagtailimages	0012_copy_image_permissions_to_collections	2019-03-24 16:58:20.511386+06
94	wagtailimages	0013_make_rendition_upload_callable	2019-03-24 16:58:20.519474+06
95	wagtailimages	0014_add_filter_spec_field	2019-03-24 16:58:20.527991+06
96	wagtailimages	0015_fill_filter_spec_field	2019-03-24 16:58:20.53564+06
97	wagtailimages	0016_deprecate_rendition_filter_relation	2019-03-24 16:58:20.543506+06
98	wagtailimages	0017_reduce_focal_point_key_max_length	2019-03-24 16:58:20.550741+06
99	wagtailimages	0018_remove_rendition_filter	2019-03-24 16:58:20.558684+06
100	wagtailimages	0019_delete_filter	2019-03-24 16:58:20.566152+06
101	wagtailimages	0020_add-verbose-name	2019-03-24 16:58:20.573468+06
102	wagtailimages	0021_image_file_hash	2019-03-24 16:58:20.580016+06
103	wagtailredirects	0001_initial	2019-03-24 16:58:20.681635+06
104	wagtailredirects	0002_add_verbose_names	2019-03-24 16:58:20.74176+06
105	wagtailredirects	0003_make_site_field_editable	2019-03-24 16:58:20.785391+06
106	wagtailredirects	0004_set_unique_on_path_and_site	2019-03-24 16:58:20.853258+06
107	wagtailredirects	0005_capitalizeverbose	2019-03-24 16:58:20.971124+06
108	wagtailredirects	0006_redirect_increase_max_length	2019-03-24 16:58:21.012958+06
109	wagtailsearch	0001_initial	2019-03-24 16:58:21.23136+06
110	wagtailsearch	0002_add_verbose_names	2019-03-24 16:58:21.32152+06
111	wagtailsearch	0003_remove_editors_pick	2019-03-24 16:58:21.36086+06
112	wagtailsearch	0004_querydailyhits_verbose_name_plural	2019-03-24 16:58:21.374459+06
113	wagtailusers	0001_initial	2019-03-24 16:58:21.453508+06
114	wagtailusers	0002_add_verbose_name_on_userprofile	2019-03-24 16:58:21.511827+06
115	wagtailusers	0003_add_verbose_names	2019-03-24 16:58:21.547689+06
116	wagtailusers	0004_capitalizeverbose	2019-03-24 16:58:21.656713+06
117	wagtailusers	0005_make_related_name_wagtail_specific	2019-03-24 16:58:21.695587+06
118	wagtailusers	0006_userprofile_prefered_language	2019-03-24 16:58:21.761253+06
119	wagtailusers	0007_userprofile_current_time_zone	2019-03-24 16:58:21.836805+06
120	wagtailusers	0008_userprofile_avatar	2019-03-24 16:58:21.906884+06
121	wagtailusers	0009_userprofile_verbose_name_plural	2019-03-24 16:58:21.939358+06
122	wagtailimages	0001_squashed_0021	2019-03-24 16:58:21.951755+06
123	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2019-03-24 16:58:21.962025+06
124	home	0004_auto_20190324_1119	2019-03-24 17:19:36.84221+06
125	home	0005_primarysitesettings_footer_logo	2019-03-24 17:20:48.606118+06
126	home	0006_auto_20190324_1125	2019-03-24 17:25:31.963378+06
127	home	0007_auto_20190324_1139	2019-03-24 17:39:08.923511+06
128	home	0008_auto_20190324_1233	2019-03-24 18:33:08.331148+06
129	home	0009_auto_20190324_1241	2019-03-24 18:41:30.666818+06
130	home	0010_contactsettings_contact_desc	2019-03-24 18:50:26.253422+06
131	home	0011_auto_20190324_1254	2019-03-24 18:54:25.335133+06
132	home	0012_partnerimgsettings_partneritem	2019-03-24 18:59:16.574914+06
133	home	0013_partneritem_alt_text	2019-03-24 19:02:51.307237+06
134	home	0014_partneritem_ptnr_url	2019-03-24 19:06:30.018124+06
135	home	0015_auto_20190324_1308	2019-03-24 19:08:31.62716+06
136	home	0016_primarysitesettings_copyright_text	2019-03-24 19:17:10.686322+06
137	home	0017_homepage_content	2019-03-31 17:28:23.276004+06
138	home	0018_auto_20190331_1133	2019-03-31 17:33:13.649999+06
139	home	0019_auto_20190331_1144	2019-03-31 17:44:41.137308+06
140	home	0020_auto_20190331_1147	2019-03-31 17:48:26.305164+06
141	home	0021_auto_20190331_1205	2019-03-31 18:10:45.432674+06
142	home	0022_auto_20190331_1209	2019-03-31 18:10:45.490236+06
143	home	0023_auto_20190331_1209	2019-03-31 18:10:45.59535+06
144	home	0024_auto_20190331_1211	2019-03-31 18:11:04.256901+06
145	home	0025_auto_20190401_0856	2019-04-01 14:56:32.720736+06
146	home	0026_auto_20190401_0958	2019-04-01 15:58:43.0316+06
147	home	0027_auto_20190401_1005	2019-04-01 16:05:32.525303+06
148	home	0028_auto_20190401_1009	2019-04-01 16:09:51.960321+06
149	home	0029_achievementcount_icon	2019-04-01 16:17:27.714654+06
150	home	0030_homepage_achiev_bg	2019-04-01 16:23:37.495638+06
151	home	0031_auto_20190401_1028	2019-04-01 16:28:43.633667+06
152	home	0032_auto_20190401_1039	2019-04-01 16:42:50.770073+06
153	home	0033_servicesicontext	2019-04-01 16:46:09.245096+06
154	home	0034_auto_20190402_0708	2019-04-02 13:08:42.209287+06
155	article	0001_initial	2019-04-02 14:11:56.670842+06
156	article	0002_articlepage	2019-04-02 14:13:34.679936+06
157	home	0035_simplepage	2019-04-02 15:29:57.327202+06
158	home	0036_auto_20190402_0941	2019-04-02 15:41:59.303671+06
159	article	0003_auto_20190403_1022	2019-04-03 16:22:02.395804+06
160	article	0004_auto_20190403_1058	2019-04-03 16:58:57.632901+06
161	article	0005_auto_20190403_1101	2019-04-03 17:01:08.346388+06
162	article	0006_articlepage_hit_count	2019-04-04 13:10:04.325726+06
163	article	0007_auto_20190404_0719	2019-04-04 13:19:07.383259+06
164	article	0008_auto_20190404_0724	2019-04-04 13:24:51.449892+06
165	article	0009_articlepage_like_count	2019-04-04 13:32:42.435377+06
166	wagtailmenus	0001_initial	2019-04-07 13:17:44.78119+06
167	wagtailmenus	0002_auto_20160129_0901	2019-04-07 13:17:44.818703+06
168	wagtailmenus	0003_auto_20160129_2339	2019-04-07 13:17:44.942638+06
169	wagtailmenus	0004_auto_20160130_0024	2019-04-07 13:17:44.980869+06
170	wagtailmenus	0005_auto_20160130_2209	2019-04-07 13:17:45.142518+06
171	wagtailmenus	0006_auto_20160131_1347	2019-04-07 13:17:45.195333+06
172	wagtailmenus	0007_auto_20160131_2000	2019-04-07 13:17:45.331025+06
173	wagtailmenus	0008_auto_20160131_2327	2019-04-07 13:17:45.684576+06
174	wagtailmenus	0009_auto_20160201_0859	2019-04-07 13:17:45.718792+06
175	wagtailmenus	0010_auto_20160201_1558	2019-04-07 13:17:45.774457+06
176	wagtailmenus	0011_auto_20160415_1519	2019-04-07 13:17:45.83836+06
177	wagtailmenus	0012_auto_20160419_0039	2019-04-07 13:17:46.074644+06
178	wagtailmenus	0013_auto_20160423_1124	2019-04-07 13:17:46.177508+06
179	wagtailmenus	0014_auto_20160423_1339	2019-04-07 13:17:46.233909+06
180	wagtailmenus	0015_auto_20160423_1348	2019-04-07 13:17:46.285843+06
181	wagtailmenus	0016_auto_20160930_0645	2019-04-07 13:17:46.442114+06
182	wagtailmenus	0017_auto_20161013_1658	2019-04-07 13:17:46.719074+06
183	wagtailmenus	0018_auto_20161204_2043	2019-04-07 13:17:46.820656+06
184	wagtailmenus	0019_auto_20161204_2143	2019-04-07 13:17:46.847253+06
185	wagtailmenus	0020_auto_20161210_0004	2019-04-07 13:17:47.021928+06
186	wagtailmenus	0021_auto_20170106_2352	2019-04-07 13:17:47.072664+06
187	wagtailmenus	0022_auto_20170913_2125	2019-04-07 13:17:47.126227+06
188	home	0037_primarysitesettings_txt_ph_nmb_footer	2019-04-07 15:06:53.792466+06
189	home	0038_primarysitesettings_qt_disclaimer	2019-04-07 15:47:23.352356+06
190	home	0039_auto_20190407_0950	2019-04-07 15:50:39.834141+06
191	quotes	0001_initial	2019-04-07 15:58:27.464656+06
192	quotes	0002_lead_dob	2019-04-07 18:20:29.167138+06
193	article	0010_auto_20190409_0724	2019-04-09 13:24:54.820194+06
194	home	0040_auto_20190409_1101	2019-04-09 17:01:42.513468+06
195	home	0041_auto_20190409_1130	2019-04-09 17:30:17.561473+06
196	home	0042_auto_20190409_1132	2019-04-09 17:32:14.554578+06
197	home	0043_auto_20190409_1154	2019-04-09 17:54:19.642536+06
198	home	0044_homepage_prom_bg	2019-04-10 13:26:04.826632+06
199	home	0045_auto_20190410_0745	2019-04-10 13:45:05.69276+06
200	home	0046_auto_20190410_0755	2019-04-10 13:55:14.02427+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
t8nlgc865ldl0dkkb47tx3zjv8ayjomd	ZDAwNjA5ZWE2N2UzOWU3MTEzMjEzYmQ4M2VmM2U4YmU3ZGQwODQ5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTFkYTQxYmNmMmQxMjU4YmE3YjFmOTE5MmU0NDE1NzYyYzRkNTYzIn0=	2019-04-07 17:00:04.4973+06
1j8bbkd58l36ern53b03jdmiiketllk2	MTUwYjUyZjRkMDIwOGY1ZDY0YTgzYTE5M2JhNjg1ZGJiNGE1OTM4Nzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NWM3NjZmMzQ2NTlhYmEzMWY3Nzk2YjhmMzE5MWY5OTZkMzM3OWYyIn0=	2019-04-14 16:38:59.897792+06
rbcm99asn7fzrhvyo9fspuvwxvhxbxw2	ZDAwNjA5ZWE2N2UzOWU3MTEzMjEzYmQ4M2VmM2U4YmU3ZGQwODQ5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTFkYTQxYmNmMmQxMjU4YmE3YjFmOTE5MmU0NDE1NzYyYzRkNTYzIn0=	2019-04-21 12:17:58.292094+06
c8e6951zdccwfldp47kriohb95r3c332	ZDAwNjA5ZWE2N2UzOWU3MTEzMjEzYmQ4M2VmM2U4YmU3ZGQwODQ5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTFkYTQxYmNmMmQxMjU4YmE3YjFmOTE5MmU0NDE1NzYyYzRkNTYzIn0=	2019-04-23 12:06:27.267413+06
hel1kbunuytpnholamyhpfhzpwraorcy	ZDAwNjA5ZWE2N2UzOWU3MTEzMjEzYmQ4M2VmM2U4YmU3ZGQwODQ5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTFkYTQxYmNmMmQxMjU4YmE3YjFmOTE5MmU0NDE1NzYyYzRkNTYzIn0=	2019-04-24 13:26:19.148465+06
wiesdxvojmu7q2722k6wnmktuvmq91or	ZDAwNjA5ZWE2N2UzOWU3MTEzMjEzYmQ4M2VmM2U4YmU3ZGQwODQ5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTFkYTQxYmNmMmQxMjU4YmE3YjFmOTE5MmU0NDE1NzYyYzRkNTYzIn0=	2019-04-24 13:46:36.848189+06
s1w6jnhqhiuplw50qq9zk0jitghjuzjc	ZDAwNjA5ZWE2N2UzOWU3MTEzMjEzYmQ4M2VmM2U4YmU3ZGQwODQ5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTFkYTQxYmNmMmQxMjU4YmE3YjFmOTE5MmU0NDE1NzYyYzRkNTYzIn0=	2019-04-25 12:58:50.037205+06
dau83c2avq84p6iarentgp8688p1ah4o	ZDAwNjA5ZWE2N2UzOWU3MTEzMjEzYmQ4M2VmM2U4YmU3ZGQwODQ5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTFkYTQxYmNmMmQxMjU4YmE3YjFmOTE5MmU0NDE1NzYyYzRkNTYzIn0=	2019-04-25 13:01:48.907765+06
\.


--
-- Data for Name: home_achievementcount; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_achievementcount (id, sort_order, name, count, page_id, icon) FROM stdin;
1	0	happy customers	5479	3	pe-7s-smile
2	1	Insurance Coverage	844	3	pe-7s-rocket
3	2	our agents	121	3	pe-7s-add-user
4	3	service points	22	3	pe-7s-global
\.


--
-- Data for Name: home_baseicontext; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_baseicontext (id, icon, name, "desc") FROM stdin;
5	fa fa-line-chart	Large Rate Increase	Contrary to popular belief, Lorem Ipsum is not simply random text.
6	flaticon-medical-medical51	Medicare Coverage	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.
3	fa fa-thumbs-up	Reliable	It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
4	fa fa-shield	Secured	The point of using Lorem Ipsum is that it has a more-or-less normal distrib
1	fa fa-heartbeat	Guided Online Experience	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believabl
2	fa fa-search-plus	Over 800+ Insurances	All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combin
7	fa fa-cart-plus	Personalized Recommendation	orem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC.
8	fa fa-address-book-o	1 min Quote	The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum".
9	fa fa-user-md	Qualified Doctors	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia quasiqui invent cumque nulla!
10	flaticon-medical-hospital37	General Medical	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
\.


--
-- Data for Name: home_contactitem; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_contactitem (id, sort_order, contact_icon, contact_url, cnct_settings_id, contact_text) FROM stdin;
1	0	fa fa-map-marker	http://www.coasmdasd.com	1	sdfgsdgert
2	1	fa fa-phone	http://www.coasmdasd.com	1	asfdsadfgsregh
3	2	fa fa-envelope-o	http://www.coasmdasd.com	1	serfgdfgdfg
4	3	fa fa-globe	http://www.coasmdasd.com	1	wsgfeth rtg aergefg
\.


--
-- Data for Name: home_contactsettings; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_contactsettings (id, site_id, contact_desc) FROM stdin;
1	2	\N
\.


--
-- Data for Name: home_homepage; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_homepage (page_ptr_id, banner_bg_id, banner_qt_text, banner_slogan, why_choose_desc, why_choose_heading, why_choose_img_id, achiev_bg_id, srvc_desc, srvc_heading, ins_desc, ins_heading, prom_article_id, prom_custom_desc, prom_custom_heading, prom_custom_url, prom_custom_url_text, prom_bg_id) FROM stdin;
3	1	Quick Compare Insurance Plans and Save Money!	find the right health insurance and start immediately	<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>	Why People <span>Choose</span> Us ?	11	\N	dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf	Our <span>Services</span>	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!	Popular <span>Health Insurance</span> Options	7	tjtfjtyu	wesehtyj	http://wejrewr.com	eryrtydfggfdf	17
\.


--
-- Data for Name: home_insurancepolicy; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_insurancepolicy (id, sort_order, name, "desc", facilities, img_id, page_id) FROM stdin;
1	0	STM	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>	[{"type": "facility", "value": {"title": "asdasd", "image": 14, "desc": "sdgdfghg"}, "id": "3c41955a-92bf-4695-86a1-23a4e5cc6b36"}, {"type": "facility", "value": {"title": "dsfg", "image": 15, "desc": "ert"}, "id": "5e68952d-6b01-4d98-a4ac-78f951fdc797"}, {"type": "facility", "value": {"title": "fdgfdg", "image": 14, "desc": "sertert"}, "id": "531721a3-2a9e-4fc6-955c-43c9f16887dc"}, {"type": "facility", "value": {"title": "gdhjh", "image": 14, "desc": "ftgyhrtyty"}, "id": "ddef33cd-8c23-4281-93db-4ebb2721bccc"}]	13	3
2	1	Limited	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>	[{"type": "facility", "value": {"title": "errr", "image": 15, "desc": "ffff"}, "id": "ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff"}, {"type": "facility", "value": {"title": "awe", "image": 15, "desc": "qwe"}, "id": "58bb7574-473e-4eeb-b54c-36569a1e2f6a"}, {"type": "facility", "value": {"title": "dfgrrw", "image": 14, "desc": "erwerxc"}, "id": "d81d1d1f-642e-47f7-b61d-96a01c04a2f6"}, {"type": "facility", "value": {"title": "srteerer", "image": 15, "desc": "fgcvncvbv"}, "id": "14a1b847-aa9d-4de1-bff5-cf1db0ea28d3"}]	13	3
\.


--
-- Data for Name: home_partnerimgsettings; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_partnerimgsettings (id, site_id) FROM stdin;
1	2
\.


--
-- Data for Name: home_partneritem; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_partneritem (id, sort_order, main_settings_id, alt_text, ptnr_url, logo_id) FROM stdin;
6	0	1	\N	\N	3
7	1	1	\N	\N	4
8	2	1	\N	\N	5
9	3	1	\N	\N	6
10	4	1	\N	\N	7
\.


--
-- Data for Name: home_primarysitesettings; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_primarysitesettings (id, favicon_id, logo_id, phone_number, txt_ph_nmb, site_id, qt_heading, footer_logo_id, copyright_text, txt_ph_nmb_footer, qt_disclaimer) FROM stdin;
2	18	8	+1 234 5678	Speak to an agent	2	Get your preferable quote	9	Copyright ©2018 MediGapDirect. All rights reserved	Call us right now !!	<p>* By clicking on the submit button, by completing a contact form on this site or calling a number posted on this site, you represent that you are at least 18 years old and agree to our Privacy Policy and Terms of Use. You provide your signature expressly consenting to be contacted by eAgent Direct, Inc. and/or its partner companies and any of their commercial partners concerning the purchase of policies for health and other types of insurance including personal property and casualty insurance, even if you are on a state or federal Do Not Call Registry. You may be directed to a licensed sales agent who can answer your questions and provide information about Medicare related insurance plans. Agents are not connected with or endorsed by the U.S. government or the federal Medicare program. You agree to be contacted through the use of emails or on your landline or mobile phone by live operators, automated telephone dialing systems, pre-recorded messages, and/or text/voice messages or email. Your phone carrier’s message and data rates may apply. Your consent is not a condition of purchase and you may revoke your consent at any time. You may also call (833) 403-6274 to inquire and/or purchase. To buy a plan, you must complete an application process with one of our partners that is licensed to sell insurance products and that will provide you more definitive information on plan prices, benefits, availability, and other details.</p>
\.


--
-- Data for Name: home_quoteformfield; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_quoteformfield (id, sort_order, label, field_type, required, choices, default_value, help_text, page_id) FROM stdin;
5	0	First Name	singleline	t				11
6	1	Middle Name	singleline	f				11
7	2	Last Name	singleline	t				11
8	3	Date of birth	date	t				11
10	4	Phone	singleline	t				11
11	5	Alternate Phone	singleline	t				11
9	6	Email	email	t				11
12	7	Zip Code	singleline	t				11
\.


--
-- Data for Name: home_quoteformpage; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_quoteformpage (page_ptr_id, small_desc, ty_text) FROM stdin;
11	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>	<p>dvbsdfgnfgbea gfasd fdvdfv</p>
\.


--
-- Data for Name: home_servicesicontext; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_servicesicontext (baseicontext_ptr_id, sort_order, page_id) FROM stdin;
1	0	3
2	1	3
7	2	3
8	3	3
9	4	3
10	5	3
\.


--
-- Data for Name: home_simplepage; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_simplepage (page_ptr_id, content, heading_bg_id, slogan_img_id, slogan_txt) FROM stdin;
8	<p></p>	\N	\N	<p></p>
9	<h3><b>Where does it come from?</b></h3><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p></p><h3><b>Why?</b></h3><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>	13	14	<p>rehtona erachtlaeh noitpo si a ycilop noitidda nwonk sa efil ro lacitirc ssenlli .egarevoc htiw siht latnemelppus, egarevoc eht ecnarusni ynapmoc si ,gnieerga ni ,ecnavda ot yap a mus-pmul tnemyap ot elpoep ohw era desongaid htiw niatrec ,sesaesid gnidulcni s’remiehzla ,esaesid elpitlum.</p><p><b>sisorelcs s’nosnikrap esaesid dna erom.</b></p>
12	<h2>What is Lorem Ipsum?</h2><p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#x27;lorem ipsum&#x27; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>	13	15	<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;.</p>
13	<h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><h2>Where can I get some?</h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>	1	7	<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage</p>
14	<ol><li><b>The standard Lorem Ipsum passage, used since the 1500s:</b> &quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</li><li><b>de Finibus Bonorum et Malorum:</b> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham:</b> But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li><li><b>The standard Lorem Ipsum passage, used since the 1500s:</b> &quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</li><li><b>de Finibus Bonorum et Malorum:</b> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham:</b> But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li></ol><p></p>	16	3	<p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.</p>
15	<ol><li><b>de Finibus Bonorum et Malorum:</b> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham:</b> But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li><li><b>The standard Lorem Ipsum passage, used since the 1500s:</b> &quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</li><li><b>de Finibus Bonorum et Malorum:</b> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham:</b> But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li></ol><p></p>	13	14	<p>I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.</p>
16	<h3><b>Section 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC</b></h3><p>&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;</p><h3><b>1914 translation by H. Rackham</b></h3><p>&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>	16	5	<p>her hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are</p>
\.


--
-- Data for Name: home_socialitem; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_socialitem (id, sort_order, sm_icon, sm_url, sm_settings_id) FROM stdin;
1	0	fa fa-facebook	https://www.facebook.com/wall.e.buet	1
2	1	fa fa-twitter	https://www.facebook.com/wallasdadasd	1
3	2	fa fa-skype	https://www.facebook.com/	1
\.


--
-- Data for Name: home_socialmediasettings; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_socialmediasettings (id, site_id) FROM stdin;
1	2
\.


--
-- Data for Name: home_whychooseicontext; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.home_whychooseicontext (sort_order, page_id, baseicontext_ptr_id) FROM stdin;
0	3	5
1	3	6
2	3	3
3	3	4
\.


--
-- Data for Name: quotes_lead; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.quotes_lead (id, first_name, middle_name, last_name, email, phone, phone2, zip_code, created_time, dob) FROM stdin;
1	Debashis	qwe	Roy Bhowmik	debashis.buet08@gmail.com	1911581929	asd	1209	2019-04-07 17:10:08.615465+06	\N
2	Debashis	ewrwrwe	Roy Bhowmik	debashis.buet08@gmail.com	1911581929	erwer	12094	2019-04-07 17:56:25.08288+06	\N
3	Debashis		Roy Bhowmik	debashis.buet08@gmail.com	1911581929	asdad	12095	2019-04-07 18:20:37.962087+06	1990-07-24
4	\N		\N	debashis.buet08@gmail.com	\N	\N	\N	2019-04-11 13:19:40.732107+06	\N
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
1	Banner Background	banner-background
2	favicon	favicon
3	partner	partner
4	logo	logo
5	sdadasd	sdadasd
6	why choose	why-choose
7	insurance policy	insurance-policy
8	insurance benefit	insurance-benefit
9	ek	ek
10	nambar	nambar
11	dui	dui
12	hudai	hudai
13	article sidebar	article-sidebar
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	1	5	1
2	2	5	2
3	3	5	3
4	4	5	3
5	5	5	3
6	6	5	3
7	7	5	3
8	8	5	4
9	9	5	4
11	11	5	6
12	12	5	6
13	13	5	7
14	14	5	8
15	15	5	8
16	16	5	13
17	18	5	2
\.


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	2
2	1	2	2
3	1	1	3
4	1	2	3
5	1	1	5
6	1	2	5
7	1	1	6
8	1	2	6
\.


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at, draft_title) FROM stdin;
16	000100010009	3	0	About Us	about-us	t	f	/home/about-us/		t		\N	\N	f	42	1	f	2019-04-11 17:17:24.903109+06	2019-04-11 17:17:24.949039+06	89	2019-04-11 17:17:24.949039+06	About Us
11	000100010004	3	0	Get a Quote	get-a-quote	t	f	/home/get-a-quote/	Get a Free Quote	t		\N	\N	f	51	1	f	2019-04-11 17:06:10.966616+06	2019-04-10 18:03:27.596091+06	82	2019-04-11 17:06:11.029585+06	Get a Quote
5	000100010001	3	2	All Articles	article	t	f	/home/article/	Articles about Health Insurance	t		\N	\N	f	40	3	f	2019-04-11 17:19:35.248241+06	2019-04-02 14:20:26.644934+06	91	2019-04-11 17:19:35.289291+06	All Articles
12	000100010005	3	0	Medicare Advantage	medicare-advantage	t	f	/home/medicare-advantage/		t		\N	\N	f	42	1	f	2019-04-11 17:08:29.018843+06	2019-04-11 17:07:58.611278+06	84	2019-04-11 17:08:29.065807+06	Medicare Advantage
6	0001000100010001	4	0	article one	article-one	t	f	/home/article/article-one/		f		\N	\N	f	41	3	f	2019-04-11 17:20:24.786457+06	2019-04-02 14:21:04.97449+06	93	2019-04-11 17:20:25.0434+06	article one
13	000100010006	3	0	ACA/obamacare	obamacare	t	f	/home/obamacare/	ACA / Obamacare	t		\N	\N	f	42	1	f	2019-04-11 17:10:01.727356+06	2019-04-11 17:10:01.773677+06	85	2019-04-11 17:10:01.773677+06	ACA/obamacare
14	000100010007	3	0	Terms & Conditions	terms-conditions	t	f	/home/terms-conditions/		t		\N	\N	f	42	1	f	2019-04-11 17:13:55.551617+06	2019-04-11 17:13:07.013611+06	87	2019-04-11 17:13:55.809142+06	Terms & Conditions
8	000100010002	3	0	Medigap	medigap	t	f	/home/medigap/		t		\N	\N	f	42	3	f	2019-04-07 13:29:24.098907+06	2019-04-02 15:44:24.144494+06	44	2019-04-07 13:29:24.137736+06	Medigap
9	000100010003	3	0	Life/Final Expense	life-final-expense	t	f	/home/life-final-expense/		t		\N	\N	f	42	3	f	2019-04-07 13:29:31.588621+06	2019-04-02 15:44:50.613033+06	45	2019-04-07 13:29:31.840593+06	Life/Final Expense
15	000100010008	3	0	Privacy & Policies	privacy-policies	t	f	/home/privacy-policies/		t		\N	\N	f	42	1	f	2019-04-11 17:14:30.708176+06	2019-04-11 17:14:30.744344+06	88	2019-04-11 17:14:30.744344+06	Privacy & Policies
3	00010001	2	9	Medigap Direct	home	t	f	/home/	Medigap Direct | Reliable Health Insurance	t		\N	\N	f	2	\N	f	2019-04-11 16:58:54.20888+06	2019-03-24 17:27:34.499151+06	80	2019-04-11 16:58:54.310718+06	Medigap Direct
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Root
7	0001000100010002	4	0	article two	article-two	t	f	/home/article/article-two/		f		\N	\N	f	41	3	f	2019-04-03 17:06:40.713837+06	2019-04-02 14:21:12.792392+06	40	2019-04-03 17:06:40.771469+06	article two
\.


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
32	f	2019-04-02 17:14:53.105315+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "life-final-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/life-final-expense/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:50.613Z", "last_published_at": "2019-04-02T10:52:48.443Z", "latest_revision_created_at": "2019-04-02T10:52:48.374Z", "live_revision": 31, "heading_bg": 13, "slogan_txt": "<p>rehtona erachtlaeh noitpo si a ycilop noitidda nwonk sa efil ro lacitirc ssenlli .egarevoc htiw siht latnemelppus, egarevoc eht ecnarusni ynapmoc si ,gnieerga ni ,ecnavda ot yap a mus-pmul tnemyap ot elpoep ohw era desongaid htiw niatrec ,sesaesid gnidulcni s\\u2019remiehzla ,esaesid elpitlum, sisorelcs s\\u2019nosnikrap esaesid dna erom.</p>", "slogan_img": 14, "content": "<p></p>"}	\N	9	3
83	f	2019-04-11 17:07:58.566799+06	{"pk": 12, "path": "000100010005", "depth": 3, "numchild": 0, "title": "Medicare Advantage", "draft_title": "Medicare Advantage", "slug": "medicare-advantage", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/home/medicare-advantage/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "heading_bg": 13, "slogan_txt": "<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>", "slogan_img": 18, "content": "<h2>What is Lorem Ipsum?</h2><p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#x27;lorem ipsum&#x27; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>"}	\N	12	1
35	f	2019-04-02 17:48:17.4619+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "All Articles", "draft_title": "All Articles", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/", "owner": 3, "seo_title": "komu naa", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-02T09:45:06.664Z", "latest_revision_created_at": "2019-04-02T09:45:06.598Z", "live_revision": 27, "feature_bg": 12}	\N	5	3
79	f	2019-04-11 16:56:56.113185+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 4, "title": "Medigap Direct", "draft_title": "Medigap Direct", "slug": "home", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "Medigap Direct | Reliable Health Insurance", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-11T10:55:47.961Z", "latest_revision_created_at": "2019-04-11T10:55:47.873Z", "live_revision": 78, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_bg": 17, "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 5, "icon": "fa fa-line-chart", "name": "Large Rate Increase", "desc": "Contrary to popular belief, Lorem Ipsum is not simply random text.", "sort_order": 0, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "Medicare Coverage", "desc": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.", "sort_order": 1, "page": 3}, {"pk": 3, "icon": "fa fa-thumbs-up", "name": "Reliable", "desc": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", "sort_order": 2, "page": 3}, {"pk": 4, "icon": "fa fa-shield", "name": "Secured", "desc": "The point of using Lorem Ipsum is that it has a more-or-less normal distrib", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "fa fa-heartbeat", "name": "Guided Online Experience", "desc": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believabl", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "fa fa-search-plus", "name": "Over 800+ Insurances", "desc": "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combin", "sort_order": 1, "page": 3}, {"pk": 7, "icon": "fa fa-cart-plus", "name": "Personalized Recommendation", "desc": "orem Ipsum comes from sections 1.10.32 and 1.10.33 of \\"de Finibus Bonorum et Malorum\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC.", "sort_order": 2, "page": 3}, {"pk": 8, "icon": "fa fa-address-book-o", "name": "1 min Quote", "desc": "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\"de Finibus Bonorum et Malorum\\".", "sort_order": 3, "page": 3}, {"pk": 9, "icon": "fa fa-user-md", "name": "Qualified Doctors", "desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia quasiqui invent cumque nulla!", "sort_order": 4, "page": 3}, {"pk": 10, "icon": "flaticon-medical-hospital37", "name": "General Medical", "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", "sort_order": 5, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
76	f	2019-04-11 16:43:51.408203+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 4, "title": "Medigap Direct", "draft_title": "Medigap Direct", "slug": "home", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "Medigap Direct | Reliable Health Insurance", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-11T10:39:28.433Z", "latest_revision_created_at": "2019-04-11T10:39:28.352Z", "live_revision": 75, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_bg": 17, "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 5, "icon": "fa fa-line-chart", "name": "Large Rate Increase", "desc": "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.", "sort_order": 0, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "Medicare Coverage", "desc": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.", "sort_order": 1, "page": 3}, {"pk": 3, "icon": "fa fa-thumbs-up", "name": "Reliable", "desc": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", "sort_order": 2, "page": 3}, {"pk": 4, "icon": "fa fa-shield", "name": "Secured", "desc": "The point of using Lorem Ipsum is that it has a more-or-less normal distrib", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
74	f	2019-04-11 15:32:26.163311+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 4, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "home", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-10T07:28:34.640Z", "latest_revision_created_at": "2019-04-10T07:28:34.556Z", "live_revision": 58, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_bg": 17, "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
57	f	2019-04-09 17:44:01.981382+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:43:40.759Z", "latest_revision_created_at": "2019-04-09T11:43:40.670Z", "live_revision": 56, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
54	f	2019-04-09 17:42:45.053907+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:40:50.601Z", "latest_revision_created_at": "2019-04-09T11:40:50.501Z", "live_revision": 53, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": 7, "prom_custom_heading": null, "prom_custom_desc": "", "prom_custom_url": null, "prom_custom_url_text": null, "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
52	f	2019-04-09 17:39:04.802693+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:15:27.153Z", "latest_revision_created_at": "2019-04-09T11:15:27.070Z", "live_revision": 51, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": 7, "prom_custom_heading": "rgshg sfdgh dfgh", "prom_custom_desc": "ertertertrty", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "fdkj f ff", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
46	f	2019-04-07 13:34:02.234633+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-02T07:21:28.681Z", "latest_revision_created_at": "2019-04-02T07:21:28.607Z", "live_revision": 18, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
18	f	2019-04-02 13:21:28.607776+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-02T07:19:59.025Z", "latest_revision_created_at": "2019-04-02T07:19:58.961Z", "live_revision": 17, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": null, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	3
84	f	2019-04-11 17:08:29.018843+06	{"pk": 12, "path": "000100010005", "depth": 3, "numchild": 0, "title": "Medicare Advantage", "draft_title": "Medicare Advantage", "slug": "medicare-advantage", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/home/medicare-advantage/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-11T11:07:58.611Z", "last_published_at": "2019-04-11T11:07:58.611Z", "latest_revision_created_at": "2019-04-11T11:07:58.566Z", "live_revision": 83, "heading_bg": 13, "slogan_txt": "<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;.</p>", "slogan_img": 15, "content": "<h2>What is Lorem Ipsum?</h2><p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#x27;lorem ipsum&#x27; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>"}	\N	12	1
12	f	2019-04-01 16:20:07.35656+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T10:11:31.745Z", "latest_revision_created_at": "2019-04-01T10:11:31.676Z", "live_revision": 11, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achievement_count": [{"pk": null, "sort_order": 0, "page": 3, "name": "happy customers", "count": "5,479", "icon": "pe-7s-smile"}, {"pk": null, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": "844", "icon": "pe-7s-rocket"}, {"pk": null, "sort_order": 2, "page": 3, "name": "our agents", "count": "121", "icon": "pe-7s-add-user"}, {"pk": null, "sort_order": 3, "page": 3, "name": "service points", "count": "22", "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 1, "sort_order": 0, "page": 3, "icon": "flaticon-medical-ambulance14", "name": "Self-Employed", "desc": "sadf"}, {"pk": 2, "sort_order": 1, "page": 3, "icon": "flaticon-medical-illness", "name": "Single Parents", "desc": "sfdgdfgasd"}, {"pk": 3, "sort_order": 2, "page": 3, "icon": "flaticon-medical-stethoscope10", "name": "Avoid Tax Penalty", "desc": "dsfgrtg"}, {"pk": 4, "sort_order": 3, "page": 3, "icon": "flaticon-medical-medical51", "name": "Who Received Large Rate Increase", "desc": "lorem ipsum"}]}	\N	3	3
1	f	2019-03-24 17:27:34.454633+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "Home", "draft_title": "Home", "slug": "home", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": "", "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "achievement_count": []}	\N	3	1
36	f	2019-04-03 16:39:45.574066+06	{"pk": 7, "path": "0001000100010002", "depth": 4, "numchild": 0, "title": "article two", "draft_title": "article two", "slug": "article-two", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/article-two/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:12.792Z", "last_published_at": "2019-04-02T08:21:12.792Z", "latest_revision_created_at": "2019-04-02T08:21:12.753Z", "live_revision": 22, "feature_img": null, "content": "<h2><b>What is Lorem Ipsum?</b></h2><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p></p><h2><b>Why do we use it?</b></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#x27;lorem ipsum&#x27; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p></p><h2><b>Where does it come from?</b></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p></p><h2><b>Where can I get some?</b></h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>"}	\N	7	3
43	f	2019-04-07 13:29:17.589784+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "All Articles", "draft_title": "All Articles", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/", "owner": 3, "seo_title": "komu naa", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-02T11:48:17.796Z", "latest_revision_created_at": "2019-04-02T11:48:17.461Z", "live_revision": 35, "feature_bg": 12}	\N	5	1
85	f	2019-04-11 17:10:01.727356+06	{"pk": 13, "path": "000100010006", "depth": 3, "numchild": 0, "title": "ACA/obamacare", "draft_title": "ACA/obamacare", "slug": "obamacare", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/home/obamacare/", "owner": 1, "seo_title": "ACA / Obamacare", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "heading_bg": 1, "slogan_txt": "<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage</p>", "slogan_img": 7, "content": "<h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><h2>Where can I get some?</h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>"}	\N	13	1
33	f	2019-04-02 17:18:50.638625+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "life-final-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/life-final-expense/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:50.613Z", "last_published_at": "2019-04-02T11:14:53.170Z", "latest_revision_created_at": "2019-04-02T11:14:53.105Z", "live_revision": 32, "heading_bg": 13, "slogan_txt": "<p>rehtona erachtlaeh noitpo si a ycilop noitidda nwonk sa efil ro lacitirc ssenlli .egarevoc htiw siht latnemelppus, egarevoc eht ecnarusni ynapmoc si ,gnieerga ni ,ecnavda ot yap a mus-pmul tnemyap ot elpoep ohw era desongaid htiw niatrec ,sesaesid gnidulcni s\\u2019remiehzla ,esaesid elpitlum.</p><p><b>sisorelcs s\\u2019nosnikrap esaesid dna erom.</b></p>", "slogan_img": 14, "content": "<p></p>"}	\N	9	3
80	f	2019-04-11 16:58:54.20888+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 4, "title": "Medigap Direct", "draft_title": "Medigap Direct", "slug": "home", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "Medigap Direct | Reliable Health Insurance", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-11T10:56:56.223Z", "latest_revision_created_at": "2019-04-11T10:56:56.113Z", "live_revision": 79, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_bg": 17, "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "Popular <span>Health Insurance</span> Options", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 5, "icon": "fa fa-line-chart", "name": "Large Rate Increase", "desc": "Contrary to popular belief, Lorem Ipsum is not simply random text.", "sort_order": 0, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "Medicare Coverage", "desc": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.", "sort_order": 1, "page": 3}, {"pk": 3, "icon": "fa fa-thumbs-up", "name": "Reliable", "desc": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", "sort_order": 2, "page": 3}, {"pk": 4, "icon": "fa fa-shield", "name": "Secured", "desc": "The point of using Lorem Ipsum is that it has a more-or-less normal distrib", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "fa fa-heartbeat", "name": "Guided Online Experience", "desc": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believabl", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "fa fa-search-plus", "name": "Over 800+ Insurances", "desc": "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combin", "sort_order": 1, "page": 3}, {"pk": 7, "icon": "fa fa-cart-plus", "name": "Personalized Recommendation", "desc": "orem Ipsum comes from sections 1.10.32 and 1.10.33 of \\"de Finibus Bonorum et Malorum\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC.", "sort_order": 2, "page": 3}, {"pk": 8, "icon": "fa fa-address-book-o", "name": "1 min Quote", "desc": "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\"de Finibus Bonorum et Malorum\\".", "sort_order": 3, "page": 3}, {"pk": 9, "icon": "fa fa-user-md", "name": "Qualified Doctors", "desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia quasiqui invent cumque nulla!", "sort_order": 4, "page": 3}, {"pk": 10, "icon": "flaticon-medical-hospital37", "name": "General Medical", "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", "sort_order": 5, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 15, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
37	f	2019-04-03 16:42:11.300127+06	{"pk": 7, "path": "0001000100010002", "depth": 4, "numchild": 0, "title": "article two", "draft_title": "article two", "slug": "article-two", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/article-two/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:12.792Z", "last_published_at": "2019-04-03T10:39:45.617Z", "latest_revision_created_at": "2019-04-03T10:39:45.574Z", "live_revision": 36, "feature_img": null, "content": "<h2><b>What is Lorem Ipsum?</b></h2><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p></p><h2><b>Why do we use it?</b></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#x27;lorem ipsum&#x27; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p></p><h2><b>Where does it come from?</b></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p></p><h2><b>Where can I get some?</b></h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>"}	\N	7	3
44	f	2019-04-07 13:29:24.098907+06	{"pk": 8, "path": "000100010002", "depth": 3, "numchild": 0, "title": "Medigap", "draft_title": "Medigap", "slug": "medigap", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/medigap/", "owner": 3, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:24.144Z", "last_published_at": "2019-04-02T09:44:24.144Z", "latest_revision_created_at": "2019-04-02T09:44:24.074Z", "live_revision": 25, "heading_bg": null, "slogan_txt": "<p></p>", "slogan_img": null, "content": "<p></p>"}	\N	8	1
86	f	2019-04-11 17:13:06.973375+06	{"pk": 14, "path": "000100010007", "depth": 3, "numchild": 0, "title": "Terms & Conditions", "draft_title": "Terms & Conditions", "slug": "terms-conditions", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/home/terms-conditions/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "heading_bg": 16, "slogan_txt": "<p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.</p>", "slogan_img": 13, "content": "<ol><li><b>The standard Lorem Ipsum passage, used since the 1500s:  </b>&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</li><li><b>de Finibus Bonorum et Malorum: </b>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham: </b>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li><li><b>The standard Lorem Ipsum passage, used since the 1500s:  </b>&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</li><li><b>de Finibus Bonorum et Malorum: </b>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham: </b>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li></ol><p></p>"}	\N	14	1
14	f	2019-04-01 16:47:03.989031+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T10:27:54.093Z", "latest_revision_created_at": "2019-04-01T10:27:54.004Z", "live_revision": 13, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [], "services_icontext": []}	\N	3	3
38	f	2019-04-03 16:44:35.002101+06	{"pk": 7, "path": "0001000100010002", "depth": 4, "numchild": 0, "title": "article two", "draft_title": "article two", "slug": "article-two", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/article-two/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:12.792Z", "last_published_at": "2019-04-03T10:42:11.342Z", "latest_revision_created_at": "2019-04-03T10:42:11.300Z", "live_revision": 37, "feature_img": 13, "content": "<h2><b>What is Lorem Ipsum?</b></h2><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p></p><h2><b>Why do we use it?</b></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#x27;lorem ipsum&#x27; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p></p><h2><b>Where does it come from?</b></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p></p><h2><b>Where can I get some?</b></h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>"}	\N	7	3
34	f	2019-04-02 17:21:01.757953+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "life-final-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/life-final-expense/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:50.613Z", "last_published_at": "2019-04-02T11:18:50.901Z", "latest_revision_created_at": "2019-04-02T11:18:50.638Z", "live_revision": 33, "heading_bg": 13, "slogan_txt": "<p>rehtona erachtlaeh noitpo si a ycilop noitidda nwonk sa efil ro lacitirc ssenlli .egarevoc htiw siht latnemelppus, egarevoc eht ecnarusni ynapmoc si ,gnieerga ni ,ecnavda ot yap a mus-pmul tnemyap ot elpoep ohw era desongaid htiw niatrec ,sesaesid gnidulcni s\\u2019remiehzla ,esaesid elpitlum.</p><p><b>sisorelcs s\\u2019nosnikrap esaesid dna erom.</b></p>", "slogan_img": 14, "content": "<h3><b>Where does it come from?</b></h3><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p></p><h3><b>Why?</b></h3><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>"}	\N	9	3
45	f	2019-04-07 13:29:31.588621+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "life-final-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/life-final-expense/", "owner": 3, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:50.613Z", "last_published_at": "2019-04-02T11:21:01.830Z", "latest_revision_created_at": "2019-04-02T11:21:01.757Z", "live_revision": 34, "heading_bg": 13, "slogan_txt": "<p>rehtona erachtlaeh noitpo si a ycilop noitidda nwonk sa efil ro lacitirc ssenlli .egarevoc htiw siht latnemelppus, egarevoc eht ecnarusni ynapmoc si ,gnieerga ni ,ecnavda ot yap a mus-pmul tnemyap ot elpoep ohw era desongaid htiw niatrec ,sesaesid gnidulcni s\\u2019remiehzla ,esaesid elpitlum.</p><p><b>sisorelcs s\\u2019nosnikrap esaesid dna erom.</b></p>", "slogan_img": 14, "content": "<h3><b>Where does it come from?</b></h3><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p></p><h3><b>Why?</b></h3><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>"}	\N	9	1
3	f	2019-03-31 17:50:32.601748+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-03-31T10:39:42.914Z", "latest_revision_created_at": "2019-03-31T10:39:42.831Z", "live_revision": 2, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "achievement_count": []}	\N	3	3
20	f	2019-04-02 14:20:26.602183+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 0, "title": "Main Index page of Article", "draft_title": "Main Index page of Article", "slug": "main-index-page-article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/main-index-page-article/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "feature_bg": 13}	\N	5	3
13	f	2019-04-01 16:27:54.004709+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T10:20:07.614Z", "latest_revision_created_at": "2019-04-01T10:20:07.356Z", "live_revision": 12, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": "5479", "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": "844", "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": "121", "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": "22", "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 1, "sort_order": 0, "page": 3, "icon": "flaticon-medical-ambulance14", "name": "Self-Employed", "desc": "sadf"}, {"pk": 2, "sort_order": 1, "page": 3, "icon": "flaticon-medical-illness", "name": "Single Parents", "desc": "sfdgdfgasd"}, {"pk": 3, "sort_order": 2, "page": 3, "icon": "flaticon-medical-stethoscope10", "name": "Avoid Tax Penalty", "desc": "dsfgrtg"}, {"pk": 4, "sort_order": 3, "page": 3, "icon": "flaticon-medical-medical51", "name": "Who Received Large Rate Increase", "desc": "lorem ipsum"}]}	\N	3	3
11	f	2019-04-01 16:11:31.676537+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T10:07:22.920Z", "latest_revision_created_at": "2019-04-01T10:07:22.847Z", "live_revision": 10, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achievement_count": [], "whychoose_icontext": [{"pk": 1, "sort_order": 0, "page": 3, "icon": "flaticon-medical-ambulance14", "name": "Self-Employed", "desc": "sadf"}, {"pk": 2, "sort_order": 1, "page": 3, "icon": "flaticon-medical-illness", "name": "Single Parents", "desc": "sfdgdfgasd"}, {"pk": 3, "sort_order": 2, "page": 3, "icon": "flaticon-medical-stethoscope10", "name": "Avoid Tax Penalty", "desc": "dsfgrtg"}, {"pk": 4, "sort_order": 3, "page": 3, "icon": "flaticon-medical-medical51", "name": "Who Received Large Rate Increase", "desc": "lorem ipsum"}]}	\N	3	3
39	f	2019-04-03 17:06:23.571305+06	{"pk": 6, "path": "0001000100010001", "depth": 4, "numchild": 0, "title": "article one", "draft_title": "article one", "slug": "article-one", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/article-one/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:04.974Z", "last_published_at": "2019-04-02T08:21:04.974Z", "latest_revision_created_at": "2019-04-02T08:21:04.934Z", "live_revision": 21, "feature_img": null, "content": "<p>a</p>", "article_tags": [{"pk": null, "tag": 9, "content_object": 6}, {"pk": null, "tag": 10, "content_object": 6}]}	\N	6	3
87	f	2019-04-11 17:13:55.551617+06	{"pk": 14, "path": "000100010007", "depth": 3, "numchild": 0, "title": "Terms & Conditions", "draft_title": "Terms & Conditions", "slug": "terms-conditions", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/home/terms-conditions/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-11T11:13:07.013Z", "last_published_at": "2019-04-11T11:13:07.013Z", "latest_revision_created_at": "2019-04-11T11:13:06.973Z", "live_revision": 86, "heading_bg": 16, "slogan_txt": "<p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.</p>", "slogan_img": 3, "content": "<ol><li><b>The standard Lorem Ipsum passage, used since the 1500s:</b> &quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</li><li><b>de Finibus Bonorum et Malorum:</b> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham:</b> But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li><li><b>The standard Lorem Ipsum passage, used since the 1500s:</b> &quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</li><li><b>de Finibus Bonorum et Malorum:</b> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham:</b> But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li></ol><p></p>"}	\N	14	1
47	f	2019-04-09 13:27:12.325544+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "All Articles", "draft_title": "All Articles", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/", "owner": 3, "seo_title": "komu naa", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-07T07:29:17.630Z", "latest_revision_created_at": "2019-04-07T07:29:17.589Z", "live_revision": 43, "feature_bg": 12, "sidebar_form_main_heading": null, "sidebar_form_bg": 16, "sidebar_form_heading": null}	\N	5	1
40	f	2019-04-03 17:06:40.713837+06	{"pk": 7, "path": "0001000100010002", "depth": 4, "numchild": 0, "title": "article two", "draft_title": "article two", "slug": "article-two", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/article-two/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:12.792Z", "last_published_at": "2019-04-03T10:44:35.048Z", "latest_revision_created_at": "2019-04-03T10:44:35.002Z", "live_revision": 38, "feature_img": 13, "content": "<h2><b>What is Lorem Ipsum?</b></h2><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p></p><h2><b>Why do we use it?</b></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#x27;lorem ipsum&#x27; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p></p><h2><b>Where does it come from?</b></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p></p><h2><b>Where can I get some?</b></h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>", "article_tags": [{"pk": null, "tag": 10, "content_object": 7}, {"pk": null, "tag": 11, "content_object": 7}, {"pk": null, "tag": 12, "content_object": 7}]}	\N	7	3
21	f	2019-04-02 14:21:04.934968+06	{"pk": 6, "path": "0001000100010001", "depth": 4, "numchild": 0, "title": "article one", "draft_title": "article one", "slug": "article-one", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/main-index-page-article/article-one/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null}	\N	6	3
77	f	2019-04-11 16:47:49.534798+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 4, "title": "Medigap Direct", "draft_title": "Medigap Direct", "slug": "home", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "Medigap Direct | Reliable Health Insurance", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-11T10:43:51.503Z", "latest_revision_created_at": "2019-04-11T10:43:51.408Z", "live_revision": 76, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_bg": 17, "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 5, "icon": "fa fa-line-chart", "name": "Large Rate Increase", "desc": "Contrary to popular belief, Lorem Ipsum is not simply random text.", "sort_order": 0, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "Medicare Coverage", "desc": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.", "sort_order": 1, "page": 3}, {"pk": 3, "icon": "fa fa-thumbs-up", "name": "Reliable", "desc": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", "sort_order": 2, "page": 3}, {"pk": 4, "icon": "fa fa-shield", "name": "Secured", "desc": "The point of using Lorem Ipsum is that it has a more-or-less normal distrib", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
4	f	2019-04-01 15:36:03.025858+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-03-31T11:50:32.639Z", "latest_revision_created_at": "2019-03-31T11:50:32.601Z", "live_revision": 3, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": null, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": null, "why_choose_desc": "<p></p>", "achievement_count": [], "whychoose_icontext": []}	\N	3	3
41	f	2019-04-03 17:10:05.592485+06	{"pk": 6, "path": "0001000100010001", "depth": 4, "numchild": 0, "title": "article one", "draft_title": "article one", "slug": "article-one", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/article-one/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:04.974Z", "last_published_at": "2019-04-03T11:06:23.616Z", "latest_revision_created_at": "2019-04-03T11:06:23.571Z", "live_revision": 39, "feature_img": 12, "content": "<p>a</p>", "article_tags": [{"pk": null, "tag": 9, "content_object": 6}, {"pk": null, "tag": 10, "content_object": 6}]}	\N	6	3
51	f	2019-04-09 17:15:27.070447+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:14:38.485Z", "latest_revision_created_at": "2019-04-09T11:14:38.363Z", "live_revision": 50, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": 7, "prom_custom_heading": null, "prom_custom_desc": "", "prom_custom_url": null, "prom_custom_url_text": null, "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
53	f	2019-04-09 17:40:50.50132+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:39:04.888Z", "latest_revision_created_at": "2019-04-09T11:39:04.802Z", "live_revision": 52, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": null, "prom_custom_heading": null, "prom_custom_desc": "", "prom_custom_url": null, "prom_custom_url_text": null, "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
48	f	2019-04-09 13:35:45.348277+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "All Articles", "draft_title": "All Articles", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/", "owner": 3, "seo_title": "komu naa", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-09T07:27:12.374Z", "latest_revision_created_at": "2019-04-09T07:27:12.325Z", "live_revision": 47, "feature_bg": 12, "sidebar_form_main_heading": "Find Insurance Plans", "sidebar_form_bg": 16, "sidebar_form_heading": "Get the best plan suit for you"}	\N	5	1
22	f	2019-04-02 14:21:12.753044+06	{"pk": 7, "path": "0001000100010002", "depth": 4, "numchild": 0, "title": "article two", "draft_title": "article two", "slug": "article-two", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/main-index-page-article/article-two/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null}	\N	7	3
88	f	2019-04-11 17:14:30.708176+06	{"pk": 15, "path": "000100010008", "depth": 3, "numchild": 0, "title": "Privacy & Policies", "draft_title": "Privacy & Policies", "slug": "privacy-policies", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/home/privacy-policies/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "heading_bg": 13, "slogan_txt": "<p>I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example.</p>", "slogan_img": 14, "content": "<ol><li><b>de Finibus Bonorum et Malorum:</b> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham:</b> But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li><li><b>The standard Lorem Ipsum passage, used since the 1500s:</b> &quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</li><li><b>de Finibus Bonorum et Malorum:</b> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo in.</li><li><b>translation by H. Rackham:</b> But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the.</li></ol><p></p>"}	\N	15	1
8	f	2019-04-01 16:00:38.514697+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T09:59:24.492Z", "latest_revision_created_at": "2019-04-01T09:59:24.184Z", "live_revision": 7, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": null, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "achievement_count": [], "whychoose_icontext": []}	\N	3	3
49	f	2019-04-09 17:12:26.390592+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-07T07:34:02.462Z", "latest_revision_created_at": "2019-04-07T07:34:02.234Z", "live_revision": 46, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": 7, "prom_custom_heading": null, "prom_custom_desc": "", "prom_custom_url": null, "prom_custom_url_text": null, "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
89	f	2019-04-11 17:17:24.903109+06	{"pk": 16, "path": "000100010009", "depth": 3, "numchild": 0, "title": "About Us", "draft_title": "About Us", "slug": "about-us", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/home/about-us/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "heading_bg": 16, "slogan_txt": "<p>her hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are</p>", "slogan_img": 5, "content": "<h3><b>Section 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC</b></h3><p>&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;</p><h3><b>1914 translation by H. Rackham</b></h3><p>&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>"}	\N	16	1
23	f	2019-04-02 15:25:06.837229+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "Main Index page of Article", "draft_title": "Main Index page of Article", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/main-index-page-article/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-02T08:20:26.644Z", "latest_revision_created_at": "2019-04-02T08:20:26.602Z", "live_revision": 20, "feature_bg": 13}	\N	5	3
42	f	2019-04-03 17:14:03.40685+06	{"pk": 6, "path": "0001000100010001", "depth": 4, "numchild": 0, "title": "article one", "draft_title": "article one", "slug": "article-one", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/article-one/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:04.974Z", "last_published_at": "2019-04-03T11:10:05.642Z", "latest_revision_created_at": "2019-04-03T11:10:05.592Z", "live_revision": 41, "feature_img": 11, "content": "<p>a</p>", "article_tags": [{"pk": null, "tag": 9, "content_object": 6}, {"pk": null, "tag": 10, "content_object": 6}]}	\N	6	3
10	f	2019-04-01 16:07:22.847004+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T10:01:53.121Z", "latest_revision_created_at": "2019-04-01T10:01:52.849Z", "live_revision": 9, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": null, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "achievement_count": [], "whychoose_icontext": [{"pk": 1, "sort_order": 0, "page": 3, "icon": "flaticon-medical-ambulance14", "name": "Self-Employed", "desc": "sadf"}, {"pk": null, "sort_order": 1, "page": 3, "icon": "flaticon-medical-illness", "name": "Single Parents", "desc": "sfdgdfgasd"}, {"pk": null, "sort_order": 2, "page": 3, "icon": "flaticon-medical-stethoscope10", "name": "Avoid Tax Penalty", "desc": "dsfgrtg"}, {"pk": null, "sort_order": 3, "page": 3, "icon": "flaticon-medical-medical51", "name": "Who Received Large Rate Increase", "desc": "lorem ipsum"}]}	\N	3	3
78	f	2019-04-11 16:55:47.873515+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 4, "title": "Medigap Direct", "draft_title": "Medigap Direct", "slug": "home", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "Medigap Direct | Reliable Health Insurance", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-11T10:47:49.637Z", "latest_revision_created_at": "2019-04-11T10:47:49.534Z", "live_revision": 77, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_bg": 17, "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 5, "icon": "fa fa-line-chart", "name": "Large Rate Increase", "desc": "Contrary to popular belief, Lorem Ipsum is not simply random text.", "sort_order": 0, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "Medicare Coverage", "desc": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.", "sort_order": 1, "page": 3}, {"pk": 3, "icon": "fa fa-thumbs-up", "name": "Reliable", "desc": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", "sort_order": 2, "page": 3}, {"pk": 4, "icon": "fa fa-shield", "name": "Secured", "desc": "The point of using Lorem Ipsum is that it has a more-or-less normal distrib", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "fa fa-heartbeat", "name": "Guided Online Experience", "desc": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believabl", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "fa fa-search-plus", "name": "Over 800+ Insurances", "desc": "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combin", "sort_order": 1, "page": 3}, {"pk": null, "icon": "fa fa-cart-plus", "name": "Personalized Recommendation", "desc": "orem Ipsum comes from sections 1.10.32 and 1.10.33 of \\"de Finibus Bonorum et Malorum\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC.", "sort_order": 2, "page": 3}, {"pk": null, "icon": "fa fa-bars", "name": "1 min Quote", "desc": "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\"de Finibus Bonorum et Malorum\\".", "sort_order": 3, "page": 3}, {"pk": null, "icon": "fa fa-user-md", "name": "Qualified Doctors", "desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia quasiqui invent cumque nulla!", "sort_order": 4, "page": 3}, {"pk": null, "icon": "flaticon-medical-hospital37", "name": "General Medical", "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", "sort_order": 5, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
66	f	2019-04-10 18:03:27.554253+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "test-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/test-quote/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 3, "sort_order": 0, "label": "sdfgdfh", "field_type": "multiline", "required": true, "choices": "ertertwer", "default_value": "twetewrt", "help_text": "jhfjfgjgf", "page": 11}]}	\N	11	1
90	f	2019-04-11 17:19:12.693197+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "All Articles", "draft_title": "All Articles", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/home/article/", "owner": 3, "seo_title": "komu naa", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-09T07:35:45.392Z", "latest_revision_created_at": "2019-04-09T07:35:45.348Z", "live_revision": 48, "feature_bg": 1, "sidebar_form_main_heading": "Find Insurance Plans", "sidebar_form_bg": 16, "sidebar_form_heading": "Get the best plan suit for you"}	\N	5	1
24	f	2019-04-02 15:33:21.299612+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "Main Index page of Article", "draft_title": "Main Index page of Article", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/", "owner": 3, "seo_title": "komu naa", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-02T09:25:07.122Z", "latest_revision_created_at": "2019-04-02T09:25:06.837Z", "live_revision": 23, "feature_bg": 13}	\N	5	3
16	f	2019-04-02 11:35:58.819352+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T10:52:47.992Z", "latest_revision_created_at": "2019-04-01T10:52:47.903Z", "live_revision": 15, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": null, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": null, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": null, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": null, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}]}	\N	3	3
25	f	2019-04-02 15:44:24.074148+06	{"pk": 8, "path": "000100010002", "depth": 3, "numchild": 0, "title": "Medigap", "draft_title": "Medigap", "slug": "medigap", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/medigap/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "heading_bg": null, "slogan_txt": "<p></p>", "slogan_img": null, "content": "<p></p>"}	\N	8	3
67	f	2019-04-10 18:03:44.795051+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/test-quote/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-10T12:03:27.596Z", "latest_revision_created_at": "2019-04-10T12:03:27.554Z", "live_revision": 66, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 3, "sort_order": 0, "label": "sdfgdfh", "field_type": "multiline", "required": true, "choices": "ertertwer", "default_value": "twetewrt", "help_text": "jhfjfgjgf", "page": 11}]}	\N	11	1
91	f	2019-04-11 17:19:35.248241+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "All Articles", "draft_title": "All Articles", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/home/article/", "owner": 3, "seo_title": "Articles about Health Insurance", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-11T11:19:12.738Z", "latest_revision_created_at": "2019-04-11T11:19:12.693Z", "live_revision": 90, "feature_bg": 1, "sidebar_form_main_heading": "Find Insurance Plans", "sidebar_form_bg": 16, "sidebar_form_heading": "Get the best plan suit for you"}	\N	5	1
26	f	2019-04-02 15:44:50.55787+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "lifefinal-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/lifefinal-expense/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": null, "last_published_at": null, "latest_revision_created_at": null, "live_revision": null, "heading_bg": null, "slogan_txt": "<p></p>", "slogan_img": null, "content": "<p></p>"}	\N	9	3
68	f	2019-04-11 12:02:52.795837+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/get-a-quote/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-10T12:03:44.844Z", "latest_revision_created_at": "2019-04-10T12:03:44.795Z", "live_revision": 67, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 3, "sort_order": 0, "label": "sdfgdfh", "field_type": "multiline", "required": true, "choices": "ertertwer", "default_value": "twetewrt", "help_text": "jhfjfgjgf", "page": 11}, {"pk": null, "sort_order": 1, "label": "sderter", "field_type": "email", "required": false, "choices": "rttryy", "default_value": "yyyyy", "help_text": "rtyertert", "page": 11}]}	\N	11	1
92	f	2019-04-11 17:20:06.455746+06	{"pk": 6, "path": "0001000100010001", "depth": 4, "numchild": 0, "title": "article one", "draft_title": "article one", "slug": "article-one", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/home/article/article-one/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:04.974Z", "last_published_at": "2019-04-03T11:14:03.462Z", "latest_revision_created_at": "2019-04-03T11:14:03.406Z", "live_revision": 42, "hit_count": 60, "like_count": 0, "feature_img": 13, "content": "<p>a</p>", "article_tags": [{"pk": null, "tag": 9, "content_object": 6}, {"pk": null, "tag": 10, "content_object": 6}]}	\N	6	1
6	f	2019-04-01 15:58:49.995996+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T09:54:47.389Z", "latest_revision_created_at": "2019-04-01T09:54:47.119Z", "live_revision": 5, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": null, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "achievement_count": [], "whychoose_icontext": []}	\N	3	3
5	f	2019-04-01 15:54:47.119099+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": true, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-03-31T11:50:32.639Z", "latest_revision_created_at": "2019-04-01T09:36:03.025Z", "live_revision": 3, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": null, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<p></p>", "achievement_count": [], "whychoose_icontext": []}	\N	3	3
58	f	2019-04-10 13:28:34.556686+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:44:02.071Z", "latest_revision_created_at": "2019-04-09T11:44:01.981Z", "live_revision": 57, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_bg": 17, "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
17	f	2019-04-02 13:19:58.961559+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-02T05:35:58.885Z", "latest_revision_created_at": "2019-04-02T05:35:58.819Z", "live_revision": 16, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": null, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}]}	\N	3	3
27	f	2019-04-02 15:45:06.59834+06	{"pk": 5, "path": "000100010001", "depth": 3, "numchild": 2, "title": "All Articles", "draft_title": "Main Index page of Article", "slug": "article", "content_type": 40, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/article/", "owner": 3, "seo_title": "komu naa", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:20:26.644Z", "last_published_at": "2019-04-02T09:33:21.621Z", "latest_revision_created_at": "2019-04-02T09:33:21.299Z", "live_revision": 24, "feature_bg": 13}	\N	5	3
81	f	2019-04-11 17:05:32.146429+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/home/get-a-quote/", "owner": 1, "seo_title": "Get a Free Quote", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-11T09:01:56.714Z", "latest_revision_created_at": "2019-04-11T09:01:56.659Z", "live_revision": 73, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 5, "sort_order": 0, "label": "First Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 6, "sort_order": 1, "label": "Middle Name", "field_type": "singleline", "required": false, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 7, "sort_order": 2, "label": "Last Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 8, "sort_order": 3, "label": "Date of birth", "field_type": "date", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 10, "sort_order": 4, "label": "Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 11, "sort_order": 5, "label": "Alternate Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 9, "sort_order": 6, "label": "Email", "field_type": "email", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 12, "sort_order": 7, "label": "Zip Code", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}]}	\N	11	1
93	f	2019-04-11 17:20:24.786457+06	{"pk": 6, "path": "0001000100010001", "depth": 4, "numchild": 0, "title": "article one", "draft_title": "article one", "slug": "article-one", "content_type": 41, "live": true, "has_unpublished_changes": false, "url_path": "/home/article/article-one/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T08:21:04.974Z", "last_published_at": "2019-04-11T11:20:06.504Z", "latest_revision_created_at": "2019-04-11T11:20:06.455Z", "live_revision": 92, "hit_count": 60, "like_count": 0, "feature_img": 13, "content": "<h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><h2>Where can I get some?</h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#x27;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,</p>", "article_tags": [{"pk": null, "tag": 9, "content_object": 6}, {"pk": null, "tag": 10, "content_object": 6}]}	\N	6	1
69	f	2019-04-11 12:46:32.890568+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/get-a-quote/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-11T06:02:52.850Z", "latest_revision_created_at": "2019-04-11T06:02:52.795Z", "live_revision": 68, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": null, "sort_order": 0, "label": "First Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": null, "sort_order": 1, "label": "Middle Name", "field_type": "singleline", "required": false, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": null, "sort_order": 2, "label": "Last Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": null, "sort_order": 3, "label": "Date of birth", "field_type": "date", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}]}	\N	11	1
28	f	2019-04-02 16:14:21.825524+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "life-final-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/lifefinal-expense/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:50.613Z", "last_published_at": "2019-04-02T09:44:50.613Z", "latest_revision_created_at": "2019-04-02T09:44:50.557Z", "live_revision": 26, "heading_bg": null, "slogan_txt": "<p></p>", "slogan_img": null, "content": "<p></p>"}	\N	9	3
55	f	2019-04-09 17:43:26.438793+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:42:45.151Z", "latest_revision_created_at": "2019-04-09T11:42:45.053Z", "live_revision": 54, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
50	f	2019-04-09 17:14:38.363563+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:12:26.461Z", "latest_revision_created_at": "2019-04-09T11:12:26.390Z", "live_revision": 49, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": 6, "prom_custom_heading": null, "prom_custom_desc": "", "prom_custom_url": null, "prom_custom_url_text": null, "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
7	f	2019-04-01 15:59:24.184136+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T09:58:50.061Z", "latest_revision_created_at": "2019-04-01T09:58:49.995Z", "live_revision": 6, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": null, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And &lt;span&gt;Health Insurance&lt;/span&gt; right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "achievement_count": [], "whychoose_icontext": []}	\N	3	3
29	f	2019-04-02 16:44:25.551727+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "life-final-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/life-final-expense/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:50.613Z", "last_published_at": "2019-04-02T10:14:21.892Z", "latest_revision_created_at": "2019-04-02T10:14:21.825Z", "live_revision": 28, "heading_bg": 13, "slogan_txt": "<p></p>", "slogan_img": null, "content": "<p></p>"}	\N	9	3
72	f	2019-04-11 13:35:49.31275+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/get-a-quote/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-11T07:35:15.119Z", "latest_revision_created_at": "2019-04-11T07:35:15.065Z", "live_revision": 71, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 5, "sort_order": 0, "label": "First Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 6, "sort_order": 1, "label": "Middle Name", "field_type": "singleline", "required": false, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 7, "sort_order": 2, "label": "Last Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 8, "sort_order": 3, "label": "Date of birth", "field_type": "date", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 9, "sort_order": 4, "label": "Email", "field_type": "email", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 10, "sort_order": 5, "label": "Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 11, "sort_order": 6, "label": "Alternate Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": null, "sort_order": 7, "label": "Zip Code", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}]}	\N	11	1
56	f	2019-04-09 17:43:40.670031+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 3, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-09T11:43:26.542Z", "latest_revision_created_at": "2019-04-09T11:43:26.438Z", "live_revision": 55, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_article": null, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-facebook", "name": "test1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
75	f	2019-04-11 16:39:28.352856+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 4, "title": "Medigap Direct", "draft_title": "MediGapDirect", "slug": "home", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "Medigap Direct | Reliable Health Insurance", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-11T09:32:26.243Z", "latest_revision_created_at": "2019-04-11T09:32:26.163Z", "live_revision": 74, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "prom_bg": 17, "prom_article": 7, "prom_custom_heading": "wesehtyj", "prom_custom_desc": "tjtfjtyu", "prom_custom_url": "http://wejrewr.com", "prom_custom_url_text": "eryrtydfggfdf", "ins_heading": "insurance <span>policies</span>", "ins_desc": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [{"pk": 3, "icon": "fa fa-thumbs-up", "name": "Reliable", "desc": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib", "sort_order": 0, "page": 3}, {"pk": 4, "icon": "fa fa-user", "name": "gg1", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 1, "page": 3}, {"pk": 5, "icon": "fa fa-envelope", "name": "asdasd", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 2, "page": 3}, {"pk": 6, "icon": "flaticon-medical-medical51", "name": "aaa", "desc": "sdjeh fhawer gfugwf sdgndfgldfgdsfg jdsfg jdsfg sdfguyyrwher wbenmw vwe", "sort_order": 3, "page": 3}], "services_icontext": [{"pk": 1, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": 2, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}], "ins_policy": [{"pk": 1, "sort_order": 0, "page": 3, "name": "STM", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem</p><p>voluptatem obcaecati! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem voluptatem obcaecati!</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"asdasd\\", \\"image\\": 14, \\"desc\\": \\"sdgdfghg\\"}, \\"id\\": \\"3c41955a-92bf-4695-86a1-23a4e5cc6b36\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dsfg\\", \\"image\\": 14, \\"desc\\": \\"ert\\"}, \\"id\\": \\"5e68952d-6b01-4d98-a4ac-78f951fdc797\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"fdgfdg\\", \\"image\\": 14, \\"desc\\": \\"sertert\\"}, \\"id\\": \\"531721a3-2a9e-4fc6-955c-43c9f16887dc\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"gdhjh\\", \\"image\\": 14, \\"desc\\": \\"ftgyhrtyty\\"}, \\"id\\": \\"ddef33cd-8c23-4281-93db-4ebb2721bccc\\"}]"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Limited", "desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem autem.</p>", "img": 13, "facilities": "[{\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"errr\\", \\"image\\": 15, \\"desc\\": \\"ffff\\"}, \\"id\\": \\"ad2fd9b6-670b-478a-a5e1-f7e3bf4f33ff\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"awe\\", \\"image\\": 15, \\"desc\\": \\"qwe\\"}, \\"id\\": \\"58bb7574-473e-4eeb-b54c-36569a1e2f6a\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"dfgrrw\\", \\"image\\": 14, \\"desc\\": \\"erwerxc\\"}, \\"id\\": \\"d81d1d1f-642e-47f7-b61d-96a01c04a2f6\\"}, {\\"type\\": \\"facility\\", \\"value\\": {\\"title\\": \\"srteerer\\", \\"image\\": 15, \\"desc\\": \\"fgcvncvbv\\"}, \\"id\\": \\"14a1b847-aa9d-4de1-bff5-cf1db0ea28d3\\"}]"}]}	\N	3	1
30	f	2019-04-02 16:52:27.199682+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "life-final-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/life-final-expense/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:50.613Z", "last_published_at": "2019-04-02T10:44:25.615Z", "latest_revision_created_at": "2019-04-02T10:44:25.551Z", "live_revision": 29, "heading_bg": 13, "slogan_txt": "<p></p>", "slogan_img": 14, "content": "<p></p>"}	\N	9	3
9	f	2019-04-01 16:01:52.849604+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T10:00:38.777Z", "latest_revision_created_at": "2019-04-01T10:00:38.514Z", "live_revision": 8, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": null, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "achievement_count": [], "whychoose_icontext": [{"pk": null, "sort_order": 0, "page": 3, "icon": "asdf", "name": "asdf", "desc": "sadf"}]}	\N	3	3
31	f	2019-04-02 16:52:48.374676+06	{"pk": 9, "path": "000100010003", "depth": 3, "numchild": 0, "title": "Life/Final Expense", "draft_title": "Life/Final Expense", "slug": "life-final-expense", "content_type": 42, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/life-final-expense/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-02T09:44:50.613Z", "last_published_at": "2019-04-02T10:52:27.263Z", "latest_revision_created_at": "2019-04-02T10:52:27.199Z", "live_revision": 30, "heading_bg": 13, "slogan_txt": "<p>vugi chugi vugi chugi vugi chugi vugi chugi vugi chugi vugi chugi vugi chugi </p>", "slogan_img": 14, "content": "<p></p>"}	\N	9	3
70	f	2019-04-11 12:50:08.368377+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/get-a-quote/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-11T06:46:32.940Z", "latest_revision_created_at": "2019-04-11T06:46:32.890Z", "live_revision": 69, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 5, "sort_order": 0, "label": "First Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 6, "sort_order": 1, "label": "Middle Name", "field_type": "singleline", "required": false, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 7, "sort_order": 2, "label": "Last Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 8, "sort_order": 3, "label": "Date of birth", "field_type": "date", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": null, "sort_order": 4, "label": "Email", "field_type": "email", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}]}	\N	11	1
82	f	2019-04-11 17:06:10.966616+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "Get a Quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/home/get-a-quote/", "owner": 1, "seo_title": "Get a Free Quote", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-11T11:05:32.206Z", "latest_revision_created_at": "2019-04-11T11:05:32.146Z", "live_revision": 81, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 5, "sort_order": 0, "label": "First Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 6, "sort_order": 1, "label": "Middle Name", "field_type": "singleline", "required": false, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 7, "sort_order": 2, "label": "Last Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 8, "sort_order": 3, "label": "Date of birth", "field_type": "date", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 10, "sort_order": 4, "label": "Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 11, "sort_order": 5, "label": "Alternate Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 9, "sort_order": 6, "label": "Email", "field_type": "email", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 12, "sort_order": 7, "label": "Zip Code", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}]}	\N	11	1
71	f	2019-04-11 13:35:15.065613+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/get-a-quote/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-11T06:50:08.450Z", "latest_revision_created_at": "2019-04-11T06:50:08.368Z", "live_revision": 70, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 5, "sort_order": 0, "label": "First Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 6, "sort_order": 1, "label": "Middle Name", "field_type": "singleline", "required": false, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 7, "sort_order": 2, "label": "Last Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 8, "sort_order": 3, "label": "Date of birth", "field_type": "date", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 9, "sort_order": 4, "label": "Email", "field_type": "email", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": null, "sort_order": 5, "label": "Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": null, "sort_order": 6, "label": "Alternate Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}]}	\N	11	1
2	f	2019-03-31 16:39:42.831928+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "Home", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/home/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-03-24T11:27:34.499Z", "latest_revision_created_at": "2019-03-24T11:27:34.454Z", "live_revision": 1, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": "", "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "achievement_count": []}	\N	3	3
73	f	2019-04-11 15:01:56.659488+06	{"pk": 11, "path": "000100010004", "depth": 3, "numchild": 0, "title": "test quote", "draft_title": "test quote", "slug": "get-a-quote", "content_type": 51, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/get-a-quote/", "owner": 1, "seo_title": "", "show_in_menus": true, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-04-10T12:03:27.596Z", "last_published_at": "2019-04-11T07:35:49.589Z", "latest_revision_created_at": "2019-04-11T07:35:49.312Z", "live_revision": 72, "small_desc": "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus consequatur delectus distinctio eius illo molestias officiis praesentium, unde veritatis voluptates? A accusantium adipisci alias aliquam aspernatur cumque ducimus ea error eum explicabo ipsa ipsam ipsum itaque minima necessitatibus nulla odio, officia perferendis provident qui quo ratione sit unde vero voluptas?</p>", "ty_text": "<p>dvbsdfgnfgbea gfasd fdvdfv</p>", "form_fields": [{"pk": 5, "sort_order": 0, "label": "First Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 6, "sort_order": 1, "label": "Middle Name", "field_type": "singleline", "required": false, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 7, "sort_order": 2, "label": "Last Name", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 8, "sort_order": 3, "label": "Date of birth", "field_type": "date", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 10, "sort_order": 4, "label": "Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 11, "sort_order": 5, "label": "Alternate Phone", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 9, "sort_order": 6, "label": "Email", "field_type": "email", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}, {"pk": 12, "sort_order": 7, "label": "Zip Code", "field_type": "singleline", "required": true, "choices": "", "default_value": "", "help_text": "", "page": 11}]}	\N	11	1
15	f	2019-04-01 16:52:47.903566+06	{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "title": "MediGapDirect", "draft_title": "MediGapDirect", "slug": "medigapdirect", "content_type": 2, "live": true, "has_unpublished_changes": false, "url_path": "/medigapdirect/", "owner": null, "seo_title": "MediGapDirect", "show_in_menus": false, "search_description": "", "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "first_published_at": "2019-03-24T11:27:34.499Z", "last_published_at": "2019-04-01T10:47:04.074Z", "latest_revision_created_at": "2019-04-01T10:47:03.989Z", "live_revision": 14, "banner_slogan": "find the right health insurance and start immediately", "banner_bg": 1, "banner_qt_text": "Quick Compare Insurance Plans and Save Money!", "why_choose_heading": "Why People <span>Choose</span> Us ?", "why_choose_desc": "<h3>In Search Of A Good And Health Insurance right now?</h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit consectetur dolor ullam illo ipsa numquam, quod iusto enim ipsum amet iusto amet consec utem fugit consllo ipsa numquam dolor ullam illo, quod iusto enim ipsum amet iusto amet consec.</p>", "why_choose_img": 11, "achiev_bg": null, "srvc_heading": "Our <span>Services</span>", "srvc_desc": "dflkgjh hsd fksdjlhfn sdlbe fblwegewlffsdf", "achievement_count": [{"pk": 1, "sort_order": 0, "page": 3, "name": "happy customers", "count": 5479, "icon": "pe-7s-smile"}, {"pk": 2, "sort_order": 1, "page": 3, "name": "Insurance Coverage", "count": 844, "icon": "pe-7s-rocket"}, {"pk": 3, "sort_order": 2, "page": 3, "name": "our agents", "count": 121, "icon": "pe-7s-add-user"}, {"pk": 4, "sort_order": 3, "page": 3, "name": "service points", "count": 22, "icon": "pe-7s-global"}], "whychoose_icontext": [], "services_icontext": [{"pk": null, "icon": "sdf", "name": "sdf", "desc": "fdgh", "sort_order": 0, "page": 3}, {"pk": null, "icon": "wer", "name": "aedf", "desc": "wer", "sort_order": 1, "page": 3}]}	\N	3	3
\.


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
2	localhost	80	t	3	\N
\.


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id, file_size, file_hash) FROM stdin;
\.


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
1	{"first-name": "Debashis", "middle-name": "qwwq", "last-name": "Roy Bhowmik", "date-of-birth": "2019-04-02", "email": "debashis.buet08@gmail.com"}	2019-04-11 13:04:42.31358+06	11
2	{"first-name": "Debashis", "middle-name": "qwe", "last-name": "Roy Bhowmik", "date-of-birth": "2019-04-02", "email": "debashis.buet08@gmail.com"}	2019-04-11 13:05:17.692129+06	11
3	{"first-name": "Debashis", "middle-name": "", "last-name": "Roy Bhowmik", "date-of-birth": "2019-04-15", "email": "debashis.buet08@gmail.com"}	2019-04-11 13:05:53.234325+06	11
4	{"first-name": "Debashis", "middle-name": "", "last-name": "Roy Bhowmik", "date-of-birth": "2019-04-03", "email": "debashis.buet08@gmail.com"}	2019-04-11 13:14:24.45278+06	11
5	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2019-04-08", "email": "debashis.buet08@gmail.com"}	2019-04-11 13:19:40.788104+06	11
6	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2019-04-08", "email": "debashis.buet08@gmail.com"}	2019-04-11 13:22:48.942442+06	11
7	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2019-04-08", "email": "debashis.buet08@gmail.com"}	2019-04-11 13:23:01.491188+06	11
8	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2019-04-08", "email": "debashis.buet08@gmail.com"}	2019-04-11 13:23:16.930993+06	11
9	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-02", "email": "debashis.buet08@gmail.com", "phone": "1911581929", "alternate-phone": "werwer", "zip-code": "12095"}	2019-04-11 13:37:43.787951+06	11
10	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-02", "email": "debashis.buet08@gmail.com", "phone": "1911581929", "alternate-phone": "werwer", "zip-code": "12095"}	2019-04-11 13:38:37.946594+06	11
11	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-02", "email": "debashis.buet08@gmail.com", "phone": "1911581929", "alternate-phone": "werwer", "zip-code": "12095"}	2019-04-11 13:38:45.270829+06	11
12	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-02", "email": "debashis.buet08@gmail.com", "phone": "1911581929", "alternate-phone": "werwer", "zip-code": "12095"}	2019-04-11 13:38:59.980741+06	11
13	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-02", "email": "debashis.buet08@gmail.com", "phone": "1911581929", "alternate-phone": "werwer", "zip-code": "12095"}	2019-04-11 13:39:15.450323+06	11
14	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-02", "email": "debashis.buet08@gmail.com", "phone": "1911581929", "alternate-phone": "werwer", "zip-code": "12095"}	2019-04-11 13:39:49.315037+06	11
15	{"first-name": "Debashis", "middle-name": "wer", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-02", "email": "debashis.buet08@gmail.com", "phone": "1911581929", "alternate-phone": "werwer", "zip-code": "12095"}	2019-04-11 13:39:52.865221+06	11
16	{"first-name": "Debashis", "middle-name": "qwewqe", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-09", "phone": "1911581929", "alternate-phone": "1233333333", "email": "debashis.buet08@gmail.com", "zip-code": "12095"}	2019-04-11 15:10:49.357648+06	11
17	{"first-name": "Debashis", "middle-name": "qwewqe", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-09", "phone": "1911581929", "alternate-phone": "1233333333", "email": "debashis.buet08@gmail.com", "zip-code": "12095"}	2019-04-11 15:12:37.70916+06	11
18	{"first-name": "Debashis", "middle-name": "qwewqe", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-09", "phone": "1911581929", "alternate-phone": "1233333333", "email": "debashis.buet08@gmail.com", "zip-code": "12095"}	2019-04-11 15:13:04.542251+06	11
19	{"first-name": "Debashis", "middle-name": "qwewqe", "last-name": "Roy Bhowmik", "date-of-birth": "2000-04-09", "phone": "1911581929", "alternate-phone": "1233333333", "email": "debashis.buet08@gmail.com", "zip-code": "12095"}	2019-04-11 15:13:46.241722+06	11
\.


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id, file_hash) FROM stdin;
1	Banner Image	original_images/bg3.jpg	1500	1001	2019-03-31 17:50:27.781531+06	\N	\N	\N	\N	3	548248	1	2f3adde83af94ab622fce99311806762c5fac907
2	tyest favionc	original_images/close.png	30	30	2019-03-31 18:26:37.984771+06	\N	\N	\N	\N	3	1564	1	6c433aacfbad0912f53ae8da2fe2a534a1e65dd8
3	Partner 1	original_images/logo-1.png	136	45	2019-03-31 18:30:43.453375+06	\N	\N	\N	\N	3	6090	1	15f16027a9d38ec4861ff10ab8a5e8e2cfa96a0c
4	Partner 2	original_images/logo-2.png	192	40	2019-03-31 18:31:06.266741+06	\N	\N	\N	\N	3	10762	1	c7bc70520ae79fe1904973426637db3bd32f60a7
5	Partner 3	original_images/logo-3.png	183	35	2019-03-31 18:31:23.479809+06	\N	\N	\N	\N	3	1876	1	002d8fab8156b8015c33dea730cea4f931d642a6
6	Partner 4	original_images/logo-4.png	214	40	2019-03-31 18:31:42.764688+06	\N	\N	\N	\N	3	4500	1	1b3db99fb364e88eaff008fbad086b645ddf8a8b
7	Partner 5	original_images/logo-5.png	152	40	2019-03-31 18:32:00.05833+06	\N	\N	\N	\N	3	2581	1	32b7bb42d73d027489f0a05da62debd3291b0626
8	Logo	original_images/logo-wide.png	214	39	2019-03-31 18:33:19.230937+06	\N	\N	\N	\N	3	1799	1	861a7c17f71a9c550a835cc39df19d470d8c8562
9	Footer Logo	original_images/logo-wide-white.png	214	39	2019-03-31 18:33:38.941648+06	\N	\N	\N	\N	3	1825	1	9f53c7a582467c7972f9f3ebe9314e8cb2f2876b
12	why choose2	original_images/dc3.png	400	672	2019-04-01 16:11:13.462946+06	\N	\N	\N	\N	3	333806	1	f92b7a83d47fd1c1d8f88c5c134cd58ce33c83cf
11	why choose1	original_images/dc2.png	400	672	2019-04-01 16:10:51.813784+06	\N	\N	\N	\N	3	395858	1	0c601820b9b6908d6d89c96394a4e4fc2115e120
13	STM	original_images/service-1.jpg	600	600	2019-04-02 13:18:50.51236+06	\N	\N	\N	\N	3	97454	1	9b0c6476e3586a8fd459e39a2e0ea03666c5e78b
14	24-7.png	original_images/24-7.png	500	500	2019-04-02 13:19:29.765602+06	\N	\N	\N	\N	3	8843	1	b7b525407c302cabb1b259f6573c25e2353ac553
15	accidental.png	original_images/accidental.png	476	309	2019-04-02 13:21:02.304933+06	\N	\N	\N	\N	3	3475	1	b277bb6e26fec5c244b733c44e50e11dde96b49c
16	Happy Couple	original_images/couple.png	300	442	2019-04-09 13:27:06.758849+06	\N	\N	\N	\N	1	179902	1	775cda1389e6b3cf0711cda818710237d12d4d0d
17	Promotion Image	original_images/Girl-Smile-Transparent-Background-editted.png	338	564	2019-04-10 13:26:56.221561+06	\N	\N	\N	\N	1	239229	1	20ccbd8f8694d3e93e7d489b8e55901e5fc6fedd
18	favicon-64x64	original_images/favicon-64x64.png	64	64	2019-04-11 17:04:12.053855+06	\N	\N	\N	\N	1	2752	1	8236f35935ac8a8185d8ba495f20939cdb08c0f0
\.


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailimages_rendition (id, file, width, height, focal_point_key, filter_spec, image_id) FROM stdin;
1	images/bg3.max-165x165.jpg	165	110		max-165x165	1
2	images/bg3.original.jpg	1500	1001		original	1
3	images/close.max-165x165.png	30	30		max-165x165	2
4	images/logo-1.max-165x165.png	136	45		max-165x165	3
5	images/logo-2.max-165x165.png	165	34		max-165x165	4
6	images/logo-3.max-165x165.png	165	31		max-165x165	5
7	images/logo-4.max-165x165.png	165	30		max-165x165	6
8	images/logo-5.max-165x165.png	152	40		max-165x165	7
9	images/logo-1.original.png	136	45		original	3
10	images/logo-1.max-800x600.png	136	45		max-800x600	3
11	images/logo-wide.max-165x165.png	165	30		max-165x165	8
12	images/logo-wide-white.max-165x165.png	165	30		max-165x165	9
16	images/logo-2.original.png	192	40		original	4
17	images/logo-2.max-800x600.png	192	40		max-800x600	4
18	images/dc2.max-165x165.png	98	165		max-165x165	11
19	images/dc3.max-165x165.png	98	165		max-165x165	12
20	images/dc2.original.png	400	672		original	11
21	images/dc2.max-800x600.png	357	600		max-800x600	11
22	images/service-1.max-165x165.jpg	165	165		max-165x165	13
23	images/24-7.max-165x165.png	165	165		max-165x165	14
24	images/accidental.max-165x165.png	165	107		max-165x165	15
25	images/24-7.original.png	500	500		original	14
26	images/accidental.original.png	476	309		original	15
27	images/service-1.original.jpg	600	600		original	13
28	images/service-1.max-800x600.jpg	600	600		max-800x600	13
29	images/couple.max-165x165.png	111	165		max-165x165	16
30	images/Girl-Smile-Transparent-Background-editted.max-165x165.png	98	165		max-165x165	17
31	images/favicon-64x64.max-165x165.png	64	64		max-165x165	18
\.


--
-- Data for Name: wagtailmenus_flatmenu; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailmenus_flatmenu (id, title, handle, heading, site_id, max_levels, use_specific) FROM stdin;
1	Footer Menu	footer_menu		2	1	1
\.


--
-- Data for Name: wagtailmenus_flatmenuitem; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailmenus_flatmenuitem (id, sort_order, link_text, link_url, link_page_id, menu_id, url_append, allow_subnav, handle) FROM stdin;
4	0		\N	16	1		f	
5	1	Articles	\N	5	1		f	
6	2	Terms	\N	14	1		f	
7	3	Privacy	\N	15	1		f	
\.


--
-- Data for Name: wagtailmenus_mainmenu; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailmenus_mainmenu (id, site_id, max_levels, use_specific) FROM stdin;
1	2	2	0
\.


--
-- Data for Name: wagtailmenus_mainmenuitem; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailmenus_mainmenuitem (id, sort_order, link_text, link_url, link_page_id, menu_id, allow_subnav, url_append, handle) FROM stdin;
4	1	Home	\N	3	1	f		
5	2		\N	12	1	f		
2	2		\N	8	1	f		
3	3		\N	9	1	f		
6	4	Obamacare	\N	13	1	f		
\.


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailsearch_query (id, query_string) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
\.


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: medigap
--

COPY public.wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language, current_time_zone, avatar) FROM stdin;
\.


--
-- Name: article_articletag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.article_articletag_id_seq', 13, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 14, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 197, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 51, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 200, true);


--
-- Name: home_achievementcount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_achievementcount_id_seq', 4, true);


--
-- Name: home_baseicontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_baseicontext_id_seq', 10, true);


--
-- Name: home_contactitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_contactitem_id_seq', 4, true);


--
-- Name: home_contactsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_contactsettings_id_seq', 1, true);


--
-- Name: home_insurancepolicy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_insurancepolicy_id_seq', 2, true);


--
-- Name: home_partnerimgsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_partnerimgsettings_id_seq', 1, true);


--
-- Name: home_partneritem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_partneritem_id_seq', 10, true);


--
-- Name: home_primarysitesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_primarysitesettings_id_seq', 2, true);


--
-- Name: home_quoteformfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_quoteformfield_id_seq', 12, true);


--
-- Name: home_socialitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_socialitem_id_seq', 3, true);


--
-- Name: home_socialmediasettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.home_socialmediasettings_id_seq', 1, true);


--
-- Name: quotes_lead_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.quotes_lead_id_seq', 4, true);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 13, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 17, true);


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_collection_id_seq', 1, true);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_id_seq', 1, false);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_page_id_seq', 16, true);


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_pagerevision_id_seq', 93, true);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailcore_site_id_seq', 2, true);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtaildocs_document_id_seq', 1, false);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailembeds_embed_id_seq', 1, false);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailforms_formsubmission_id_seq', 19, true);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailimages_image_id_seq', 18, true);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailimages_rendition_id_seq', 31, true);


--
-- Name: wagtailmenus_flatmenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailmenus_flatmenu_id_seq', 1, true);


--
-- Name: wagtailmenus_flatmenuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailmenus_flatmenuitem_id_seq', 7, true);


--
-- Name: wagtailmenus_mainmenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailmenus_mainmenu_id_seq', 1, true);


--
-- Name: wagtailmenus_mainmenuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailmenus_mainmenuitem_id_seq', 6, true);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailredirects_redirect_id_seq', 1, false);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailsearch_editorspick_id_seq', 1, false);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailsearch_query_id_seq', 1, false);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailsearch_querydailyhits_id_seq', 1, false);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medigap
--

SELECT pg_catalog.setval('public.wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: article_articleindexpage article_articleindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articleindexpage
    ADD CONSTRAINT article_articleindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: article_articlepage article_articlepage_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articlepage
    ADD CONSTRAINT article_articlepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: article_articletag article_articletag_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articletag
    ADD CONSTRAINT article_articletag_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_achievementcount home_achievementcount_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_achievementcount
    ADD CONSTRAINT home_achievementcount_pkey PRIMARY KEY (id);


--
-- Name: home_baseicontext home_baseicontext_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_baseicontext
    ADD CONSTRAINT home_baseicontext_pkey PRIMARY KEY (id);


--
-- Name: home_contactitem home_contactitem_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_contactitem
    ADD CONSTRAINT home_contactitem_pkey PRIMARY KEY (id);


--
-- Name: home_contactsettings home_contactsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_contactsettings
    ADD CONSTRAINT home_contactsettings_pkey PRIMARY KEY (id);


--
-- Name: home_contactsettings home_contactsettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_contactsettings
    ADD CONSTRAINT home_contactsettings_site_id_key UNIQUE (site_id);


--
-- Name: home_homepage home_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_insurancepolicy home_insurancepolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_insurancepolicy
    ADD CONSTRAINT home_insurancepolicy_pkey PRIMARY KEY (id);


--
-- Name: home_partnerimgsettings home_partnerimgsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_partnerimgsettings
    ADD CONSTRAINT home_partnerimgsettings_pkey PRIMARY KEY (id);


--
-- Name: home_partnerimgsettings home_partnerimgsettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_partnerimgsettings
    ADD CONSTRAINT home_partnerimgsettings_site_id_key UNIQUE (site_id);


--
-- Name: home_partneritem home_partneritem_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_partneritem
    ADD CONSTRAINT home_partneritem_pkey PRIMARY KEY (id);


--
-- Name: home_primarysitesettings home_primarysitesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_primarysitesettings
    ADD CONSTRAINT home_primarysitesettings_pkey PRIMARY KEY (id);


--
-- Name: home_primarysitesettings home_primarysitesettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_primarysitesettings
    ADD CONSTRAINT home_primarysitesettings_site_id_key UNIQUE (site_id);


--
-- Name: home_quoteformfield home_quoteformfield_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_quoteformfield
    ADD CONSTRAINT home_quoteformfield_pkey PRIMARY KEY (id);


--
-- Name: home_quoteformpage home_quoteformpage_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_quoteformpage
    ADD CONSTRAINT home_quoteformpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_servicesicontext home_servicesicontext_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_servicesicontext
    ADD CONSTRAINT home_servicesicontext_pkey PRIMARY KEY (baseicontext_ptr_id);


--
-- Name: home_simplepage home_simplepage_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_simplepage
    ADD CONSTRAINT home_simplepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_socialitem home_socialitem_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_socialitem
    ADD CONSTRAINT home_socialitem_pkey PRIMARY KEY (id);


--
-- Name: home_socialmediasettings home_socialmediasettings_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_socialmediasettings
    ADD CONSTRAINT home_socialmediasettings_pkey PRIMARY KEY (id);


--
-- Name: home_socialmediasettings home_socialmediasettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_socialmediasettings
    ADD CONSTRAINT home_socialmediasettings_site_id_key UNIQUE (site_id);


--
-- Name: home_whychooseicontext home_whychooseicontext_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_whychooseicontext
    ADD CONSTRAINT home_whychooseicontext_pkey PRIMARY KEY (baseicontext_ptr_id);


--
-- Name: quotes_lead quotes_lead_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.quotes_lead
    ADD CONSTRAINT quotes_lead_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collection wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq UNIQUE (collectionviewrestriction_id, group_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site wagtailcore_site_hostname_port_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_port_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_url_max_width_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_max_width_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailmenus_flatmenu wagtailmenus_flatmenu_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_flatmenu
    ADD CONSTRAINT wagtailmenus_flatmenu_pkey PRIMARY KEY (id);


--
-- Name: wagtailmenus_flatmenu wagtailmenus_flatmenu_site_id_handle_7b0cab3a_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_flatmenu
    ADD CONSTRAINT wagtailmenus_flatmenu_site_id_handle_7b0cab3a_uniq UNIQUE (site_id, handle);


--
-- Name: wagtailmenus_flatmenuitem wagtailmenus_flatmenuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_flatmenuitem
    ADD CONSTRAINT wagtailmenus_flatmenuitem_pkey PRIMARY KEY (id);


--
-- Name: wagtailmenus_mainmenu wagtailmenus_mainmenu_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_mainmenu
    ADD CONSTRAINT wagtailmenus_mainmenu_pkey PRIMARY KEY (id);


--
-- Name: wagtailmenus_mainmenu wagtailmenus_mainmenu_site_id_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_mainmenu
    ADD CONSTRAINT wagtailmenus_mainmenu_site_id_key UNIQUE (site_id);


--
-- Name: wagtailmenus_mainmenuitem wagtailmenus_mainmenuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_mainmenuitem
    ADD CONSTRAINT wagtailmenus_mainmenuitem_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_old_path_site_id_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_site_id_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: article_articleindexpage_feature_bg_id_8be213f2; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX article_articleindexpage_feature_bg_id_8be213f2 ON public.article_articleindexpage USING btree (feature_bg_id);


--
-- Name: article_articleindexpage_sidebar_form_bg_id_44c37446; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX article_articleindexpage_sidebar_form_bg_id_44c37446 ON public.article_articleindexpage USING btree (sidebar_form_bg_id);


--
-- Name: article_articlepage_feature_img_id_7b986828; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX article_articlepage_feature_img_id_7b986828 ON public.article_articlepage USING btree (feature_img_id);


--
-- Name: article_articletag_content_object_id_661a5ba3; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX article_articletag_content_object_id_661a5ba3 ON public.article_articletag USING btree (content_object_id);


--
-- Name: article_articletag_tag_id_11f15649; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX article_articletag_tag_id_11f15649 ON public.article_articletag USING btree (tag_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: home_achievementcount_page_id_dc97aaa0; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_achievementcount_page_id_dc97aaa0 ON public.home_achievementcount USING btree (page_id);


--
-- Name: home_contactitem_sm_settings_id_f53dbc16; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_contactitem_sm_settings_id_f53dbc16 ON public.home_contactitem USING btree (cnct_settings_id);


--
-- Name: home_homepage_achiev_bg_id_f843f926; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_homepage_achiev_bg_id_f843f926 ON public.home_homepage USING btree (achiev_bg_id);


--
-- Name: home_homepage_banner_bg_id_412e8507; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_homepage_banner_bg_id_412e8507 ON public.home_homepage USING btree (banner_bg_id);


--
-- Name: home_homepage_prom_article_id_3c80f070; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_homepage_prom_article_id_3c80f070 ON public.home_homepage USING btree (prom_article_id);


--
-- Name: home_homepage_prom_bg_id_0cbca87b; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_homepage_prom_bg_id_0cbca87b ON public.home_homepage USING btree (prom_bg_id);


--
-- Name: home_homepage_why_choose_img_id_29811807; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_homepage_why_choose_img_id_29811807 ON public.home_homepage USING btree (why_choose_img_id);


--
-- Name: home_insurancepolicy_img_id_63632fb7; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_insurancepolicy_img_id_63632fb7 ON public.home_insurancepolicy USING btree (img_id);


--
-- Name: home_insurancepolicy_page_id_7b5b31f6; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_insurancepolicy_page_id_7b5b31f6 ON public.home_insurancepolicy USING btree (page_id);


--
-- Name: home_partneritem_main_settings_id_a582765e; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_partneritem_main_settings_id_a582765e ON public.home_partneritem USING btree (main_settings_id);


--
-- Name: home_partneritem_ptnr_logo_id_1676f331; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_partneritem_ptnr_logo_id_1676f331 ON public.home_partneritem USING btree (logo_id);


--
-- Name: home_primarysitesettings_favicon_id_2a076600; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_primarysitesettings_favicon_id_2a076600 ON public.home_primarysitesettings USING btree (favicon_id);


--
-- Name: home_primarysitesettings_footer_logo_id_74d99dff; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_primarysitesettings_footer_logo_id_74d99dff ON public.home_primarysitesettings USING btree (footer_logo_id);


--
-- Name: home_primarysitesettings_logo_id_b16e0e75; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_primarysitesettings_logo_id_b16e0e75 ON public.home_primarysitesettings USING btree (logo_id);


--
-- Name: home_quoteformfield_page_id_a11ba285; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_quoteformfield_page_id_a11ba285 ON public.home_quoteformfield USING btree (page_id);


--
-- Name: home_servicesicontext_page_id_e39c38ad; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_servicesicontext_page_id_e39c38ad ON public.home_servicesicontext USING btree (page_id);


--
-- Name: home_simplepage_heading_bg_id_01928097; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_simplepage_heading_bg_id_01928097 ON public.home_simplepage USING btree (heading_bg_id);


--
-- Name: home_simplepage_slogan_img_id_7f2586c4; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_simplepage_slogan_img_id_7f2586c4 ON public.home_simplepage USING btree (slogan_img_id);


--
-- Name: home_socialitem_sm_settings_id_fd4d7d4a; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_socialitem_sm_settings_id_fd4d7d4a ON public.home_socialitem USING btree (sm_settings_id);


--
-- Name: home_whychooseicontext_page_id_e673d564; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX home_whychooseicontext_page_id_e673d564 ON public.home_whychooseicontext USING btree (page_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON public.wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_collectionview_collectionviewrestriction__47320efd; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_collectionview_collectionviewrestriction__47320efd ON public.wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: wagtailcore_collectionviewrestriction_collection_id_761908ec; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_collectionviewrestriction_collection_id_761908ec ON public.wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3 ON public.wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_collection_id_5423575a; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_groupcollectionpermission_collection_id_5423575a ON public.wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_group_id_05d61460; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_groupcollectionpermission_group_id_05d61460 ON public.wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_permission_id_1b626275; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_groupcollectionpermission_permission_id_1b626275 ON public.wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_group_id_fc07e671; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_grouppagepermission_group_id_fc07e671 ON public.wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_page_id_710b114a; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_grouppagepermission_page_id_710b114a ON public.wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_content_type_id_c28424df; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_page_content_type_id_c28424df ON public.wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637 ON public.wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_live_revision_id_930bd822; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_page_live_revision_id_930bd822 ON public.wagtailcore_page USING btree (live_revision_id);


--
-- Name: wagtailcore_page_owner_id_fbf7c332; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_page_owner_id_fbf7c332 ON public.wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON public.wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f ON public.wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON public.wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b ON public.wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_page_id_d421cc1d; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_pagerevision_page_id_d421cc1d ON public.wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c ON public.wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_pagerevision_user_id_2409d2f4 ON public.wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a ON public.wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_group_id_6460f223; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_group_id_6460f223 ON public.wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_page_id_15a8bea6; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_pageviewrestriction_page_id_15a8bea6 ON public.wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_site_hostname_96b20b46 ON public.wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON public.wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtailcore_site_root_page_id_e02fb95c; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailcore_site_root_page_id_e02fb95c ON public.wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtaildocs_document_collection_id_23881625; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtaildocs_document_collection_id_23881625 ON public.wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_uploaded_by_user_id_17258b41; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtaildocs_document_uploaded_by_user_id_17258b41 ON public.wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_page_id_e48e93e7; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailforms_formsubmission_page_id_e48e93e7 ON public.wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_collection_id_c2f8af7e; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailimages_image_collection_id_c2f8af7e ON public.wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4 ON public.wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_uploaded_by_user_id_5d73dc75; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailimages_image_uploaded_by_user_id_5d73dc75 ON public.wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201 ON public.wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON public.wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailimages_rendition_image_id_3e1fd774; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailimages_rendition_image_id_3e1fd774 ON public.wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailmenus_flatmenu_handle_fd420cad; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailmenus_flatmenu_handle_fd420cad ON public.wagtailmenus_flatmenu USING btree (handle);


--
-- Name: wagtailmenus_flatmenu_handle_fd420cad_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailmenus_flatmenu_handle_fd420cad_like ON public.wagtailmenus_flatmenu USING btree (handle varchar_pattern_ops);


--
-- Name: wagtailmenus_flatmenu_site_id_516a598d; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailmenus_flatmenu_site_id_516a598d ON public.wagtailmenus_flatmenu USING btree (site_id);


--
-- Name: wagtailmenus_flatmenuitem_link_page_id_36779c0f; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailmenus_flatmenuitem_link_page_id_36779c0f ON public.wagtailmenus_flatmenuitem USING btree (link_page_id);


--
-- Name: wagtailmenus_flatmenuitem_menu_id_757c39da; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailmenus_flatmenuitem_menu_id_757c39da ON public.wagtailmenus_flatmenuitem USING btree (menu_id);


--
-- Name: wagtailmenus_mainmenuitem_link_page_id_208a4a4d; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailmenus_mainmenuitem_link_page_id_208a4a4d ON public.wagtailmenus_mainmenuitem USING btree (link_page_id);


--
-- Name: wagtailmenus_mainmenuitem_menu_id_6505d4c4; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailmenus_mainmenuitem_menu_id_6505d4c4 ON public.wagtailmenus_mainmenuitem USING btree (menu_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b ON public.wagtailredirects_redirect USING btree (old_path);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON public.wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_redirect_page_id_b5728a8f; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailredirects_redirect_redirect_page_id_b5728a8f ON public.wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_site_id_780a0e1e; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailredirects_redirect_site_id_780a0e1e ON public.wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailsearch_editorspick_page_id_28cbc274; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailsearch_editorspick_page_id_28cbc274 ON public.wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_editorspick_query_id_c6eee4a0; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailsearch_editorspick_query_id_c6eee4a0 ON public.wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON public.wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_query_id_2185994b; Type: INDEX; Schema: public; Owner: medigap
--

CREATE INDEX wagtailsearch_querydailyhits_query_id_2185994b ON public.wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: article_articleindexpage article_articleindex_feature_bg_id_8be213f2_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articleindexpage
    ADD CONSTRAINT article_articleindex_feature_bg_id_8be213f2_fk_wagtailim FOREIGN KEY (feature_bg_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: article_articleindexpage article_articleindex_page_ptr_id_b217a1a3_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articleindexpage
    ADD CONSTRAINT article_articleindex_page_ptr_id_b217a1a3_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: article_articleindexpage article_articleindex_sidebar_form_bg_id_44c37446_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articleindexpage
    ADD CONSTRAINT article_articleindex_sidebar_form_bg_id_44c37446_fk_wagtailim FOREIGN KEY (sidebar_form_bg_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: article_articlepage article_articlepage_feature_img_id_7b986828_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articlepage
    ADD CONSTRAINT article_articlepage_feature_img_id_7b986828_fk_wagtailim FOREIGN KEY (feature_img_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: article_articlepage article_articlepage_page_ptr_id_7f5b2dca_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articlepage
    ADD CONSTRAINT article_articlepage_page_ptr_id_7f5b2dca_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: article_articletag article_articletag_content_object_id_661a5ba3_fk_article_a; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articletag
    ADD CONSTRAINT article_articletag_content_object_id_661a5ba3_fk_article_a FOREIGN KEY (content_object_id) REFERENCES public.article_articlepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: article_articletag article_articletag_tag_id_11f15649_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.article_articletag
    ADD CONSTRAINT article_articletag_tag_id_11f15649_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_achievementcount home_achievementcoun_page_id_dc97aaa0_fk_home_home; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_achievementcount
    ADD CONSTRAINT home_achievementcoun_page_id_dc97aaa0_fk_home_home FOREIGN KEY (page_id) REFERENCES public.home_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_contactitem home_contactitem_cnct_settings_id_a0dbeaee_fk_home_cont; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_contactitem
    ADD CONSTRAINT home_contactitem_cnct_settings_id_a0dbeaee_fk_home_cont FOREIGN KEY (cnct_settings_id) REFERENCES public.home_contactsettings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_contactsettings home_contactsettings_site_id_0da58a59_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_contactsettings
    ADD CONSTRAINT home_contactsettings_site_id_0da58a59_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage home_homepage_achiev_bg_id_f843f926_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_achiev_bg_id_f843f926_fk_wagtailimages_image_id FOREIGN KEY (achiev_bg_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage home_homepage_banner_bg_id_412e8507_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_banner_bg_id_412e8507_fk_wagtailimages_image_id FOREIGN KEY (banner_bg_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage home_homepage_prom_article_id_3c80f070_fk_article_a; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_prom_article_id_3c80f070_fk_article_a FOREIGN KEY (prom_article_id) REFERENCES public.article_articlepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage home_homepage_prom_bg_id_0cbca87b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_prom_bg_id_0cbca87b_fk_wagtailimages_image_id FOREIGN KEY (prom_bg_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage home_homepage_why_choose_img_id_29811807_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_why_choose_img_id_29811807_fk_wagtailim FOREIGN KEY (why_choose_img_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_insurancepolicy home_insurancepolicy_img_id_63632fb7_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_insurancepolicy
    ADD CONSTRAINT home_insurancepolicy_img_id_63632fb7_fk_wagtailimages_image_id FOREIGN KEY (img_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_insurancepolicy home_insurancepolicy_page_id_7b5b31f6_fk_home_home; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_insurancepolicy
    ADD CONSTRAINT home_insurancepolicy_page_id_7b5b31f6_fk_home_home FOREIGN KEY (page_id) REFERENCES public.home_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_partnerimgsettings home_partnerimgsettings_site_id_1deb7573_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_partnerimgsettings
    ADD CONSTRAINT home_partnerimgsettings_site_id_1deb7573_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_partneritem home_partneritem_logo_id_40d4fa9b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_partneritem
    ADD CONSTRAINT home_partneritem_logo_id_40d4fa9b_fk_wagtailimages_image_id FOREIGN KEY (logo_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_partneritem home_partneritem_main_settings_id_a582765e_fk_home_part; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_partneritem
    ADD CONSTRAINT home_partneritem_main_settings_id_a582765e_fk_home_part FOREIGN KEY (main_settings_id) REFERENCES public.home_partnerimgsettings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_primarysitesettings home_primarysitesett_favicon_id_2a076600_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_primarysitesettings
    ADD CONSTRAINT home_primarysitesett_favicon_id_2a076600_fk_wagtailim FOREIGN KEY (favicon_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_primarysitesettings home_primarysitesett_footer_logo_id_74d99dff_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_primarysitesettings
    ADD CONSTRAINT home_primarysitesett_footer_logo_id_74d99dff_fk_wagtailim FOREIGN KEY (footer_logo_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_primarysitesettings home_primarysitesett_logo_id_b16e0e75_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_primarysitesettings
    ADD CONSTRAINT home_primarysitesett_logo_id_b16e0e75_fk_wagtailim FOREIGN KEY (logo_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_primarysitesettings home_primarysitesett_site_id_d47c67dc_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_primarysitesettings
    ADD CONSTRAINT home_primarysitesett_site_id_d47c67dc_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quoteformfield home_quoteformfield_page_id_a11ba285_fk_home_quot; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_quoteformfield
    ADD CONSTRAINT home_quoteformfield_page_id_a11ba285_fk_home_quot FOREIGN KEY (page_id) REFERENCES public.home_quoteformpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quoteformpage home_quoteformpage_page_ptr_id_1c3a39e7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_quoteformpage
    ADD CONSTRAINT home_quoteformpage_page_ptr_id_1c3a39e7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_servicesicontext home_servicesicontex_baseicontext_ptr_id_b28aef08_fk_home_base; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_servicesicontext
    ADD CONSTRAINT home_servicesicontex_baseicontext_ptr_id_b28aef08_fk_home_base FOREIGN KEY (baseicontext_ptr_id) REFERENCES public.home_baseicontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_servicesicontext home_servicesicontex_page_id_e39c38ad_fk_home_home; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_servicesicontext
    ADD CONSTRAINT home_servicesicontex_page_id_e39c38ad_fk_home_home FOREIGN KEY (page_id) REFERENCES public.home_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_simplepage home_simplepage_heading_bg_id_01928097_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_simplepage
    ADD CONSTRAINT home_simplepage_heading_bg_id_01928097_fk_wagtailim FOREIGN KEY (heading_bg_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_simplepage home_simplepage_page_ptr_id_6d377021_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_simplepage
    ADD CONSTRAINT home_simplepage_page_ptr_id_6d377021_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_simplepage home_simplepage_slogan_img_id_7f2586c4_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_simplepage
    ADD CONSTRAINT home_simplepage_slogan_img_id_7f2586c4_fk_wagtailim FOREIGN KEY (slogan_img_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_socialitem home_socialitem_sm_settings_id_fd4d7d4a_fk_home_soci; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_socialitem
    ADD CONSTRAINT home_socialitem_sm_settings_id_fd4d7d4a_fk_home_soci FOREIGN KEY (sm_settings_id) REFERENCES public.home_socialmediasettings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_socialmediasettings home_socialmediasett_site_id_c4e4ffba_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_socialmediasettings
    ADD CONSTRAINT home_socialmediasett_site_id_c4e4ffba_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_whychooseicontext home_whychooseiconte_baseicontext_ptr_id_490b8cc7_fk_home_base; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_whychooseicontext
    ADD CONSTRAINT home_whychooseiconte_baseicontext_ptr_id_490b8cc7_fk_home_base FOREIGN KEY (baseicontext_ptr_id) REFERENCES public.home_baseicontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_whychooseicontext home_whychooseiconte_page_id_e673d564_fk_home_home; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.home_whychooseicontext
    ADD CONSTRAINT home_whychooseiconte_page_id_e673d564_fk_home_home FOREIGN KEY (page_id) REFERENCES public.home_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collecti_collection_id_761908ec_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collecti_collection_id_761908ec_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco FOREIGN KEY (collectionviewrestriction_id) REFERENCES public.wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_group_id_05d61460_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_group_id_05d61460_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_page_id_710b114a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_page_id_710b114a_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_content_type_id_c28424df_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_content_type_id_c28424df_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_live_revision_id_930bd822_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_live_revision_id_930bd822_fk_wagtailco FOREIGN KEY (live_revision_id) REFERENCES public.wagtailcore_pagerevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_group_id_6460f223_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_group_id_6460f223_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco FOREIGN KEY (pageviewrestriction_id) REFERENCES public.wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_document_collection_id_23881625_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_collection_id_23881625_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmission wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendition wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_flatmenuitem wagtailmenus_flatmen_link_page_id_36779c0f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_flatmenuitem
    ADD CONSTRAINT wagtailmenus_flatmen_link_page_id_36779c0f_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_flatmenuitem wagtailmenus_flatmen_menu_id_757c39da_fk_wagtailme; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_flatmenuitem
    ADD CONSTRAINT wagtailmenus_flatmen_menu_id_757c39da_fk_wagtailme FOREIGN KEY (menu_id) REFERENCES public.wagtailmenus_flatmenu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_flatmenu wagtailmenus_flatmenu_site_id_516a598d_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_flatmenu
    ADD CONSTRAINT wagtailmenus_flatmenu_site_id_516a598d_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_mainmenuitem wagtailmenus_mainmen_link_page_id_208a4a4d_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_mainmenuitem
    ADD CONSTRAINT wagtailmenus_mainmen_link_page_id_208a4a4d_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_mainmenuitem wagtailmenus_mainmen_menu_id_6505d4c4_fk_wagtailme; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_mainmenuitem
    ADD CONSTRAINT wagtailmenus_mainmen_menu_id_6505d4c4_fk_wagtailme FOREIGN KEY (menu_id) REFERENCES public.wagtailmenus_mainmenu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_mainmenu wagtailmenus_mainmenu_site_id_84b0fde4_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailmenus_mainmenu
    ADD CONSTRAINT wagtailmenus_mainmenu_site_id_84b0fde4_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco FOREIGN KEY (redirect_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirects_red_site_id_780a0e1e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_site_id_780a0e1e_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspick wagtailsearch_editor_page_id_28cbc274_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_page_id_28cbc274_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspick wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_queryd_query_id_2185994b_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_queryd_query_id_2185994b_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: medigap
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

