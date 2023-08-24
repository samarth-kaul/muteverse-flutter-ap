import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muteverse_flutter_app/constants/assets_constants.dart';
import 'package:muteverse_flutter_app/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        height: 30,
        colorFilter: ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn),
      ),
    );
  }
}
