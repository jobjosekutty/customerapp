import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/controllers/coupon_controller.dart';
import 'package:customerapp/controllers/profile_controller.dart';
import 'package:customerapp/screens/coupon_screen.dart';
import 'package:customerapp/screens/profile.dart';
import 'package:customerapp/screens/update_location.dart';
import 'package:customerapp/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Settings extends StatelessWidget {
  Settings({super.key});
  CouponController couponController = Get.put(CouponController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkScaffold,
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.grey6,
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.grey6,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 0.2, color: AppColors.grey6),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.grey1,
                    AppColors.grey1.withOpacity(0.5),
                    AppColors.grey1.withOpacity(0.2),
                  ],
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(const Profile());
                    },
                    leading: FaIcon(
                      FontAwesomeIcons.solidUser,
                      color: AppColors.grey6,
                    ),
                    title: Text(
                      'profile',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey6,
                        fontSize: 16,
                      ),
                    ),
                    trailing: const LeadingChevron(),
                  ),
                  const AppDividerInDark(),
                  ListTile(
                    onTap: () {
                      Get.to(() => const CouponScreen());
                    },
                    leading: FaIcon(
                      FontAwesomeIcons.wallet,
                      color: AppColors.grey6,
                    ),
                    title: Text(
                      'Coupon',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey6,
                        fontSize: 16,
                      ),
                    ),
                    trailing: const LeadingChevron(),
                  ),
                  const AppDividerInDark(),
                  ListTile(
                    onTap: () {
                      Get.to(() => const UpdateLocation());
                    },
                    leading: FaIcon(
                      FontAwesomeIcons.wallet,
                      color: AppColors.grey6,
                    ),
                    title: Text(
                      'Update Location',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey6,
                        fontSize: 16,
                      ),
                    ),
                    trailing: const LeadingChevron(),
                  ),
                  const AppDividerInDark(),
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(
                            "Do You Want to Logout?",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    profileController.logout();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Yes",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blue1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "No",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.red,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    leading: FaIcon(
                      FontAwesomeIcons.rightFromBracket,
                      color: AppColors.red,
                    ),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
