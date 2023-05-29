import 'package:cuidapet/app/core/helpers/environments.dart';
import 'package:cuidapet/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _firebaseCoreConfig();
    await _loadEnvs();
  }

  Future<void> _firebaseCoreConfig() async => await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

  Future<void> _loadEnvs() => Environments.loadEnvs();
}
