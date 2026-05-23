MERGE (l:Land {id:$id})

SET
    l.title = $title,
    l.price_billion = $price_billion,
    l.area_m2 = $area_m2,
    l.width_m = $width_m,
    l.length_m = $length_m,
    l.legal_status = $legal_status,
    l.direction = $direction,
    l.lat = $lat,
    l.lng = $lng,
    l.ai_score = $ai_score,
    l.created_at = datetime();

MERGE (a:Area {name:$area})

MERGE (r:Road {name:$road})

MERGE (b:Broker {phone:$broker_phone})

MERGE (l)-[:IN_AREA]->(a)

MERGE (l)-[:LOCATED_ON]->(r)

MERGE (l)-[:LISTED_BY]->(b);
