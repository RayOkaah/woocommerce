/*
 * BSD 3-Clause License

    Copyright (c) 2020, RAY OKAAH - MailTo: ray@flutterengineer.com, Twitter: Rayscode
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

/// The WooCommerce SDK for Flutter. Bringing your ecommerce app to life easily with Flutter and Woo Commerce.

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
import 'package:woocommerce/models/customer_download.dart';
import 'package:woocommerce/models/payment_gateway.dart';
import 'package:woocommerce/models/shipping_zone_method.dart';
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
//import 'models/shipping_zone_method.dart';
import 'models/tax_classes.dart';
import 'models/tax_rate.dart';
import 'constants/constants.dart';
import 'models/jwt_response.dart';
import 'models/user.dart';
import 'utilities/local_db.dart';

export 'models/cart_item.dart' show WooCartItem;
export 'woocommerce_error.dart' show WooCommerceError;
export 'models/cart.dart' show WooCart;
export 'models/coupon.dart' show WooCoupon;
export 'models/customer.dart' show WooCustomer;
export 'models/order.dart' show WooOrder;
export 'models/order_payload.dart' show WooOrderPayload;
export 'models/product_attribute_term.dart' show WooProductAttributeTerm;
export 'models/product_attributes.dart' show WooProductAttribute;
export 'models/product_category.dart' show WooProductCategory;
export 'models/product_review.dart' show WooProductReview;
export 'models/product_shipping_class.dart' show WooProductShippingClass;
export 'models/product_tag.dart' show WooProductTag;
export 'models/product_variation.dart' show WooProductVariation;
export 'models/products.dart' show WooProduct;
export 'models/shipping_method.dart' show WooShippingMethod;
export 'models/shipping_zone.dart' show WooShippingZone;
export 'models/shipping_zone_location.dart' show WooShippingZoneLocation;
export 'models/shipping_zone_method.dart' show WooShippingZoneMethod;
export 'models/tax_classes.dart' show WooTaxClass;
export 'models/tax_rate.dart' show WooTaxRate;
export 'models/jwt_response.dart' show WooJWTResponse;
export 'models/user.dart' show WooUser;

/// Create a new Instance of [WooCommerce] and pass in the necessary parameters into the constructor.
///
/// For example
/// ``` WooCommerce myApi = WooCommerce(
///   baseUrl: yourbaseUrl, // For example  http://mywebsite.com or https://mywebsite.com or http://cs.mywebsite.com
///   consumerKey: consumerKey,
///  consumerSecret: consumerSecret);
///  ```

class WooCommerce {
  /// Parameter, [baseUrl] is the base url of your site. For example, http://me.com or https://me.com.
  String baseUrl;

  /// Parameter [consumerKey] is the consumer key provided by WooCommerce, e.g. `ck_12abc34n56j`.
  String consumerKey;

  /// Parameter [consumerSecret] is the consumer secret provided by WooCommerce, e.g. `cs_1uab8h3s3op`.
  String consumerSecret;

  /// Returns if the website is https or not based on the [baseUrl] parameter.
  bool isHttps;

  /// Parameter(Optional) [apiPath], tells the SDK if there is a different path to your api installation.
  /// Useful if the websites woocommerce api path have been modified.
  String apiPath;

  /// Parameter(Optional) [isDebug], tells the library if it should _printToLog debug logs.
  /// Useful if you are debuging or in development.
  bool isDebug;

  WooCommerce({
    @required String baseUrl,
    @required String consumerKey,
    @required String consumerSecret,
    String apiPath = DEFAULT_WC_API_PATH,
    bool isDebug = false,
  }) {
    this.baseUrl = baseUrl;
    this.consumerKey = consumerKey;
    this.consumerSecret = consumerSecret;
    this.apiPath = apiPath;
    this.isDebug = isDebug;

    if (this.baseUrl.startsWith("https")) {
      this.isHttps = true;
    } else {
      this.isHttps = false;
    }
  }

  void _printToLog(String message) {
    if (isDebug) {
      print("WOOCOMMERCE LOG : " + message);
    }
  }

  String _authToken;
  String get authToken => _authToken;

  Uri queryUri;
  String get apiResourceUrl => queryUri.toString();

  // Header to be sent for JWT authourization
  Map<String, String> _urlHeader = {'Authorization': ''};
  String get urlHeader => _urlHeader['Authorization'] = 'Bearer ' + authToken;
  LocalDatabaseService _localDbService = LocalDatabaseService();

  /// Authenticates the user using WordPress JWT authentication and returns the access [_token] string.
  ///
  /// Associated endpoint : yourwebsite.com/wp-json/jwt-auth/v1/token
  Future authenticateViaJWT({String username, String password}) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      this.baseUrl + URL_JWT_TOKEN,
      body: body,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      WooJWTResponse authResponse =
          WooJWTResponse.fromJson(json.decode(response.body));
      _authToken = authResponse.token;
      _localDbService.updateSecurityToken(_authToken);
      _urlHeader['Authorization'] = 'Bearer ${authResponse.token}';
      return _authToken;
    } else {
      throw new WooCommerceError.fromJson(json.decode(response.body));
    }
  }

  /// Authenticates the user via JWT and returns a WooCommerce customer object of the current logged in customer.
  loginCustomer({
    @required String username,
    @required String password,
  }) async {
    WooCustomer customer;
    try {
      var response =
          await authenticateViaJWT(username: username, password: password);
      _printToLog('attempted token : ' + response.toString());
      if (response is String) {
        int id = await fetchLoggedInUserId();
        customer = await getCustomerById(id: id);
      }
      return customer;
    } catch (e) {
      return e.message;
    }
  }

  /// Confirm if a customer is logged in [true] or out [false].
  Future<bool> isCustomerLoggedIn() async {
    String sToken = await _localDbService.getSecurityToken();
    if (sToken == '0') {
      return false;
    } else {
      return true;
    }
  }

  /// Fetches already authenticated user, using Jwt
  ///
  /// Associated endpoint : /wp-json/wp/v2/users/me
  Future<int> fetchLoggedInUserId() async {
    _authToken = await _localDbService.getSecurityToken();
    _urlHeader['Authorization'] = 'Bearer ' + _authToken;
    final response =
        await http.get(this.baseUrl + URL_USER_ME, headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonStr = json.decode(response.body);
      if (jsonStr.length == 0)
        throw new WooCommerceError(
            code: 'wp_empty_user',
            message: "No user found or you dont have permission");
      _printToLog('account user fetch : ' + jsonStr.toString());
      return jsonStr['id'];
    } else {
      WooCommerceError err =
          WooCommerceError.fromJson(json.decode(response.body));
      throw err;
    }
  }

  /// Log User out
  ///
  logUserOut() async {
    await _localDbService.deleteSecurityToken();
  }

  /// Creates a new Wordpress user and returns whether action was sucessful or not using WP Rest User Wordpress plugin.
  ///
  /// Associated endpoint : /register .

  Future<bool> registerNewWpUser({WooUser user}) async {
    String url = this.baseUrl + URL_REGISTER_ENDPOINT;

    http.Client client = http.Client();
    http.Request request = http.Request('POST', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(user.toJson());
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    _printToLog('registerNewUser response : ' + dataResponse.toString());
    if (dataResponse['data'] == null) {
      return true;
    } else {
      throw Exception(WooCommerceError.fromJson(dataResponse).toString());
    }
  }

  /// Creates a new Woocommerce Customer and returns the customer object.
  ///
  /// Accepts a customer object as required parameter.
  Future<bool> createCustomer(WooCustomer customer) async {
    _printToLog('Creating Customer With info : ' + customer.toString());
    _setApiResourceUrl(path: 'customers');
    final response = await post(queryUri.toString(), customer.toJson());
    _printToLog('created customer : ' + response.toString());
    final cus = WooCustomer.fromJson(response);
    if (cus is WooCustomer) {
      return true;
    } else {
      return false;
    }
    //return WooCustomer.fromJson(response);
  }

  /// Returns a list of all [WooCustomer], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#customers
  Future<List<WooCustomer>> getCustomers(
      {int page,
      int perPage,
      String search,
      List<int> exclude,
      List<int> include,
      int offset,
      String order,
      String orderBy,
      //String email,
      String role}) async {
    Map<String, dynamic> payload = {};

    ({
      'page': page, 'per_page': perPage, 'search': search,
      'exclude': exclude, 'include': include, 'offset': offset,
      'order': order, 'orderby': orderBy, //'email': email,
      'role': role,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });

    List<WooCustomer> customers = [];
    _setApiResourceUrl(path: 'customers', queryParameters: payload);

    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());
    for (var c in response) {
      var customer = WooCustomer.fromJson(c);
      _printToLog('customers here : ' + customer.toString());
      customers.add(customer);
    }
    return customers;
  }

  /// Returns a [WooCustomer], whoose [id] is specified.
  Future<WooCustomer> getCustomerById({@required int id}) async {
    WooCustomer customer;
    _setApiResourceUrl(
      path: 'customers/' + id.toString(),
    );
    final response = await get(queryUri.toString());
    customer = WooCustomer.fromJson(response);
    return customer;
  }

  /// Returns a list of all [WooCustomerDownload], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#customers
  Future<List<WooCustomerDownload>> getCustomerDownloads(
      {@required int customerId}) async {
    List<WooCustomerDownload> customerDownloads = [];
    _setApiResourceUrl(
        path: 'customers/' + customerId.toString() + '/downloads');

    final response = await get(queryUri.toString());
    _printToLog('getting customer downloads : ' + response.toString());
    for (var d in response) {
      var download = WooCustomerDownload.fromJson(d);
      _printToLog('download gotten here : ' + download.toString());
      customerDownloads.add(download);
    }
    return customerDownloads;
  }

  /// Updates an existing Customer and returns the [WooCustomer] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#customer-properties.

  Future<WooCustomer> oldUpdateCustomer(
      {@required WooCustomer wooCustomer}) async {
    _printToLog(
        'Updating customer With customerId : ' + wooCustomer.id.toString());
    _setApiResourceUrl(
      path: 'customers/' + wooCustomer.id.toString(),
    );
    final response = await put(queryUri.toString(), wooCustomer.toJson());
    return WooCustomer.fromJson(response);
  }

  Future<WooCustomer> updateCustomer({@required int id, Map data}) async {
    _printToLog('Updating customer With customerId : ' + id.toString());
    _setApiResourceUrl(
      path: 'customers/' + id.toString(),
    );
    final response = await put(queryUri.toString(), data);
    return WooCustomer.fromJson(response);
  }

  /// Deletes an existing Customer and returns the [WooCustomer] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#customer-properties.

  Future<WooCustomer> deleteCustomer(
      {@required int customerId, reassign}) async {
    Map data = {
      'force': true,
    };
    if (reassign != null) data['reassign'] = reassign;
    _printToLog('Deleting customer With customerId : ' + customerId.toString());
    _setApiResourceUrl(
      path: 'customers/' + customerId.toString(),
    );
    final response = await delete(queryUri.toString(), data);
    return WooCustomer.fromJson(response);
  }

  /// Returns a list of all [WooProduct], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#products.
  Future<List<WooProduct>> getProducts(
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

    ({
      'page': page,
      'per_page': perPage,
      'search': search,
      'after': after,
      'before': before,
      'exclude': exclude,
      'include': include,
      'offset': offset,
      'order': order,
      'orderby': orderBy,
      'parent': parent,
      'parent_exclude': parentExclude,
      'slug': slug,
      'status': status,
      'type': type,
      'sku': sku,
      'featured': featured,
      'category': category,
      'tag': tag,
      'shipping_class': shippingClass,
      'attribute': attribute,
      'attribute_term': attributeTerm,
      'tax_class': taxClass,
      'on_sale': onSale,
      'min_price': minPrice,
      'max_price': maxPrice,
      'stock_status': stockStatus,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });

    _printToLog("Parameters: " + payload.toString());
    List<WooProduct> products = [];
    _setApiResourceUrl(path: 'products', queryParameters: payload);
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());
    _printToLog('this is the queri uri : ' + queryUri.toString());
    for (var p in response) {
      var prod = WooProduct.fromJson(p);
      _printToLog('product gotten here : ' + prod.name.toString());
      products.add(prod);
    }
    return products;
  }

  /// Returns a [WooProduct], with the specified [id].
  Future<WooProduct> getProductById({@required int id}) async {
    WooProduct product;
    _setApiResourceUrl(
      path: 'products/' + id.toString(),
    );
    final response = await get(queryUri.toString());
    product = WooProduct.fromJson(response);
    return product;
  }

  /// Returns a list of all [WooProductVariation], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-variations
  Future<List<WooProductVariation>> getProductVariations(
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

    ({
      'page': page,
      'per_page': perPage,
      'search': search,
      'after': after,
      'before': before,
      'exclude': exclude,
      'include': include,
      'offset': offset,
      'order': order,
      'orderby': orderBy,
      'parent': parent,
      'parent_exclude': parentExclude,
      'slug': slug,
      'status': status,
      'sku': sku,
      'tax_class': taxClass,
      'on_sale': onSale,
      'min_price': minPrice,
      'max_price': maxPrice,
      'stock_status': stockStatus,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });
    List<WooProductVariation> productVariations = [];
    _setApiResourceUrl(
        path: 'products/' + productId.toString() + '/variations',
        queryParameters: payload);
    _printToLog('this is the curent path : ' + this.apiPath);
    final response = await get(queryUri.toString());
    for (var v in response) {
      var prodv = WooProductVariation.fromJson(v);
      _printToLog('prod gotten here : ' + prodv.toString());
      productVariations.add(prodv);
    }
    return productVariations;
  }

  /// Returns a [WooProductVariation], with the specified [productId] and [variationId].

  Future<WooProductVariation> getProductVariationById(
      {@required int productId, variationId}) async {
    WooProductVariation productVariation;
    _setApiResourceUrl(
      path: 'products/' +
          productId.toString() +
          '/variations/' +
          variationId.toString(),
    );
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());

    productVariation = WooProductVariation.fromJson(response);
    return productVariation;
  }

  /// Returns a List[WooProductVariation], with the specified [productId] only.

  Future<List<WooProductVariation>> getProductVariationsByProductId(
      {@required int productId}) async {
    List<WooProductVariation> productVariations = [];
    _setApiResourceUrl(
        path: 'products/' + productId.toString() + '/variations/');
    final response = await get(queryUri.toString());

    for (var v in response) {
      var prodv = WooProductVariation.fromJson(v);
      _printToLog('prod gotten here : ' + prodv.toString());
      productVariations.add(prodv);
    }
    return productVariations;
  }

  /// Returns a list of all [WooProductAttribute].
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-attributes

  Future<List<WooProductAttribute>> getProductAttributes() async {
    List<WooProductAttribute> productAttributes = [];
    _setApiResourceUrl(
      path: 'products/attributes',
    );
    final response = await get(queryUri.toString());
    for (var a in response) {
      var att = WooProductAttribute.fromJson(a);
      _printToLog('prod gotten here : ' + att.toString());
      productAttributes.add(att);
    }
    return productAttributes;
  }

  /// Returns a [WooProductAttribute], with the specified [attributeId].

  Future<WooProductAttribute> getProductAttributeById(
      {@required int attributeId}) async {
    WooProductAttribute productAttribute;
    _setApiResourceUrl(
      path: 'products/attributes/' + attributeId.toString(),
    );
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());

    productAttribute = WooProductAttribute.fromJson(response);
    return productAttribute;
  }

  /// Returns a list of all [WooProductAttributeTerm], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-attribute-terms
  Future<List<WooProductAttributeTerm>> getProductAttributeTerms(
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

    ({
      'page': page,
      'per_page': perPage,
      'search': search,
      'exclude': exclude,
      'include': include,
      'order': order,
      'orderby': orderBy,
      'hide_empty': hideEmpty,
      'parent': parent,
      'product': product,
      'slug': slug,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });
    List<WooProductAttributeTerm> productAttributeTerms = [];
    _setApiResourceUrl(
        path: 'products/attributes/' + attributeId.toString() + '/terms',
        queryParameters: payload);
    final response = await get(queryUri.toString());
    for (var t in response) {
      var term = WooProductAttributeTerm.fromJson(t);
      _printToLog('term gotten here : ' + term.toString());
      productAttributeTerms.add(term);
    }
    return productAttributeTerms;
  }

  /// Returns a [WooProductAttributeTerm], with the specified [attributeId] and [termId].

  Future<WooProductAttributeTerm> getProductAttributeTermById(
      {@required int attributeId, termId}) async {
    WooProductAttributeTerm productAttributeTerm;
    _setApiResourceUrl(
      path: 'products/attributes/' +
          attributeId.toString() +
          '/terms/' +
          termId.toString(),
    );
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());

    productAttributeTerm = WooProductAttributeTerm.fromJson(response);
    return productAttributeTerm;
  }

  /// Returns a list of all [WooProductCategory], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-categories

  Future<List<WooProductCategory>> getProductCategories(
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

    ({
      'page': page, 'per_page': perPage, 'search': search,
      //'exclude': exclude, 'include': include,
      'order': order, 'orderby': orderBy, 'hide_empty': hideEmpty,
      'parent': parent,
      'product': product, 'slug': slug,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });

    List<WooProductCategory> productCategories = [];
    _printToLog('payload : ' + payload.toString());
    _setApiResourceUrl(path: 'products/categories', queryParameters: payload);
    _printToLog('this is the path : ' + this.apiPath);
    final response = await get(queryUri.toString());
    for (var c in response) {
      var cat = WooProductCategory.fromJson(c);
      _printToLog('category gotten here : ' + cat.toString());
      productCategories.add(cat);
    }
    return productCategories;
  }

  /// Returns a [WooProductCategory], with the specified [categoryId].

  Future<WooProductCategory> getProductCategoryById(
      {@required int categoryId}) async {
    WooProductCategory productCategory;
    _setApiResourceUrl(
      path: 'products/categories/' + categoryId.toString(),
    );
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());
    productCategory = WooProductCategory.fromJson(response);
    return productCategory;
  }

  /// Returns a list of all [WooProductShippingClass], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-shipping-classes
  Future<List<WooProductShippingClass>> getProductShippingClasses(
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
    ({
      'page': page,
      'per_page': perPage,
      'search': search,
      'exclude': exclude,
      'include': include,
      'offset': offset,
      'order': order,
      'orderby': orderBy,
      'hide_empty': hideEmpty,
      'product': product,
      'slug': slug,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });
    List<WooProductShippingClass> productShippingClasses = [];
    _setApiResourceUrl(
      path: 'products/shipping_classes',
    );
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());
    for (var c in response) {
      var sClass = WooProductShippingClass.fromJson(c);
      _printToLog('prod gotten here : ' + sClass.toString());
      productShippingClasses.add(sClass);
    }
    return productShippingClasses;
  }

  /// Returns a [WooProductShippingClass], with the specified [id].

  Future<WooProductShippingClass> getProductShippingClassById(
      {@required int id}) async {
    WooProductShippingClass productShippingClass;
    _setApiResourceUrl(
      path: 'products/shipping_classes/' + id.toString(),
    );
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());
    productShippingClass = WooProductShippingClass.fromJson(response);
    return productShippingClass;
  }

  /// Returns a list of all [ProductTag], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-tags
  Future<List<WooProductTag>> getProductTags(
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
    ({
      'page': page, 'per_page': perPage, 'search': search,
      // 'exclude': exclude, 'include': include,
      'offset': offset,
      'order': order, 'orderby': orderBy, 'hide_empty': hideEmpty,
      'product': product, 'slug': slug,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });
    List<WooProductTag> productTags = [];
    _printToLog('making request with payload : ' + payload.toString());
    _setApiResourceUrl(path: 'products/tags', queryParameters: payload);
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());
    for (var c in response) {
      var tag = WooProductTag.fromJson(c);
      _printToLog('prod gotten here : ' + tag.toString());
      productTags.add(tag);
    }
    return productTags;
  }

  /// Returns a [WooProductTag], with the specified [id].

  Future<WooProductTag> getProductTagById({@required int id}) async {
    WooProductTag productTag;
    _setApiResourceUrl(
      path: 'products/tags/' + id.toString(),
    );
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());
    productTag = WooProductTag.fromJson(response);
    return productTag;
  }

  /// Returns a  [WooProductReview] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-reviews
  Future<WooProductReview> createProductReview(
      {@required int productId,
      int status,
      @required String reviewer,
      @required String reviewerEmail,
      @required String review,
      int rating,
      bool verified}) async {
    Map<String, dynamic> payload = {};

    ({
      'product_id': productId,
      'status': status,
      'reviewer': reviewer,
      'reviewer_email': reviewerEmail,
      'review': review,
      'rating': rating,
      'verified': verified,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });

    WooProductReview productReview;
    _setApiResourceUrl(
      path: 'products/reviews',
    );
    final response = await post(queryUri.toString(), payload);
    _printToLog('response gotten : ' + response.toString());
    productReview = WooProductReview.fromJson(response);
    return productReview;
  }

  /// Returns a list of all [WooProductReview], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-reviews
  Future<List<WooProductReview>> getProductReviews(
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
      List<int> reviewer,
      //List<int> reviewerExclude,
      //List<String> reviewerEmail,
      List<int> product,
      String status}) async {
    Map<String, dynamic> payload = {};

    ({
      'page': page, 'per_page': perPage, 'search': search,
      'after': after, 'before': before,
      //'exclude': exclude, 'include': include,
      'offset': offset,
      'order': order, 'orderby': orderBy,
      'reviewer': reviewer,
      //'reviewer_exclude': reviewerExclude, 'reviewer_email': reviewerEmail,
      'product': product,
      'status': status,
    }).forEach((k, v) {
      if (v != null) payload[k] = v;
    });
    String meQueryPath = 'products/reviews' + getQueryString(payload);
    List<WooProductReview> productReviews = [];
    //_setApiResourceUrl(path: 'products/reviews', queryParameters: payload);
    final response = await get(meQueryPath);
    _printToLog('response gotten : ' + response.toString());
    for (var r in response) {
      var rev = WooProductReview.fromJson(r);
      _printToLog('reviews gotten here : ' + rev.toString());
      productReviews.add(rev);
    }
    return productReviews;
  }

  /// Returns a [WooProductReview], with the specified [reviewId].
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-reviews

  Future<WooProductReview> getProductReviewById(
      {@required int reviewId}) async {
    WooProductReview productReview;
    _setApiResourceUrl(
      path: 'products/reviews/' + reviewId.toString(),
    );
    final response = await get(queryUri.toString());
    _printToLog('response gotten : ' + response.toString());
    productReview = WooProductReview.fromJson(response);
    return productReview;
  }

  /// Updates an existing Product Review and returns the [WooProductReview] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-reviews

  Future<WooProductReview> updateProductReview(
      {@required WooProductReview productReview}) async {
    _printToLog('Updating product review With reviewId : ' +
        productReview.id.toString());
    _setApiResourceUrl(
      path: 'products/reviews/' + productReview.id.toString(),
    );
    final response = await put(queryUri.toString(), productReview.toJson());
    return WooProductReview.fromJson(response);
  }

  /// Deletes an existing Product Review and returns the [WooProductReview] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#product-reviews

  Future<WooProductReview> deleteProductReview({@required int reviewId}) async {
    Map data = {
      'force': true,
    };
    _printToLog(
        'Deleting product review With reviewId : ' + reviewId.toString());
    _setApiResourceUrl(
      path: 'products/review/' + reviewId.toString(),
    );
    final response = await delete(queryUri.toString(), data);
    return WooProductReview.fromJson(response);
  }

  /**
  /// Accepts an int [id] of a product or product variation, int quantity, and an array of chosen variation attribute objects
  /// Related endpoint : wc/store/cart
  Future<WooCartItem>addToCart({@required int itemId, @required int quantity, List<WooProductVariation> variations}) async{
    Map<String, dynamic> data = {
      'id': itemId,
      'quantity' : quantity,
    };
    if(variations!=null) data['variations'] = variations;
    _setApiResourceUrl(path: 'cart/items', isShop: true);
    final response = await post(queryUri.toString(), data,);
    return WooCartItem.fromJson(response);
  }
  */

  /// Accepts an int [id] of a product or product variation, int quantity, and an array of chosen variation attribute objects
  /// Related endpoint : wc/store/cart
  ///

  Future<WooCartItem> addToMyCart(
      {@required String itemId,
      @required String quantity,
      List<WooProductVariation> variations}) async {
    Map<String, dynamic> data = {
      'id': itemId,
      'quantity': quantity,
    };
    if (variations != null) data['variations'] = variations;
    await getAuthTokenFromDb();
    _urlHeader['Authorization'] = 'Bearer ' + _authToken;
    final response = await http.post(
        this.baseUrl + URL_STORE_API_PATH + 'cart/items',
        headers: _urlHeader,
        body: data);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonStr = json.decode(response.body);

      _printToLog('added to my cart : ' + jsonStr.toString());
      return WooCartItem.fromJson(jsonStr);
    } else {
      WooCommerceError err =
          WooCommerceError.fromJson(json.decode(response.body));
      throw err;
    }
  }

  /// Returns a list of all [WooCartItem].
  ///
  /// Related endpoint : wc/store/cart/items

  Future<List<WooCartItem>> getMyCartItems() async {
    await getAuthTokenFromDb();
    _urlHeader['Authorization'] = 'Bearer ' + _authToken;
    final response = await http.get(
        this.baseUrl + URL_STORE_API_PATH + 'cart/items',
        headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonStr = json.decode(response.body);
      List<WooCartItem> cartItems = [];
      _printToLog('response gotten : ' + response.toString());
      for (var p in jsonStr) {
        var prod = WooCartItem.fromJson(p);
        _printToLog('prod gotten here : ' + prod.name.toString());
        cartItems.add(prod);
      }

      _printToLog('account user fetch : ' + jsonStr.toString());
      return cartItems;
    } else {
      _printToLog(' error : ' + response.body);
      WooCommerceError err =
          WooCommerceError.fromJson(json.decode(response.body));
      throw err;
    }
  }

  /// Returns the current user's [WooCart], information

  Future<WooCart> getMyCart() async {
    await getAuthTokenFromDb();
    _urlHeader['Authorization'] = 'Bearer ' + _authToken;
    WooCart cart;
    final response = await http.get(this.baseUrl + URL_STORE_API_PATH + 'cart',
        headers: _urlHeader);
    _printToLog('response gotten : ' + response.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonStr = json.decode(response.body);
      cart = WooCart.fromJson(jsonStr);
      return cart;
    } else {
      _printToLog(' error : ' + response.body);
      WooCommerceError err =
          WooCommerceError.fromJson(json.decode(response.body));
      throw err;
    }
  }

  Future deleteMyCartItem({@required String key}) async {
    Map<String, dynamic> data = {
      'key': key,
    };
    _printToLog('Deleting CartItem With Payload : ' + data.toString());
    await getAuthTokenFromDb();
    _urlHeader['Authorization'] = 'Bearer ' + _authToken;

    final http.Response response = await http.delete(
      this.baseUrl + URL_STORE_API_PATH + 'cart/items/' + key,
      headers: _urlHeader,
    );
    _printToLog('response of delete cart  : ' + response.body.toString());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      _printToLog(
          'response of delete cart oooo   : ' + response.body.toString());
      //final jsonStr = json.decode(response.body);

      //_printToLog('added to my cart : '+jsonStr.toString());
      //return WooCartItem.fromJson(jsonStr);
      return response.body;
    } else {
      WooCommerceError err =
          WooCommerceError.fromJson(json.decode(response.body));
      throw err;
    }
  }

  Future deleteAllMyCartItems() async {
    await getAuthTokenFromDb();
    _urlHeader['Authorization'] = 'Bearer ' + _authToken;

    final http.Response response = await http.delete(
      this.baseUrl + URL_STORE_API_PATH + 'cart/items/',
      headers: _urlHeader,
    );
    _printToLog('response of delete cart  : ' + response.body.toString());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      WooCommerceError err =
          WooCommerceError.fromJson(json.decode(response.body));
      throw err;
    }
  }

  /// Returns a [WooCartItem], with the specified [key].

  Future<WooCartItem> getMyCartItemByKey(String key) async {
    await getAuthTokenFromDb();
    _urlHeader['Authorization'] = 'Bearer ' + _authToken;
    WooCartItem cartItem;
    final response = await http.get(
        this.baseUrl + URL_STORE_API_PATH + 'cart/items/' + key,
        headers: _urlHeader);
    _printToLog('response gotten : ' + response.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonStr = json.decode(response.body);
      cartItem = WooCartItem.fromJson(jsonStr);
      return cartItem;
    } else {
      _printToLog('error : ' + response.body);
      WooCommerceError err =
          WooCommerceError.fromJson(json.decode(response.body));
      throw err;
    }
  }

  Future<WooCartItem> updateMyCartItemByKey(
      {@required String key,
      @required int id,
      @required int quantity,
      List<WooProductVariation> variations}) async {
    Map<String, dynamic> data = {
      'key': key,
      'id': id.toString(),
      'quantity': quantity.toString(),
    };
    if (variations != null) data['variations'] = variations;
    await getAuthTokenFromDb();
    _urlHeader['Authorization'] = 'Bearer ' + _authToken;
    final response = await http.put(
        this.baseUrl + URL_STORE_API_PATH + 'cart/items/' + key,
        headers: _urlHeader,
        body: data);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonStr = json.decode(response.body);

      _printToLog('added to my cart : ' + jsonStr.toString());
      return WooCartItem.fromJson(jsonStr);
    } else {
      WooCommerceError err =
          WooCommerceError.fromJson(json.decode(response.body));
      throw err;
    }
  }

  /// Creates an order and returns the [WooOrder] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#orders.
  Future<WooOrder> createOrder(WooOrderPayload orderPayload) async {
    _printToLog('Creating Order With Payload : ' + orderPayload.toString());
    _setApiResourceUrl(
      path: 'orders',
    );
    final response = await post(queryUri.toString(), orderPayload.toJson());
    return WooOrder.fromJson(response);
  }

  /// Returns a list of all [Order], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#orders
  Future<List<WooOrder>> getOrders(
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

    ({
      'page': page,
      'per_page': perPage,
      'search': search,
      'after': after,
      'before': before,
      'exclude': exclude,
      'include': include,
      'offset': offset,
      'order': order,
      'orderby': orderBy,
      'parent': parent,
      'parent_exclude': parentExclude,
      'status': status,
      'customer': customer,
      'product': product,
      'dp': dp,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });
    List<WooOrder> orders = [];
    _printToLog('Getting Order With Payload : ' + payload.toString());
    _setApiResourceUrl(path: 'orders', queryParameters: payload);
    final response = await get(queryUri.toString());
    for (var o in response) {
      var order = WooOrder.fromJson(o);
      _printToLog('order gotten here : ' + order.toString());
      orders.add(order);
    }
    return orders;
  }

  /// Returns a [WooOrder] object that matches the provided [id].

  Future<WooOrder> getOrderById(int id, {String dp}) async {
    Map<String, dynamic> payload = {};
    if (dp != null) payload["dp"] = dp;
    _setApiResourceUrl(
        path: 'orders/' + id.toString(), queryParameters: payload);
    final response = await get(queryUri.toString());
    return WooOrder.fromJson(response);
  }

  /// Updates an existing order and returns the [WooOrder] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#orders.

  Future<WooOrder> oldUpdateOrder(WooOrder order) async {
    _printToLog('Updating Order With Payload : ' + order.toString());
    _setApiResourceUrl(
      path: 'orders/' + order.id.toString(),
    );
    final response = await put(queryUri.toString(), order.toJson());
    return WooOrder.fromJson(response);
  }

  Future<WooOrder> updateOrder({Map orderMap, int id}) async {
    _printToLog('Updating Order With Payload : ' + orderMap.toString());
    _setApiResourceUrl(
      path: 'orders/' + id.toString(),
    );
    final response = await put(queryUri.toString(), orderMap);
    return WooOrder.fromJson(response);
  }

  /// Deletes an existing order and returns the [WooOrder] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#orders.

  Future<WooOrder> deleteOrder({@required int orderId}) async {
    Map data = {
      'force': true,
    };
    _printToLog('Deleting Order With Id : ' + orderId.toString());
    _setApiResourceUrl(
      path: 'orders/' + orderId.toString(),
    );
    final response = await delete(queryUri.toString(), data);
    return WooOrder.fromJson(response);
  }

  /// Creates an coupon and returns the [WooCoupon] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#coupons.
  Future<WooCoupon> createCoupon({
    String code,
    String discountType,
    String amount,
    bool individualUse,
    bool excludeSaleItems,
    String minimumAmount,
  }) async {
    Map<String, dynamic> payload = {};

    ({
      'code': code,
      'discount_type': discountType,
      'amount': amount,
      'individual_use': individualUse,
      'exclude_sale_items': excludeSaleItems,
      'minimum_amount': minimumAmount,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });
    WooCoupon coupon;
    _setApiResourceUrl(
      path: 'coupons',
    );
    final response = await post(queryUri.toString(), payload);
    _printToLog('response gotten : ' + response.toString());
    coupon = WooCoupon.fromJson(response);
    return coupon;
  }

  /// Returns a list of all [WooCoupon], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#coupons
  Future<List<WooCoupon>> getCoupons({
    int page,
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
    ({
      'page': page, 'per_page': perPage, 'search': search,
      'after': after, 'before': before,
      //'exclude': exclude, 'include': include,
      'offset': offset,
      'order': order, 'orderby': orderBy, 'code': code,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });
    List<WooCoupon> coupons;
    _printToLog('Getting Coupons With Payload : ' + payload.toString());
    _setApiResourceUrl(path: 'coupons', queryParameters: payload);
    final response = await get(queryUri.toString());
    for (var c in response) {
      var coupon = WooCoupon.fromJson(c);
      _printToLog('prod gotten here : ' + order.toString());
      coupons.add(coupon);
    }
    return coupons;
  }

  /// Returns a [WooCoupon] object with the specified [id].
  Future<WooCoupon> getCouponById(int id) async {
    _setApiResourceUrl(path: 'coupons/' + id.toString());
    final response = await get(queryUri.toString());
    return WooCoupon.fromJson(response);
  }

  /// Returns a list of all [WooTaxRate], with filter options.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#tax-rates.
  Future<List<WooTaxRate>> getTaxRates(
      {int page,
      int perPage,
      int offset,
      String order,
      String orderBy,
      String taxClass}) async {
    Map<String, dynamic> payload = {};

    ({
      'page': page,
      'per_page': perPage,
      'offset': offset,
      'order': order,
      'orderby': orderBy,
      'class': taxClass,
    }).forEach((k, v) {
      if (v != null) payload[k] = v.toString();
    });
    List<WooTaxRate> taxRates = [];
    _printToLog('Getting Taxrates With Payload : ' + payload.toString());
    _setApiResourceUrl(path: 'taxes', queryParameters: payload);
    final response = await get(queryUri.toString());
    for (var t in response) {
      var tax = WooTaxRate.fromJson(t);
      _printToLog('prod gotten here : ' + order.toString());
      taxRates.add(tax);
    }
    return taxRates;
  }

  /// Returns a [WooTaxRate] object matching the specified [id].

  Future<WooTaxRate> getTaxRateById(int id) async {
    _setApiResourceUrl(path: 'taxes/' + id.toString());
    final response = await get(queryUri.toString());
    return WooTaxRate.fromJson(response);
  }

  /// Returns a list of all [WooTaxClass].
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#tax-classes.
  Future<List<WooTaxClass>> getTaxClasses() async {
    List<WooTaxClass> taxClasses = [];
    _setApiResourceUrl(path: 'taxes/classes');
    final response = await get(queryUri.toString());
    for (var t in response) {
      var tClass = WooTaxClass.fromJson(t);
      _printToLog('tax class gotten here : ' + tClass.toString());
      taxClasses.add(tClass);
    }
    return taxClasses;
  }

  /// Returns a list of all [WooShippingZone].
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#shipping-zones.
  Future<List<WooShippingZone>> getShippingZones() async {
    List<WooShippingZone> shippingZones = [];
    _setApiResourceUrl(path: 'shipping/zones');
    final response = await get(queryUri.toString());
    for (var z in response) {
      var sZone = WooShippingZone.fromJson(z);
      _printToLog('shipping zones gotten here : ' + sZone.toString());
      shippingZones.add(sZone);
    }
    return shippingZones;
  }

  /// Returns a [WooShippingZone] object with the specified [id].

  Future<WooShippingZone> getShippingZoneById(int id) async {
    WooShippingZone shippingZone;
    _setApiResourceUrl(path: 'shipping/zones/' + id.toString());
    final response = await get(queryUri.toString());
    shippingZone = WooShippingZone.fromJson(response);
    return shippingZone;
  }

  /// Returns a list of all [WooShippingMethod].
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#shipping-methods.
  Future<List<WooShippingMethod>> getShippingMethods() async {
    List<WooShippingMethod> shippingMethods = [];
    _setApiResourceUrl(path: 'shipping_methods');
    final response = await get(queryUri.toString());
    for (var z in response) {
      var sMethod = WooShippingMethod.fromJson(z);
      _printToLog('shipping methods gotten here : ' + sMethod.toString());
      shippingMethods.add(sMethod);
    }
    return shippingMethods;
  }

  /// Returns a [WooShippingMethod] object with the specified [id].

  Future<WooShippingMethod> getShippingMethodById(int id) async {
    WooShippingMethod shippingMethod;
    _setApiResourceUrl(path: 'shipping_methods/' + id.toString());
    final response = await get(queryUri.toString());
    shippingMethod = WooShippingMethod.fromJson(response);
    return shippingMethod;
  }

  /// Returns a list of all [WooShippingZoneMethod] associated with a shipping zone.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#shipping-zone-locations.
  Future<List<WooShippingZoneMethod>> getAllShippingZoneMethods(
      {@required int shippingZoneId}) async {
    List<WooShippingZoneMethod> shippingZoneMethods = [];
    _setApiResourceUrl(
        path: 'shipping/zones/' + shippingZoneId.toString() + '/methods');
    final response = await get(queryUri.toString());
    for (var l in response) {
      var sMethod = WooShippingZoneMethod.fromJson(l);
      _printToLog(
          'shipping zone locations gotten here : ' + sMethod.toString());
      shippingZoneMethods.add(sMethod);
    }
    return shippingZoneMethods;
  }

  /// Returns a [WooShippingZoneMethod] object from the specified [zoneId] and [methodId].

  Future<WooShippingZoneMethod> getAShippingMethodFromZone(
      {@required int zoneId, @required int methodId}) async {
    WooShippingZoneMethod shippingZoneMethod;
    _setApiResourceUrl(
        path: 'shipping/zones/' +
            zoneId.toString() +
            'methods/' +
            methodId.toString());
    final response = await get(queryUri.toString());
    shippingZoneMethod = WooShippingZoneMethod.fromJson(response);
    return shippingZoneMethod;
  }

  /// Deletes an existing shipping zone method and returns the [WooShippingZoneMethod] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#orders.

  Future<WooShippingZoneMethod> deleteShippingZoneMethod(
      {@required int zoneId, @required int methodId}) async {
    Map data = {
      'force': true,
    };
    _printToLog(
        'Deleting shipping zone method with zoneId : ' + zoneId.toString());
    _setApiResourceUrl(
        path: 'shipping/zones/' +
            zoneId.toString() +
            'methods/' +
            methodId.toString());
    final response = await delete(queryUri.toString(), data);
    return WooShippingZoneMethod.fromJson(response);
  }

  /// Returns a list of all [WooShippingZoneLocation].
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#shipping-zone-locations.
  Future<List<WooShippingZoneLocation>> getShippingZoneLocations(
      {@required int shippingZoneId}) async {
    List<WooShippingZoneLocation> shippingZoneLocations = [];
    _setApiResourceUrl(
        path: 'shipping/zones/' + shippingZoneId.toString() + '/locations');
    final response = await get(queryUri.toString());
    for (var l in response) {
      var sZoneLocation = WooShippingZoneLocation.fromJson(l);
      _printToLog(
          'shipping zone locations gotten here : ' + sZoneLocation.toString());
      shippingZoneLocations.add(sZoneLocation);
    }
    return shippingZoneLocations;
  }

  /// Returns a list of all [WooPaymentGateway] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#list-all-payment-gateways.
  Future<List<WooPaymentGateway>> getPaymentGateways() async {
    List<WooPaymentGateway> gateways = [];
    _setApiResourceUrl(path: 'payment_gateways');
    final response = await get(queryUri.toString());
    for (var g in response) {
      var sMethod = WooPaymentGateway.fromJson(g);
      _printToLog(
          'shipping zone locations gotten here : ' + sMethod.toString());
      gateways.add(sMethod);
    }
    return gateways;
  }

  /// Returns a [WooPaymentGateway] object from the specified [id].

  Future<WooPaymentGateway> getPaymentGatewayById(int id) async {
    WooPaymentGateway paymentGateway;
    _setApiResourceUrl(path: 'payment_gateways/' + id.toString());
    final response = await get(queryUri.toString());
    paymentGateway = WooPaymentGateway.fromJson(response);
    return paymentGateway;
  }

  /// Updates an existing order and returns the [WooPaymentGateway] object.
  ///
  /// Related endpoint: https://woocommerce.github.io/woocommerce-rest-api-docs/#orders.

  Future<WooPaymentGateway> updatePaymentGateway(
      WooPaymentGateway gateway) async {
    _printToLog(
        'Updating Payment Gateway With Payload : ' + gateway.toString());
    _setApiResourceUrl(
      path: 'payment_gateways/' + gateway.id,
    );
    final response = await put(queryUri.toString(), gateway.toJson());
    return WooPaymentGateway.fromJson(response);
  }

  /// This Generates a valid OAuth 1.0 URL
  ///
  /// if [isHttps] is true we just return the URL with
  /// [consumerKey] and [consumerSecret] as query parameters
  String _getOAuthURL(String requestMethod, String endpoint) {
    String consumerKey = this.consumerKey;
    String consumerSecret = this.consumerSecret;

    String token = "";
    _printToLog('oauth token = : ' + token);
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

  _handleError(dynamic response) {
    if (response['message'] == null) {
      return response;
    } else {
      throw Exception(WooCommerceError.fromJson(response).toString());
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

  // Get the auth token from db.

  getAuthTokenFromDb() async {
    _authToken = await _localDbService.getSecurityToken();
    return _authToken;
  }

  // Sets the Uri for an endpoint.
  String _setApiResourceUrl({
    @required String path,
    String host,
    port,
    queryParameters,
    bool isShop = false,
  }) {
    this.apiPath = DEFAULT_WC_API_PATH;
    if (isShop) {
      this.apiPath = URL_STORE_API_PATH;
    } else {
      this.apiPath = DEFAULT_WC_API_PATH;
    }
    //List<Map>param = [];
    // queryParameters.forEach((k, v) => param.add({k : v})); print(param.toString());
    getAuthTokenFromDb();
    queryUri = new Uri(
        path: path, queryParameters: queryParameters, port: port, host: host);

    _printToLog('Query : ' + queryUri.toString());
    //queryUri = new Uri.http( path, param);
    return queryUri.toString();
  }

  String getQueryString(Map params,
      {String prefix: '&', bool inRecursion: false}) {
    String query = '';

    params.forEach((key, value) {
      if (inRecursion) {
        key = '[$key]';
      }

      //if (value is String || value is int || value is double || value is bool) {
      query += '$prefix$key=$value';
      //} else if (value is List || value is Map) {
      // if (value is List) value = value.asMap();
      // value.forEach((k, v) {
      //  query += getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
      //});
      // }
    });

    return query;
  }

  /// Make a custom get request to a Woocommerce endpoint, using WooCommerce SDK.

  Future<dynamic> get(String endPoint) async {
    String url = this._getOAuthURL("GET", endPoint);
    String _token = await _localDbService.getSecurityToken();
    String _bearerToken = "Bearer $_token";
    _printToLog('this is the bearer token : ' + _bearerToken);
    Map<String, String> headers = new HashMap();
    headers.putIfAbsent('Accept', () => 'application/json charset=utf-8');
    // 'Authorization': _bearerToken,
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

  Future<dynamic> oldget(String endPoint) async {
    String url = this._getOAuthURL("GET", endPoint);

    http.Client client = http.Client();
    http.Request request = http.Request('GET', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    //request.headers[HttpHeaders.authorizationHeader] = _token;
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    _handleError(dataResponse);
    return dataResponse;
  }

  /// Make a custom post request to Woocommerce, using WooCommerce SDK.

  Future<dynamic> post(
    String endPoint,
    Map data,
  ) async {
    String url = this._getOAuthURL("POST", endPoint);

    http.Client client = http.Client();
    http.Request request = http.Request('POST', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    //request.headers[HttpHeaders.authorizationHeader] = _bearerToken;
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    _handleError(dataResponse);
    return dataResponse;
  }

  /// Make a custom put request to Woocommerce, using WooCommerce SDK.

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

  /// Make a custom delete request to Woocommerce, using WooCommerce SDK.

  Future<dynamic> oldelete(String endPoint, Map data) async {
    String url = this._getOAuthURL("DELETE", endPoint);

    http.Client client = http.Client();
    http.Request request = http.Request('DELETE', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    //request.headers[HttpHeaders.authorizationHeader] = _urlHeader['Authorization'];
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    final response =
        await client.send(request).then((res) => res.stream.bytesToString());
    _printToLog("this is the delete's response : " + response.toString());
    var dataResponse = await json.decode(response);
    _handleHttpError(dataResponse);
    return dataResponse;
  }

  Future<dynamic> delete(String endPoint, Map data, {String aUrl}) async {
    String realUrl;
    final url = this._getOAuthURL("DELETE", endPoint);
    if (aUrl == null) {
      realUrl = url;
    } else {
      realUrl = url;
    }
    // final url = Uri.parse(baseUrl + "notes/delete");
    final request = http.Request("DELETE", Uri.parse(realUrl));
    request.headers.addAll(<String, String>{
      "Accept": "application/json",
    });
    request.body = jsonEncode(data);
    final response = await request.send();
    if (response.statusCode > 300)
      return Future.error(
          "error: status code ${response.statusCode} ${response.reasonPhrase}");
    final deleteResponse = await response.stream.bytesToString();
    _printToLog("delete response : " + deleteResponse.toString());
    return deleteResponse;
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
