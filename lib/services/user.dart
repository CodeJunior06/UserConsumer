import 'dart:convert';

import 'package:user_consumer/services/model/user_consumer.dart';

class UserFinal {
  static List<User> userFromJson(String str) =>
      List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

  String userToJson(List<User> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
