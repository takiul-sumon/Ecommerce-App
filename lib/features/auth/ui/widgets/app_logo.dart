import 'package:ecommerce_app/app/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Applogo extends StatelessWidget {
  const Applogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetPath.appLogo);
  }
}
