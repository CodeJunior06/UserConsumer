import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_consumer/services/model/user_consumer.dart';
import 'package:user_consumer/viewmodel/view_model_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewModelHome viewModelHome = ViewModelHome();
  late Future<List<User>?> _listUser;
  @override
  void initState() {
    super.initState();
    _listUser = viewModelHome.getProviderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _listUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data?.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Card(
                        child: Center(child: Text(snapshot.data![index].name)),
                      ));
                });
          }
          return const Center(
            child: CircularProgressIndicator()
          );
        },
      ),
    );
  }
}
