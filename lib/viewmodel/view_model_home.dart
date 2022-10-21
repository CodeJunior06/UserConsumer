import 'package:user_consumer/model/model_home.dart';
import 'package:user_consumer/services/model/user_consumer.dart';
import 'package:user_consumer/view/home_page.dart';

class ViewModelHome {
  ModelHome modelHome = ModelHome();
  late List<User>? listUser = List.empty();
  getProviderList() async {
    bool isConnectInternet = await modelHome.getStateConnection();
    if (!isConnectInternet) {
      modelHome.getUserJSON();
      print("SIN INTERNET");
      return;
    }
    print("INTERNET");
    listUser = (await modelHome.getUserApi());

    if (listUser!.isEmpty) {
      return;
    }
    return;
  }

  List<User>? getList() {
    return listUser;
  }
}
