import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class Network {
  final String _url = BaseUrl + '/api';
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token')!;
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  postData(requestBody, apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: requestBody, headers: _setHeaders());
  }

  putData(requestBody, apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.put(Uri.parse(fullUrl),
        body: requestBody, headers: _setHeaders());
  }

  deleteData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.delete(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
