import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'utils/colors.dart';
import 'screens/fleet_view.dart';

void main() async{
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colour.primaryColor ,
      ),
      home: const FleetView(),
    );
  }
}



