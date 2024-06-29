import 'package:customerapp/constants/app_constants.dart';
import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/controllers/orderdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetails extends StatefulWidget {
  final int? orderid;
  const OrderDetails({super.key, required this.orderid});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  OrderdetailsController orderdetailsController =
      Get.put(OrderdetailsController());
  @override
  void initState() {
    orderdetailsController.getOrderdetails(widget.orderid.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkScaffold,
        body: GetBuilder<OrderdetailsController>(
          builder: (controller) {
            if (orderdetailsController.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.green1,
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar.medium(
                  backgroundColor: AppColors.appbar,
                  iconTheme: IconThemeData(
                    color: AppColors.grey6,
                  ),
                  title: Text(
                    'Order Details',
                    style: appTextStyle(
                        fontWeight: FontWeight.w600, color: AppColors.white),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        setHeight(8),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.grey1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order Details",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.orange,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Status",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${orderdetailsController.data?.status}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                setHeight(4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Order Date',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${orderdetailsController.data?.orderDate}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                setHeight(4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "No of Bottle",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${orderdetailsController.data?.noOfBottles}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Payment Type",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${orderdetailsController.data?.paymentType}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Driver",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${orderdetailsController.data?.driver}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Assigned Date",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${orderdetailsController.data?.assignedDate}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivered Date",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${orderdetailsController.data?.deliveredDate}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order Id",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '${orderdetailsController.data?.orderId}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // setHeight(16),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: CupertinoButton(
                        //         onPressed: () {},
                        //         color: AppColors.blue1,
                        //         child: Text("Make Delivery"),
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
