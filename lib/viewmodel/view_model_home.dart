import 'package:user_consumer/model/model_home.dart';
import 'package:user_consumer/services/model/user_consumer.dart';

class ViewModelHome {
  ModelHome modelHome = ModelHome();
  late List<User>? listUser = List.empty();
  Future<List<User>?> getProviderList() async {
    bool isConnectInternet = await modelHome.getStateConnection();
    if (!isConnectInternet) {
      modelHome.getUserJSON();
      print("SIN INTERNET");
      return listUser;
    }
    print("INTERNET");
    listUser = (await modelHome.getUserApi());

    if (listUser!.isEmpty || listUser == null) {
      return List.empty();
    }
    var newList = List.of(listUser!);
    for (int i = 0; i < 4; i++) {
      listUser?.forEach((element) {
        newList.add(element);
      });
    }

    return newList;
  }

  List<User>? getList() {
    return listUser;
  }
}
