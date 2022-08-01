import 'package:flutter/material.dart';
import 'package:prueba_orion_tek/src/Models/customers.dart';
import 'package:prueba_orion_tek/src/Pages/add_address.dart';
import 'package:prueba_orion_tek/src/share_Preferences/preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Customers> customers = <Customers>[];
  Preference pref = Preference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).pushNamed('create', arguments: '');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 210.0),
          itemCount: pref.listCustomers.length,
          itemBuilder: (context, index) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: cardCustomer(pref.listCustomers[index]),
            );
          },
        ),
      ),
    );
  }

  Widget cardCustomer(Customers cust) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color(0xFFF4F5F7))),
      child: GestureDetector(
        onTap: () {},
        child: Card(
            borderOnForeground: false,
            color: Color(0xFFF4F5F7),
            shadowColor: Color(0xFFF4F5F7),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFFF4F5F7), width: 1.0),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF4F5F7))),
                  height: 50.0,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text('ID CUSTOMER: '),
                      Text('${cust.idCustomer}')
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF949494)),
                      color: Colors.white),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      buildName(cust),
                      const SizedBox(
                        height: 8.0,
                      ),
                      buildLastName(cust),
                      const SizedBox(
                        height: 8.0,
                      ),
                      buildAge(cust),
                      const SizedBox(
                        height: 8.0,
                      ),
                      buildCountAddress(cust)
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: addAddress(cust))
              ],
            )),
      ),
    );
  }

  Widget addAddress(Customers cust) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        onPrimary: Colors.white,
        shadowColor: Colors.green,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        minimumSize: const Size(70, 30),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('address', arguments: '');
        Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (_) => AddAddress(customer: cust,
                          )));
      },
      child: Text('Add Address'),
    );
  }

  Widget buildName(Customers cust) {
    return Row(
      children: [
        const Text(
          'Name: ',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF808080)),
        ),
        Text(
          cust.name ?? '',
          style: const TextStyle(color: Color(0xFF808080)),
        ),
      ],
    );
  }

  Widget buildLastName(Customers cust) {
    return Row(
      children: [
        const Text(
          'Last Name: ',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF808080)),
        ),
        Text(
          cust.lastName ?? '',
          style: const TextStyle(color: Color(0xFF808080)),
        ),
      ],
    );
  }

  Widget buildAge(Customers cust) {
    return Row(
      children: [
        const Text(
          'Age: ',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF808080)),
        ),
        Text(
          '${cust.age ?? 0}',
          style: const TextStyle(color: Color(0xFF808080)),
        ),
      ],
    );
  }

  Widget buildCountAddress(Customers cust) {
    var add = pref.listAddress.where((x) => x.idCustomer == cust.idCustomer,).toList();
    return Row(
      children: [
        const Text(
          'Count Address: ',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF808080)),
        ),
        Text(
          '${add.length}',
          style: const TextStyle(color: Color(0xFF808080)),
        ),
      ],
    );
  }
}
