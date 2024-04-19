import 'package:asro_store/asroo_store.dart';
import 'package:asro_store/core/app/env.variables.dart';
import 'package:asro_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Env_variable.instance.init(EnvVariableEnum.dev);
  runApp(const AsrooStoreApp());
}
