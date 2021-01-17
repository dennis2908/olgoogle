<?php
 // data marker
 $markers = array(
  array(
   'title'=>'Dennis',
   'lat'=>'-7.644871999999999',
   'lng'=>'112.90329700000007',
   'add'=>'jln jhanam3',
  ),
  array(
   'title'=>'Maman',
   'lat'=>'-6.188597',
   'lng'=>'106.58851700000002',
   'add'=>'jln jhanam4',
  ),
  array(
   'title'=>'Daeng',
   'lat'=>'-7.981894',
   'lng'=>'112.62650299999996',
   'add'=>'jln jhanam5',
  ),
  array(
   'title'=>'Zen',
   'lat'=>'-6.202251',
   'lng'=>'107.001587',
   'add'=>'jln jhanam6',
  ),
 );

 // set response
 $response = array(
  'type'=>'FeatureCollection',
  'features'=>array()
 );

 // loop marker
 foreach ($markers as $key=>$val) {
  $title = $val['title'];
  $lat = $val['lat'];
  $lng = $val['lng'];
  $add = $val['add'];

  // set properties
  $properties = array(
   'title'=>$title,
   'lat'=>$lat,
   'lng'=>$lng,
   'add'=>$add,
   'pos'=>($key*10)+20
  );

  // push data to features
  array_push($response['features'], array(
   'type'=>'Feature',
   'geometry'=>array(
    'type'=>'Point',
    'coordinates'=>array($lng, $lat)
   ),
   'properties'=>$properties
  ));
 }

 // set response JSON
 header('Content-Type: application/json');
 echo json_encode($response);