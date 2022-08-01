import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_orion_tek/src/Pages/add_address.dart';
import 'package:prueba_orion_tek/src/Pages/create_customer.dart';
import 'package:prueba_orion_tek/src/Pages/home_page.dart';
import 'package:prueba_orion_tek/src/share_Preferences/preference.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Preference();
  await prefs.initPrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        'create': (context) => CreateCustomer(),
        'address': (context) => AddAddress(),
      },
    );
  }
}
