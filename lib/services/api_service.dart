import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
//import 'package:project_1/model/restaurant_detail_model.dart';
import 'package:login/constants.dart';
import 'package:login/model/enrollModel.dart';
import 'package:login/services/auth_api.dart';

class ApiService {
  static const String _baseUrl = BaseUrl + '/api';
  static const String baseUrlImg = '${_baseUrl}images/';

  Future<EnrollList> getEnrollList() async {
    final response = await Network().getData('/enroll');
    if (response.statusCode == 200) {
      var fin;
      try {
        var jasonStr = response.body;
        fin = parseFromJson(jasonStr);
      } catch (e) {
        print(e);
      }
      return fin;
    } else {
      throw Exception('Failed to load enrollment list');
    }
  }

  Future postEnroll(int kelasid) async {
    Map<String, int> requestBody = {
      'kelas_id': kelasid,
    };
    final response =
        await Network().postData(json.encode(requestBody), '/enroll');
    //var body = json.decode(response.body);
    if (response.statusCode == 200) {
      //return EnrollResponse.fromJson(body);
    } else {
      throw Exception('Failed to post');
    }
  }

  Future deleteEnroll(int enrollid) async {
    var deleteURL = '/unenroll/' + enrollid.toString();
    final response = await Network().deleteData(deleteURL);
    //var body = json.decode(response.body);
    if (response.statusCode == 200) {
      //return EnrollResponse.fromJson(body);
    } else {
      throw Exception('Failed to delete');
    }
  }
}
