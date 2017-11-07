COPY cache (key, value, expiration) FROM stdin;
\.

COPY component_groups (id, name, created_at, updated_at, "order", collapsed) FROM stdin;
1	Search	2017-11-02 16:28:11	2017-11-02 16:28:11	0	0
\.
SELECT pg_catalog.setval('component_groups_id_seq', 1, true);


COPY component_tag (id, component_id, tag_id) FROM stdin;
1	1	1
\.
SELECT pg_catalog.setval('component_tag_id_seq', 1, true);


COPY components (id, name, description, link, status, "order", group_id, created_at, updated_at, deleted_at, enabled) FROM stdin;
1	Google		https://google.com	1	0	1	2017-11-02 16:28:22	2017-11-02 16:28:22	\N	t
\.
SELECT pg_catalog.setval('components_id_seq', 1, true);


COPY failed_jobs (id, connection, queue, payload, failed_at) FROM stdin;
\.
SELECT pg_catalog.setval('failed_jobs_id_seq', 1, false);


COPY incident_templates (id, name, slug, template, created_at, updated_at, deleted_at) FROM stdin;
\.
SELECT pg_catalog.setval('incident_templates_id_seq', 1, false);



COPY incidents (id, component_id, name, status, message, created_at, updated_at, deleted_at, scheduled_at, visible) FROM stdin;
\.
SELECT pg_catalog.setval('incidents_id_seq', 1, false);



COPY invites (id, code, email, claimed_at, created_at, updated_at) FROM stdin;
\.
SELECT pg_catalog.setval('invites_id_seq', 1, false);



COPY jobs (id, queue, payload, attempts, reserved, reserved_at, available_at, created_at) FROM stdin;
\.
SELECT pg_catalog.setval('jobs_id_seq', 1, false);



COPY metric_points (id, metric_id, value, created_at, updated_at, counter) FROM stdin;
1	  1	433.000	2017-11-02 16:00:00	2017-11-02 16:00:00	1
2	  1	218.000	2017-11-02 16:15:00	2017-11-02 16:15:00	2
3	  1	251.000	2017-11-02 16:30:00	2017-11-02 16:30:00	1
4	  1	192.000	2017-11-02 16:45:00	2017-11-02 16:45:00	2
5	  1	207.000	2017-11-02 17:00:00	2017-11-02 17:00:00	2
6	  1	235.000	2017-11-02 17:15:00	2017-11-02 17:15:00	1
8	  1	210.000	2017-11-02 17:30:00	2017-11-02 17:30:00	2
7	  1	206.000	2017-11-02 17:45:00	2017-11-02 17:45:00	2
9	  1	209.000	2017-11-02 18:00:00	2017-11-02 18:00:00	2
10	1	208.000	2017-11-02 18:15:00	2017-11-02 18:15:00	1
11	1	189.000	2017-11-02 18:30:00	2017-11-02 18:30:00	1
12	1	201.000	2017-11-02 18:45:00	2017-11-02 18:45:00	2
13	1	205.000	2017-11-02 19:00:00	2017-11-02 19:00:00	2
14	1	200.000	2017-11-02 19:15:00	2017-11-02 19:15:00	3
15	1	219.000	2017-11-02 19:30:00	2017-11-02 19:30:00	1
\.
SELECT pg_catalog.setval('metric_points_id_seq', 15, true);


COPY metrics (id, name, suffix, description, default_value, calc_type, display_chart, created_at, updated_at, places, default_view, threshold, "order") FROM stdin;
1	Google Response Time	ms		205.000	1	t	2017-11-02 16:28:42	2017-11-02 16:28:42	0	0	15	0
\.
SELECT pg_catalog.setval('metrics_id_seq', 1, true);



COPY migrations (migration, batch) FROM stdin;
2015_01_05_201324_CreateComponentGroupsTable	1
2015_01_05_201444_CreateComponentsTable	1
2015_01_05_202446_CreateIncidentTemplatesTable	1
2015_01_05_202609_CreateIncidentsTable	1
2015_01_05_202730_CreateMetricPointsTable	1
2015_01_05_202826_CreateMetricsTable	1
2015_01_05_203014_CreateSettingsTable	1
2015_01_05_203235_CreateSubscribersTable	1
2015_01_05_203341_CreateUsersTable	1
2015_01_09_083419_AlterTableUsersAdd2FA	1
2015_01_16_083825_CreateTagsTable	1
2015_01_16_084030_CreateComponentTagTable	1
2015_02_28_214642_UpdateIncidentsAddScheduledAt	1
2015_05_19_214534_AlterTableComponentGroupsAddOrder	1
2015_05_20_073041_AlterTableIncidentsAddVisibileColumn	1
2015_05_24_210939_create_jobs_table	1
2015_05_24_210948_create_failed_jobs_table	1
2015_06_10_122216_AlterTableComponentsDropUserIdColumn	1
2015_06_10_122229_AlterTableIncidentsDropUserIdColumn	1
2015_08_02_120436_AlterTableSubscribersRemoveDeletedAt	1
2015_08_13_214123_AlterTableMetricsAddDecimalPlacesColumn	1
2015_10_31_211944_CreateInvitesTable	1
2015_11_03_211049_AlterTableComponentsAddEnabledColumn	1
2015_12_26_162258_AlterTableMetricsAddDefaultViewColumn	1
2016_01_09_141852_CreateSubscriptionsTable	1
2016_01_29_154937_AlterTableComponentGroupsAddCollapsedColumn	1
2016_02_18_085210_AlterTableMetricPointsChangeValueColumn	1
2016_03_01_174858_AlterTableMetricPointsAddCounterColumn	1
2016_03_10_144613_AlterTableComponentGroupsMakeColumnInteger	1
2016_04_05_142933_create_sessions_table	1
2016_04_29_061916_AlterTableSubscribersAddGlobalColumn	1
2016_06_02_075012_AlterTableMetricsAddOrderColumn	1
2016_06_05_091615_create_cache_table	1
\.



COPY sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.



COPY settings (id, name, value, created_at, updated_at) FROM stdin;
1	app_name	Statuspage	2017-11-02 16:27:30	2017-11-02 16:27:30
2	app_domain	http://localhost	2017-11-02 16:27:30	2017-11-02 16:27:30
3	app_timezone	Europe/Dublin	2017-11-02 16:27:30	2017-11-02 16:27:30
4	app_locale	en	2017-11-02 16:27:30	2017-11-02 16:27:30
5	app_incident_days	4	2017-11-02 16:27:30	2017-11-02 16:27:30
6	app_about		2017-11-02 16:28:45	2017-11-02 16:28:45
7	enable_subscribers	1	2017-11-02 16:28:45	2017-11-02 16:28:45
8	display_graphs	1	2017-11-02 16:28:45	2017-11-02 16:28:45
9	show_support	0	2017-11-02 16:28:45	2017-11-02 16:28:45
\.
SELECT pg_catalog.setval('settings_id_seq', 9, true);



COPY subscribers (id, email, verify_code, verified_at, created_at, updated_at, global) FROM stdin;
\.
SELECT pg_catalog.setval('subscribers_id_seq', 1, false);



COPY subscriptions (id, subscriber_id, component_id, created_at, updated_at) FROM stdin;
\.
SELECT pg_catalog.setval('subscriptions_id_seq', 1, false);



COPY tags (id, name, slug, created_at, updated_at) FROM stdin;
1			2017-11-02 16:28:22	2017-11-02 16:28:22
\.
SELECT pg_catalog.setval('tags_id_seq', 1, true);



COPY users (id, username, password, remember_token, email, api_key, active, level, created_at, updated_at, google_2fa_secret) FROM stdin;
1	admin	$2y$10$9nEvKuAQ4SzgNFQ8Kc4CSObgRLeMCQuDgxetwlW13Lmv8qpcHQLia	\N	test@test.com	CQ3f6IwLr6QGwCl1k5Tk	t	1	2017-11-02 16:27:30	2017-11-02 16:27:30	\N
\.
SELECT pg_catalog.setval('users_id_seq', 1, true);
