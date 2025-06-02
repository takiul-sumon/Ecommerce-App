import 'package:flutter/material.dart';

class CircularAppBarButton extends StatelessWidget {
  const CircularAppBarButton({
    super.key,
    required this.icon,
    required this.ontap,
  });
  final Icon icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.black26,
        child: IconButton(onPressed: ontap, icon: icon),
      ),
    );
  }
}
