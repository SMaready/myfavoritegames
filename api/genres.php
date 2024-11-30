<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

if (!empty($_GET)) {
  if (!empty($_GET['id'])) {
    $id = $_GET['id'];
  }
  else if (!empty($_GET['name']))
  {
    $name = $_GET['name'];
  }
}

$servername = "localhost";
$username = "stephan";
$password = "Ste99Mar!!";
$dbname = "CSCI12";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, name, imageUrl, detailUrl FROM genres";

if (!empty($id)) {
    $sql = $sql . " WHERE Id = " . $id;
}
else if (!empty($name))
{
  $sql = $sql . " WHERE name LIKE '%" . $name . "%'";
}

$result = $conn->query($sql);

$genres = [];

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    $genre = [ 
        'id' => $row["id"], 
        'name' => $row["name"], 
        'imageUrl' => $row["imageUrl"], 
        'detailUrl' => $row["detailUrl"]
    ];
    $genres[] = $genre;
  }
}

$conn->close();

header('Content-type: application/json');
echo json_encode( $genres );
?>