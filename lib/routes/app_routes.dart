import 'package:flutter/cupertino.dart';
import 'package:user_consumer/routes/route.dart';
import 'package:user_consumer/view/home_page.dart';


Map<String, WidgetBuilder> getAppRoutes() {
  return <String, Widget Function(BuildContext) > {
    Routes.HOME: (BuildContext context) => const HomePage()
};
}
