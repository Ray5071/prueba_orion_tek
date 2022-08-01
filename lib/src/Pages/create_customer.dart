import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prueba_orion_tek/src/Models/customers.dart';
import 'package:prueba_orion_tek/src/share_Preferences/preference.dart';

// ignore: must_be_immutable
class CreateCustomer extends StatefulWidget {
  CreateCustomer({Key? key}) : super(key: key);

  @override
  State<CreateCustomer> createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {
  final TextEditingController _nameCustomer = TextEditingController();
  final TextEditingController _lastnameCustomer = TextEditingController();
  final TextEditingController _ageCustomer = TextEditingController();
  Preference pref = Preference();
  List<Customers> customers = <Customers>[];

  @override
  Widget build(BuildContext context) {
    //loadSharedPrefs();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Customer'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Create',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.0,
            ),
            _textFieldName(),
            SizedBox(
              height: 20.0,
            ),
            _textFieldLastName(),
            SizedBox(
              height: 20.0,
            ),
            _textFieldAge(),
            SizedBox(
              height: 20.0,
            ),
            _button(context),
          ],
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return TextFormField(
      controller: _nameCustomer,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: 'Name Customer',
        suffixIcon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _textFieldLastName() {
    return TextFormField(
      controller: _lastnameCustomer,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: 'Last Name Customer',
        suffixIcon: const Icon(Icons.account_circle_outlined),
      ),
    );
  }

  Widget _textFieldAge() {
    return TextFormField(
      controller: _ageCustomer,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: 'Age Customer',
        suffixIcon: const Icon(Icons.calendar_today_rounded),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return TextButton(
        onPressed: () {
          _saveCustomer(context);
        },
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        child: const Text('Save'));
  }

  _saveCustomer(BuildContext context){
    if(!_validate()) return;
    int id = 0;
    List<Customers> cus = <Customers>[];
    int? age = int.tryParse(_ageCustomer.text);

    if(pref.listCustomers.length > 0){
      int? idC = pref.listCustomers.last.idCustomer;
      id = 1;
      id += idC!;
      cus.addAll(pref.listCustomers);
    } else {id = 1;}
    
    Customers custom = Customers(
      idCustomer: id,
      name: _nameCustomer.text,
      lastName: _lastnameCustomer.text,
      age: age!,
    );
    cus.add(custom);

    pref.listCustomers = cus;

    _messages('Saved successfully', Colors.green);
    Navigator.of(context).pop();
  }

  bool _validate(){
    bool valid = true;

    if(_nameCustomer.text.isEmpty){
      valid = false;
      _messages('Please enter the name', Colors.redAccent);
    } else {
      if(_lastnameCustomer.text.isEmpty){
        valid = false;
        _messages('Please enter the address', Colors.redAccent);
      } else{
        if(_ageCustomer.text.isEmpty){
          valid = false;
        _messages('Please enter the age', Colors.redAccent);
        } else{
          int? age = int.tryParse(_ageCustomer.text) ?? 0;
          if(age <= 0){
            valid = false;
            _messages('Invalid age', Colors.redAccent);
          }
        }
      }
    }

    return valid;
  }

  _messages(String text, Color color) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 17.0,
        timeInSecForIosWeb: 10);
  }
}
