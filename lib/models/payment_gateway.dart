

class WooPaymentGateway {
  String? id;
  String? title;
  String? description;
  int? order;
  bool? enabled;
  String? methodTitle;
  String? methodDescription;
  List<String>? methodSupports;
  WooPaymentGatewaySettings? settings;
  WooPaymentGatewayLinks? lLinks;

  WooPaymentGateway(
      {required String this.id,
      this.title,
      this.description,
      this.order,
      this.enabled,
      this.methodTitle,
      this.methodDescription,
      this.methodSupports,
      this.settings,
      this.lLinks});

  WooPaymentGateway.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    enabled = json['enabled'];
    methodTitle = json['method_title'];
    methodDescription = json['method_description'];
    methodSupports = json['method_supports'].cast<String>();
    settings = json['settings'] != null
        ? new WooPaymentGatewaySettings.fromJson(json['settings'])
        : null;
    lLinks = json['_links'] != null
        ? new WooPaymentGatewayLinks.fromJson(json['_links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['enabled'] = this.enabled;
    data['method_title'] = this.methodTitle;
    data['method_description'] = this.methodDescription;
    data['method_supports'] = this.methodSupports;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class WooPaymentGatewaySettings {
  WooPaymentGatewayTitle? title;
  WooPaymentGatewayTitle? instructions;

  WooPaymentGatewaySettings({this.title, this.instructions});

  WooPaymentGatewaySettings.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null
        ? new WooPaymentGatewayTitle.fromJson(json['title'])
        : null;
    instructions = json['instructions'] != null
        ? new WooPaymentGatewayTitle.fromJson(json['instructions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.instructions != null) {
      data['instructions'] = this.instructions!.toJson();
    }
    return data;
  }
}

class WooPaymentGatewayTitle {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? defaultvalue;
  String? tip;
  String? placeholder;

  WooPaymentGatewayTitle(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.defaultvalue,
      this.tip,
      this.placeholder});

  WooPaymentGatewayTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    defaultvalue = json['default'];
    tip = json['tip'];
    placeholder = json['placeholder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['description'] = this.description;
    data['type'] = this.type;
    data['value'] = this.value;
    data['default'] = this.defaultvalue;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class WooPaymentGatewayLinks {
  List<WooPaymentGatewaySelf>? self;
  List<WooPaymentGatewayCollection>? collection;

  WooPaymentGatewayLinks({this.self, this.collection});

  WooPaymentGatewayLinks.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self!.add(new WooPaymentGatewaySelf.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection!.add(new WooPaymentGatewayCollection.fromJson(v));
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

class WooPaymentGatewaySelf {
  String? href;

  WooPaymentGatewaySelf({this.href});

  WooPaymentGatewaySelf.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class WooPaymentGatewayCollection {
  String? href;

  WooPaymentGatewayCollection({this.href});

  WooPaymentGatewayCollection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
