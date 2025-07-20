import 'package:ecommerce_app/app/app_color.dart';
import 'package:ecommerce_app/app/assets_paths.dart';
import 'package:ecommerce_app/features/Product/ui/screans/product_details.dart';
import 'package:ecommerce_app/features/commons/ui/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: productModel.id,
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColor.themeColor.withOpacity(.01),
              offset: Offset(0.0, 0.1),
              blurRadius: 7,
            ),
          ],
        ),
        // height: 200,
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: AppColor.themeColor.withOpacity(.1),
              ),
              padding: EdgeInsets.all(16),
              child: Image.network(
                productModel.photos.first,
                fit: BoxFit.contain,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AssetPath.appLogo);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                productModel.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productModel.currentPrice.toString(),
                      style: TextStyle(color: AppColor.themeColor),
                    ),
                    Text('⭐'),
                    Text('4.8', style: TextStyle(color: Colors.black45)),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        color: AppColor.themeColor,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(2),
                        ),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
