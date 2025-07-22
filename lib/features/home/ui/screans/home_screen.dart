import 'package:ecommerce_app/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_app/features/commons/model/catagory_list_model.dart';
import 'package:ecommerce_app/features/auth/ui/controller/new_product_list_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/popular_product_list_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/special_product_list_controller.dart';
import 'package:ecommerce_app/features/commons/widgets/product_card.dart';
import 'package:ecommerce_app/features/commons/widgets/product_catagory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/app/assets_paths.dart';
import 'package:ecommerce_app/features/Product/ui/screans/prodcut_list_screens.dart';
import 'package:ecommerce_app/features/commons/controller/catagory_Controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/slider_controller.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/Carousel_Slider.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/Circular_App_Button.dart';
import 'package:ecommerce_app/features/commons/ui/controllers/main_bottom_nav_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchProductTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                GetBuilder<SliderController>(
                  builder: (controller) {
                    if (controller.inProgress) {
                      return CenteredCircularProgressIndicator();
                    }
                    return CarouselSliderWidget(slider: controller.slider);
                  },
                ),
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
                  child: GetBuilder<CatagoryListController>(
                    builder: (controller) => ListView.builder(
                      itemCount: controller.homeCatagorylength,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CatagoryWiseProduct(
                            catagory: controller.catagoryList[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CatagoriesSeeAll(
                  title: 'Popular',
                  onSeeAll: () {},
                  buttonText: 'See All',
                ),
                getPopularProduct(),
                SizedBox(height: 10),
                CatagoriesSeeAll(
                  title: 'Special',
                  onSeeAll: () {},
                  buttonText: 'See All',
                ),
                getSpecialProduct(),
                SizedBox(height: 10),
                CatagoriesSeeAll(
                  title: 'New',
                  onSeeAll: () {},
                  buttonText: 'See All',
                ),
                getNewProduct(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget getPopularProduct() {
  return GetBuilder<PopularProductListController>(
    builder: (controller) => Visibility(
      visible: controller.inProgress == false,
      replacement: CenteredCircularProgressIndicator(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          children: controller.popularProduct
              .map((e) => ProductCard(productModel: e))
              .toList(),
        ),
      ),
    ),
  );
}

Widget getNewProduct() {
  return GetBuilder<NewProductListController>(
    builder: (controller) => Visibility(
      visible: controller.inProgress == false,
      replacement: CenteredCircularProgressIndicator(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          children: controller.popularProduct
              .map((e) => FittedBox(child: ProductCard(productModel: e)))
              .toList(),
        ),
      ),
    ),
  );
}

Widget getSpecialProduct() {
  return GetBuilder<SpecialProductListController>(
    builder: (controller) => Visibility(
      visible: controller.inProgress == false,
      replacement: CenteredCircularProgressIndicator(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          children: controller.popularProduct
              .map((e) => FittedBox(child: ProductCard(productModel: e)))
              .toList(),
        ),
      ),
    ),
  );
}

AppBar buildAppBar() {
  return AppBar(
    title: SvgPicture.asset(AssetPath.navBarLogo),
    actions: [
      CircularAppBarButton(icon: Icon(Icons.person), ontap: () {}),
      CircularAppBarButton(icon: Icon(Icons.call), ontap: () {}),
      CircularAppBarButton(icon: Icon(Icons.notifications), ontap: () {}),
    ],
    automaticallyImplyLeading: false,
  );
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
