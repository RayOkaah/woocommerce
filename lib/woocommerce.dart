/*
 * BSD 3-Clause License

    Copyright (c) 2020, RAY OKAAH
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

    3. Neither the name of the copyright holder nor the names of its
    contributors may be used to endorse or promote products derived from
    this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
    SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 */

library woocommerce;

import 'dart:async';
import "dart:collection";
import 'dart:convert';
import 'dart:io';
import "dart:math";
import "dart:core";
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'models/cart_item.dart';
import 'woocommerce_error.dart';
import 'models/cart.dart';
import 'models/coupon.dart';
import 'models/customer.dart';
import 'models/order.dart';
import 'models/order_payload.dart';
import 'models/product_attribute_term.dart';
import 'models/product_attributes.dart';
import 'models/product_category.dart';
import 'models/product_review.dart';
import 'models/product_shipping_class.dart';
import 'models/product_tag.dart';
import 'models/product_variation.dart';
import 'models/products.dart';
import 'models/shipping_method.dart';
import 'models/shipping_zone.dart';
import 'models/shipping_zone_location.dart';
import 'models/shipping_zone_method.dart';
import 'models/tax_classes.dart';
import 'models/tax_rate.dart';
import 'constants/constants.dart';
import 'models/jwt_response.dart';
import 'models/user.dart';



/// [url] is you're site's base URL, e.g. `https://www.yourdomain.com`
///
/// [consumerKey] is the consumer key provided by WooCommerce, e.g. `ck_1a2b3c4d5e6f7g8h9i`
///
/// [consumerSecret] is the consumer secret provided by WooCommerce, e.g. `cs_1a2b3c4d5e6f7g8h9i`
///
/// [isHttps] check if [url] is https based
class WooCommerce{
  String baseUrl;
  String consumerKey;
  String consumerSecret;
  bool isHttps;
  String apiPath;

  WooCommerce({
    @required String baseUrl,
    @required String consumerKey,
    @required String consumerSecret,
    String apiPath = DEFAULT_WC_API_PATH,
  }) {
    this.baseUrl = baseUrl;
    this.consumerKey = consumerKey;
    this.consumerSecret = consumerSecret;
    this.apiPath = apiPath;

    if (this.baseUrl.startsWith("https")) {
      this.isHttps = true;
    } else {
      this.isHttps = false;
    }
  }


  static String sampleBaseUrl = "http://cs.myecommerceapp.com";

  String _token = "";
  Future<String> userTokenString ()async {
    //_token = await _localDbService.getSecurityToken();
    return _token;
  }

  Uri queryUri;
  String setApiResourceUrl({
    @required String path,
    String host, port, queryParameters,
    bool isShop = false,
  }){
    this.apiPath = DEFAULT_WC_API_PATH;
    isShop? apiPath = URL_STORE_API_PATH : DEFAULT_WC_API_PATH;
    queryUri = new Uri(path: path, queryParameters: queryParameters, port: port, host: host );
    return queryUri.toString();
  }
  String get apiResourceUrl=> queryUri.toString();

  Map<String, String> _urlHeader = {
    'Authorization': '',
  };


  Future authenticateViaJWT(
      {String username, String password}) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      this.baseUrl + URL_JWT_TOKEN,
      body: body,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      JWTResponse authResponse =
      JWTResponse.fromJson(json.decode(response.body));
      _token = authResponse.token;
      //_localDbService.updateSecurityToken(_token);
      _urlHeader['Authorization'] = 'Bearer ${authResponse.token}';
      return _token;
    } else {
        throw new WooCommerceError.fromJson(json.decode(response.body));

    }
  }

  loginUser({
    @required String username,
    @required String password,
  }) async{
    User user;
    try {
      var response = await authenticateViaJWT(username: username, password: password);
      print('attempted token : '+ response.toString());
      if (response is String){
        user = await fetchLoggedInUser(response);
      }
      return user;
    } catch (e) {
      return e.message;
    }

  }

  Future<User> fetchLoggedInUser(String token) async {
    _urlHeader['Authorization'] = 'Bearer ${token}';
    final response =
    await http.get(this.baseUrl + URL_USER_ME, headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonStr = json.decode(response.body);
      if (jsonStr.length == 0)
        throw new WooCommerceError(
            code: 'wp_empty_user', message: "No user found or you dont have permission");
      print('account user fetch sucessful : '+jsonStr.toString());
      return User.fromJson(jsonStr);
    } else {
        WooCommerceError err =
        WooCommerceError.fromJson(json.decode(response.body));
        throw err;
    }
  }

  Future<bool> registerNewUser({@required User user}) async {
    final StringBuffer url = new StringBuffer('baseapiurl' + 'egisterEndpoint');

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request =
    await httpClient.postUrl(Uri.parse(url.toString()));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    request.headers.set(HttpHeaders.acceptHeader, "application/json");

    request.add(utf8.encode(json.encode(user.toJson())));
    HttpClientResponse response = await request.close();
    print('result is this : '+ response.toString());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      response.transform(utf8.decoder).listen((contents) {
        try {
          WooCommerceError err = WooCommerceError.fromJson(json.decode(contents));
          throw err;
        } catch (e) {
          throw new WooCommerceError(message: contents);
        }
      });
    }
  }

  Future<Customer> createCustomer (Customer customer) async{
    print('Creating Customet With info : ' + customer.toString());
    setApiResourceUrl(path: 'customers');
    final response = await post(queryUri.toString(), customer.toJson());
    return Customer.fromJson(response);
  }

  /// https://woosignal.com/docs/api/1.0/customers
  Future<List<Customer>> getCustomers(
      {int page,
        int perPage,
        String search,
        List<int> exclude,
        List<int> include,
        int offset,
        String order,
        String orderBy,
        String email,
        String role}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      'exclude': exclude, 'include': include, 'offset': offset,
      'order': order, 'orderby': orderBy, 'email': email,
      'role': role,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString().toString();
    });

    List<Customer> customers = [];
    setApiResourceUrl(path: 'customers', queryParameters: payload);

    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    for(var c in response){
      var customer = Customer.fromJson(c);
      print('prod gotten here : '+customer.toString());
      customers.add(customer);
    }
    return customers;
  }

  Future<Customer>getCustomerById({@required int id}) async{
    Customer customer;
    setApiResourceUrl(path: 'customers/${id}',);
    final response = await get(queryUri.toString());
    customer = Customer.fromJson(response);
    return customer;
  }


  /// https://woosignal.com/docs/api/1.0/products
  Future<List<Product>> getProducts(
      {int page,
        int perPage,
        String search,
        String after,
        String before,
        String order,
        String orderBy,
        String slug,
        String status,
        String type,
        String sku,
        String category,
        String tag,
        String shippingClass,
        String attribute,
        String attributeTerm,
        String taxClass,
        String minPrice,
        String maxPrice,
        String stockStatus,
        List<int> exclude,
        List<int> parentExclude,
        List<int> include,
        List<int> parent,
        int offset,
        bool featured,
        bool onSale}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      'after': after, 'before': before,
      'exclude': exclude, 'include': include, 'offset': offset,
      'order': order, 'orderby': orderBy, 'parent': parent,
      'parent_exclude': parentExclude, 'slug': slug,
      'status': status, 'type': type, 'sku': sku,
      'feature': featured, 'category': category, 'tag': tag,
      'shipping_class': shippingClass, 'attribute': attribute,
      'attribute_term': attributeTerm, 'tax_class': taxClass, 'on_sale': onSale,
      'min_price': minPrice, 'max_price': maxPrice, 'stock_status': stockStatus,

    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    print("Parameters: " + payload.toString());
    List<Product> products =[];
    setApiResourceUrl(path: 'products', queryParameters: payload);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    print('this is query oo : '+queryUri.toString());
    for(var p in response){
      var prod = Product.fromJson(p);
      print('prod gotten here : '+prod.name.toString());
      products.add(prod);
    }
    return products;
  }

  Future<Product>getProductById({@required int id}) async{
    Product product;
    setApiResourceUrl(path: 'products/${id}',);
    final response = await get(queryUri.toString());
    product = Product.fromJson(response);
    return product;
  }

  /// https://woosignal.com/docs/api/1.0/products-variations
  Future<List<ProductVariation>> getProductVariations(
      {@required int productId,
        int page,
        int perPage,
        String search,
        String after,
        String before,
        List<int> exclude,
        List<int> include,
        int offset,
        String order,
        String orderBy,
        List<int> parent,
        List<int> parentExclude,
        String slug,
        String status,
        String sku,
        String taxClass,
        bool onSale,
        String minPrice,
        String maxPrice,
        String stockStatus}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      'after': after, 'before': before,
      'exclude': exclude, 'include': include, 'offset': offset,
      'order': order, 'orderby': orderBy, 'parent': parent,
      'parent_exclude': parentExclude, 'slug': slug,
      'status': status, 'sku': sku,
       'tax_class': taxClass, 'on_sale': onSale,
      'min_price': minPrice, 'max_price': maxPrice, 'stock_status': stockStatus,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<ProductVariation> productVariations = [];
    setApiResourceUrl(path: 'products/${productId}/variations', queryParameters: payload);
    print('this is the curent path : '+this.apiPath);
    final response = await get(queryUri.toString());
    for(var v in response){
      var prodv = ProductVariation.fromJson(v);
      print('prod gotten here : '+prodv.toString());
      productVariations.add(prodv);
    }
    return productVariations;
  }

  Future<ProductVariation>getProductVariationById({@required int productId, variationId}) async{

    ProductVariation productVariation;
    setApiResourceUrl(path: 'products/${productId}/variations/${variationId}',);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());

    productVariation = ProductVariation.fromJson(response);
    return productVariation;
  }

  /// https://woosignal.com/docs/api/1.0/products-attributes
  Future<List<ProductAttribute>> getProductAttributes() async {
    List<ProductAttribute> productAttributes = [];
    setApiResourceUrl(path: 'products/attributes',);
    final response = await get(queryUri.toString());
    for(var a in response){
      var att = ProductAttribute.fromJson(a);
      print('prod gotten here : '+att.toString());
      productAttributes.add(att);
    }
    return productAttributes;
  }

  Future<ProductAttribute>getProductAttributeById({@required int attributeId}) async{

    ProductAttribute productAttribute;
    setApiResourceUrl(path: 'products/attributes/${attributeId}',);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());

    productAttribute = ProductAttribute.fromJson(response);
    return productAttribute;
  }


  /// https://woosignal.com/docs/api/1.0/products-attribute-terms
  Future<List<ProductAttributeTerm>> getProductAttributeTerms(
      {@required int attributeId,
        int page,
        int perPage,
        String search,
        List<int> exclude,
        List<int> include,
        String order,
        String orderBy,
        bool hideEmpty,
        int parent,
        int product,
        String slug}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      'exclude': exclude, 'include': include,
      'order': order, 'orderby': orderBy, 'hide_empty': hideEmpty, 'parent': parent,
      'product': product, 'slug': slug,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<ProductAttributeTerm> productAttributeTerms = [];
    setApiResourceUrl(path: 'products/attributes/${attributeId}/terms', queryParameters: payload);
    final response = await get(queryUri.toString());
    for(var t in response){
      var term = ProductAttributeTerm.fromJson(t);
      print('term gotten here : '+term.toString());
      productAttributeTerms.add(term);
    }

    return productAttributeTerms;
  }

  Future<ProductAttributeTerm>getProductAttributeTermById({@required int attributeId, termId}) async{

    ProductAttributeTerm productAttributeTerm;
    setApiResourceUrl(path: 'products/attributes/${attributeId}/terms/${termId}',);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());

    productAttributeTerm = ProductAttributeTerm.fromJson(response);
    return productAttributeTerm;
  }

  /// https://woosignal.com/docs/api/1.0/product-categories
  Future<List<ProductCategory>> getProductCategories(
      {int page,
        int perPage,
        String search,
        //List<int> exclude,
        //List<int> include,
        String order,
        String orderBy,
        bool hideEmpty,
        int parent,
        int product,
        String slug}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      //'exclude': exclude, 'include': include,
      'order': order, 'orderby': orderBy, 'hide_empty': hideEmpty, 'parent': parent,
      'product': product, 'slug': slug,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<ProductCategory> productCategories = [];
    print('payload : '+payload.toString());
    setApiResourceUrl(path: 'products/categories', queryParameters: payload);
    print('this is the path : '+this.apiPath);
    final response = await get(queryUri.toString());
    for(var c in response){
      var cat = ProductCategory.fromJson(c);
      print('category gotten here : '+cat.toString());
      productCategories.add(cat);
    }
    return productCategories;
  }

  Future<ProductCategory>getProductCategoryById({@required int categoryId}) async{
    ProductCategory productCategory;
    setApiResourceUrl(path: 'products/categories/${categoryId}',);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    productCategory = ProductCategory.fromJson(response);
    return productCategory;
  }


  /// https://woosignal.com/docs/api/1.0/product-shipping-classes
  Future<List<ProductShippingClass>> getProductShippingClasses(
      {int page,
        int perPage,
        String search,
        List<int> exclude,
        List<int> include,
        int offset,
        String order,
        String orderBy,
        bool hideEmpty,
        int product,
        String slug}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      'exclude': exclude, 'include': include, 'offset': offset,
      'order': order, 'orderby': orderBy, 'hide_empty': hideEmpty,
      'product': product, 'slug': slug,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<ProductShippingClass> productShippingClasses = [];
    setApiResourceUrl(path: 'products/shipping_classes',);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    for(var c in response){
      var sClass = ProductShippingClass.fromJson(c);
      print('prod gotten here : '+sClass.toString());
      productShippingClasses.add(sClass);
    }
    return productShippingClasses;
  }

  Future<ProductShippingClass>getProductShippingClassById({@required int id}) async{
    ProductShippingClass productShippingClass;
    setApiResourceUrl(path: 'products/shipping_classes/${id}',);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    productShippingClass = ProductShippingClass.fromJson(response);
    return productShippingClass;
  }

  Future<List<ProductTag>> getProductTags(
      {int page,
        int perPage,
        String search,
        //List<int> exclude,
        //List<int> include,
        int offset,
        String order,
        String orderBy,
        bool hideEmpty,
        int product,
        String slug}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
     // 'exclude': exclude, 'include': include,
      'offset': offset,
      'order': order, 'orderby': orderBy, 'hide_empty': hideEmpty,
      'product': product, 'slug': slug,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<ProductTag> productTags = [];
    print('making request with payload : '+payload.toString());
    setApiResourceUrl(path: 'products/tags', queryParameters: payload);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    for(var c in response){
      var tag = ProductTag.fromJson(c);
      print('prod gotten here : '+tag.toString());
      productTags.add(tag);
    }
    return productTags;
  }

  Future<ProductTag>getProductTagById({@required int id}) async{
    ProductTag productTag;
    setApiResourceUrl(path: 'products/tags/${id}',);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    productTag = ProductTag.fromJson(response);
    return productTag;
  }

  /// https://woosignal.com/docs/api/1.0/product-reviews
  Future<ProductReview> createProductReview(
      {@required int productId,
        int status,
        @required String reviewer,
        @required String reviewerEmail,
        @required String review,
        int rating,
        bool verified}) async {
    Map<String, dynamic> payload = {};

    ({'product_id': productId, 'status': status,
      'reviewer': reviewer, 'reviewer_email': reviewerEmail,
      'review': review, 'rating': rating, 'verified': verified,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    ProductReview productReview;
    setApiResourceUrl(path: 'products/reviews',);
    final response = await post(queryUri.toString(), payload);
    print('response gotten : '+response.toString());
    productReview = ProductReview.fromJson(response);
    return productReview;
  }

  /// https://woosignal.com/docs/api/1.0/product-reviews
  Future<List<ProductReview>> getProductReviews(
      {int page,
        int perPage,
        String search,
        String after,
        String before,
        //List<int> exclude,
        //List<int> include,
        int offset,
        String order,
        String orderBy,
        //List<int> reviewer,
        //List<int> reviewerExclude,
        //List<String> reviewerEmail,
        //List<int> product,
        String status}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      'after': after, 'before': before,
      //'exclude': exclude, 'include': include,
      'offset': offset,
      'order': order, 'orderby': orderBy,
      //'reviewer': reviewer,
      //'reviewer_exclude': reviewerExclude, 'reviewer_email': reviewerEmail, 'product': product,
      'status': status,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<ProductReview> productReviews = [];
    setApiResourceUrl(path: 'products/reviews', queryParameters: payload);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    for(var r in response){
      var rev = ProductReview.fromJson(r);
      print('reviews gotten here : '+rev.toString());
      productReviews.add(rev);
    }
    return productReviews;
  }

  Future<ProductReview>getProductReviewById({@required int reviewId}) async{
    ProductReview productReview;
    setApiResourceUrl(path: 'products/reviews/${reviewId}',);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    productReview = ProductReview.fromJson(response);
    return productReview;
  }


  Future<List<CartItem>>getCartItems() async{
    print('This is the current path : '+this.apiPath.toString());
    List<CartItem> cartItems =[];
    setApiResourceUrl(path: 'cart/items', isShop: true);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    print('this is query oo : '+queryUri.toString());
    for(var p in response){
      var prod = CartItem.fromJson(p);
      print('prod gotten here : '+prod.name.toString());
      cartItems.add(prod);
    }
    return cartItems;
  }

  Future<Cart>getCart() async{
    print('This is the current path : '+this.apiPath.toString());
    Cart cart;
    setApiResourceUrl(path: 'cart/', isShop: true);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    print('this is query oo : '+queryUri.toString());
    cart = Cart.fromJson(response);
    return cart;
  }



  Future<CartItem>getCartItemByKey(String key) async{
    CartItem cartItem;
    setApiResourceUrl(path: 'cart/items/${key}', isShop: true);
    final response = await get(queryUri.toString());
    print('response gotten : '+response.toString());
    cartItem = CartItem.fromJson(response);
    return cartItem;
  }

  /// Accepts an int [id] of a product or product variation, int quantity, and an array of chosen variation attribute objects

  Future<CartItem>addToCart({@required int id, @required int quantity, List<String> variations}) async{
    Map<String, dynamic> data = {
      'id': id,
    };
    if(quantity!=null) data['quantity'] = quantity;
    setApiResourceUrl(path: 'cart/items', isShop: true);
    final response = await post(queryUri.toString(), data);
    return CartItem.fromJson(response);
  }

  Future<Order> createOrder (OrderPayload orderPayload) async{
    print('Creating Order With Payload : ' + orderPayload.toString());
    setApiResourceUrl(path: 'orders',);
    final response = await post(queryUri.toString(), orderPayload.toJson());
    return Order.fromJson(response);
  }

  Future<List<Order>> getOrders(
      {int page,
        int perPage,
        String search,
        String after,
        String before,
        List<int> exclude,
        List<int> include,
        int offset,
        String order,
        String orderBy,
        List<int> parent,
        List<int> parentExclude,
        List<String>
        status, // Options: any, pending, processing, on-hold, completed, cancelled, refunded, failed and trash. Default is any.
        int customer,
        int product,
        int dp}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      'after': after, 'before': before,
      'exclude': exclude, 'include': include, 'offset': offset,
      'order': order, 'orderby': orderBy, 'parent': parent,
      'parent_exclude': parentExclude, 'status': status,
      'customer': customer, 'product': product, 'dp': dp,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<Order>orders = [];
    print('Getting Order With Payload : ' + payload.toString());
    setApiResourceUrl(path: 'orders', queryParameters: payload);
    final response = await get(queryUri.toString());
    for(var o in response){
      var order = Order.fromJson(o);
      print('order gotten here : '+order.toString());
      orders.add(order);
    }
    return orders;
  }

  Future<Order> getOrderById(int id, {String dp}) async {
    Map<String, dynamic> payload = {};
    if (dp != null) payload["dp"] = dp;
    setApiResourceUrl(path: 'orders/${id}',queryParameters: payload);
    final response = await get(queryUri.toString());
    return Order.fromJson(response);
  }

  Future<Coupon> createCoupon(
      {String code,
        String discountType,
        String amount,
        bool individualUse,
        bool excludeSaleItems,
        String minimumAmount,
      }) async {
    Map<String, dynamic> payload = {};

    ({'code': code, 'discount_type': discountType, 'amount': amount,
      'individual_use': individualUse, 'exclude_sale_items': excludeSaleItems,
      'minimum_amount': minimumAmount,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    Coupon coupon;
    setApiResourceUrl(path: 'coupons',);
    final response = await post(queryUri.toString(), payload);
    print('response gotten : '+response.toString());
    coupon = Coupon.fromJson(response);
    return coupon;
  }

  Future<List<Coupon>> getCoupons(
      {int page,
        int perPage,
        String search,
        String after,
        String before,
        //List<int> exclude,
        //List<int> include,
        int offset,
        String order,
        String orderBy,
        String code,
      }) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'search': search,
      'after': after, 'before': before,
      //'exclude': exclude, 'include': include,
      'offset': offset,
      'order': order, 'orderby': orderBy, 'code': code,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<Coupon>coupons;
    print('Getting Coupons With Payload : ' + payload.toString());
    setApiResourceUrl(path: 'coupons', queryParameters: payload);
    final response = await get(queryUri.toString());
    for(var c in response){
      var coupon = Coupon.fromJson(c);
      print('prod gotten here : '+order.toString());
      coupons.add(coupon);
    }
    return coupons;
  }

  Future<Coupon> getCouponById(int id) async {
    setApiResourceUrl(path: 'coupons/${id}');
    final response = await get(queryUri.toString());
    return Coupon.fromJson(response);
  }

  /// https://woosignal.com/docs/api/1.0/tax-rates
  Future<List<TaxRate>> getTaxRates(
      {int page,
        int perPage,
        int offset,
        String order,
        String orderBy,
        String taxClass}) async {
    Map<String, dynamic> payload = {};

    ({'page': page, 'per_page': perPage, 'offset': offset,
      'order': order, 'orderby': orderBy, 'class': taxClass,
    }
    ).forEach((k, v) {
      if(v != null) payload[k] = v.toString();
    });

    List<TaxRate> taxRates = [];
    print('Getting Taxrates With Payload : ' + payload.toString());
    setApiResourceUrl(path: 'taxes', queryParameters: payload);
    final response = await get(queryUri.toString());
    for(var t in response){
      var tax = TaxRate.fromJson(t);
      print('prod gotten here : '+order.toString());
      taxRates.add(tax);
    }
    return taxRates;
  }

  Future<TaxRate> getTaxRateById(int id) async {
    setApiResourceUrl(path: 'taxes/${id}');
    final response = await get(queryUri.toString());
    return TaxRate.fromJson(response);
  }

  /// https://woosignal.com/docs/api/1.0/tax-classes
  Future<List<TaxClass>> getTaxClasses() async {
    List<TaxClass> taxClasses = [];
    setApiResourceUrl(path: 'taxes/classes');
    final response = await get(queryUri.toString());
    for(var t in response){
      var tClass = TaxClass.fromJson(t);
      print('tax class gotten here : '+tClass.toString());
      taxClasses.add(tClass);
    }
    return taxClasses;
  }


  /// https://woosignal.com/docs/api/1.0/shipping-zones
  Future<List<ShippingZone>> getShippingZones() async {
    List<ShippingZone> shippingZones = [];
    setApiResourceUrl(path: 'shipping/zones');
    final response = await get(queryUri.toString());
    for(var z in response){
      var sZone = ShippingZone.fromJson(z);
      print('shipping zones gotten here : '+sZone.toString());
      shippingZones.add(sZone);
    }
    return shippingZones;
  }

  /// https://woosignal.com/docs/api/1.0/shipping-zones#retrive-a-shipping-zone
  Future<ShippingZone> getShippingZoneById(int id) async {
    ShippingZone shippingZone;
    setApiResourceUrl(path: 'shipping/zones/${id}');
    final response = await get(queryUri.toString());
    shippingZone = ShippingZone.fromJson(response);
    return shippingZone;
  }

  /// This Generates a valid OAuth 1.0 URL
  ///
  /// if [isHttps] is true we just return the URL with
  /// [consumerKey] and [consumerSecret] as query parameters
  String _getOAuthURL(String requestMethod, String endpoint) {
    String consumerKey = this.consumerKey;
    String consumerSecret = this.consumerSecret;

    String token = "";
    String url = this.baseUrl + apiPath + endpoint;
    bool containsQueryParams = url.contains("?");

    if (this.isHttps == true) {
      return url +
          (containsQueryParams == true
              ? "&consumer_key=" +
              this.consumerKey +
              "&consumer_secret=" +
              this.consumerSecret
              : "?consumer_key=" +
              this.consumerKey +
              "&consumer_secret=" +
              this.consumerSecret);
    }

    Random rand = Random();
    List<int> codeUnits = List.generate(10, (index) {
      return rand.nextInt(26) + 97;
    });

    /// Random string uniquely generated to identify each signed request
    String nonce = String.fromCharCodes(codeUnits);

    /// The timestamp allows the Service Provider to only keep nonce values for a limited time
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    String parameters = "oauth_consumer_key=" +
        consumerKey +
        "&oauth_nonce=" +
        nonce +
        "&oauth_signature_method=HMAC-SHA1&oauth_timestamp=" +
        timestamp.toString() +
        "&oauth_token=" +
        token +
        "&oauth_version=1.0&";

    if (containsQueryParams == true) {
      parameters = parameters + url.split("?")[1];
    } else {
      parameters = parameters.substring(0, parameters.length - 1);
    }

    Map<dynamic, dynamic> params = QueryString.parse(parameters);
    Map<dynamic, dynamic> treeMap = new SplayTreeMap<dynamic, dynamic>();
    treeMap.addAll(params);

    String parameterString = "";

    for (var key in treeMap.keys) {
      parameterString = parameterString +
          Uri.encodeQueryComponent(key) +
          "=" +
          treeMap[key] +
          "&";
    }

    parameterString = parameterString.substring(0, parameterString.length - 1);

    String method = requestMethod;
    String baseString = method +
        "&" +
        Uri.encodeQueryComponent(
            containsQueryParams == true ? url.split("?")[0] : url) +
        "&" +
        Uri.encodeQueryComponent(parameterString);

    String signingKey = consumerSecret + "&" + token;
    crypto.Hmac hmacSha1 =
    crypto.Hmac(crypto.sha1, utf8.encode(signingKey)); // HMAC-SHA1

    /// The Signature is used by the server to verify the
    /// authenticity of the request and prevent unauthorized access.
    /// Here we use HMAC-SHA1 method.
    crypto.Digest signature = hmacSha1.convert(utf8.encode(baseString));

    String finalSignature = base64Encode(signature.bytes);

    String requestUrl = "";

    if (containsQueryParams == true) {
      requestUrl = url.split("?")[0] +
          "?" +
          parameterString +
          "&oauth_signature=" +
          Uri.encodeQueryComponent(finalSignature);
    } else {
      requestUrl = url +
          "?" +
          parameterString +
          "&oauth_signature=" +
          Uri.encodeQueryComponent(finalSignature);
    }

    return requestUrl;
  }

  _handleError(dynamic response){
    if(response['message']==null){
      return response;
    }
    else {
      throw Exception(
          WooCommerceError.fromJson(response).toString());
    }
  }

  Exception _handleHttpError(http.Response response) {
    switch (response.statusCode) {
      case 400:
      case 401:
      case 404:
      case 500:
        throw Exception(
            WooCommerceError.fromJson(json.decode(response.body)).toString());
      default:
        throw Exception(
            "An error occurred, status code: ${response.statusCode}");
    }
  }

  Future<dynamic> get(String endPoint) async {
    String url = this._getOAuthURL("GET", endPoint);
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      _handleHttpError(response);
    } on SocketException {
      throw Exception('No Internet connection.');
    }
  }

  Future<dynamic> post(String endPoint, Map data) async {
    String url = this._getOAuthURL("POST", endPoint);

    http.Client client = http.Client();
    http.Request request = http.Request('POST', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
    'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    String response =
    await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    _handleError(dataResponse);
    return dataResponse;
  }

  Future<dynamic> put(String endPoint, Map data) async {
    String url = this._getOAuthURL("PUT", endPoint);

    http.Client client = http.Client();
    http.Request request = http.Request('PUT', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
    'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    String response =
    await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    _handleError(dataResponse);
    return dataResponse;
  }

  Future<dynamic> delete(String endPoint, Map data) async {
    String url = this._getOAuthURL("DELETE", endPoint);

    http.Client client = http.Client();
    http.Request request = http.Request('DELETE', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
    'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    String response =
    await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    _handleError(dataResponse);
    return dataResponse;
  }
}

class QueryString {
  /// Parses the given query string into a Map.
  static Map parse(String query) {
    RegExp search = RegExp('([^&=]+)=?([^&]*)');
    Map result = Map();

    // Get rid off the beginning ? in query strings.
    if (query.startsWith('?')) query = query.substring(1);

    // A custom decoder.
    decode(String s) => Uri.decodeComponent(s.replaceAll('+', ' '));

    // Go through all the matches and build the result map.
    for (Match match in search.allMatches(query)) {
      result[decode(match.group(1))] = decode(match.group(2));
    }

    return result;
  }
}
