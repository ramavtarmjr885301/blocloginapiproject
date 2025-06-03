import 'dart:convert';
import 'package:blocloginapiproject/BLoC/model/loginReqModel.dart';
import 'package:blocloginapiproject/BLoC/model/loginResponseModel.dart';
import 'package:http/http.dart' as http;

class LoginRepo {

 Future login(String userName, String password)async{

var url="https://dummyjson.com/auth/login";
LoginReqModel loginReqModel= LoginReqModel(username: userName, password: password);
http.Response response= await  http.post(Uri.parse(url),
headers: {'Content-Type':'application/json'},
body: jsonEncode(loginReqModel.toJson())

);
try{
if(response.statusCode==200){
  var resp = response.body;
  var respBody=jsonDecode(resp);
  return LoginResponseModel.fromJson(respBody);
}else{
  return LoginResponseModel();
}

}
catch(e){
  throw Exception(e);
}

  }
}