// To parse this JSON data, do
//
//     final getEmirates = getEmiratesFromJson(jsonString);

import 'dart:convert';

List<GetEmirates> getEmiratesFromJson(String str) => List<GetEmirates>.from(json.decode(str).map((x) => GetEmirates.fromJson(x)));

String getEmiratesToJson(List<GetEmirates> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetEmirates {
    final int? emiratesId;
    final String? name;

    GetEmirates({
        this.emiratesId,
        this.name,
    });

    GetEmirates copyWith({
        int? emiratesId,
        String? name,
    }) => 
        GetEmirates(
            emiratesId: emiratesId ?? this.emiratesId,
            name: name ?? this.name,
        );

    factory GetEmirates.fromJson(Map<String, dynamic> json) => GetEmirates(
        emiratesId: json["emirates_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "emirates_id": emiratesId,
        "name": name,
    };
}
