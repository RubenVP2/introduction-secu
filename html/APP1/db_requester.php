<?php

	function request($sql, $params) {
		try {
			$conn = new PDO('mysql:host=172.25.0.4;dbname=idor_db', 'root', 'S3cret');
			$stmt = $conn->prepare($sql);
			$stmt->execute($params);
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		} catch (PDOException $e) {
			echo $e->getMessage();
		}
	}

?>
