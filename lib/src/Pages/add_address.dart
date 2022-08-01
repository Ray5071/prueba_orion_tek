

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prueba_orion_tek/src/Models/address.dart';
import 'package:prueba_orion_tek/src/Models/customers.dart';
import 'package:prueba_orion_tek/src/share_Preferences/preference.dart';

// ignore: must_be_immutable
class AddAddress extends StatefulWidget {
  AddAddress({Key? key, this.customer}) : super(key: key);

  Customers? customer;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  final TextEditingController _addressController = TextEditingController();
  Preference pref = Preference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.0,
            ),
            _textFieldAddress(),
            SizedBox(
              height: 20.0,
            ),
            _button(context)
          ],
        ),
      ),
    );
  }

  Widget _textFieldAddress() {
    return TextFormField(
      controller: _addressController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: 'Address',
        suffixIcon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return TextButton(
        onPressed: () {
          _saveAddress(context);
        },
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        child: const Text('Save'));
  }

  _saveAddress(BuildContext context){
    if(!_validate()) return;
    int id = 0;
    List<Address> adr = <Address>[];

    if(pref.listAddress.length > 0){
      int? idC = pref.listAddress.last.idAddress;
      id = 1;
      id += idC;
      adr.addAll(pref.listAddress);
    } else {id = 1;}
    
    Address addre = Address(
      idAddress: id ,
      idCustomer: widget.customer!.idCustomer,
      address: _addressController.text,
    );
    adr.add(addre);

    pref.listAddress = adr;

    _messages('Saved successfully', Colors.green);
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  bool _validate(){
    bool valid = true;

    if(_addressController.text.isEmpty){
      valid = false;
      _messages('Please enter the Address', Colors.redAccent);
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