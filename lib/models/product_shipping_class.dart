

class WooProductShippingClass {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? count;
  WooProductShippingClassLinks? links;

  WooProductShippingClass(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.count,
      this.links});

  WooProductShippingClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    count = json['count'];
    links = json['_links'] != null
        ? new WooProductShippingClassLinks.fromJson(json['_links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['count'] = this.count;
    if (this.links != null) {
      data['_links'] = this.links!.toJson();
    }
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooProductShippingClassLinks {
  List<WooProductShippingClassSelf>? self;
  List<WooProductShippingClassCollection>? collection;

  WooProductShippingClassLinks({this.self, this.collection});

  WooProductShippingClassLinks.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self!.add(new WooProductShippingClassSelf.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection!.add(new WooProductShippingClassCollection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WooProductShippingClassSelf {
  String? href;

  WooProductShippingClassSelf({this.href});

  WooProductShippingClassSelf.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class WooProductShippingClassCollection {
  String? href;

  WooProductShippingClassCollection({this.href});

  WooProductShippingClassCollection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
