<?php

	function request($sql, $params) {
		$conn =new PDO('mysql:host=127.0.0.1;dbname=idor_db', 'idor_user', '0a04ffebd4186d8cc7f1'); 
		$stmt = $conn->prepare($sql);
		$stmt->execute($params);
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}

?>
