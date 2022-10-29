import 'package:user_consumer/model/model_home.dart';
import 'package:user_consumer/services/model/user_consumer.dart';
import 'package:user_consumer/view/home_page.dart';

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
    return listUser;
  }

  List<User>? getList() {
    return listUser;
  }
}
