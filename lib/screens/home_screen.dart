import 'dart:io';

import 'package:customerapp/constants/app_constants.dart';
import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/controllers/home_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bottleFocusNode = FocusNode();
  TextEditingController bottleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    count();
    super.initState();
  }

  bool load = false;
  int? Number;

  count() async {
    load = true;

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString("bottle");
    Number = int.parse(data!);
    print("====Number==>$Number");
    load = false;
    setState(() {});
  }

  HomeController homeController = Get.put(HomeController());

  showProcessDialogue() {
    Get.dialog(Platform.isIOS
        ? CupertinoAlertDialog(
            content: Column(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text("Please Enter Vaild Number"),
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(color: AppColors.white),
                    ))
              ],
            ),
          )
        : AlertDialog(
            backgroundColor: CupertinoColors.white,
            content: SizedBox(
              height: 80,
              child: Column(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Please Enter Vaild Number"),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue1),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(color: AppColors.white),
                      ))
                ],
              ),
            ),
          ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey5,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            color: AppColors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Text(
                        "Select Bottle Count",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                setHeight(16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      focusNode: bottleFocusNode,
                      controller: bottleController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter bottle count';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        floatingLabelStyle: GoogleFonts.poppins(
                          color: AppColors.blue1,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8.0,
                        ),
                        label: const Text(
                          'Select No of Bottle',
                        ),
                        hintText: ' Select No of Bottle',
                        labelStyle: appTextStyle(),
                        hintStyle: appTextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                          borderSide: BorderSide(
                            width: 0.5,
                            color: AppColors.blue1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: textFieldBorderRadius,
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                setHeight(16),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      GetBuilder<HomeController>(
                        builder: (controller) {
                          if (homeController.loading) {
                            return Expanded(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.black,
                                ),
                              ),
                            );
                          }
                          return Expanded(
                            child: CupertinoButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (int.parse(bottleController.text) <=
                                      Number!) {
                                    print('kkkk');
                                    homeController
                                        .getCount(bottleController.text);
                                  } else {
                                    showProcessDialogue();
                                  }
                                }
                              },
                              color: AppColors.blue3,
                              child: const Text("Place Order"),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                setHeight(8)
              ],
            ),
          )
        ],
      ),
    );
  }
}
