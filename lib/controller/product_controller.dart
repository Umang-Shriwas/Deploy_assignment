import 'dart:convert';

import 'package:deploy_assignment/controller/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final data = await rootBundle.loadString('assets/products.json');
    final jsonResult = json.decode(data) as List;
    products.value = jsonResult.map((e) => Product.fromJson(e)).toList();
    filteredProducts.value = products;
  }

  void filterProducts(String query) {
    searchQuery.value = query;
    filteredProducts.value = products
        .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
