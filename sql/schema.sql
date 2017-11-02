CREATE TABLE cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);

CREATE TABLE component_groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    "order" integer DEFAULT 0 NOT NULL,
    collapsed integer DEFAULT 1 NOT NULL
);

CREATE TABLE component_tag (
    id integer NOT NULL,
    component_id integer NOT NULL,
    tag_id integer NOT NULL
);

CREATE TABLE components (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    link text NOT NULL,
    status integer NOT NULL,
    "order" integer NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    enabled boolean DEFAULT true NOT NULL
);

CREATE TABLE failed_jobs (
    id integer NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    failed_at timestamp(0) without time zone NOT NULL
);

CREATE TABLE incident_templates (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    template text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);

CREATE TABLE incidents (
    id integer NOT NULL,
    component_id integer DEFAULT 0 NOT NULL,
    name character varying(255) NOT NULL,
    status integer NOT NULL,
    message text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    scheduled_at timestamp(0) without time zone,
    visible boolean DEFAULT true NOT NULL
);

CREATE TABLE invites (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    claimed_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);

CREATE TABLE metric_points (
    id integer NOT NULL,
    metric_id integer NOT NULL,
    value numeric(15,3) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    counter integer DEFAULT 1 NOT NULL
);

CREATE TABLE metrics (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    suffix character varying(255) NOT NULL,
    description text NOT NULL,
    default_value numeric(10,3) NOT NULL,
    calc_type smallint NOT NULL,
    display_chart boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    places integer DEFAULT 2 NOT NULL,
    default_view smallint DEFAULT '1'::smallint NOT NULL,
    threshold integer DEFAULT 5 NOT NULL,
    "order" smallint DEFAULT '0'::smallint NOT NULL
);

CREATE TABLE migrations (
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);

CREATE TABLE sessions (
    id character varying(255) NOT NULL,
    user_id integer,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);

CREATE TABLE settings (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE subscribers (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    verify_code character varying(255) NOT NULL,
    verified_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    global boolean DEFAULT true NOT NULL
);

CREATE TABLE subscriptions (
    id integer NOT NULL,
    subscriber_id integer NOT NULL,
    component_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    email character varying(255) NOT NULL,
    api_key character varying(255) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    level smallint DEFAULT '2'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    google_2fa_secret character varying(255)
);

CREATE SEQUENCE component_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE component_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE incident_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE incidents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE metric_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE subscribers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE cache OWNER TO postgres;
ALTER TABLE component_groups OWNER TO postgres;
ALTER TABLE component_groups_id_seq OWNER TO postgres;
ALTER SEQUENCE component_groups_id_seq OWNED BY component_groups.id;
ALTER TABLE component_tag OWNER TO postgres;
ALTER TABLE component_tag_id_seq OWNER TO postgres;
ALTER SEQUENCE component_tag_id_seq OWNED BY component_tag.id;
ALTER TABLE components OWNER TO postgres;
ALTER TABLE components_id_seq OWNER TO postgres;
ALTER SEQUENCE components_id_seq OWNED BY components.id;
ALTER TABLE failed_jobs OWNER TO postgres;
ALTER TABLE failed_jobs_id_seq OWNER TO postgres;
ALTER SEQUENCE failed_jobs_id_seq OWNED BY failed_jobs.id;
ALTER TABLE incident_templates OWNER TO postgres;
ALTER TABLE incident_templates_id_seq OWNER TO postgres;
ALTER SEQUENCE incident_templates_id_seq OWNED BY incident_templates.id;
ALTER TABLE incidents OWNER TO postgres;
ALTER TABLE incidents_id_seq OWNER TO postgres;
ALTER SEQUENCE incidents_id_seq OWNED BY incidents.id;
ALTER TABLE invites OWNER TO postgres;
ALTER TABLE invites_id_seq OWNER TO postgres;
ALTER SEQUENCE invites_id_seq OWNED BY invites.id;
ALTER TABLE jobs OWNER TO postgres;
ALTER TABLE jobs_id_seq OWNER TO postgres;
ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;
ALTER TABLE metric_points OWNER TO postgres;
ALTER TABLE metric_points_id_seq OWNER TO postgres;
ALTER SEQUENCE metric_points_id_seq OWNED BY metric_points.id;
ALTER TABLE metrics OWNER TO postgres;
ALTER TABLE metrics_id_seq OWNER TO postgres;
ALTER SEQUENCE metrics_id_seq OWNED BY metrics.id;
ALTER TABLE migrations OWNER TO postgres;
ALTER TABLE sessions OWNER TO postgres;
ALTER TABLE settings OWNER TO postgres;
ALTER TABLE settings_id_seq OWNER TO postgres;
ALTER SEQUENCE settings_id_seq OWNED BY settings.id;
ALTER TABLE subscribers OWNER TO postgres;
ALTER TABLE subscribers_id_seq OWNER TO postgres;
ALTER SEQUENCE subscribers_id_seq OWNED BY subscribers.id;
ALTER TABLE subscriptions OWNER TO postgres;
ALTER TABLE subscriptions_id_seq OWNER TO postgres;
ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;
ALTER TABLE tags OWNER TO postgres;
ALTER TABLE tags_id_seq OWNER TO postgres;
ALTER SEQUENCE tags_id_seq OWNED BY tags.id;
ALTER TABLE users OWNER TO postgres;
ALTER TABLE users_id_seq OWNER TO postgres;
ALTER SEQUENCE users_id_seq OWNED BY users.id;

ALTER TABLE ONLY component_groups ALTER COLUMN id SET DEFAULT nextval('component_groups_id_seq'::regclass);
ALTER TABLE ONLY component_tag ALTER COLUMN id SET DEFAULT nextval('component_tag_id_seq'::regclass);
ALTER TABLE ONLY components ALTER COLUMN id SET DEFAULT nextval('components_id_seq'::regclass);
ALTER TABLE ONLY failed_jobs ALTER COLUMN id SET DEFAULT nextval('failed_jobs_id_seq'::regclass);
ALTER TABLE ONLY incident_templates ALTER COLUMN id SET DEFAULT nextval('incident_templates_id_seq'::regclass);
ALTER TABLE ONLY incidents ALTER COLUMN id SET DEFAULT nextval('incidents_id_seq'::regclass);
ALTER TABLE ONLY invites ALTER COLUMN id SET DEFAULT nextval('invites_id_seq'::regclass);
ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);
ALTER TABLE ONLY metric_points ALTER COLUMN id SET DEFAULT nextval('metric_points_id_seq'::regclass);
ALTER TABLE ONLY metrics ALTER COLUMN id SET DEFAULT nextval('metrics_id_seq'::regclass);
ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);
ALTER TABLE ONLY subscribers ALTER COLUMN id SET DEFAULT nextval('subscribers_id_seq'::regclass);
ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);
ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);
ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


ALTER TABLE ONLY cache
    ADD CONSTRAINT cache_key_unique UNIQUE (key);
ALTER TABLE ONLY component_groups
    ADD CONSTRAINT component_groups_pkey PRIMARY KEY (id);
ALTER TABLE ONLY component_tag
    ADD CONSTRAINT component_tag_pkey PRIMARY KEY (id);
ALTER TABLE ONLY components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);
ALTER TABLE ONLY failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
ALTER TABLE ONLY incident_templates
    ADD CONSTRAINT incident_templates_pkey PRIMARY KEY (id);
ALTER TABLE ONLY incidents
    ADD CONSTRAINT incidents_pkey PRIMARY KEY (id);
ALTER TABLE ONLY invites
    ADD CONSTRAINT invites_code_unique UNIQUE (code);
ALTER TABLE ONLY invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);
ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
ALTER TABLE ONLY metric_points
    ADD CONSTRAINT metric_points_pkey PRIMARY KEY (id);
ALTER TABLE ONLY metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);
ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_id_unique UNIQUE (id);
ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
ALTER TABLE ONLY subscribers
    ADD CONSTRAINT subscribers_email_unique UNIQUE (email);
ALTER TABLE ONLY subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);
ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_name_slug_unique UNIQUE (name, slug);
ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
ALTER TABLE ONLY users
    ADD CONSTRAINT users_api_key_unique UNIQUE (api_key);
ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


CREATE INDEX component_groups_order_index ON component_groups USING btree ("order");
CREATE INDEX component_tag_component_id_index ON component_tag USING btree (component_id);
CREATE INDEX component_tag_tag_id_index ON component_tag USING btree (tag_id);
CREATE INDEX components_group_id_index ON components USING btree (group_id);
CREATE INDEX components_order_index ON components USING btree ("order");
CREATE INDEX components_status_index ON components USING btree (status);
CREATE INDEX incidents_component_id_index ON incidents USING btree (component_id);
CREATE INDEX incidents_status_index ON incidents USING btree (status);
CREATE INDEX incidents_visible_index ON incidents USING btree (visible);
CREATE INDEX metric_points_metric_id_index ON metric_points USING btree (metric_id);
CREATE INDEX metrics_display_chart_index ON metrics USING btree (display_chart);
CREATE INDEX subscriptions_component_id_index ON subscriptions USING btree (component_id);
CREATE INDEX subscriptions_subscriber_id_index ON subscriptions USING btree (subscriber_id);
CREATE INDEX users_active_index ON users USING btree (active);
CREATE INDEX users_remember_token_index ON users USING btree (remember_token);
