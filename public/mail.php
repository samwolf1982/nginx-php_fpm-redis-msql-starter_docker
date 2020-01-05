<?php
echo 'send mail';

$to = rand().'_to@fmail.com';
$subject = 'Hello from docker';
$message = 'This is a Mailhog test';
$headers = "From: ".rand()."_from@zend.com\r\n";

if (mail($to, $subject, $message, $headers)) {
    echo "SUCCESS";
} else {
    echo "ERROR";
}