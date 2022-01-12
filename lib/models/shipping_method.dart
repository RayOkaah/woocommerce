

class WooShippingMethod {
  int? parentId;
  String? name;
  List<WooShippingMethodLocations>? locations;
  WooShippingMethodMethods? methods;

  WooShippingMethod({this.parentId, this.name, this.locations, this.methods});

  WooShippingMethod.fromJson(Map<String, dynamic> json) {
    parentId = json['parent_id'];
    name = json['name'];
    if (json['locations'] != null) {
      locations = [];
      json['locations'].forEach((v) {
        locations!.add(new WooShippingMethodLocations.fromJson(v));
      });
    }
    methods = json['methods'] != null
        ? new WooShippingMethodMethods.fromJson(json['methods'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    if (this.methods != null) {
      data['methods'] = this.methods!.toJson();
    }
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooShippingMethodLocations {
  String? code;
  String? type;

  WooShippingMethodLocations({this.code, this.type});

  WooShippingMethodLocations.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['type'] = this.type;
    return data;
  }
}

class WooShippingMethodMethods {
  List<WooShippingMethodFreeShipping>? freeShipping;
  List<WooShippingMethodFlatRate>? flatRate;
  List<WooShippingMethodLocalPickup>? localPickup;

  WooShippingMethodMethods(
      {this.freeShipping, this.flatRate, this.localPickup});

  WooShippingMethodMethods.fromJson(Map<String, dynamic> json) {
    if (json['free_shipping'] != null) {
      freeShipping = [];
      json['free_shipping'].forEach((v) {
        freeShipping!.add(new WooShippingMethodFreeShipping.fromJson(v));
      });
    }
    if (json['flat_rate'] != null) {
      flatRate = [];
      json['flat_rate'].forEach((v) {
        flatRate!.add(new WooShippingMethodFlatRate.fromJson(v));
      });
    }
    if (json['local_pickup'] != null) {
      localPickup = [];
      json['local_pickup'].forEach((v) {
        localPickup!.add(new WooShippingMethodLocalPickup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.freeShipping != null) {
      data['free_shipping'] = this.freeShipping!.map((v) => v.toJson()).toList();
    }
    if (this.flatRate != null) {
      data['flat_rate'] = this.flatRate!.map((v) => v.toJson()).toList();
    }
    if (this.localPickup != null) {
      data['local_pickup'] = this.localPickup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WooShippingMethodFreeShipping {
  int? id;
  String? title;
  String? methodId;
  String? cost;

  WooShippingMethodFreeShipping(
      {this.id, this.title, this.methodId, this.cost});

  WooShippingMethodFreeShipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    methodId = json['method_id'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['method_id'] = this.methodId;
    data['cost'] = this.cost;
    return data;
  }
}

class WooShippingMethodFlatRate {
  int? id;
  String? title;
  String? methodId;
  String? cost;
  String? classCost;
  String? calculationType;
  bool? taxable;
  List<WooShippingMethodShippingClasses>? shippingClasses;

  WooShippingMethodFlatRate(
      {this.id,
      this.title,
      this.methodId,
      this.cost,
      this.classCost,
      this.calculationType,
      this.taxable,
      this.shippingClasses});

  WooShippingMethodFlatRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    methodId = json['method_id'];
    cost = json['cost'];
    classCost = json['class_cost'];
    calculationType = json['calculation_type'];
    taxable = json['taxable'];
    if (json['shipping_classes'] != null) {
      shippingClasses = [];
      json['shipping_classes'].forEach((v) {
        shippingClasses!.add(new WooShippingMethodShippingClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['method_id'] = this.methodId;
    data['cost'] = this.cost;
    data['class_cost'] = this.classCost;
    data['calculation_type'] = this.calculationType;
    data['taxable'] = this.taxable;
    if (this.shippingClasses != null) {
      data['shipping_classes'] =
          this.shippingClasses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WooShippingMethodShippingClasses {
  String? id;
  String? cost;

  WooShippingMethodShippingClasses({this.id, this.cost});

  WooShippingMethodShippingClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cost'] = this.cost;
    return data;
  }
}

class WooShippingMethodLocalPickup {
  int? id;
  String? title;
  String? methodId;
  bool? taxable;
  String? cost;

  WooShippingMethodLocalPickup(
      {this.id, this.title, this.methodId, this.taxable, this.cost});

  WooShippingMethodLocalPickup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    methodId = json['method_id'];
    taxable = json['taxable'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['method_id'] = this.methodId;
    data['taxable'] = this.taxable;
    data['cost'] = this.cost;
    return data;
  }
}
