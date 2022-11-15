import 'package:flutter/material.dart';
import 'package:user_consumer/services/model/user_consumer.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ITEM INFORMATION'),
      ),
      body: Center(
        child: Container(
          child: Text(parameter.name),
        ),
      ),
    );
  }
}
