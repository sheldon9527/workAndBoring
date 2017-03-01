<?php

$aHTTP['http']['header'] =  "User-Agent: PHP-SOAP/5.5.11\r\n";

$aHTTP['http']['header'].= "username: XXXXXXXXXXX\r\n"."password: XXXXX\r\n";

$context = stream_context_create($aHTTP);

$client=new SoapClient("https://ocppws-cert.extra.bcv.org.ve:443/AltoValor/BancoUniversal?WSDL",array('trace' => 1,"stream_context" => $context));

$result = $client->jornadaActiva();
var_dump($result);
?>
