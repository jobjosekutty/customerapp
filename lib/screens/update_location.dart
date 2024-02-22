// ignore_for_file: avoid_print

import 'package:customerapp/constants/app_constants.dart';
import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/controllers/update_location_controller.dart';
import 'package:customerapp/models/area_model.dart';
import 'package:customerapp/models/emirates_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class UpdateLocation extends StatefulWidget {
  const UpdateLocation({super.key});

  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  UpdateLocationController updateLocationController =
      Get.put(UpdateLocationController());
  final formKey = GlobalKey<FormState>();
  final flatFocusNode = FocusNode();
  final buildingFocusNode = FocusNode();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController flatController = TextEditingController();

  List<GetEmirates> data = [];
  List<GetArea> area = [];
  GetArea? seletedArea;
  GetEmirates? seletedEmirates;
  getEmirates() async {
    final http.Response response = await http.post(
      Uri.parse('http://68.178.175.87/api/getemirates'),
    );
    print('sc${response.body}');
    data = getEmiratesFromJson(response.body);
    if (response.statusCode == 200) {
      getArea('');
      setState(() {});
    }
  }

  getArea(String id) async {
    var body = {
      'emirates_id': id,
    };
    final http.Response response = await http
        .post(Uri.parse('http://68.178.175.87/api/getarea'), body: body);
    print('///Area/sc${response.statusCode}');
    print(response.body);
    print(area);
    area = getAreaFromJson(response.body);
    print(area);
    setState(() {});
  }

  @override
  void initState() {
    getEmirates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpdateLocation"),
        centerTitle: true,
      ),
      body: area.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          label: RichText(
                              text: const TextSpan(
                                  text: 'Select Emirates',
                                  style: TextStyle(color: Colors.grey),
                                  children: [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              ])),
                          border: InputBorder.none,
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0D2042),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0D2042),
                              width: .5,
                            ),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0D2042),
                              width: .5,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return '* Relationship is required';
                          } else {
                            return null;
                          }
                        },
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                        items: data.map<DropdownMenuItem<GetEmirates>>(
                            (GetEmirates value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value.name.toString()),
                          );
                        }).toList(),
                        onChanged: (onvalue) {
                          setState(() {
                            print('jobjosekutty');
                            seletedEmirates = onvalue;
                            getArea(seletedEmirates!.emiratesId.toString());
                            seletedArea = null;
                          });
                        },
                        value: seletedEmirates,
                      ),

                      setHeight(16),
                      //------
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          label: RichText(
                              text: const TextSpan(
                                  text: 'Select Area',
                                  style: TextStyle(color: Colors.grey),
                                  children: [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              ])),
                          border: InputBorder.none,
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0D2042),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0D2042),
                              width: .5,
                            ),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0D2042),
                              width: .5,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return '* Relationship is required';
                          } else {
                            return null;
                          }
                        },
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                        items:
                            area.map<DropdownMenuItem<GetArea>>((GetArea data) {
                          return DropdownMenuItem(
                            value: data,
                            child: Text(data.name.toString()),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            print('jobjosekutty');
                            seletedArea = newVal;
                          });
                        },
                        value: seletedArea,
                      ),

                      setHeight(16),
                      TextFormField(
                        focusNode: flatFocusNode,
                        controller: flatController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter flat';
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
                            'flat',
                          ),
                          hintText: 'flat',
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
                      setHeight(16),
                      TextFormField(
                        focusNode: buildingFocusNode,
                        controller: buildingController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter building';
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
                            'Buildings',
                          ),
                          hintText: 'Buildings',
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
                      setHeight(16),
                      Row(
                        children: [
                          GetBuilder<UpdateLocationController>(
                            builder: (controller) {
                              if (updateLocationController.loading) {
                                return const Expanded(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              return Expanded(
                                child: CupertinoButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      updateLocationController.updateLocation(
                                        seletedEmirates!.emiratesId.toString(),
                                        seletedArea!.areaId.toString(),
                                        buildingController.text,
                                        flatController.text,
                                      );
                                    }
                                  },
                                  color: AppColors.blue1,
                                  child: const Text("UpdateLocation"),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
