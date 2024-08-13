import 'package:deploy_assignment/controller/cart_controller.dart';
import 'package:deploy_assignment/controller/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name, style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => FullScreenImage(imagePath: product.image));
              },
              child: Container(
                height: 300.h,
                width: double.infinity.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Center(
                      child: Hero(
                          tag: product.image,
                          child: Image.asset(product.image))),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(product.name,
                style: GoogleFonts.poppins(
                    fontSize: 22.sp, fontWeight: FontWeight.bold)),
            Text('₹ ${product.price}',
                style: GoogleFonts.poppins(fontSize: 18.sp)),
            SizedBox(height: 20),
            Text(product.description,
                style: GoogleFonts.poppins(fontSize: 16.sp)),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), 
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 24.w), 
              ),
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar('Added to Cart', '${product.name} added to cart');
              },
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, 
                children: [
                  Icon(Icons.add_shopping_cart,
                      color: Colors.white), 
                  SizedBox(width: 8.w), 
                  Text('Add to Cart',
                      style: GoogleFonts.poppins(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  FullScreenImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Center(
          child: Hero(
            tag: imagePath,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
