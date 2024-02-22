// To parse this JSON data, do
//
//     final getArea = getAreaFromJson(jsonString);

import 'dart:convert';

List<GetArea> getAreaFromJson(String str) => List<GetArea>.from(json.decode(str).map((x) => GetArea.fromJson(x)));

String getAreaToJson(List<GetArea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetArea {
    final int? areaId;
    final String? name;

    GetArea({
        this.areaId,
        this.name,
    });

    GetArea copyWith({
        int? areaId,
        String? name,
    }) => 
        GetArea(
            areaId: areaId ?? this.areaId,
            name: name ?? this.name,
        );

    factory GetArea.fromJson(Map<String, dynamic> json) => GetArea(
        areaId: json["area_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "area_id": areaId,
        "name": name,
    };
}
