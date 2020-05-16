import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class TesController {
  //deskripsi parameter bisa langsund ditulis di dalam () atau didalam({})
  //kalau di dalam () harus diisi semua waktu manggil fungsi
  //kalau di dalma ({}) ngisinya harus pakai key
  Future<List> getData({@required String name}) async {
    try {
      FormData formData = new FormData.fromMap({
        "name": name,
        "age": "25",
      });
      Response response;
      Dio dio = new Dio();
      response = await dio.post("https://reqres.in/api/users", data: formData);
      var json = jsonDecode(response.toString());
      Logger().i(json);
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
