<?php
unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'pgsql';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'ep-plain-block-a4xsu8el.us-east-1.pg.koyeb.app';
$CFG->dbname    = 'koyebdb';
$CFG->dbuser    = 'root';
$CFG->dbpass    = 'npg_jkRXcPWBUz25';
$CFG->prefix    = 'mdl_';

$CFG->wwwroot   = 'https://system.mindaccel.org';
$CFG->dataroot  = '/var/www/html/moodledata';
$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');
