import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_local_database/HomeScreen.dart';
import 'package:path_provider/path_provider.dart';

import 'notes_model/Model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory  =  await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ModelAdapter());
  await Hive.openBox<Model>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

