-- To run from a terminal:
--  psql "dbname=<DBNAME> user=<USER>" -v mimic_data_dir=<PATH TO DATA DIR> -f load.sql

-- Change to the directory containing the data files
\cd :mimic_data_dir

-- If running scripts individually, you can set the schema where all tables are created as follows:
SET search_path TO mimic_ed;
-- Restoring the search path to its default value can be accomplished as follows:
-- SET search_path TO "$user",public;

/* Set the mimic_data_dir variable to point to directory containing
   all .csv files. If using Docker, this should not be changed here.
   Rather, when running the docker container, use the -v option
   to have Docker mount a host volume to the container path /mimic_data
   as explained in the README file
*/

--------------------------------------------------------
--  Load Data for Table diagnosis
--------------------------------------------------------
\echo '######################'
\echo 'Copying diagnosis.....'
\copy diagnosis FROM 'diagnosis.csv' DELIMITER ',' CSV HEADER NULL ''
\echo 'Table diagnosis successfully generated.'

--------------------------------------------------------
--  Load Data for Table edstays
--------------------------------------------------------
\echo '###################'
\echo 'Copying edstay.....'
\copy edstays from 'edstays.csv' delimiter ',' csv header NULL ''
\echo 'Table edstay successfully generated.'
--------------------------------------------------------
--  Load Data for Table medrecon
--------------------------------------------------------
\echo '#####################'
\echo 'Copying medrecon.....'
\copy medrecon from 'medrecon.csv' delimiter ',' csv header NULL ''
\echo 'Table medrecon successfully generated.'

--------------------------------------------------------
--  Load Data for Table pyxis
--------------------------------------------------------
\echo '##################'
\echo 'Copying pyxis.....'
\copy pyxis from 'pyxis.csv' delimiter ',' csv header NULL ''
\echo 'Table pyxis successfully generated.'

--------------------------------------------------------
--  Load Data for Table triage
--------------------------------------------------------
\echo '###################'
\echo 'Copying triage.....'
\copy triage from 'triage.csv' delimiter ',' csv header NULL ''
\echo 'Table triage successfully generated.'

--------------------------------------------------------
--  Load Data for Table vitalsign
--------------------------------------------------------
\echo '######################'
\echo 'Copying vitalsign.....'
\copy vitalsign from 'vitalsign.csv' delimiter ',' csv header NULL ''
\echo 'Table vitalsign successfully generated.'
\echo 'All tables generated.'
\echo 'THE END.'