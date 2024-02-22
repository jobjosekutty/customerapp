
import 'package:customerapp/constants/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WorkLocation extends StatelessWidget {
  const WorkLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Select Work Location',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.black,
                ),
              ),
              background: Lottie.asset('assets/world-map.json'),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: List.generate(
                    10,
                    (index) => RadioListTile(
                      title: Text(
                        'Buraydha',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      activeColor: AppColors.primarycolor,
                      value: index,
                      groupValue: null,
                      onChanged: (val) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
                  child: CupertinoButton(
                    color: AppColors.primarycolor,
                    child: Text(
                      'Select',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
