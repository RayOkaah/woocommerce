class ShippingZoneLocation {
  String code;
  String type;
  Links links;

  ShippingZoneLocation({this.code, this.type, this.links});

  ShippingZoneLocation.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    links = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['type'] = this.type;
    if (this.links != null) {
      data['_links'] = this.links.toJson();
    }
    return data;
  }
  @override toString() => this.toJson().toString();
}

class Links {
  List<Collection> collection;
  List<Describes> describes;

  Links({this.collection, this.describes});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['collection'] != null) {
      collection = new List<Collection>();
      json['collection'].forEach((v) {
        collection.add(new Collection.fromJson(v));
      });
    }
    if (json['describes'] != null) {
      describes = new List<Describes>();
      json['describes'].forEach((v) {
        describes.add(new Describes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v.toJson()).toList();
    }
    if (this.describes != null) {
      data['describes'] = this.describes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collection {
  String href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Describes {
  String href;

  Describes({this.href});

  Describes.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
