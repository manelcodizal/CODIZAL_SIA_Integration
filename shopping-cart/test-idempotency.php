<?php
$payload = [
    'order_id' => 13,
    'amount' => 4,100.00,
    'customer_name' => 'Marinel Codizal',
    'payment_method' => 'EWALLET',
    'idempotency_key' => 'cart-order-13',
    'outcome' => 'SUCCESS'
];

$ch = curl_init();

curl_setopt_array($ch, [
    CURLOPT_URL => 'http://localhost/SIA_PHP_SQL_Integration/payment-gateway/api/payments.php',
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => json_encode($payload),
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTPHEADER => [
        'Content-Type: application/json',
        'Accept: application/json'
    ]
]);

$response = curl_exec($ch);

header('Content-Type: application/json');
echo $response;