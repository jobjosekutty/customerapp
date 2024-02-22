import 'package:customerapp/constants/app_theme.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeadingChevron extends StatelessWidget {
  const LeadingChevron({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.chevron_right_circle_fill,
      color: AppColors.grey6,
      size: 32,
    );
  }
}

class AppDividerInDark extends StatelessWidget {
  const AppDividerInDark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.grey2,
    );
  }
}
