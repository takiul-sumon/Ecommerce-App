import 'package:ecommerce_app/app/app_color.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key});

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildIconButton(
          icon: Icons.remove,
          onTap: () {
            if (value <= 1) return;
            value--;
            setState(() {});
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            '$value',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        buildIconButton(
          icon: Icons.add,
          onTap: () {
            if (value >= 20) return;
            value++;
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget buildIconButton({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColor.themeColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
