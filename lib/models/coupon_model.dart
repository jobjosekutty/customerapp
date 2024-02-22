// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

List<CouponModel> couponModelFromJson(String str) => List<CouponModel>.from(json.decode(str).map((x) => CouponModel.fromJson(x)));

String couponModelToJson(List<CouponModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CouponModel {
    final String? bookNo;
    final String? status;
    final int? bookId;

    CouponModel({
        this.bookNo,
        this.status,
        this.bookId,
    });

    CouponModel copyWith({
        String? bookNo,
        String? status,
        int? bookId,
    }) => 
        CouponModel(
            bookNo: bookNo ?? this.bookNo,
            status: status ?? this.status,
            bookId: bookId ?? this.bookId,
        );

    factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        bookNo: json["book_no"],
        status: json["status"],
        bookId: json["book_id"],
    );

    Map<String, dynamic> toJson() => {
        "book_no": bookNo,
        "status": status,
        "book_id": bookId,
    };
}
