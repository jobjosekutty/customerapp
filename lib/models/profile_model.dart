// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    final String? phone;
    final String? name;
    final String? email;
    final String? emirates;
    final String? area;
    final String? building;
    final String? flatNo;

    ProfileModel({
        this.phone,
        this.name,
        this.email,
        this.emirates,
        this.area,
        this.building,
        this.flatNo,
    });

    ProfileModel copyWith({
        String? phone,
        String? name,
        String? email,
        String? emirates,
        String? area,
        String? building,
        String? flatNo,
    }) => 
        ProfileModel(
            phone: phone ?? this.phone,
            name: name ?? this.name,
            email: email ?? this.email,
            emirates: emirates ?? this.emirates,
            area: area ?? this.area,
            building: building ?? this.building,
            flatNo: flatNo ?? this.flatNo,
        );

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        phone: json["phone"],
        name: json["name"],
        email: json["email"],
        emirates: json["emirates"],
        area: json["area"],
        building: json["building"],
        flatNo: json["flat_no"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "name": name,
        "email": email,
        "emirates": emirates,
        "area": area,
        "building": building,
        "flat_no": flatNo,
    };
}
