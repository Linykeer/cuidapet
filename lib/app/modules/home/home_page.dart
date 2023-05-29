import 'package:cuidapet/app/core/rest_client/rest_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
                child: ElevatedButton(
              child: Text('Logout'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            )),
          ),
          Container(
            child: Center(
                child: ElevatedButton(
              child: Text('Refresh'),
              onPressed: () async {
                final result =
                    await Modular.get<RestClient>().auth().get('/categories/');
                print(result.data);
              },
            )),
          ),
        ],
      ),
    );
  }
}
