

class WooTaxClass {
  String? slug;
  String? name;
  WooTaxClassLinks? links;

  WooTaxClass({this.slug, this.name, this.links});

  WooTaxClass.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    links = json['_links'] != null
        ? new WooTaxClassLinks.fromJson(json['_links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    if (this.links != null) {
      data['_links'] = this.links!.toJson();
    }
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooTaxClassLinks {
  List<WooTaxClassCollection>? collection;

  WooTaxClassLinks({this.collection});

  WooTaxClassLinks.fromJson(Map<String, dynamic> json) {
    if (json['collection'] != null) {
      collection = <WooTaxClassCollection>[];
      json['collection'].forEach((v) {
        collection!.add(new WooTaxClassCollection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WooTaxClassCollection {
  String? href;

  WooTaxClassCollection({this.href});

  WooTaxClassCollection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
