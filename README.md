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

 Parameter, [baseUrl] is the base url of your site. For example, http://me.com, https://me.com or http://my.me.com

 Parameter [consumerKey] is the consumer key provided by WooCommerce, e.g. `ck_12abc34n56j`.

 Parameter [consumerSecret] is the consumer secret provided by WooCommerce, e.g. `cs_1uab8h3s3op`.

 Optional Parameter [apiPath] is the direct url from your baseUrl to your Woo commerce endpoint.
 An example : "/wp-json/wc/v3/"
 This is useful if only you changed your default Wordpress Woocommerce path, otherwise default applies.

 Optional Parameter [isDebug], tells the library if it should print to debug logs.
  /// Useful if you are debuging or in development.

  The goal of Woo Commerce SDK is to make building amazing Ecommerce apps with flutter and Woo Commerce as easy as can be,
  hope it improves your workflow.


## Features.

- User Authentication.
- Customer Management
- Cart Management.
- Order Management.
- Products management.
- Categories.
- Tags.
- Variations.
- Ability to filter on methods that returns a list.
- Supports custom endpoints.
- Shipping, Shipping methods, Shipping Locations.
- Payment.
- Tax, TaxClasses.
- Etc and more.


## Notes.
 Install [Jwt Token Plugin](https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/) and [Wp Rest User](https://en-nz.wordpress.org/plugins/wp-rest-user/), to be able to log in,

## Examples

Put your credentials into the example app for a quick demo.



<img src="https://github.com/RayOkaah/woocommerce/blob/master/example/woocommerce-ios-demo.gif" width="30%">.


### Auth

```dart
//Login - Returns the access token on success.

final token = woocommerce.authenticateViaJWT(username: username, password: password);

// Login - Signs a user in and returns the logged in user's (WooUser object) details.

final user = woocommerce.loginUser(username: username, password: password);

/// Create Account
// Recommended, create a new Wordpress user and returns whether action was successful or not using WP Rest User Wordpress plugin.
Woouser user = WooUser(username: username, password: password, email: email);
bool result = woocommerce.registerNewUser(user);

// Creates a new Woocommerce customer and returns the WooCustomer object.
WooCustomer user = WooCustomer(username: username, password: password, email: email);
final result = woocommerce.createCustomer();

// Return current loggedIn user (WooUser object).

final user = woocommerce.fetchLoggedInUser();

```
 ### Products [see SDK reference](https://pub.dev/documentation/woocommerce/latest/models_products/Product-class.html) for filter options.

```dart
// Get All Products - Returns list of product object, default is 10 per page.

final myProducts = await woocommerce.getProducts();

//Get All Featured Products - Returns a list of featured products, see Api reference for more filter options.

final myFeaturedProducts = await woocommerce.getProducts(featured: true);

// Get All Products marked with category id '22'.

final mySpecificProduct = await getProducts(category: '22');
```

### Cart!


```dart
// Add To Cart! - Returns the added cart item object(Accepts quantity, product id, and list of variations(id) of the product to be added)

final myCart = await woocommerce.addToCart(quantity: 2, id: 17);

// Create an Order. - Returns the created order object (Accepts an orderPayload object).

OrderPayload orderPayload = OrderPayload(customerId: customerId, setPaid=true);
final order = await woocommerce.CreateOrder(orderPayload);

```

### Custom Requests - Make your custom authenticated requests to the Woocommerce api.

```dart
final response = await woocommerce.put(endpoint, data);

final anotherResponse = await woocommerce.get(endpoint);
```

## Updates

- [x] Add documentation.
- [ ] Add more search filter abilities.
- [ ] Multiple Examples.

## WooCommerce SDK Documentation Reference
[WooCommerce SDK Docs] (https://pub.dev/documentation/woocommerce/latest/)

## WooCommerce Api Documentation Reference
[WooCommerce Docs] (https://woocommerce.github.io/woocommerce-rest-api-docs/)

## Issues and FeedBack
If you find this useful :blue_heart:, feel free to click :star:
You can create a Github issue anytime. Pull requests on both code and documentation are welcomed as well pls :heart_eyes:.
You can also send a mail to ray@flutterengineer.com.

For help getting started with Flutter, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
