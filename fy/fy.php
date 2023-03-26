<?php
header("Content-Type:text/json;charset=UTF-8");

$info = $argv[1];

$json_string = file_get_contents("https://api.vvhan.com/api/fy?text=" . $info);

$decoded_data = json_decode($json_string, true);

$fanyi = $decoded_data['data']['fanyi'];

echo "\033[34m⇢\033[0m  $fanyi  \033[34m⇠ 翻译结果\033[0m";
?>
