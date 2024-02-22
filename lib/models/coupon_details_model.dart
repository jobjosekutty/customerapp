// To parse this JSON data, do
//
//     final couponDetailsModel = couponDetailsModelFromJson(jsonString);

import 'dart:convert';

List<CouponDetailsModel> couponDetailsModelFromJson(String str) => List<CouponDetailsModel>.from(json.decode(str).map((x) => CouponDetailsModel.fromJson(x)));

String couponDetailsModelToJson(List<CouponDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CouponDetailsModel {
    final String? couponNo;
    final Status? status;
    final String? redeemedOn;

    CouponDetailsModel({
        this.couponNo,
        this.status,
        this.redeemedOn,
    });

    CouponDetailsModel copyWith({
        String? couponNo,
        Status? status,
        String? redeemedOn,
    }) => 
        CouponDetailsModel(
            couponNo: couponNo ?? this.couponNo,
            status: status ?? this.status,
            redeemedOn: redeemedOn ?? this.redeemedOn,
        );

    factory CouponDetailsModel.fromJson(Map<String, dynamic> json) => CouponDetailsModel(
        couponNo: json["coupon_no"],
        status: statusValues.map[json["status"]]!,
        redeemedOn: json["redeemed_on"],
    );

    Map<String, dynamic> toJson() => {
        "coupon_no": couponNo,
        "status": statusValues.reverse[status],
        "redeemed_on": redeemedOn,
    };
}

enum Status {
    INACTIVE
}

final statusValues = EnumValues({
    "inactive": Status.INACTIVE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
