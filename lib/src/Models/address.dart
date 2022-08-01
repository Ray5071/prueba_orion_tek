import 'dart:convert';

class Address {
    Address({
        required this.idAddress,
        this.idCustomer,
        required this.address,
    });

    int idAddress;
    int? idCustomer;
    String address;

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        idAddress: json["idAddress"] ?? 0,
        idCustomer: json["idCustomer"] ?? 0,
        address: json["address"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "idAddress": idAddress,
        "idCustomer": idCustomer,
        "address": address,
    };
}
