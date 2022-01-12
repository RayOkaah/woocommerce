

class WooTaxRate {
  int? id;
  String? country;
  String? state;
  String? postcode;
  String? city;
  String? rate;
  String? name;
  int? priority;
  bool? compound;
  bool? shipping;
  int? order;
  String? taxClass;
  WooTaxRateLinks? links;

  WooTaxRate(
      {this.id,
      this.country,
      this.state,
      this.postcode,
      this.city,
      this.rate,
      this.name,
      this.priority,
      this.compound,
      this.shipping,
      this.order,
      this.taxClass,
      this.links});

  WooTaxRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    state = json['state'];
    postcode = json['postcode'];
    city = json['city'];
    rate = json['rate'];
    name = json['name'];
    priority = json['priority'];
    compound = json['compound'];
    shipping = json['shipping'];
    order = json['order'];
    taxClass = json['class'];
    links = json['_links'] != null
        ? new WooTaxRateLinks.fromJson(json['_links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['city'] = this.city;
    data['rate'] = this.rate;
    data['name'] = this.name;
    data['priority'] = this.priority;
    data['compound'] = this.compound;
    data['shipping'] = this.shipping;
    data['order'] = this.order;
    data['class'] = this.taxClass;
    if (this.links != null) {
      data['_links'] = this.links!.toJson();
    }
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooTaxRateLinks {
  List<WooTaxRateSelf>? self;
  List<WooTaxRateCollection>? collection;

  WooTaxRateLinks({this.self, this.collection});

  WooTaxRateLinks.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <WooTaxRateSelf>[];
      json['self'].forEach((v) {
        self!.add(new WooTaxRateSelf.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = <WooTaxRateCollection>[];
      json['collection'].forEach((v) {
        collection!.add(new WooTaxRateCollection.fromJson(v));
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

class WooTaxRateSelf {
  String? href;

  WooTaxRateSelf({this.href});

  WooTaxRateSelf.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class WooTaxRateCollection {
  String? href;

  WooTaxRateCollection({this.href});

  WooTaxRateCollection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
