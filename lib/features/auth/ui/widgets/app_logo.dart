import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Applogo extends StatelessWidget {
  const Applogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/logo.svg');
  }
}