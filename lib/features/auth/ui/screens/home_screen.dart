import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/Circular_App_Button.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/Carousel_Slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchProductTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/logo_nav.svg'),
        actions: [
          CircularAppBarButton(icon: Icon(Icons.person), ontap: () {}),
          CircularAppBarButton(icon: Icon(Icons.call), ontap: () {}),
          CircularAppBarButton(icon: Icon(Icons.notifications), ontap: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {},
              controller: searchProductTEController,
              decoration: InputDecoration(
                fillColor: Colors.black12,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
            SizedBox(height: 10),
            CarouselSliderWidget(),
            SizedBox(height: 10),
            CatagoriesSeeAll(
              title: 'All Catagories',
              onSeeAll: () {
                Get.find<MainBottomNavScreenController>().moveToCategory();
              },
              buttonText: 'See All',
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CatagoryWiseProduct(
                      icon: Icons.computer,
                      prodcutTitle: 'Electronics',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            CatagoriesSeeAll(
              title: 'Popular',
              onSeeAll: () {},
              buttonText: 'See All',
            ),
            SizedBox(height: 10),
            CatagoriesSeeAll(
              title: 'Special',
              onSeeAll: () {},
              buttonText: 'See All',
            ),
            SizedBox(height: 10),
            CatagoriesSeeAll(
              title: 'New',
              onSeeAll: () {},
              buttonText: 'See All',
            ),
          ],
        ),
      ),
    );
  }
}

class CatagoryWiseProduct extends StatelessWidget {
  const CatagoryWiseProduct({
    super.key,
    required this.icon,
    required this.prodcutTitle,
  });
  final IconData icon;
  final String prodcutTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: AppColor.themeColor.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, size: 45, color: AppColor.themeColor),
        ),
        SizedBox(height: 5),
        Text(
          prodcutTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.themeColor.withValues(alpha: .7),
          ),
        ),
      ],
    );
  }
}

class CatagoriesSeeAll extends StatelessWidget {
  const CatagoriesSeeAll({
    super.key,
    required this.title,
    required this.onSeeAll,
    required this.buttonText,
  });
  final String title;
  final VoidCallback onSeeAll;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          style: ButtonStyle(),
          child: Text(buttonText),
        ),
      ],
    );
  }
}
