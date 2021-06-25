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

class WooCart {
  WooCart({
    this.coupons,
    this.shippingRates,
    this.shippingAddress,
    this.items,
    this.itemsCount,
    this.itemsWeight,
    this.needsPayment,
    this.needsShipping,
    this.totals,
    this.errors,
  });

  List<dynamic>? coupons;
  List<dynamic>? shippingRates;
  Shipping? shippingAddress;
  List<WooCartItem>? items;
  int? itemsCount;
  int? itemsWeight;
  bool? needsPayment;
  bool? needsShipping;
  WooCartTotals? totals;
  List<dynamic>? errors;

  factory WooCart.fromJson(Map<String, dynamic> json) => WooCart(
        coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
        shippingRates: List<dynamic>.from(json["shipping_rates"].map((x) => x)),
        shippingAddress: Shipping.fromJson(json["shipping_address"]),
        items: List<WooCartItem>.from(json["items"].map((x) => WooCartItem.fromJson(x))),
        itemsCount: json["items_count"],
        itemsWeight: json["items_weight"],
        needsPayment: json["needs_payment"],
        needsShipping: json["needs_shipping"],
        totals: WooCartTotals.fromJson(json["totals"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "coupons": List<dynamic>.from(coupons!.map((x) => x)),
        "shipping_rates": shippingRates!.map((x) => x).toList(),
        "shipping_address": shippingAddress!.toJson(),
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
