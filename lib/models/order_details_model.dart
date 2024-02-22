// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
    final dynamic status;
    final String? orderDate;
    final String? noOfBottles;
    final String? paymentType;
    final String? driver;
    final String? assignedDate;
    final String? deliveredDate;
    final int? orderId;

    OrderDetailsModel({
        this.status,
        this.orderDate,
        this.noOfBottles,
        this.paymentType,
        this.driver,
        this.assignedDate,
        this.deliveredDate,
        this.orderId,
    });

    OrderDetailsModel copyWith({
        dynamic status,
        String? orderDate,
        String? noOfBottles,
        String? paymentType,
        String? driver,
        String? assignedDate,
        String? deliveredDate,
        int? orderId,
    }) => 
        OrderDetailsModel(
            status: status ?? this.status,
            orderDate: orderDate ?? this.orderDate,
            noOfBottles: noOfBottles ?? this.noOfBottles,
            paymentType: paymentType ?? this.paymentType,
            driver: driver ?? this.driver,
            assignedDate: assignedDate ?? this.assignedDate,
            deliveredDate: deliveredDate ?? this.deliveredDate,
            orderId: orderId ?? this.orderId,
        );

    factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
        status: json["status"],
        orderDate: json["order_date"],
        noOfBottles: json["no_of_bottles"],
        paymentType: json["payment_type"],
        driver: json["driver"],
        assignedDate: json["assigned_date"],
        deliveredDate: json["delivered_date"],
        orderId: json["order_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "order_date": orderDate,
        "no_of_bottles": noOfBottles,
        "payment_type": paymentType,
        "driver": driver,
        "assigned_date": assignedDate,
        "delivered_date": deliveredDate,
        "order_id": orderId,
    };
}
