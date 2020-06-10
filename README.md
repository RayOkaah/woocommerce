# woocommerce

Woocommerce SDK for Flutter.

## Getting Started
Add the package to your pubspec.yaml and import.

```dart
import 'package:woocommerce/woocommerce.dart';
```
Create an instance of WooCommerce for your project.
#### Example:

```dart
WooCommerce woocommerce = WooCommerce(
  baseUrl: yourBaseUrl,
  consumerKey: yourConsumerKey,
  consumerSecret: consumerSecret);
```
 For example  http://mywebsite.com or https://mywebsite.com or http://cs.mywebsite.com

 Parameter, [baseUrl] is the base url of your site. For example, http://me.com or https://me.com.

 Parameter [consumerKey] is the consumer key provided by WooCommerce, e.g. `ck_12abc34n56j`.

 Parameter [consumerSecret] is the consumer secret provided by WooCommerce, e.g. `cs_1uab8h3s3op`.

 Optional Parameter [apiPath] is the direct url from your baseUrl to your Woo commerce endpoint.
 An example : "/wp-json/wc/v3/"
 This is useful if only you changed your default Wordpress Woocommerce path, otherwise default applies.

  The goal of Woo Commerce SDK is to make building amazing Ecommerce apps with flutter and Woo Commerce as easy as can be,
  hope you it improves your workflow.

## Features.

- Customer / User Authentication.
- Cart Management.
- Order Management.
- Products management.
- Categories.
- Tags.
- Variations.
- Ability to filter on methods that returns a list.
- Supports custom endpoints.
- Shipping.
- Tax, TaxClasses.
- Etc and more.


## Notes.
 Install Wordpress [Jwt Token Plugin](https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/) and [Wp Rest User](https://en-nz.wordpress.org/plugins/wp-rest-user/), to be able to log in,

## Examples

### Login - Returns the access token on success.

```dart
final token = woocommerce.authenticateViaJWT(username: username, password: password);
```

### Login - Signs a user in and returns the logged in user's wordpress user object.

```dart
final user = woocommerce.loginUser(username: username, password: password);
```

### Get All Products - Returns list of product object, default is 10 per page, see Api reference for filter options.

```dart
final myProducts = await woocommerce.getProducts();
```

### Get All Featured Products - Returns a list of featured products, see Api reference for more filter options.

```dart
final myFeaturedProducts = await woocommerce.getProducts(featured: true);
```

### Get All Products marked with category id '22'.

```dart
final mySpecificProduct = await getProducts(category: '22');
```

### Add To Cart! - Returns the added cart item object(Accepts quantity, product id, and list of variations(id) of the product to be added).

```dart
final myCart = await woocommerce.addToCart(quantity: 2, id: 17);
```

### Create an Order. - Returns the created order object (Accepts an orderPayload object).

```dart
OrderPayload orderPayload = OrderPayload(customerId: customerId, setPaid=true);
final order = await woocommerce.CreateOrder(orderPayload);
```


This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

## Issues and FeedBack
You can create a Github issue if any and I'll try to fix it. Pull requests on both code and documentation are welcomed as well pls.
You can also send a mail to ray@flutterengineer.com.
For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
