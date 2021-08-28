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

import 'package:woocommerce/models/customer.dart';

import 'cart_item.dart';
import 'shipping_rates.dart';

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
    this.totals,
    this.errors,
  });

  List<WooCartCoupon>? coupons;
  List<ShippingRates>? shippingRates;
  Shipping? shippingAddress;
  Billing? billingAddress;
  List<WooCartItem>? items;
  int? itemsCount;
  int? itemsWeight;
  bool? needsPayment;
  bool? needsShipping;
  WooCartTotals? totals;
  List<dynamic>? errors;

  factory WooCart.fromJson(Map<String, dynamic> json) => WooCart(
        coupons: List<WooCartCoupon>.from(json["coupons"].map((x) => WooCartCoupon.fromJson(x))),
        shippingRates: List<ShippingRates>.from(json["shipping_rates"].map((x) => ShippingRates.fromJson(x))),
        shippingAddress: Shipping.fromJson(json["shipping_address"]),
        billingAddress: Billing.fromJson(json["billing_address"]),
        items: List<WooCartItem>.from(json["items"].map((x) => WooCartItem.fromJson(x))),
        itemsCount: json["items_count"],
        itemsWeight: json["items_weight"],
        needsPayment: json["needs_payment"],
        needsShipping: json["needs_shipping"],
        totals: WooCartTotals.fromJson(json["totals"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "coupons": coupons!.map((x) => x.toJson()).toList(),
        "shipping_rates": shippingRates!.map((x) => x.toJson()).toList(),
        "shipping_address": shippingAddress!.toJson(),
        "billing_address": billingAddress!.toJson(),
        "items": items!.map((x) => x.toJson()).toList(),
        "items_count": itemsCount,
        "items_weight": itemsWeight,
        "needs_payment": needsPayment,
        "needs_shipping": needsShipping,
        "totals": totals!.toJson(),
        "errors": List<dynamic>.from(errors!.map((x) => x)),
      };

  @override
  toString() => this.toJson().toString();
}

class WooCartCoupon {
  String? code;
  String? discountType;
  WooCartCouponTotals? totals;

  WooCartCoupon({
    this.code,
    this.discountType,
    this.totals,
  });

  factory WooCartCoupon.fromJson(Map<String, dynamic> json) => WooCartCoupon(
        code: json['code'],
        discountType: json['discount_type'],
        totals: WooCartCouponTotals.fromJson(json['totals']),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'discount_type': discountType,
        'totals': totals!.toJson(),
      };
}

class WooCartCouponTotals {
  String? totalDiscount;
  String? totalDiscountTax;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  WooCartCouponTotals({
    this.totalDiscount,
    this.totalDiscountTax,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  factory WooCartCouponTotals.fromJson(Map<String, dynamic> json) => WooCartCouponTotals(
        totalDiscount: json['total_discount'],
        totalDiscountTax: json['total_discount_tax'],
        currencyCode: json['currency_code'],
        currencySymbol: json['currency_symbol'],
        currencyMinorUnit: json['currency_minor_unit'],
        currencyDecimalSeparator: json['currency_decimal_separator'],
        currencyThousandSeparator: json['currency_thousand_separator'],
        currencyPrefix: json['currency_prefix'],
        currencySuffix: json['currency_suffix'],
      );

  Map<String, dynamic> toJson() => {
        'total_discount': totalDiscount,
        'total_discount_tax': totalDiscountTax,
        'currency_code': currencyCode,
        'currency_symbol': currencySymbol,
        'currency_minor_unit': currencyMinorUnit,
        'currency_decimal_separator': currencyDecimalSeparator,
        'currency_thousand_separator': currencyThousandSeparator,
        'currency_prefix': currencyPrefix,
        'currency_suffix': currencySuffix,
      };
}
