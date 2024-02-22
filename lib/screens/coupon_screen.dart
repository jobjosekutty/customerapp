import 'package:customerapp/constants/app_constants.dart';
import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/controllers/coupon_controller.dart';
import 'package:customerapp/screens/coupondetails_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  CouponController couponController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupon'),
        centerTitle: true,
      ),
      body: GetBuilder<CouponController>(
        builder: (controller) {
          if (couponController.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.blue1,
              ),
            );
          }
          if (couponController.data!.isEmpty) {
            return Center(
              child: Text('NO COUPON'),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: couponController.data?.length,
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
                                    "Book no:${couponController.data?[index].bookNo}",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.green1,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "${couponController.data?[index].status}",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                                "Book ID:${couponController.data?[index].bookId}"),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CupertinoButton(
                                      onPressed: () {
                                        Get.to(CouponDetailsScreen(
                                            id: couponController
                                                .data?[index].bookId
                                                .toString()));
                                      },
                                      color: AppColors.blue1,
                                      child: const Text("Coupon Details"),
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
