<?php
$wsdl = 'http://test.dev/company/soap.wsdl';
$soap = new SoapClient($wsdl);
echo $soap->Add(1,2);
//echo $soap->HelloWorld();
?>
