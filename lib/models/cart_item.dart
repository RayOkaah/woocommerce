

class WooCartItem {
  String? key;
  int? id;
  int? quantity;
  String? name;
  String? sku;
  String? permalink;
  List<WooCartItemImages>? images;
  String? price;
  String? linePrice;
  List<String>? variation;

  WooCartItem(
      {this.key,
      this.id,
      this.quantity,
      this.name,
      this.sku,
      this.permalink,
      this.images,
      this.price,
      this.linePrice,
      this.variation});

  WooCartItem.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
    quantity = json['quantity'];
    name = json['name'];
    sku = json['sku'];
    permalink = json['permalink'];
    if (json['images'] != null) {
      images = <WooCartItemImages>[];
      json['images'].forEach((v) {
        images!.add(new WooCartItemImages.fromJson(v));
      });
    }
    price = json['price'];
    linePrice = json['line_price'];
    variation = json['variation'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['permalink'] = this.permalink;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['line_price'] = this.linePrice;
    data['variation'] = this.variation;
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooCartItemImages {
  String? id;
  String? src;
  String? thumbnail;
  bool? srcset;
  String? sizes;
  String? name;
  String? alt;

  WooCartItemImages(
      {this.id,
      this.src,
      this.thumbnail,
      this.srcset,
      this.sizes,
      this.name,
      this.alt});

  WooCartItemImages.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    src = json['src'];
    thumbnail = json['thumbnail'];

    if (json['srcset'] is String) {
      srcset = bool.fromEnvironment(json['srcset']);
    } else {
      srcset = json['srcset'];
    }
    sizes = json['sizes'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['src'] = this.src;
    data['thumbnail'] = this.thumbnail;
    data['srcset'] = this.srcset;
    data['sizes'] = this.sizes;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}
