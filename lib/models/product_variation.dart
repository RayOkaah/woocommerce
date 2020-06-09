/*
 * BSD 3-Clause License

    Copyright (c) 2020, RAY OKAAH
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

class ProductVariation {
  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String description;
  String permalink;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  DateTime dateOnSaleFrom;
  DateTime dateOnSaleFromGmt;
  DateTime dateOnSaleTo;
  DateTime dateOnSaleToGmt;
  bool onSale;
  String status;
  bool purchasable;
  bool virtual;
  bool downloadable;
  List<Download> downloads;
  int downloadLimit;
  int downloadExpiry;
  String taxStatus;
  String taxClass;
  bool manageStock;
  int stockQuantity;
  String stockStatus;
  String backorders;
  bool backordersAllowed;
  bool backordered;
  List<Attribute> attributes;
  String weight;
  String shippingClass;
  int shippingClassId;
  int menuOrder;
  Dimension dimensions;
  List<MetaData> metaData;
  Image image;

  ProductVariation(
      this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.description,
      this.permalink,
      this.sku,
      this.price,
      this.attributes,
      this.regularPrice,
      this.salePrice,
      this.dateOnSaleFrom,
      this.dateOnSaleFromGmt,
      this.dateOnSaleTo,
      this.dateOnSaleToGmt,
      this.onSale,
      this.status,
      this.purchasable,
      this.virtual,
      this.downloadable,
      this.downloads,
      this.downloadLimit,
      this.downloadExpiry,
      this.taxStatus,
      this.taxClass,
      this.manageStock,
      this.stockQuantity,
      this.stockStatus,
      this.backorders,
      this.backordersAllowed,
      this.backordered,
      this.weight,
      this.shippingClass,
      this.shippingClassId,
      this.menuOrder,
      this.dimensions,
      this.metaData,
      this.image);

  ProductVariation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        permalink = json['permalink'],
        status = json['status'],
        description = json['description'],
        sku = json['sku'],
        price = json['price'],
        regularPrice = json['regular_price'],
        salePrice = json['sale_price'],
        onSale = json['on_sale'],
        purchasable = json['purchasable'],
        virtual = json['virtual'],
        downloadable = json['downloadable'],
        downloads = (json['downloads'] as List)
            .map((i) => Download.fromJson(i))
            .toList(),
        downloadLimit = json['download_limit'],
        downloadExpiry = json['download_expiry'],
        taxStatus = json['tax_status'],
        taxClass = json['tax_class'],
        manageStock = (json['manage_stock'] != null && json['manage_stock'] is bool) ? json['manage_stock'] : false,
        stockQuantity = json['stock_quantity'],
        stockStatus = json['stock_status'],
        backorders = json['backorders'],
        backordersAllowed = json['backorders_allowed'],
        backordered = json['backordered'],
        weight = json['weight'],
        dimensions = Dimension.fromJson(json['dimensions']),
        shippingClass = json['shipping_class'],
        shippingClassId = json['shipping_class_id'],
        menuOrder = json['menu_order'],
        attributes = (json['attributes'] as List)
            .map((i) => Attribute.fromJson(i))
            .toList(),
        metaData = (json['meta_data'] as List)
            .map((i) => MetaData.fromJson(i))
            .toList();
}

class MetaData {
  final int id;
  final String key;
  final String value;

  MetaData(this.id, this.key, this.value);

  MetaData.fromJson(Map<String, dynamic> json)
      : id = json['name'],
        key = json['email'],
        value = json['value'].toString();

  Map<String, dynamic> toJson() => {'id': id, 'key': key, 'value': value};
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category(this.id, this.name, this.slug);

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        slug = json['slug'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
      };
}

class Dimension {
  final String length;
  final String width;
  final String height;

  Dimension(this.length, this.height, this.width);

  Dimension.fromJson(Map<String, dynamic> json)
      : length = json['length'],
        width = json['width'],
        height = json['height'];

  Map<String, dynamic> toJson() =>
      {'length': length, 'width': width, 'height': height};
}

class Attribute {
  final int id;
  final String name;
  final String option;

  Attribute(this.id, this.name, this.option);

  Attribute.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        option = json['option'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'option': option,
      };
}

class Download {
  final String id;
  final String name;
  final String file;

  Download(this.id, this.name, this.file);

  Download.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        file = json['file'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'file': file,
      };
}

class Image {
  final int id;
  final DateTime dateCreated;
  final DateTime dateCreatedGMT;
  final DateTime dateModified;
  final DateTime dateModifiedGMT;
  final String src;
  final String name;
  final String alt;

  Image(this.id, this.src, this.name, this.alt, this.dateCreated,
      this.dateCreatedGMT, this.dateModified, this.dateModifiedGMT);

  Image.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        src = json['src'],
        name = json['name'],
        alt = json['alt'],
        dateCreated = DateTime.parse(json['date_created']),
        dateModifiedGMT = DateTime.parse(json['date_modified_gmt']),
        dateModified = DateTime.parse(json['date_modified']),
        dateCreatedGMT = DateTime.parse(json['date_created_gmt']);
}
