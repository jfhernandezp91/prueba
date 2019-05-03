<?php
$conexion = new mysqli("localhost","document_jamer","@+2!y.p+i)Q3","document_prueba");
if($conexion){
	$consulta_sql = "SELECT A.name, B.phoneNumber, B.address, C.company
			FROM users A 
			INNER JOIN usersContactInfo B ON A.userId = B.userId
			INNER JOIN companies C ON A.companyId = C.companyId";
	$query = $conexion->query($consulta_sql);
	$datos = array();
	while($r = $query->fetch_assoc()){
		$datos[] = $r;
	}
	echo json_encode(array("usuarios"=>$datos));
}
?>