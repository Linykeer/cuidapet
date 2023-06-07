import 'package:cuidapet/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:cuidapet/app/core/rest_client/rest_client.dart';
import 'package:cuidapet/app/modules/home/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Center(
              child: ElevatedButton(
            child: const Text('Logout'),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )),
          Center(
              child: ElevatedButton(
            child: const Text('Refresh'),
            onPressed: () async {
              final result =
                  await Modular.get<RestClient>().auth().get('/categories/');
              print(result.data);
            },
          )),
        ],
      ),
    );
  }
}
