import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class TesController {
  getData() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get("https://reqres.in/api/users?page=2");
      var json = jsonDecode(response.toString());
      return json['data'];
    } catch(e) {
      Logger().e(e);
      return [];
    }
    // response =
    //     await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
    // print(response.data.toString());
  }
}
