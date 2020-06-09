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
