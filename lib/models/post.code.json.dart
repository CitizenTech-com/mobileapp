import 'dart:convert';

PostCodeJson postCodeJsonFromJson(String str) => PostCodeJson.fromJson(json.decode(str));

String postCodeJsonToJson(PostCodeJson data) => json.encode(data.toJson());

class PostCodeJson {
  String city;
  String postcode;
  List<Address> addresses;

  PostCodeJson({
    required this.city,
    required this.postcode,
    required this.addresses,
  });

  factory PostCodeJson.fromJson(Map<String, dynamic> json) => PostCodeJson(
    city: json["city"],
    postcode: json["postcode"],
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "postcode": postcode,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}

class Address {
  String bn;
  String hn;
  String fn;
  String st;

  Address({
    required this.bn,
    required this.hn,
    required this.fn,
    required this.st,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    bn: json["bn"]!,
    hn: json["hn"],
    fn: json["fn"],
    st: json["st"]!,
  );

  Map<String, dynamic> toJson() => {
    "bn": bn,
    "hn": hn,
    "fn": fn,
    "st": st,
  };
}