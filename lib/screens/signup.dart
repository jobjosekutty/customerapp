// ignore_for_file: avoid_print

import 'package:customerapp/constants/app_constants.dart';
import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/controllers/signup_controller.dart';
import 'package:customerapp/models/area_model.dart';
import 'package:customerapp/models/emirates_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  final nameFocusNode = FocusNode();

  final phoneFocusNode = FocusNode();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();
  final flatFocusNode = FocusNode();
  final buildingFocusNode = FocusNode();
  final bottleFocusNode = FocusNode();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  final TextEditingController bottleController = TextEditingController();

  SignupController signupController = Get.put(SignupController());
  @override
  void initState() {
    getEmirates();
    super.initState();
  }

  List<GetEmirates> data = [];
  List<GetArea> area = [];
  GetArea? seletedArea;
  GetEmirates? seletedEmirates;
  getEmirates() async {
    final http.Response response = await http.post(
      Uri.parse('https://waterdelivery.calparglobal.com/api/getemirates'),
    );
    print('sc${response.body}');
    data = getEmiratesFromJson(response.body);
    if (response.statusCode == 200) {
      getArea('');
    }
  }

  getArea(String id) async {
    var body = {
      'emirates_id': id,
    };
    final http.Response response = await http.post(
        Uri.parse('https://waterdelivery.calparglobal.com/api/getarea'),
        body: body);
    print('///Area/sc${response.statusCode}');
    print(response.body);
    print(area);
    area = getAreaFromJson(response.body);
    print(area);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: area.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: formKey,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          TextFormField(
                            focusNode: nameFocusNode,
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter Username';
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
                                'Name',
                              ),
                              hintText: 'Name',
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
                            focusNode: phoneFocusNode,
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter Username';
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
                                'Phone',
                              ),
                              hintText: 'Phone',
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
                            focusNode: emailFocusNode,
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter Username';
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
                                'Email',
                              ),
                              hintText: 'Email',
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
                            focusNode: passwordFocusNode,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter Password';
                              }

                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            decoration: InputDecoration(
                              floatingLabelStyle: GoogleFonts.poppins(
                                color: AppColors.blue1,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 8.0,
                              ),
                              label: const Text(
                                'password',
                              ),
                              hintText: 'password',
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
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              label: RichText(
                                  text: TextSpan(
                                      text: 'Select Emirates',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      children: const [
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
                                print(seletedEmirates?.name);
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
                            items: area
                                .map<DropdownMenuItem<GetArea>>((GetArea data) {
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
                          TextFormField(
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
                                'No of Bottle',
                              ),
                              hintText: 'No of Bottle',
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
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              GetBuilder<SignupController>(
                                builder: (controller) {
                                  if (signupController.loading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return CupertinoButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        signupController.signup(
                                            nameController.text,
                                            phoneController.text,
                                            emailController.text,
                                            passwordController.text,
                                            seletedEmirates!.emiratesId
                                                .toString(),
                                            seletedArea!.areaId.toString(),
                                            flatController.text,
                                            buildingController.text,
                                            bottleController.text);
                                      }
                                    },
                                    color: AppColors.blue3,
                                    child: Text(
                                      'SignUp',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                          setHeight(8),
                          // Image.asset(
                          //   "assets/logo.jpeg",
                          //   height: 175,
                          //   width: 175,
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
