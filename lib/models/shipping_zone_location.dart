

class WooShippingZoneLocation {
  String? code;
  String? type;
  WooShippingZoneLocationLinks? links;

  WooShippingZoneLocation({this.code, this.type, this.links});

  WooShippingZoneLocation.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    links = json['_links'] != null
        ? new WooShippingZoneLocationLinks.fromJson(json['_links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['type'] = this.type;
    if (this.links != null) {
      data['_links'] = this.links!.toJson();
    }
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooShippingZoneLocationLinks {
  List<WooShippingZoneLocationCollection>? collection;
  List<WooShippingZoneLocationDescribes>? describes;

  WooShippingZoneLocationLinks({this.collection, this.describes});

  WooShippingZoneLocationLinks.fromJson(Map<String, dynamic> json) {
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection!.add(new WooShippingZoneLocationCollection.fromJson(v));
      });
    }
    if (json['describes'] != null) {
      describes = [];
      json['describes'].forEach((v) {
        describes!.add(new WooShippingZoneLocationDescribes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    if (this.describes != null) {
      data['describes'] = this.describes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WooShippingZoneLocationCollection {
  String? href;

  WooShippingZoneLocationCollection({this.href});

  WooShippingZoneLocationCollection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class WooShippingZoneLocationDescribes {
  String? href;

  WooShippingZoneLocationDescribes({this.href});

  WooShippingZoneLocationDescribes.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
