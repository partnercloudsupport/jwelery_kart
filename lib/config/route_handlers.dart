import 'package:jwelery_kart/pages/home/home_screen.dart';
import 'package:jwelery_kart/pages/productcart/product_cart.dart';
import 'package:jwelery_kart/pages/productdetail/product_detail_screen.dart';
import 'package:jwelery_kart/pages/productlist/product_list_screen.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomeScreen();
});

var mainHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomeScreen();
});

var productListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String collectionId = params["collectionId"]?.first;
  return new ProductListScreen(
    collectionId: collectionId,
  );
});

var productDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String productId = params["productId"]?.first;
  return new ProductDetailScreen(
    productId: productId,
  );
});

var cartListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new ProductKart();
});
