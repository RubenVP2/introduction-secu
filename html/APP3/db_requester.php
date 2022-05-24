<?php

	function request($sql) {
		$conn =new PDO('mysql:host=172.25.0.4;dbname=sqli_db', 'root', 'S3cret'); 
		$result = $conn->query($sql);
		return $result->fetchAll(PDO::FETCH_ASSOC);
	}

?>
