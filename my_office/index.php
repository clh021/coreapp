<?php
error_reporting(E_ALL ^E_NOTICE);
!defined('DS') & define('DS', DIRECTORY_SEPARATOR);
define('IN_SITE', TRUE);
define('SITE_ROOT', dirname(__FILE__));
define('CACHE_PATH', SITE_ROOT.DS.'.'.DS.'_cache'.DS); //缓存默认存储路径

//define('IN_WAP',1);
//file_put_contents('1.txt',var_export($_SERVER,true));
//echo '<pre>';print_r($_SERVER);exit();
if(!file_exists('configs/config.php')){
	header("Location:install.php");
	exit;
}

require_once 'core.php';
core::init('configs/config.php');
core::main();
?>