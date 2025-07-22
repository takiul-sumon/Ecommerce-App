
import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/features/Product/ui/screans/prodcut_list_screens.dart';
import 'package:ecommerce_app/features/commons/model/catagory_list_model.dart';
import 'package:flutter/widgets.dart';

class CatagoryWiseProduct extends StatelessWidget {
  const CatagoryWiseProduct({super.key, required this.catagory});

  final CatagoryListModel catagory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: catagory,
        );
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColor.themeColor.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(catagory.icon),
          ),
          SizedBox(height: 5),
          Text(
            onTaptitleSmaller(catagory.title),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.themeColor.withValues(alpha: .7),
            ),
          ),
        ],
      ),
    );
  }

  String onTaptitleSmaller(String title) {
    title.length > 9 ? title = title.substring(0, 9) : title;
    return title;
  }
}