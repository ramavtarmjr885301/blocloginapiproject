import 'dart:convert';
import 'package:blocloginapiproject/BLoC/model/loginReqModel.dart';
import 'package:blocloginapiproject/BLoC/model/loginResponseModel.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  Future<LoginResponseModel> login(String userName, String password) async {
    const String url = "https://dummyjson.com/auth/login";

    final loginReqModel = LoginReqModel(username: userName, password: password);

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginReqModel.toJson()),
      );

      if (response.statusCode == 200) {
        final respBody = jsonDecode(response.body);
        return LoginResponseModel.fromJson(respBody);
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Login request failed: $e');
    }
  }
}
