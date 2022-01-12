

class WooShippingZone {
  int? id;
  String? name;
  int? order;
  WooShippingZoneLinks? links;

  WooShippingZone({this.id, this.name, this.order, this.links});

  WooShippingZone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    links = json['_links'] != null
        ? new WooShippingZoneLinks.fromJson(json['_links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.links != null) {
      data['_links'] = this.links!.toJson();
    }
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooShippingZoneLinks {
  List<WooShippingZoneSelf>? self;
  List<WooShippingZoneCollection>? collection;
  List<Describedby>? describedby;

  WooShippingZoneLinks({this.self, this.collection, this.describedby});

  WooShippingZoneLinks.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <WooShippingZoneSelf>[];
      json['self'].forEach((v) {
        self!.add(new WooShippingZoneSelf.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = <WooShippingZoneCollection>[];
      json['collection'].forEach((v) {
        collection!.add(new WooShippingZoneCollection.fromJson(v));
      });
    }
    if (json['describedby'] != null) {
      describedby = <Describedby>[];
      json['describedby'].forEach((v) {
        describedby!.add(new Describedby.fromJson(v));
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
    if (this.describedby != null) {
      data['describedby'] = this.describedby!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WooShippingZoneSelf {
  String? href;

  WooShippingZoneSelf({this.href});

  WooShippingZoneSelf.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class WooShippingZoneCollection {
  String? href;

  WooShippingZoneCollection({this.href});

  WooShippingZoneCollection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Describedby {
  String? href;

  Describedby({this.href});

  Describedby.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
