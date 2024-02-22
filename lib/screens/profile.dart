import 'package:customerapp/constants/app_constants.dart';
import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Profile",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
            ),
            body: GetBuilder<ProfileController>(
              builder: (controller) {
                if (profileController.loading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.green1,
                    ),
                  );
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        setHeight(16),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.grey4,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              setWidth(8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${profileController.data?.name}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  setHeight(8),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(5),
                                  //     color: const Color(0xff6FCF97)
                                  //         .withOpacity(.5),
                                  //   ),
                                  //   child: Center(
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(4.0),
                                  //       child: Text(
                                  //         "ON DUTY",
                                  //         style: GoogleFonts.poppins(
                                  //           fontWeight: FontWeight.w600,
                                  //           fontSize: 16,
                                  //           color: AppColors.green1,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        setHeight(16),

                        Text(
                          "Phone No.",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        setHeight(4),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff2F80ED).withOpacity(.04),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '${profileController.data?.phone}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppColors.grey3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        setHeight(4),
                        Text(
                          "Emirates",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        setHeight(4),

                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff2F80ED).withOpacity(.04),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '${profileController.data?.emirates}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppColors.grey3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        setHeight(4),
                        Text(
                          "Area",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        setHeight(4),

                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff2F80ED).withOpacity(.04),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '${profileController.data?.area}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppColors.grey3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        setHeight(4),
                        Text(
                          "Email",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        setHeight(4),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff2F80ED).withOpacity(.04),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '${profileController.data?.email}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppColors.grey3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        setHeight(4),
                        Text(
                          "flat no",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        setHeight(4),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff2F80ED).withOpacity(.04),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '${profileController.data?.flatNo}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppColors.grey3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "building",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        setHeight(4),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff2F80ED).withOpacity(.04),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '${profileController.data?.building}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppColors.grey3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //  setHeight(32),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     CupertinoButton(
                        //       child: Text(
                        //         "Delete Account",
                        //         style: GoogleFonts.poppins(
                        //           fontWeight: FontWeight.w600,
                        //           fontSize: 14,
                        //           color: AppColors.red,
                        //         ),
                        //       ),
                        //       onPressed: () {},
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
