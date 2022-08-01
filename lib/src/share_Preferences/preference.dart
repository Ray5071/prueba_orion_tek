import 'dart:convert';

import 'package:prueba_orion_tek/src/Models/address.dart';
import 'package:prueba_orion_tek/src/Models/customers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {

  static final Preference _instancia = Preference._internal();

  factory Preference() {
    return _instancia;
  }

  Preference._internal();

  SharedPreferences? _prefs;

  Future initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<Customers> get listCustomers {
    final obj = json.decode(
        _prefs?.getString('listCustomers') ?? jsonEncode(<Customers>[]));
    return List<Customers>.from(obj?.map((x) => Customers.fromJson(x)));
  }

  set listCustomers(List<Customers> value) {
    final lst = List<dynamic>.from(value.map((e) => e.toJson()));
    String encode = jsonEncode(lst);
    _prefs?.setString('listCustomers', encode);
  }

  List<Address> get listAddress {
    final obj = json
        .decode(_prefs?.getString('listAddress') ?? jsonEncode(<Address>[]));
    return List<Address>.from(obj?.map((x) => Address.fromJson(x)));
  }

  set listAddress(List<Address> value) {
    final lst = List<dynamic>.from(value.map((e) => e.toJson()));
    String encode = jsonEncode(lst);
    _prefs?.setString('listAddress', encode);
  }
}
