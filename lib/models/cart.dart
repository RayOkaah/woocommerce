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

    List<dynamic> coupons;
    List<dynamic> shippingRates;
    ShippingAddress shippingAddress;
    List<WooCartItems> items;
    int itemsCount;
    int itemsWeight;
    bool needsPayment;
    bool needsShipping;
    WooCartTotals totals;
    List<dynamic> errors;

    factory WooCart.fromJson(Map<String, dynamic> json) => WooCart(
        coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
        shippingRates: List<dynamic>.from(json["shipping_rates"].map((x) => x)),
        shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
        items: List<WooCartItems>.from(json["items"].map((x) => WooCartItems.fromJson(x))),
        itemsCount: json["items_count"],
        itemsWeight: json["items_weight"],
        needsPayment: json["needs_payment"],
        needsShipping: json["needs_shipping"],
        totals: WooCartTotals.fromJson(json["totals"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "coupons": List<dynamic>.from(coupons.map((x) => x)),
        "shipping_rates": List<dynamic>.from(shippingRates.map((x) => x)),
        "shipping_address": shippingAddress.toJson(),
        "items": List<WooCartItems>.from(items.map((x) => x.toJson())),
        "items_count": itemsCount,
        "items_weight": itemsWeight,
        "needs_payment": needsPayment,
        "needs_shipping": needsShipping,
        "totals": totals.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
    };
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
        this.prices,
        this.totals,
    });

    String key;
    int id;
    int quantity;
    int quantityLimit;
    String name;
    String shortDescription;
    String description;
    String sku;
    dynamic lowStockRemaining;
    bool backordersAllowed;
    bool showBackorderBadge;
    bool soldIndividually;
    String permalink;
    List<Image> images;
    List<dynamic> variation;
    Prices prices;
    ItemTotals totals;

    factory WooCartItems.fromJson(Map<String, dynamic> json) => WooCartItems(
        key: json["key"],
        id: json["id"],
        quantity: json["quantity"],
        quantityLimit: json["quantity_limit"],
        name: json["name"],
        shortDescription: json["short_description"],
        description: json["description"],
        sku: json["sku"],
        lowStockRemaining: json["low_stock_remaining"],
        backordersAllowed: json["backorders_allowed"],
        showBackorderBadge: json["show_backorder_badge"],
        soldIndividually: json["sold_individually"],
        permalink: json["permalink"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        variation: List<dynamic>.from(json["variation"].map((x) => x)),
        prices: Prices.fromJson(json["prices"]),
        totals: ItemTotals.fromJson(json["totals"]),
    );

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
        "backorders_allowed": backordersAllowed,
        "show_backorder_badge": showBackorderBadge,
        "sold_individually": soldIndividually,
        "permalink": permalink,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "variation": List<dynamic>.from(variation.map((x) => x)),
        "prices": prices.toJson(),
        "totals": totals.toJson(),
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

    int id;
    String src;
    String thumbnail;
    String srcset;
    String sizes;
    String name;
    String alt;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
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

class Prices {
    Prices({
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

    String currencyCode;
    String currencySymbol;
    int currencyMinorUnit;
    String currencyDecimalSeparator;
    String currencyThousandSeparator;
    String currencyPrefix;
    String currencySuffix;
    String price;
    String regularPrice;
    String salePrice;
    dynamic priceRange;
    RawPrices rawPrices;

    factory Prices.fromJson(Map<String, dynamic> json) => Prices(
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
        rawPrices: RawPrices.fromJson(json["raw_prices"]),
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
        "raw_prices": rawPrices.toJson(),
    };
}

class RawPrices {
    RawPrices({
        this.precision,
        this.price,
        this.regularPrice,
        this.salePrice,
    });

    int precision;
    String price;
    String regularPrice;
    String salePrice;

    factory RawPrices.fromJson(Map<String, dynamic> json) => RawPrices(
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

class ItemTotals {
    ItemTotals({
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

    String currencyCode;
    String currencySymbol;
    int currencyMinorUnit;
    String currencyDecimalSeparator;
    String currencyThousandSeparator;
    String currencyPrefix;
    String currencySuffix;
    String lineSubtotal;
    String lineSubtotalTax;
    String lineTotal;
    String lineTotalTax;

    factory ItemTotals.fromJson(Map<String, dynamic> json) => ItemTotals(
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

class ShippingAddress {
    ShippingAddress({
        this.firstName,
        this.lastName,
        this.company,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.postcode,
        this.country,
    });

    String firstName;
    String lastName;
    String company;
    String address1;
    String address2;
    String city;
    String state;
    String postcode;
    String country;

    factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
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

    String currencyCode;
    String currencySymbol;
    int currencyMinorUnit;
    String currencyDecimalSeparator;
    String currencyThousandSeparator;
    String currencyPrefix;
    String currencySuffix;
    String totalItems;
    String totalItemsTax;
    String totalFees;
    String totalFeesTax;
    String totalDiscount;
    String totalDiscountTax;
    String totalShipping;
    String totalShippingTax;
    String totalPrice;
    String totalTax;
    List<dynamic> taxLines;

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
        "tax_lines": List<dynamic>.from(taxLines.map((x) => x)),
    };
}