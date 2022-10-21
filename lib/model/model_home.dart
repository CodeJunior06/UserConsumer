import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:user_consumer/services/model/user_consumer.dart';
import 'package:http/http.dart' as http;
import 'package:user_consumer/services/user.dart';

class ModelHome {
  Future<List<User>?> getUserApi() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      print("RESPONSE 200");
      var json = response.body;
      return UserFinal.userFromJson(json);
    }
    print("RESPONSE != 200");
    return null;
  }

  Future<List<User>?> getUserJSON() async {
    return null;
  }

  Future<bool> getStateConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
