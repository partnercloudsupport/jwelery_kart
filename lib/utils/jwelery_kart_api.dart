import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:jwelery_kart/models/cart_response.dart';
import 'package:jwelery_kart/models/collection_response.dart';
import 'package:jwelery_kart/models/offer_product_response.dart';
import 'package:jwelery_kart/models/product.dart';
import 'package:jwelery_kart/models/product_response.dart';

class JweleryKartApi {
  final Client _client = Client();

  static const String _rootUrl =
      'http://jewelrykart-env.s4kbz4hmp3.ap-south-1.elasticbeanstalk.com/';

  Future<List<Collection>> getWomenCollections() async {
    List<Collection> collections = [];
    await _client
        .get(_rootUrl + 'product?task=fetchWomenCollections')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => CollectionResponse.fromJson(json))
        .then((collectionResponse) =>
            collections.addAll(collectionResponse.collection));

    return collections;
  }

  Future<List<OfferBrief>> getWomenOffers() async {
    List<OfferBrief> offers = [];
    await _client
        .get(_rootUrl + 'product?task=fetchWomenOffersProducts')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => OfferProductResponse.fromJson(json))
        .then((offerResponse) => offers.addAll(offerResponse.offerBrief));

    return offers;
  }

  Future<List<Collection>> getMenCollections() async {
    List<Collection> collections = [];
    await _client
        .get(_rootUrl + 'product?task=fetchMenCollections')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => CollectionResponse.fromJson(json))
        .then((collectionResponse) =>
            collections.addAll(collectionResponse.collection));

    return collections;
  }

  Future<List<OfferBrief>> getMenOffers() async {
    List<OfferBrief> offers = [];
    await _client
        .get(_rootUrl + 'product?task=fetchMenOffersProducts')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => OfferProductResponse.fromJson(json))
        .then((offerResponse) => offers.addAll(offerResponse.offerBrief));

    return offers;
  }

  Future<List<ProductBrief>> getMenProducts() async {
    List<ProductBrief> products = [];
    await _client
        .get(_rootUrl + 'product?task=fetchMenProducts')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => ProductResponse.fromJson(json))
        .then(
            (productResponse) => products.addAll(productResponse.productBrief));

    return products;
  }

  Future<List<ProductBrief>> getWomenProducts() async {
    List<ProductBrief> products = [];
    await _client
        .get(_rootUrl + 'product?task=fetchWomenProducts')
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => ProductResponse.fromJson(json))
        .then(
            (productResponse) => products.addAll(productResponse.productBrief));

    return products;
  }

  Future<List<ProductBrief>> getProductsByCollection(
      String collectionId) async {
    List<ProductBrief> products = [];
    await _client
        .get(_rootUrl +
            'product?task=fetchProductsInCollection&collectionId=' +
            collectionId)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => ProductResponse.fromJson(json))
        .then(
            (productResponse) => products.addAll(productResponse.productBrief));

    return products;
  }

  Future<Product> getProductDetail(String productId) async {
    return await _client
        .get(_rootUrl +
            'product?task=fetchIndividualProduct&productId=' +
            productId)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => Product.fromJson(json));
  }

  Future<List<Cart>> getCartList(String contact) async {
    List<Cart> carts = [];
    await _client
        .get(_rootUrl + 'customer?task=fetchCart&customerContact=' + contact)
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => CartResponse.fromJson(json))
        .then((cartResponse) => carts.addAll(cartResponse.cart));

    return carts;
  }

  Future<String> addItemToCart(Map<String, String> cart) async {
    return await _client
        .post(
          _rootUrl + 'customer?task=addUpdateToCart',
          body: cart,
        )
        .then((result) => result.body);
  }

  Future<String> removeItemFromCart(Map<String, String> cart) async {
    return await _client
        .post(
          _rootUrl + 'customer?task=deleteFromCart',
          body: cart,
        )
        .then((result) => result.body);
  }
}
