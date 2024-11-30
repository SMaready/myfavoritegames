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

  if (!empty($_GET['genreid']))
  {
    $genreId = $_GET['genreid'];
  }
}

$servername = "localhost";
$username = "stephan";
$password = "awesomegamesinc!";
$dbname = "csci12db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT ga.id, 
        ga.name, 
        ga.genreId,
        ga.studio AS gameStudio,
        ga.rating AS gameRating,
        ga.releasedate AS releaseDate,
        ga.description AS description,
        ge.name AS genreName,
        ge.description AS genreDescription
        FROM games ga INNER JOIN genres ge ON ga.genreId=ge.Id";
$hasWhere = false;

if (!empty($id)) {
  $sql = $sql . " WHERE ga.Id = " . $id;
  $hasWhere = true;
}
else if (!empty($name)) {
  $sql = $sql . " WHERE ga.name LIKE '%" . $name . "%'";
  $hasWhere = true;
}

if (!empty($genreId)) {
  if($hasWhere) {
    $sql = $sql . " AND ga.genreId = " . $genreId;
  }
  else {
    $sql = $sql . " WHERE ga.genreId = " . $genreId;
  }
}

$result = $conn->query($sql);

$games = [];

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    $game = [ 
      'id' => $row["id"],
      'name' => $row["name"],
      'genreId' => $row["genreId"],
      'gameStudio' => $row["gameStudio"],
      'gameRating' => $row["gameRating"],
      'releaseDate' => $row["releaseDate"],
      'description' => $row["description"],
      'genreName' => $row["genreName"],
      'genreDescription' => $row["genreDescription"]
    ];
    $games[] = $game;
  }
}

$conn->close();

header('Content-type: application/json');
echo json_encode( $games );
?>