// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:customerapp/controllers/coupondetails_controller.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CouponDetailsScreen extends StatefulWidget {
  String? id;
  CouponDetailsScreen({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<CouponDetailsScreen> createState() => _CouponDetailsScreenState();
}

class _CouponDetailsScreenState extends State<CouponDetailsScreen> {
  CouponDetailController couponDetailController =
      Get.put(CouponDetailController());
  @override
  void initState() {
    couponDetailController.getCoupon(widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coupon Details"),
        centerTitle: true,
      ),
      body: GetBuilder<CouponDetailController>(
        builder: (controller) {
          if (couponDetailController.loading) {
           return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: couponDetailController.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: CouponCard(
                          height: 150,
                          backgroundColor: Color(0xfff1e3d3),
                          curveAxis: Axis.vertical,
                          firstChild: Container(
                            decoration: const BoxDecoration(
                              color: Colors.blueGrey,
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '23%',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'OFF',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(color: Colors.white54, height: 0),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'WINTER IS\nHERE',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          secondChild: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Coupon Code:${couponDetailController.data[index].couponNo}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Status:${couponDetailController.data[index].status}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Redeemed on:${couponDetailController.data[index].redeemedOn}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
