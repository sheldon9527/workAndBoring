<?php
class Paycallback
{

    public function callback()
    {

        foreach ($_SERVER as $name => $value) {
            $headers[$name] = $value;
        }

        return $headers;
    }
}


$paycallback  = new Paycallback();
$content = $paycallback->callback();

print_r($content);

die;
