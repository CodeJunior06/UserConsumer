import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_consumer/viewmodel/view_model_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewModelHome viewModelHome = ViewModelHome();
  bool visibleList = false;
  @override
  void initState() {
    super.initState();
    viewModelHome.getProviderList();
    setState(() {
      visibleList = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                child: Column(children: [
              const Text(
                "USERS",
                style: TextStyle(fontSize: 25, color: Colors.deepOrangeAccent),
              ),
              Visibility(
                  visible: visibleList,
                  child: GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModelHome.getList()?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Card(
                              child: Center(
                                  child: Text(
                                      viewModelHome.getList()![index].name)),
                            ));
                      }))
            ]))));
  }
}
