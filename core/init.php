<?php
ob_start();
session_start();

require_once 'database.php';

function myAutoload($class){
    $fileName = 'classes/' . $class . '.php';
    include_once $fileName;
}

spl_autoload_register('myAutoload');

try{
    $general = new General($db);
    $index = new Index($db);
}
catch(Exception $e){
    echo 'Caught Exception ', $e->getMessage();
}
?>
