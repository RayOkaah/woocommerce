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

class WooCartItem {
  WooCartItem({
    this.key,
    this.id,
    this.quantity,
    this.quantityLimit,
    this.name,
    this.shortDescription,
    this.description,
    this.sku,
    this.lowStockRemaining,
    this.backOrdersAllowed,
    this.showBackOrderBadge,
    this.soldIndividually,
    this.permalink,
    this.images,
    this.variation,
    this.prices,
    this.totals,
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
  bool? backOrdersAllowed;
  bool? showBackOrderBadge;
  bool? soldIndividually;
  String? permalink;
  List<WooCartImages>? images;
  List<dynamic>? variation;
  WooCartPrices? prices;
  WooCartItemTotals? totals;

  factory WooCartItem.fromJson(Map<String, dynamic> json) {
    List images = [];
    if (json["images"] is List) {
      images = json["images"];
    } else {
      for (int i = 1; i <= json["images"].length; i++) {
        images.add(json["images"]["$i"]);
      }
    }
    return WooCartItem(
      key: json["key"],
      id: json["id"],
      quantity: json["quantity"],
      quantityLimit: json["quantity_limit"],
      name: json["name"],
      shortDescription: json["short_description"],
      description: json["description"],
      sku: json["sku"],
      lowStockRemaining: json["low_stock_remaining"],
      backOrdersAllowed: json["backorders_allowed"],
      showBackOrderBadge: json["show_backorder_badge"],
      soldIndividually: json["sold_individually"],
      permalink: json["permalink"],
      images: List<WooCartImages>.from(images.map((x) => WooCartImages.fromJson(x))),
      variation: List<dynamic>.from(json["variation"].map((x) => x)),
      prices: WooCartPrices.fromJson(json["prices"]),
      totals: WooCartItemTotals.fromJson(json["totals"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "key": key,
        "id": id,
        "quantity": quantity,
        "quantity_limit": quantityLimit,
        "name": name,
        "short_description": shortDescription,
        "description": description,
        "sku": sku,
        "low_stock_remaining": lowStockRemaining,
        "backorders_allowed": backOrdersAllowed,
        "show_backorder_badge": showBackOrderBadge,
        "sold_individually": soldIndividually,
        "permalink": permalink,
        "images": images!.map((x) => x.toJson()).toList(),
        "variation": variation!.map((x) => x).toList(),
        "prices": prices!.toJson(),
        "totals": totals!.toJson(),
      };
}

class WooCartItemTotals {
  WooCartItemTotals({
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
    this.lineSubtotal,
    this.lineSubtotalTax,
    this.lineTotal,
    this.lineTotalTax,
  });

  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;
  String? lineSubtotal;
  String? lineSubtotalTax;
  String? lineTotal;
  String? lineTotalTax;

  factory WooCartItemTotals.fromJson(Map<String, dynamic> json) => WooCartItemTotals(
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
        lineSubtotal: json["line_subtotal"],
        lineSubtotalTax: json["line_subtotal_tax"],
        lineTotal: json["line_total"],
        lineTotalTax: json["line_total_tax"],
      );

  Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
        "line_subtotal": lineSubtotal,
        "line_subtotal_tax": lineSubtotalTax,
        "line_total": lineTotal,
        "line_total_tax": lineTotalTax,
      };
}

class WooCartImages {
  WooCartImages({
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

  factory WooCartImages.fromJson(Map<String, dynamic> json) => WooCartImages(
        id: json["id"],
        src: json["src"],
        thumbnail: json["thumbnail"],
        srcset: json["srcset"],
        sizes: json["sizes"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
        "thumbnail": thumbnail,
        "srcset": srcset,
        "sizes": sizes,
        "name": name,
        "alt": alt,
      };
}

class WooCartPrices {
  WooCartPrices({
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceRange,
    this.rawPrices,
  });

  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic priceRange;
  WooCartRawPrices? rawPrices;

  factory WooCartPrices.fromJson(Map<String, dynamic> json) => WooCartPrices(
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        priceRange: json["price_range"],
        rawPrices: WooCartRawPrices.fromJson(json["raw_prices"]),
      );

  Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "price_range": priceRange,
        "raw_prices": rawPrices!.toJson(),
      };
}

class WooCartRawPrices {
  WooCartRawPrices({
    this.precision,
    this.price,
    this.regularPrice,
    this.salePrice,
  });

  int? precision;
  String? price;
  String? regularPrice;
  String? salePrice;

  factory WooCartRawPrices.fromJson(Map<String, dynamic> json) => WooCartRawPrices(
        precision: json["precision"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
      );

  Map<String, dynamic> toJson() => {
        "precision": precision,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
      };
}

class WooCartTotals {
  WooCartTotals({
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
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
  });

  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;
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
  List<dynamic>? taxLines;

  factory WooCartTotals.fromJson(Map<String, dynamic> json) => WooCartTotals(
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
        totalItems: json["total_items"],
        totalItemsTax: json["total_items_tax"],
        totalFees: json["total_fees"],
        totalFeesTax: json["total_fees_tax"],
        totalDiscount: json["total_discount"],
        totalDiscountTax: json["total_discount_tax"],
        totalShipping: json["total_shipping"],
        totalShippingTax: json["total_shipping_tax"],
        totalPrice: json["total_price"],
        totalTax: json["total_tax"],
        taxLines: List<dynamic>.from(json["tax_lines"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
        "total_items": totalItems,
        "total_items_tax": totalItemsTax,
        "total_fees": totalFees,
        "total_fees_tax": totalFeesTax,
        "total_discount": totalDiscount,
        "total_discount_tax": totalDiscountTax,
        "total_shipping": totalShipping,
        "total_shipping_tax": totalShippingTax,
        "total_price": totalPrice,
        "total_tax": totalTax,
        "tax_lines": taxLines!.map((x) => x).toList(),
      };
}
