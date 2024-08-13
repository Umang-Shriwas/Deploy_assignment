import 'package:deploy_assignment/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: GoogleFonts.poppins()),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 150.h,
                    child: Image.asset("assets/images/shopping.png")),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Cart is Empty',
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartController.cartItems[index];
                    return ListTile(
                      leading: Container(
                          height: 50.h,
                          width: 50.h,
                          child: Image.asset(product.image)),
                      title: Text(product.name,
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      subtitle: Text('₹ ${product.price}',
                          style: GoogleFonts.poppins()),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => cartController.removeFromCart(product),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity.w,
                height: 50.h,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Total: ₹ ${cartController.totalPrice}',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
