import 'package:ecommerce_app/features/auth/ui/widgets/Circular_App_Button.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/Carousel_Slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainButtomNavBar extends StatefulWidget {
  const MainButtomNavBar({super.key});

  @override
  State<MainButtomNavBar> createState() => _MainButtomNavBarState();
}

class _MainButtomNavBarState extends State<MainButtomNavBar> {
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
              onSeeAll: () {},
              buttonText: 'See All',
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
          child: Text(buttonText),
          style: ButtonStyle(),
        ),
      ],
    );
  }
}
