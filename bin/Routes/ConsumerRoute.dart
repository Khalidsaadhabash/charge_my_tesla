// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middelwares/User/CheckToken_Middelware.dart';
import '../Response/User/Consumer/cancelOrderResponse.dart';
import '../Response/User/Consumer/placeOrderResponse.dart';
import '../Response/User/Consumer/viewNearbyStationResponse.dart';
import '../Response/User/Consumer/viewOrderResponse.dart';



class ConsumerRoute {
  Handler get handler {
    final router = Router()
      ..post("/cancel_order/<id>", cancelOrderResponse)
      ..post('/place_order/<id>', placeOrderResponse)
      ..get("/view_order", viewOrderResponse)
      ..get('/view_nearby_station', viewNearbyStationResponse);
    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
