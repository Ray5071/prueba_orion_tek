

import 'dart:convert';

class Customers {
    Customers({
        this.idCustomer,
        this.name,
        this.lastName,
        this.age,
        this.conteoDirecciones,
    });

    int? idCustomer;
    String? name;
    String? lastName;
    int? age;
    int? conteoDirecciones;

    factory Customers.fromRawJson(String str) => Customers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        idCustomer: json["idCustomer"] ?? 0,
        name: json["name"] ?? '',
        lastName: json["lastName"] ?? '',
        age: json["age"] ?? 0,
        conteoDirecciones: json["conteoDirecciones"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "idCustomer": idCustomer,
        "name": name,
        "lastName": lastName,
        "age": age,
        "conteoDirecciones": conteoDirecciones,
    };
}