
-- Generated by ORDS REST Data Services 21.4.2.r0621806
-- Schema: ADMIN  Date: Tue Apr 19 09:43:04 2022 
--

BEGIN
    
  ORDS.DEFINE_MODULE(
      p_module_name    => 'com.oracle.dbtools.chart.Top 10 Fan Favorite Races',
      p_base_path      => '/sdw/charts/Top 10 Fan Favorite Races/',
      p_items_per_page => 0,
      p_status         => 'PUBLISHED',
      p_comments       => 'Fans Favorite Races');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Top 10 Fan Favorite Races',
      p_pattern        => 'data/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Top 10 Fan Favorite Races',
      p_pattern        => 'data/',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'SELECT
     name ||'' ''|| year "Race", score "Score"
FROM
    ADMIN.RACES
where score is not null
order by score desc, year desc
fetch first 10 rows only');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Top 10 Fan Favorite Races',
      p_pattern        => 'settings',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Top 10 Fan Favorite Races',
      p_pattern        => 'settings',
      p_method         => 'GET',
      p_source_type    => 'resource/lob',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'SELECT
	''application/json'' AS CONTENT_TYPE,
	TO_CLOB( ''{
    "com.oracle.dbtools.chart": [
        {
            "orientation": "horizontal",
            "sorting": "off",
            "coordinateSystem": "cartesian",
            "xAxisTitle": "race",
            "yAxisTitle": "fan score",
            "type": "bar",
            "mapping": {
                "groupId": "race",
                "value": "score"
            },
            "customOptions": {}
        }
    ]
}'' ) AS BODY,
	''chart_settings.json'' AS FILE_NAME
FROM
	DUAL');

    
        
COMMIT;

END;
/


-- Generated by ORDS REST Data Services 21.4.2.r0621806
-- Schema: ADMIN  Date: Tue Apr 19 09:43:34 2022 
--

BEGIN
    
  ORDS.DEFINE_MODULE(
      p_module_name    => 'com.oracle.dbtools.chart.Top Drivers With the Most Wins',
      p_base_path      => '/sdw/charts/Top Drivers With the Most Wins/',
      p_items_per_page => 0,
      p_status         => 'PUBLISHED',
      p_comments       => 'Drivers with the most wins');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Top Drivers With the Most Wins',
      p_pattern        => 'data/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Top Drivers With the Most Wins',
      p_pattern        => 'data/',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'select n.driverref name, count(r.driverid) wins
from RESULTS r,
driver_names n
where position = 1
and r.DRIVERID = n.DRIVERID
group by r.driverid, n.driverref
order by wins desc
fetch first 20 rows only');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Top Drivers With the Most Wins',
      p_pattern        => 'settings',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Top Drivers With the Most Wins',
      p_pattern        => 'settings',
      p_method         => 'GET',
      p_source_type    => 'resource/lob',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'SELECT
	''application/json'' AS CONTENT_TYPE,
	TO_CLOB( ''{
    "com.oracle.dbtools.chart": [
        {
            "orientation": "vertical",
            "sorting": "off",
            "coordinateSystem": "cartesian",
            "xAxisTitle": "",
            "yAxisTitle": "",
            "type": "bar",
            "mapping": {
                "groupId": "name",
                "value": "wins"
            },
            "customOptions": {}
        }
    ]
}'' ) AS BODY,
	''chart_settings.json'' AS FILE_NAME
FROM
	DUAL');

    
        
COMMIT;

END;
/


-- Generated by ORDS REST Data Services 21.4.2.r0621806
-- Schema: ADMIN  Date: Tue Apr 19 09:43:47 2022 
--

BEGIN
    
  ORDS.DEFINE_MODULE(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Pitstops',
      p_base_path      => '/sdw/charts/Fastest Pitstops/',
      p_items_per_page => 0,
      p_status         => 'PUBLISHED',
      p_comments       => 'Fastest Pitstops');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Pitstops',
      p_pattern        => 'data/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Pitstops',
      p_pattern        => 'data/',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'select distinct p.driverref, (p.milliseconds/1000) seconds, 
r.name ||'' ''|| r.year "Race Location"
from PIT_STOPS p,
    races r
where p.driverref is not null
and r.raceid = p.raceid
order by p.MILLISECONDS asc
fetch first 15 rows only
');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Pitstops',
      p_pattern        => 'settings',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Pitstops',
      p_pattern        => 'settings',
      p_method         => 'GET',
      p_source_type    => 'resource/lob',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'SELECT
	''application/json'' AS CONTENT_TYPE,
	TO_CLOB( ''{
    "com.oracle.dbtools.chart": [
        {
            "orientation": "horizontal",
            "sorting": "off",
            "coordinateSystem": "cartesian",
            "xAxisTitle": "driver",
            "yAxisTitle": "seconds",
            "type": "bar",
            "mapping": {
                "groupId": "driverref",
                "value": "seconds"
            },
            "customOptions": {}
        }
    ]
}'' ) AS BODY,
	''chart_settings.json'' AS FILE_NAME
FROM
	DUAL');

    
        
COMMIT;

END;
/


-- Generated by ORDS REST Data Services 21.4.2.r0621806
-- Schema: ADMIN  Date: Tue Apr 19 09:44:01 2022 
--

BEGIN
    
  ORDS.DEFINE_MODULE(
      p_module_name    => 'com.oracle.dbtools.chart.Most Dangerous Races with Wet Weather',
      p_base_path      => '/sdw/charts/Most Dangerous Races with Wet Weather/',
      p_items_per_page => 0,
      p_status         => 'PUBLISHED',
      p_comments       => 'Most Dangerous Races with Wet Weather');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Most Dangerous Races with Wet Weather',
      p_pattern        => 'data/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Most Dangerous Races with Wet Weather',
      p_pattern        => 'data/',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'select name ||'' ''|| year "Race", (DNF_DUE_TO_ACCIDENT_COUNT/DNF_COUNT)*100 "Percent of Weather Related Accidents"
from (
select dnf_count, DNF_DUE_TO_ACCIDENT_COUNT, name, year
from races
where DNF_COUNT != 0
and DNF_DUE_TO_ACCIDENT_COUNT != 0
and WEATHER_WET = ''Y''
order by 2 desc
fetch first 10 rows only)
order by 2 desc');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Most Dangerous Races with Wet Weather',
      p_pattern        => 'settings',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Most Dangerous Races with Wet Weather',
      p_pattern        => 'settings',
      p_method         => 'GET',
      p_source_type    => 'resource/lob',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'SELECT
	''application/json'' AS CONTENT_TYPE,
	TO_CLOB( ''{
    "com.oracle.dbtools.chart": [
        {
            "orientation": "horizontal",
            "sorting": "off",
            "coordinateSystem": "polar",
            "xAxisTitle": "",
            "yAxisTitle": "",
            "type": "area",
            "mapping": {
                "groupId": "race",
                "value": "percent of weather related accidents"
            },
            "customOptions": {}
        }
    ]
}'' ) AS BODY,
	''chart_settings.json'' AS FILE_NAME
FROM
	DUAL');

    
        
COMMIT;

END;
/


-- Generated by ORDS REST Data Services 21.4.2.r0621806
-- Schema: ADMIN  Date: Tue Apr 19 09:44:11 2022 
--

BEGIN
    
  ORDS.DEFINE_MODULE(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Laps in 2021',
      p_base_path      => '/sdw/charts/Fastest Laps in 2021/',
      p_items_per_page => 0,
      p_status         => 'PUBLISHED',
      p_comments       => 'Fastest Laps in 2021');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Laps in 2021',
      p_pattern        => 'settings',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Laps in 2021',
      p_pattern        => 'settings',
      p_method         => 'GET',
      p_source_type    => 'resource/lob',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'SELECT
	''application/json'' AS CONTENT_TYPE,
	TO_CLOB( ''{
    "com.oracle.dbtools.chart": [
        {
            "orientation": "horizontal",
            "sorting": "off",
            "coordinateSystem": "cartesian",
            "xAxisTitle": "driver",
            "yAxisTitle": "seconds",
            "type": "bar",
            "mapping": {
                "groupId": "driver",
                "value": "seconds"
            },
            "customOptions": {}
        }
    ]
}'' ) AS BODY,
	''chart_settings.json'' AS FILE_NAME
FROM
	DUAL');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Laps in 2021',
      p_pattern        => 'data/',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.chart.Fastest Laps in 2021',
      p_pattern        => 'data/',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'with toplap as (
select o.*,
       row_number () over (
         partition by race_name
         order by MILLISECONDS
       ) rn
from   lap_times o
)
select distinct DRIVERREF "Driver", race_name "Race", MILLISECONDS/1000 seconds 
from toplap
where rn=1
and race_name like ''2021%''
order by 3');

    
        
COMMIT;

END;
/