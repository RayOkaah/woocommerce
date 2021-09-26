class ShippingRates {
  int? packageId;
  String? name;
  dynamic destination, items;
  List<ShippingMethodRates>? shippingRates;

  ShippingRates({
    this.packageId,
    this.name,
    this.destination,
    this.items,
    this.shippingRates,
  });

  factory ShippingRates.fromJson(Map<String, dynamic> json) => ShippingRates(
        packageId: json['package_id'],
        name: json['name'],
        destination: json['destination'],
        items: json['items'],
        shippingRates: List<ShippingMethodRates>.from(json['shipping_rates']!.map((x) => ShippingMethodRates.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'package_id': packageId,
        'name': name,
        'destination': destination,
        'items': items,
        'shipping_rates': shippingRates!.map((x) => x.toJson()).toList(),
      };
}

class ShippingMethodRates {
  String? rateId;
  String? name;
  String? description;
  String? deliveryTime;
  String? price;
  String? taxes;
  int? instanceId;
  String? methodId;
  dynamic metaData;
  bool? selected;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  ShippingMethodRates({
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

  factory ShippingMethodRates.fromJson(Map<String, dynamic> json) => ShippingMethodRates(
        rateId: json['rate_id'],
        name: json['name'],
        description: json['description'],
        deliveryTime: json['delivery_time'],
        price: json['price'].toString(),
        taxes: json['taxes'],
        instanceId: json['instance_id'],
        methodId: json['method_id'],
        metaData: json['meta_data'],
        selected: json['selected'],
        currencyCode: json['currency_code'],
        currencySymbol: json['currency_symbol'],
        currencyMinorUnit: json['currency_minor_unit'],
        currencyDecimalSeparator: json['currency_decimal_separator'],
        currencyThousandSeparator: json['currency_thousand_separator'],
        currencyPrefix: json['currency_prefix'],
        currencySuffix: json['currency_suffix'],
      );

  Map<String, dynamic> toJson() => {
        'rate_id': rateId,
        'name': name,
        'description': description,
        'delivery_time': deliveryTime,
        'price': price,
        'taxes': taxes,
        'instance_id': instanceId,
        'method_id': methodId,
        'meta_data': metaData,
        'selected': selected,
        'currency_code': currencyCode,
        'currency_symbol': currencySymbol,
        'currency_minor_unit': currencyMinorUnit,
        'currency_decimal_separator': currencyDecimalSeparator,
        'currency_thousand_separator': currencyThousandSeparator,
        'currency_prefix': currencyPrefix,
        'currency_suffix': currencySuffix,
      };
}
