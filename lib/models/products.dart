import 'package:flutter/foundation.dart';

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

import 'product_category.dart';

class WooProduct {
  final int? id;
  final String? name;
  final String? slug;
  final String? permalink;
  final String? type;
  final String? status;
  final bool? featured;
  final String? catalogVisibility;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final String? priceHtml;
  final bool? onSale;
  final bool? purchasable;
  final int? totalSales;
  final bool? virtual;
  final bool? downloadable;
  final List<WooProductDownload> downloads;
  final int? downloadLimit;
  final int? downloadExpiry;
  final String? externalUrl;
  final String? buttonText;
  final String? taxStatus;
  final String? taxClass;
  final bool? manageStock;
  final int? stockQuantity;
  final String? stockStatus;
  final String? backorders;
  final bool? backordersAllowed;
  final bool? backordered;
  final bool? soldIndividually;
  final String? weight;
  final WooProductDimension dimensions;
  final bool? shippingRequired;
  final bool? shippingTaxable;
  final String? shippingClass;
  final int? shippingClassId;
  final bool? reviewsAllowed;
  final String? averageRating;
  final int? ratingCount;
  final List<int>? relatedIds;
  final List<int>? upsellIds;
  final List<int>? crossSellIds;
  final int? parentId;
  final String? purchaseNote;
  final List<WooProductCategory> categories;
  final List<WooProductItemTag> tags;
  final List<WooProductImage> images;
  final List<WooProductItemAttribute> attributes;
  final List<WooProductDefaultAttribute> defaultAttributes;
  final List<int>? variations;
  final List<int>? groupedProducts;
  final int? menuOrder;
  final List<MetaData> metaData;

  WooProduct(
      this.id,
      this.name,
      this.slug,
      this.permalink,
      this.type,
      this.status,
      this.featured,
      this.catalogVisibility,
      this.description,
      this.shortDescription,
      this.sku,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.priceHtml,
      this.onSale,
      this.purchasable,
      this.totalSales,
      this.virtual,
      this.downloadable,
      this.downloads,
      this.downloadLimit,
      this.downloadExpiry,
      this.externalUrl,
      this.buttonText,
      this.taxStatus,
      this.taxClass,
      this.manageStock,
      this.stockQuantity,
      this.stockStatus,
      this.backorders,
      this.backordersAllowed,
      this.backordered,
      this.soldIndividually,
      this.weight,
      this.dimensions,
      this.shippingRequired,
      this.shippingTaxable,
      this.shippingClass,
      this.shippingClassId,
      this.reviewsAllowed,
      this.averageRating,
      this.ratingCount,
      this.relatedIds,
      this.upsellIds,
      this.crossSellIds,
      this.parentId,
      this.purchaseNote,
      this.categories,
      this.tags,
      this.images,
      this.attributes,
      this.defaultAttributes,
      this.variations,
      this.groupedProducts,
      this.menuOrder,
      this.metaData);

  WooProduct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        slug = json['slug'],
        permalink = json['permalink'],
        type = json['type'],
        status = json['status'],
        featured = json['featured'],
        catalogVisibility = json['catalog_visibility'],
        description = json['description'],
        shortDescription = json['short_description'],
        sku = json['sku'],
        price = json['price'],
        regularPrice = json['regular_price'],
        salePrice = json['sale_price'],
        priceHtml = json['price_html'],
        onSale = json['on_sale'],
        purchasable = json['purchasable'],
        totalSales = json['total_sales'],
        virtual = json['virtual'],
        downloadable = json['downloadable'],
        downloads = (json['downloads'] as List)
            .map((i) => WooProductDownload.fromJson(i))
            .toList(),
        downloadLimit = json['download_limit'],
        downloadExpiry = json['download_expiry'],
        externalUrl = json['external_url'],
        buttonText = json['button_text'],
        taxStatus = json['tax_status'],
        taxClass = json['tax_class'],
        manageStock = json['manage_stock'],
        stockQuantity = json['stock_quantity'],
        stockStatus = json['stock_status'],
        backorders = json['backorders'],
        backordersAllowed = json['backorders_allowed'],
        backordered = json['backordered'],
        soldIndividually = json['sold_individually'],
        weight = json['weight'],
        dimensions = WooProductDimension.fromJson(json['dimensions']),
        shippingRequired = json['shipping_required'],
        shippingTaxable = json['shipping_taxable'],
        shippingClass = json['shipping_class'],
        shippingClassId = json['shipping_class_id'],
        reviewsAllowed = json['reviews_allowed'],
        averageRating = json['average_rating'],
        ratingCount = json['rating_count'],
        relatedIds = json['related_ids'].cast<int>(),
        upsellIds = json['upsell_ids'].cast<int>(),
        crossSellIds = json['cross_sell_ids'].cast<int>(),
        parentId = json['parent_id'],
        purchaseNote = json['purchase_note'],
        categories = (json['categories'] as List)
            .map((i) => WooProductCategory.fromJson(i))
            .toList(),
        tags = (json['tags'] as List)
            .map((i) => WooProductItemTag.fromJson(i))
            .toList(),
        images = (json['images'] as List)
            .map((i) => WooProductImage.fromJson(i))
            .toList(),
        attributes = (json['attributes'] as List)
            .map((i) => WooProductItemAttribute.fromJson(i))
            .toList(),
        defaultAttributes = (json['default_attributes'] as List)
            .map((i) => WooProductDefaultAttribute.fromJson(i))
            .toList(),
        variations = json['variations'].cast<int>(),
        groupedProducts = json['grouped_products'].cast<int>(),
        menuOrder = json['menu_order'],
        metaData = (json['meta_data'] as List)
            .map((i) => MetaData.fromJson(i))
            .toList();

  @override
  toString() => "{id: $id}, {name: $name}, {price: $price}, {status: $status}";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WooProduct && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

class WooProductItemTag {
  final int? id;
  final String? name;
  final String? slug;

  WooProductItemTag(this.id, this.name, this.slug);

  WooProductItemTag.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        slug = json['slug'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'slug': slug};
  @override
  toString() => 'Tag: $name';
}

class MetaData {
  final int? id;
  final String? key;
  final String value;

  MetaData(this.id, this.key, this.value);

  MetaData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        key = json['key'],
        value = json['value'].toString();

  Map<String, dynamic> toJson() => {'id': id, 'key': key, 'value': value};
}

class WooProductDefaultAttribute {
  final int? id;
  final String? name;
  final String? option;

  WooProductDefaultAttribute(this.id, this.name, this.option);

  WooProductDefaultAttribute.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        option = json['option'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'option': option};
}

class WooProductImage {
  final int? id;
  final DateTime dateCreated;
  final DateTime dateCreatedGMT;
  final DateTime dateModified;
  final DateTime dateModifiedGMT;
  final String? src;
  final String? name;
  final String? alt;

  WooProductImage(this.id, this.src, this.name, this.alt, this.dateCreated,
      this.dateCreatedGMT, this.dateModified, this.dateModifiedGMT);

  WooProductImage.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        src = json['src'],
        name = json['name'],
        alt = json['alt'],
        dateCreated = DateTime.parse(json['date_created']),
        dateModifiedGMT = DateTime.parse(json['date_modified_gmt']),
        dateModified = DateTime.parse(json['date_modified']),
        dateCreatedGMT = DateTime.parse(json['date_created_gmt']);
}

///
/// class Category {
///  final int id;
/// final String name;
///   final String slug;

///   Category(this.id, this.name, this.slug);

///   Category.fromJson(Map<String, dynamic> json)
///       : id = json['id'],
///         name = json['name'],
///         slug = json['slug'];

///   Map<String, dynamic> toJson() => {
///         'id': id,
///         'name': name,
///         'slug': slug,
///       };
///   @override toString() => toJson().toString();
/// }
///

class WooProductDimension {
  final String? length;
  final String? width;
  final String? height;

  WooProductDimension(this.length, this.height, this.width);

  WooProductDimension.fromJson(Map<String, dynamic> json)
      : length = json['length'],
        width = json['width'],
        height = json['height'];

  Map<String, dynamic> toJson() =>
      {'length': length, 'width': width, 'height': height};
}

class WooProductItemAttribute {
  final int? id;
  final String? name;
  final int? position;
  final bool? visible;
  final bool? variation;
  final List<String>? options;

  WooProductItemAttribute(this.id, this.name, this.position, this.visible,
      this.variation, this.options);

  WooProductItemAttribute.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        position = json['position'],
        visible = json['visible'],
        variation = json['variation'],
        options = json['options'].cast<String>();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'position': position,
        'visible': visible,
        'variation': variation,
        'options': options,
      };
}

class WooProductDownload {
  final String? id;
  final String? name;
  final String? file;

  WooProductDownload(this.id, this.name, this.file);

  WooProductDownload.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        file = json['file'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'file': file,
      };
}
