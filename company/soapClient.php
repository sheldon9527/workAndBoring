<?php
$wsdl = 'http://test.dev/company/soap.wsdl';
$soap = new SoapClient($wsdl);
var_dump($soap);
$res = $soap->Add(1,2);
var_dump($res);
//echo $soap->HelloWorld();
?>
