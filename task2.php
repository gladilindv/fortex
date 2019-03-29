<?php
/*

View query on http://sqlfiddle.com/#!9/f4015e/2/0

define("SQL_QUERY", "select BuildID, Contact from ... ");

mysql_connect("localhost", "mysql_user", "mysql_password") or
    die("connection error: " . mysql_error());
mysql_select_db("mydb");

$result = mysql_query(SQL_QUERY);

while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
    // fill mysql_result
}

mysql_free_result($result);
*/

// mock data
$mysql_result = array(
    array("BuildID"=>"101", "Contact"=>"901-23456788"), 
    array("BuildID"=>"101", "Contact"=>"901-23456789"),
    array("BuildID"=>"102", "Contact"=>"901-23456788"), 
    array("BuildID"=>"102", "Contact"=>"901-23456789"), 
    array("BuildID"=>"102", "Contact"=>"901-23456790"), 
    array("BuildID"=>"103", "Contact"=>"901-23456790")
    );

// bind contacts to the array of unique separate buildings
$cnt = array();
foreach($mysql_result as $key => $value){
  $cnt[$value['Contact']][] = $value['BuildID'];
}
// reduce to unique groups of building
$u = array_unique($cnt, SORT_REGULAR);

// show the groups
$idx = 0;
foreach($u as $key => $value){
  $c = array_keys($cnt, $value);
  echo "Group ".$idx++.":\n" ;
  echo "\tbuildings: ".join(',',$value)."\n";
  echo "\tcontacts: ".join(',',$c)."\n";
}

?>
