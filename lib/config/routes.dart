import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jwelery_kart/config/route_handlers.dart';

class Routes {
  static String root = "/";
  static String splash = "/splash";
  static String intro = "/intro";
  static String main = "/main";
  static String productsList = "/main/productList";
  static String productDetail = "/main/productList/productDetail";
  static String cartList = "/cartList";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(main,
        handler: mainHandler, transitionType: TransitionType.fadeIn);
    router.define(productsList,
        handler: productListHandler, transitionType: TransitionType.native);
    router.define(productDetail,
        handler: productDetailHandler, transitionType: TransitionType.native);
    router.define(cartList,
        handler: cartListHandler, transitionType: TransitionType.native);
  }
}
