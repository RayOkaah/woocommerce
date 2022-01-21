// To parse this JSON data, do
//
//     final wooCart = wooCartFromJson(jsonString);

import 'dart:convert';

WooCart wooCartFromJson(String str) => WooCart.fromJson(json.decode(str));

String wooCartToJson(WooCart data) => json.encode(data.toJson());

class WooCart {
  WooCart({
    this.coupons,
    this.shippingRates,
    this.shippingAddress,
    this.billingAddress,
    this.items,
    this.itemsCount,
    this.itemsWeight,
    this.needsPayment,
    this.needsShipping,
    this.hasCalculatedShipping,
    this.fees,
    this.totals,
    this.errors,
    this.paymentRequirements,
    this.extensions,
  });

  List<dynamic>? coupons;
  List<WooCartShippingRate>? shippingRates;
  IngAddress? shippingAddress;
  IngAddress? billingAddress;
  List<WooCartItems>? items;
  int? itemsCount;
  int? itemsWeight;
  bool? needsPayment;
  bool? needsShipping;
  bool? hasCalculatedShipping;
  List<dynamic>? fees;
  WooCartTotals? totals;
  List<dynamic>? errors;
  List<String>? paymentRequirements;
  Extensions? extensions;

  factory WooCart.fromJson(Map<String, dynamic> json) => WooCart(
        coupons: json["coupons"] == null
            ? null
            : List<dynamic>.from(json["coupons"].map((x) => x)),
        shippingRates: json["shipping_rates"] == null
            ? null
            : List<WooCartShippingRate>.from(json["shipping_rates"]
                .map((x) => WooCartShippingRate.fromJson(x))),
        shippingAddress: json["shipping_address"] == null
            ? null
            : IngAddress.fromJson(json["shipping_address"]),
        billingAddress: json["billing_address"] == null
            ? null
            : IngAddress.fromJson(json["billing_address"]),
        items: json["items"] == null
            ? null
            : List<WooCartItems>.from(
                json["items"].map((x) => WooCartItems.fromJson(x))),
        itemsCount: json["items_count"] == null ? null : json["items_count"],
        itemsWeight: json["items_weight"] == null ? null : json["items_weight"],
        needsPayment:
            json["needs_payment"] == null ? null : json["needs_payment"],
        needsShipping:
            json["needs_shipping"] == null ? null : json["needs_shipping"],
        hasCalculatedShipping: json["has_calculated_shipping"] == null
            ? null
            : json["has_calculated_shipping"],
        fees: json["fees"] == null
            ? null
            : List<dynamic>.from(json["fees"].map((x) => x)),
        totals: json["totals"] == null
            ? null
            : WooCartTotals.fromJson(json["totals"]),
        errors: json["errors"] == null
            ? null
            : List<dynamic>.from(json["errors"].map((x) => x)),
        paymentRequirements: json["payment_requirements"] == null
            ? null
            : List<String>.from(json["payment_requirements"].map((x) => x)),
        extensions: json["extensions"] == null
            ? null
            : Extensions.fromJson(json["extensions"]),
      );

  Map<String, dynamic> toJson() => {
        "coupons":
            coupons == null ? null : List<dynamic>.from(coupons!.map((x) => x)),
        "shipping_rates": shippingRates == null
            ? null
            : List<dynamic>.from(shippingRates!.map((x) => x.toJson())),
        "shipping_address":
            shippingAddress == null ? null : shippingAddress!.toJson(),
        "billing_address":
            billingAddress == null ? null : billingAddress!.toJson(),
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "items_count": itemsCount == null ? null : itemsCount,
        "items_weight": itemsWeight == null ? null : itemsWeight,
        "needs_payment": needsPayment == null ? null : needsPayment,
        "needs_shipping": needsShipping == null ? null : needsShipping,
        "has_calculated_shipping":
            hasCalculatedShipping == null ? null : hasCalculatedShipping,
        "fees": fees == null ? null : List<dynamic>.from(fees!.map((x) => x)),
        "totals": totals == null ? null : totals!.toJson(),
        "errors":
            errors == null ? null : List<dynamic>.from(errors!.map((x) => x)),
        "payment_requirements": paymentRequirements == null
            ? null
            : List<dynamic>.from(paymentRequirements!.map((x) => x)),
        "extensions": extensions == null ? null : extensions!.toJson(),
      };
}

class IngAddress {
  IngAddress({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? email;
  String? phone;

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        company: json["company"] == null ? null : json["company"],
        address1: json["address_1"] == null ? null : json["address_1"],
        address2: json["address_2"] == null ? null : json["address_2"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        country: json["country"] == null ? null : json["country"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "company": company == null ? null : company,
        "address_1": address1 == null ? null : address1,
        "address_2": address2 == null ? null : address2,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "postcode": postcode == null ? null : postcode,
        "country": country == null ? null : country,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
      };
}

class Extensions {
  Extensions();

  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions();

  Map<String, dynamic> toJson() => {};
}

class WooCartItems {
  WooCartItems({
    this.key,
    this.id,
    this.quantity,
    this.quantityLimit,
    this.name,
    this.shortDescription,
    this.description,
    this.sku,
    this.lowStockRemaining,
    this.backordersAllowed,
    this.showBackorderBadge,
    this.soldIndividually,
    this.permalink,
    this.images,
    this.variation,
    this.itemData,
    this.prices,
    this.totals,
    this.catalogVisibility,
    this.extensions,
  });

  String? key;
  int? id;
  int? quantity;
  int? quantityLimit;
  String? name;
  String? shortDescription;
  String? description;
  String? sku;
  dynamic? lowStockRemaining;
  bool? backordersAllowed;
  bool? showBackorderBadge;
  bool? soldIndividually;
  String? permalink;
  List<Image>? images;
  List<dynamic>? variation;
  List<dynamic>? itemData;
  Prices? prices;
  ItemTotals? totals;
  String? catalogVisibility;
  Extensions? extensions;

  factory WooCartItems.fromJson(Map<String, dynamic> json) => WooCartItems(
        key: json["key"] == null ? null : json["key"],
        id: json["id"] == null ? null : json["id"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        quantityLimit:
            json["quantity_limit"] == null ? null : json["quantity_limit"],
        name: json["name"] == null ? null : json["name"],
        shortDescription: json["short_description"] == null
            ? null
            : json["short_description"],
        description: json["description"] == null ? null : json["description"],
        sku: json["sku"] == null ? null : json["sku"],
        lowStockRemaining: json["low_stock_remaining"],
        backordersAllowed: json["backorders_allowed"] == null
            ? null
            : json["backorders_allowed"],
        showBackorderBadge: json["show_backorder_badge"] == null
            ? null
            : json["show_backorder_badge"],
        soldIndividually: json["sold_individually"] == null
            ? null
            : json["sold_individually"],
        permalink: json["permalink"] == null ? null : json["permalink"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        variation: json["variation"] == null
            ? null
            : List<dynamic>.from(json["variation"].map((x) => x)),
        itemData: json["item_data"] == null
            ? null
            : List<dynamic>.from(json["item_data"].map((x) => x)),
        prices: json["prices"] == null ? null : Prices.fromJson(json["prices"]),
        totals:
            json["totals"] == null ? null : ItemTotals.fromJson(json["totals"]),
        catalogVisibility: json["catalog_visibility"] == null
            ? null
            : json["catalog_visibility"],
        extensions: json["extensions"] == null
            ? null
            : Extensions.fromJson(json["extensions"]),
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "id": id == null ? null : id,
        "quantity": quantity == null ? null : quantity,
        "quantity_limit": quantityLimit == null ? null : quantityLimit,
        "name": name == null ? null : name,
        "short_description": shortDescription == null ? null : shortDescription,
        "description": description == null ? null : description,
        "sku": sku == null ? null : sku,
        "low_stock_remaining": lowStockRemaining,
        "backorders_allowed":
            backordersAllowed == null ? null : backordersAllowed,
        "show_backorder_badge":
            showBackorderBadge == null ? null : showBackorderBadge,
        "sold_individually": soldIndividually == null ? null : soldIndividually,
        "permalink": permalink == null ? null : permalink,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "variation": variation == null
            ? null
            : List<dynamic>.from(variation!.map((x) => x)),
        "item_data": itemData == null
            ? null
            : List<dynamic>.from(itemData!.map((x) => x)),
        "prices": prices == null ? null : prices!.toJson(),
        "totals": totals == null ? null : totals!.toJson(),
        "catalog_visibility":
            catalogVisibility == null ? null : catalogVisibility,
        "extensions": extensions == null ? null : extensions!.toJson(),
      };
}

class Image {
  Image({
    this.id,
    this.src,
    this.thumbnail,
    this.srcset,
    this.sizes,
    this.name,
    this.alt,
  });

  int? id;
  String? src;
  String? thumbnail;
  String? srcset;
  String? sizes;
  String? name;
  String? alt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] == null ? null : json["id"],
        src: json["src"] == null ? null : json["src"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        srcset: json["srcset"] == null ? null : json["srcset"],
        sizes: json["sizes"] == null ? null : json["sizes"],
        name: json["name"] == null ? null : json["name"],
        alt: json["alt"] == null ? null : json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "src": src == null ? null : src,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "srcset": srcset == null ? null : srcset,
        "sizes": sizes == null ? null : sizes,
        "name": name == null ? null : name,
        "alt": alt == null ? null : alt,
      };
}

class Prices {
  Prices({
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceRange,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
    this.rawPrices,
  });

  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic priceRange;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;
  RawPrices? rawPrices;

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        price: json["price"] == null ? null : json["price"],
        regularPrice:
            json["regular_price"] == null ? null : json["regular_price"],
        salePrice: json["sale_price"] == null ? null : json["sale_price"],
        priceRange: json["price_range"],
        currencyCode:
            json["currency_code"] == null ? null : json["currency_code"],
        currencySymbol:
            json["currency_symbol"] == null ? null : json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"] == null
            ? null
            : json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"] == null
            ? null
            : json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"] == null
            ? null
            : json["currency_thousand_separator"],
        currencyPrefix:
            json["currency_prefix"] == null ? null : json["currency_prefix"],
        currencySuffix:
            json["currency_suffix"] == null ? null : json["currency_suffix"],
        rawPrices: json["raw_prices"] == null
            ? null
            : RawPrices.fromJson(json["raw_prices"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? null : price,
        "regular_price": regularPrice == null ? null : regularPrice,
        "sale_price": salePrice == null ? null : salePrice,
        "price_range": priceRange,
        "currency_code": currencyCode == null ? null : currencyCode,
        "currency_symbol": currencySymbol == null ? null : currencySymbol,
        "currency_minor_unit":
            currencyMinorUnit == null ? null : currencyMinorUnit,
        "currency_decimal_separator":
            currencyDecimalSeparator == null ? null : currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator == null
            ? null
            : currencyThousandSeparator,
        "currency_prefix": currencyPrefix == null ? null : currencyPrefix,
        "currency_suffix": currencySuffix == null ? null : currencySuffix,
        "raw_prices": rawPrices == null ? null : rawPrices!.toJson(),
      };
}

class RawPrices {
  RawPrices({
    this.precision,
    this.price,
    this.regularPrice,
    this.salePrice,
  });

  int? precision;
  String? price;
  String? regularPrice;
  String? salePrice;

  factory RawPrices.fromJson(Map<String, dynamic> json) => RawPrices(
        precision: json["precision"] == null ? null : json["precision"],
        price: json["price"] == null ? null : json["price"],
        regularPrice:
            json["regular_price"] == null ? null : json["regular_price"],
        salePrice: json["sale_price"] == null ? null : json["sale_price"],
      );

  Map<String, dynamic> toJson() => {
        "precision": precision == null ? null : precision,
        "price": price == null ? null : price,
        "regular_price": regularPrice == null ? null : regularPrice,
        "sale_price": salePrice == null ? null : salePrice,
      };
}

class ItemTotals {
  ItemTotals({
    this.lineSubtotal,
    this.lineSubtotalTax,
    this.lineTotal,
    this.lineTotalTax,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  String? lineSubtotal;
  String? lineSubtotalTax;
  String? lineTotal;
  String? lineTotalTax;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  factory ItemTotals.fromJson(Map<String, dynamic> json) => ItemTotals(
        lineSubtotal:
            json["line_subtotal"] == null ? null : json["line_subtotal"],
        lineSubtotalTax: json["line_subtotal_tax"] == null
            ? null
            : json["line_subtotal_tax"],
        lineTotal: json["line_total"] == null ? null : json["line_total"],
        lineTotalTax:
            json["line_total_tax"] == null ? null : json["line_total_tax"],
        currencyCode:
            json["currency_code"] == null ? null : json["currency_code"],
        currencySymbol:
            json["currency_symbol"] == null ? null : json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"] == null
            ? null
            : json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"] == null
            ? null
            : json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"] == null
            ? null
            : json["currency_thousand_separator"],
        currencyPrefix:
            json["currency_prefix"] == null ? null : json["currency_prefix"],
        currencySuffix:
            json["currency_suffix"] == null ? null : json["currency_suffix"],
      );

  Map<String, dynamic> toJson() => {
        "line_subtotal": lineSubtotal == null ? null : lineSubtotal,
        "line_subtotal_tax": lineSubtotalTax == null ? null : lineSubtotalTax,
        "line_total": lineTotal == null ? null : lineTotal,
        "line_total_tax": lineTotalTax == null ? null : lineTotalTax,
        "currency_code": currencyCode == null ? null : currencyCode,
        "currency_symbol": currencySymbol == null ? null : currencySymbol,
        "currency_minor_unit":
            currencyMinorUnit == null ? null : currencyMinorUnit,
        "currency_decimal_separator":
            currencyDecimalSeparator == null ? null : currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator == null
            ? null
            : currencyThousandSeparator,
        "currency_prefix": currencyPrefix == null ? null : currencyPrefix,
        "currency_suffix": currencySuffix == null ? null : currencySuffix,
      };
}

class WooCartShippingRate {
  WooCartShippingRate({
    this.packageId,
    this.name,
    this.destination,
    this.items,
    this.shippingRates,
  });

  int? packageId;
  String? name;
  Destination? destination;
  List<ShippingRateItem>? items;
  List<ShippingRateShippingRate>? shippingRates;

  factory WooCartShippingRate.fromJson(Map<String, dynamic> json) =>
      WooCartShippingRate(
        packageId: json["package_id"] == null ? null : json["package_id"],
        name: json["name"] == null ? null : json["name"],
        destination: json["destination"] == null
            ? null
            : Destination.fromJson(json["destination"]),
        items: json["items"] == null
            ? null
            : List<ShippingRateItem>.from(
                json["items"].map((x) => ShippingRateItem.fromJson(x))),
        shippingRates: json["shipping_rates"] == null
            ? null
            : List<ShippingRateShippingRate>.from(json["shipping_rates"]
                .map((x) => ShippingRateShippingRate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "package_id": packageId == null ? null : packageId,
        "name": name == null ? null : name,
        "destination": destination == null ? null : destination!.toJson(),
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "shipping_rates": shippingRates == null
            ? null
            : List<dynamic>.from(shippingRates!.map((x) => x.toJson())),
      };
}

class Destination {
  Destination({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        address1: json["address_1"] == null ? null : json["address_1"],
        address2: json["address_2"] == null ? null : json["address_2"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        country: json["country"] == null ? null : json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address_1": address1 == null ? null : address1,
        "address_2": address2 == null ? null : address2,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "postcode": postcode == null ? null : postcode,
        "country": country == null ? null : country,
      };
}

class ShippingRateItem {
  ShippingRateItem({
    this.key,
    this.name,
    this.quantity,
  });

  String? key;
  String? name;
  String? quantity;

  factory ShippingRateItem.fromJson(Map<String, dynamic> json) =>
      ShippingRateItem(
        key: json["key"] == null ? null : json["key"],
        name: json["name"] == null ? null : json["name"],
        quantity: json["quantity"] == null ? null : json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "name": name == null ? null : name,
        "quantity": quantity == null ? null : quantity,
      };
}

class ShippingRateShippingRate {
  ShippingRateShippingRate({
    this.rateId,
    this.name,
    this.description,
    this.deliveryTime,
    this.price,
    this.taxes,
    this.instanceId,
    this.methodId,
    this.metaData,
    this.selected,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  String? rateId;
  String? name;
  String? description;
  String? deliveryTime;
  String? price;
  String? taxes;
  int? instanceId;
  String? methodId;
  List<MetaDatum>? metaData;
  bool? selected;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  factory ShippingRateShippingRate.fromJson(Map<String, dynamic> json) =>
      ShippingRateShippingRate(
        rateId: json["rate_id"] == null ? null : json["rate_id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        deliveryTime:
            json["delivery_time"] == null ? null : json["delivery_time"],
        price: json["price"] == null ? null : json["price"],
        taxes: json["taxes"] == null ? null : json["taxes"],
        instanceId: json["instance_id"] == null ? null : json["instance_id"],
        methodId: json["method_id"] == null ? null : json["method_id"],
        metaData: json["meta_data"] == null
            ? null
            : List<MetaDatum>.from(
                json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        selected: json["selected"] == null ? null : json["selected"],
        currencyCode:
            json["currency_code"] == null ? null : json["currency_code"],
        currencySymbol:
            json["currency_symbol"] == null ? null : json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"] == null
            ? null
            : json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"] == null
            ? null
            : json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"] == null
            ? null
            : json["currency_thousand_separator"],
        currencyPrefix:
            json["currency_prefix"] == null ? null : json["currency_prefix"],
        currencySuffix:
            json["currency_suffix"] == null ? null : json["currency_suffix"],
      );

  Map<String, dynamic> toJson() => {
        "rate_id": rateId == null ? null : rateId,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "delivery_time": deliveryTime == null ? null : deliveryTime,
        "price": price == null ? null : price,
        "taxes": taxes == null ? null : taxes,
        "instance_id": instanceId == null ? null : instanceId,
        "method_id": methodId == null ? null : methodId,
        "meta_data": metaData == null
            ? null
            : List<dynamic>.from(metaData!.map((x) => x.toJson())),
        "selected": selected == null ? null : selected,
        "currency_code": currencyCode == null ? null : currencyCode,
        "currency_symbol": currencySymbol == null ? null : currencySymbol,
        "currency_minor_unit":
            currencyMinorUnit == null ? null : currencyMinorUnit,
        "currency_decimal_separator":
            currencyDecimalSeparator == null ? null : currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator == null
            ? null
            : currencyThousandSeparator,
        "currency_prefix": currencyPrefix == null ? null : currencyPrefix,
        "currency_suffix": currencySuffix == null ? null : currencySuffix,
      };
}

class MetaDatum {
  MetaDatum({
    this.key,
    this.value,
  });

  String? key;
  dynamic value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        key: json["key"] == null ? null : json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "value": value,
      };
}

class ValueClass {
  ValueClass({
    this.woocommerceMethodInstanceId,
    this.id,
    this.idForShipping,
    this.methodTitle,
    this.methodDescription,
    this.methodFreeShipping,
    this.methodFreeShippingLabel,
    this.methodCalculationMethod,
    this.methodVisibility,
    this.methodDefault,
    this.methodEnabled,
    this.methodIntegration,
    this.methodRules,
    this.taxStatus,
  });

  String? woocommerceMethodInstanceId;
  String? id;
  String? idForShipping;
  String? methodTitle;
  String? methodDescription;
  String? methodFreeShipping;
  String? methodFreeShippingLabel;
  String? methodCalculationMethod;
  String? methodVisibility;
  String? methodDefault;
  String? methodEnabled;
  String? methodIntegration;
  Map<String, MethodRule>? methodRules;
  String? taxStatus;

  factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
        woocommerceMethodInstanceId:
            json["woocommerce_method_instance_id"] == null
                ? null
                : json["woocommerce_method_instance_id"],
        id: json["id"] == null ? null : json["id"],
        idForShipping:
            json["id_for_shipping"] == null ? null : json["id_for_shipping"],
        methodTitle: json["method_title"] == null ? null : json["method_title"],
        methodDescription: json["method_description"] == null
            ? null
            : json["method_description"],
        methodFreeShipping: json["method_free_shipping"] == null
            ? null
            : json["method_free_shipping"],
        methodFreeShippingLabel: json["method_free_shipping_label"] == null
            ? null
            : json["method_free_shipping_label"],
        methodCalculationMethod: json["method_calculation_method"] == null
            ? null
            : json["method_calculation_method"],
        methodVisibility: json["method_visibility"] == null
            ? null
            : json["method_visibility"],
        methodDefault:
            json["method_default"] == null ? null : json["method_default"],
        methodEnabled:
            json["method_enabled"] == null ? null : json["method_enabled"],
        methodIntegration: json["method_integration"] == null
            ? null
            : json["method_integration"],
        methodRules: json["method_rules"] == null
            ? null
            : Map.from(json["method_rules"]).map((k, v) =>
                MapEntry<String, MethodRule>(k, MethodRule.fromJson(v))),
        taxStatus: json["tax_status"] == null ? null : json["tax_status"],
      );

  Map<String, dynamic> toJson() => {
        "woocommerce_method_instance_id": woocommerceMethodInstanceId == null
            ? null
            : woocommerceMethodInstanceId,
        "id": id == null ? null : id,
        "id_for_shipping": idForShipping == null ? null : idForShipping,
        "method_title": methodTitle == null ? null : methodTitle,
        "method_description":
            methodDescription == null ? null : methodDescription,
        "method_free_shipping":
            methodFreeShipping == null ? null : methodFreeShipping,
        "method_free_shipping_label":
            methodFreeShippingLabel == null ? null : methodFreeShippingLabel,
        "method_calculation_method":
            methodCalculationMethod == null ? null : methodCalculationMethod,
        "method_visibility": methodVisibility == null ? null : methodVisibility,
        "method_default": methodDefault == null ? null : methodDefault,
        "method_enabled": methodEnabled == null ? null : methodEnabled,
        "method_integration":
            methodIntegration == null ? null : methodIntegration,
        "method_rules": methodRules == null
            ? null
            : Map.from(methodRules!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "tax_status": taxStatus == null ? null : taxStatus,
      };
}

class MethodRule {
  MethodRule({
    this.basedOn,
    this.min,
    this.max,
    this.costPerOrder,
  });

  String? basedOn;
  String? min;
  String? max;
  String? costPerOrder;

  factory MethodRule.fromJson(Map<String, dynamic> json) => MethodRule(
        basedOn: json["based_on"] == null ? null : json["based_on"],
        min: json["min"] == null ? null : json["min"],
        max: json["max"] == null ? null : json["max"],
        costPerOrder:
            json["cost_per_order"] == null ? null : json["cost_per_order"],
      );

  Map<String, dynamic> toJson() => {
        "based_on": basedOn == null ? null : basedOn,
        "min": min == null ? null : min,
        "max": max == null ? null : max,
        "cost_per_order": costPerOrder == null ? null : costPerOrder,
      };
}

class WooCartTotals {
  WooCartTotals({
    this.totalItems,
    this.totalItemsTax,
    this.totalFees,
    this.totalFeesTax,
    this.totalDiscount,
    this.totalDiscountTax,
    this.totalShipping,
    this.totalShippingTax,
    this.totalPrice,
    this.totalTax,
    this.taxLines,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  String? totalItems;
  String? totalItemsTax;
  String? totalFees;
  String? totalFeesTax;
  String? totalDiscount;
  String? totalDiscountTax;
  String? totalShipping;
  String? totalShippingTax;
  String? totalPrice;
  String? totalTax;
  List<TaxLine>? taxLines;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  factory WooCartTotals.fromJson(Map<String, dynamic> json) => WooCartTotals(
        totalItems: json["total_items"] == null ? null : json["total_items"],
        totalItemsTax:
            json["total_items_tax"] == null ? null : json["total_items_tax"],
        totalFees: json["total_fees"] == null ? null : json["total_fees"],
        totalFeesTax:
            json["total_fees_tax"] == null ? null : json["total_fees_tax"],
        totalDiscount:
            json["total_discount"] == null ? null : json["total_discount"],
        totalDiscountTax: json["total_discount_tax"] == null
            ? null
            : json["total_discount_tax"],
        totalShipping:
            json["total_shipping"] == null ? null : json["total_shipping"],
        totalShippingTax: json["total_shipping_tax"] == null
            ? null
            : json["total_shipping_tax"],
        totalPrice: json["total_price"] == null ? null : json["total_price"],
        totalTax: json["total_tax"] == null ? null : json["total_tax"],
        taxLines: json["tax_lines"] == null
            ? null
            : List<TaxLine>.from(
                json["tax_lines"].map((x) => TaxLine.fromJson(x))),
        currencyCode:
            json["currency_code"] == null ? null : json["currency_code"],
        currencySymbol:
            json["currency_symbol"] == null ? null : json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"] == null
            ? null
            : json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"] == null
            ? null
            : json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"] == null
            ? null
            : json["currency_thousand_separator"],
        currencyPrefix:
            json["currency_prefix"] == null ? null : json["currency_prefix"],
        currencySuffix:
            json["currency_suffix"] == null ? null : json["currency_suffix"],
      );

  Map<String, dynamic> toJson() => {
        "total_items": totalItems == null ? null : totalItems,
        "total_items_tax": totalItemsTax == null ? null : totalItemsTax,
        "total_fees": totalFees == null ? null : totalFees,
        "total_fees_tax": totalFeesTax == null ? null : totalFeesTax,
        "total_discount": totalDiscount == null ? null : totalDiscount,
        "total_discount_tax":
            totalDiscountTax == null ? null : totalDiscountTax,
        "total_shipping": totalShipping == null ? null : totalShipping,
        "total_shipping_tax":
            totalShippingTax == null ? null : totalShippingTax,
        "total_price": totalPrice == null ? null : totalPrice,
        "total_tax": totalTax == null ? null : totalTax,
        "tax_lines": taxLines == null
            ? null
            : List<dynamic>.from(taxLines!.map((x) => x.toJson())),
        "currency_code": currencyCode == null ? null : currencyCode,
        "currency_symbol": currencySymbol == null ? null : currencySymbol,
        "currency_minor_unit":
            currencyMinorUnit == null ? null : currencyMinorUnit,
        "currency_decimal_separator":
            currencyDecimalSeparator == null ? null : currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator == null
            ? null
            : currencyThousandSeparator,
        "currency_prefix": currencyPrefix == null ? null : currencyPrefix,
        "currency_suffix": currencySuffix == null ? null : currencySuffix,
      };
}

class TaxLine {
  TaxLine({
    this.name,
    this.price,
    this.rate,
  });

  String? name;
  String? price;
  String? rate;

  factory TaxLine.fromJson(Map<String, dynamic> json) => TaxLine(
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        rate: json["rate"] == null ? null : json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "rate": rate == null ? null : rate,
      };
}
