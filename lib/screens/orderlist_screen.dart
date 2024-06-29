// ignore_for_file: avoid_print

import 'package:customerapp/constants/app_constants.dart';
import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/controllers/orderlist_controller.dart';
import 'package:customerapp/screens/order_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  OrderlistController orderlistController = Get.put(OrderlistController());
  @override
  void initState() {
    print("jobjosekutty");
    orderlistController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderlistController>(
        builder: (controller) {
          if (orderlistController.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.blue1,
              ),
            );
          }
          if (orderlistController.data.isEmpty) {
            return Center(child: Text("NO ORDER FOUND"));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: orderlistController.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        color: AppColors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Text(
                                    "Order Id:${orderlistController.data[index].orderId}",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                // Container(
                                //   margin: const EdgeInsets.only(
                                //       top: 10, left: 10, right: 10),
                                //   padding: const EdgeInsets.symmetric(
                                //     horizontal: 8,
                                //     vertical: 4,
                                //   ),
                                //   decoration: BoxDecoration(
                                //     color: AppColors.black,
                                //     borderRadius: BorderRadius.circular(5),
                                //   ),
                                //   child: Text(
                                //     "ExpressOrder",
                                //     style: TextStyle(
                                //       color: AppColors.white,
                                //       fontWeight: FontWeight.w600,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            setHeight(8),
                            Text(
                              "Number of bottles:${orderlistController.data[index].noOfBottles}",
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            setHeight(8),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CupertinoButton(
                                      onPressed: () {
                                        Get.to(OrderDetails(
                                            orderid: orderlistController
                                                .data[index].orderId));
                                      },
                                      color: AppColors.blue3,
                                      child: const Text("Order Details"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            setHeight(8)
                          ],
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
