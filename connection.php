<?php
// Get the database URL from the environment variable
$mysql_url = getenv('mysql'); // 'mysql' is the variable name in Railway

if (!$mysql_url) {
    die("Environment variable 'mysql' not set.");
}

// Parse the URL
$dbparts = parse_url($mysql_url);

$host = $dbparts['host'] ?? 'localhost';
$user = $dbparts['user'] ?? '';
$pass = $dbparts['pass'] ?? '';
$db   = ltrim($dbparts['path'] ?? '', '/'); // remove leading '/'
$port = $dbparts['port'] ?? 3306;

// Create MySQL connection
$conn = new mysqli($host, $user, $pass, $db, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
