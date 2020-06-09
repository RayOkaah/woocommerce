class Product {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final String type;
  final String status;
  final bool featured;
  final String catalogVisibility;
  final String description;
  final String shortDescription;
  final String sku;
  final String price;
  final String regularPrice;
  final String salePrice;
  final String priceHtml;
  final bool onSale;
  final bool purchasable;
  final int totalSales;
  final bool virtual;
  final bool downloadable;
  final List<Download> downloads;
  final int downloadLimit;
  final int downloadExpiry;
  final String externalUrl;
  final String buttonText;
  final String taxStatus;
  final String taxClass;
  final bool manageStock;
  final int stockQuantity;
  final String stockStatus;
  final String backorders;
  final bool backordersAllowed;
  final bool backordered;
  final bool soldIndividually;
  final String weight;
  final Dimension dimensions;
  final bool shippingRequired;
  final bool shippingTaxable;
  final String shippingClass;
  final int shippingClassId;
  final bool reviewsAllowed;
  final String averageRating;
  final int ratingCount;
  final List<int> relatedIds;
  final List<int> upsellIds;
  final List<int> crossSellIds;
  final int parentId;
  final String purchaseNote;
  final List<Category> categories;
  final List<Tag> tags;
  final List<Image> images;
  final List<Attribute> attributes;
  final List<DefaultAttribute> defaultAttributes;
  final List<int> variations;
  final List<int> groupedProducts;
  final int menuOrder;
  final List<MetaData> metaData;

  Product(
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

  Product.fromJson(Map<String, dynamic> json)
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
            .map((i) => Download.fromJson(i))
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
        dimensions = Dimension.fromJson(json['dimensions']),
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
            .map((i) => Category.fromJson(i))
            .toList(),
        tags = (json['tags'] as List).map((i) => Tag.fromJson(i)).toList(),
        images =
            (json['images'] as List).map((i) => Image.fromJson(i)).toList(),
        attributes = (json['attributes'] as List)
            .map((i) => Attribute.fromJson(i))
            .toList(),
        defaultAttributes = (json['default_attributes'] as List)
            .map((i) => DefaultAttribute.fromJson(i))
            .toList(),
        variations = json['variations'].cast<int>(),
        groupedProducts = json['grouped_products'].cast<int>(),
        menuOrder = json['menu_order'],
        metaData = (json['meta_data'] as List)
            .map((i) => MetaData.fromJson(i))
            .toList();
  @override toString() => "{id: $id}, {name: $name}, {price: $price}, {status: $status}";
}

class Tag {
  final int id;
  final String name;
  final String slug;

  Tag(this.id, this.name, this.slug);

  Tag.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        slug = json['slug'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'slug': slug};
  @override toString() => 'Tag: $name';
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

class DefaultAttribute {
  final int id;
  final String name;
  final String option;

  DefaultAttribute(this.id, this.name, this.option);

  DefaultAttribute.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        option = json['option'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'option': option};
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
  final int position;
  final bool visible;
  final bool variation;
  final List<String> options;

  Attribute(this.id, this.name, this.position, this.visible, this.variation,
      this.options);

  Attribute.fromJson(Map<String, dynamic> json)
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
