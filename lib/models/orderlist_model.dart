// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

List<OrderListModel> orderListModelFromJson(String str) => List<OrderListModel>.from(json.decode(str).map((x) => OrderListModel.fromJson(x)));

String orderListModelToJson(List<OrderListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderListModel {
    final int? orderId;
    final String? noOfBottles;
    final dynamic status;

    OrderListModel({
        this.orderId,
        this.noOfBottles,
        this.status,
    });

    OrderListModel copyWith({
        int? orderId,
        String? noOfBottles,
        dynamic status,
    }) => 
        OrderListModel(
            orderId: orderId ?? this.orderId,
            noOfBottles: noOfBottles ?? this.noOfBottles,
            status: status ?? this.status,
        );

    factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        orderId: json["order_id"],
        noOfBottles: json["no_of_bottles"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "no_of_bottles": noOfBottles,
        "status": status,
    };
}
