<?php
$html = <<<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  </head>
  <body>
    <p>ddddddddddd</p>
  </body>
</html>
EOF;
$dom = new DOMDocument('1.0', 'utf-8');
$dom->loadXML($html);
print_r($dom->saveXML());

?>
