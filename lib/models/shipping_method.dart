/*
 * BSD 3-Clause License

    Copyright (c) 2020, RAY OKAAH
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

    3. Neither the name of the copyright holder nor the names of its
    contributors may be used to endorse or promote products derived from
    this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
    SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 */

class Shipping {
  int parentId;
  String name;
  List<Locations> locations;
  Methods methods;

  Shipping({this.parentId, this.name, this.locations, this.methods});

  Shipping.fromJson(Map<String, dynamic> json) {
    parentId = json['parent_id'];
    name = json['name'];
    if (json['locations'] != null) {
      locations = new List<Locations>();
      json['locations'].forEach((v) {
        locations.add(new Locations.fromJson(v));
      });
    }
    methods =
        json['methods'] != null ? new Methods.fromJson(json['methods']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    if (this.locations != null) {
      data['locations'] = this.locations.map((v) => v.toJson()).toList();
    }
    if (this.methods != null) {
      data['methods'] = this.methods.toJson();
    }
    return data;
  }
  @override toString() => this.toJson().toString();
}

class Locations {
  String code;
  String type;

  Locations({this.code, this.type});

  Locations.fromJson(Map<String, dynamic> json) {
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

class Methods {
  List<FreeShipping> freeShipping;
  List<FlatRate> flatRate;
  List<LocalPickup> localPickup;

  Methods({this.freeShipping, this.flatRate, this.localPickup});

  Methods.fromJson(Map<String, dynamic> json) {
    if (json['free_shipping'] != null) {
      freeShipping = new List<FreeShipping>();
      json['free_shipping'].forEach((v) {
        freeShipping.add(new FreeShipping.fromJson(v));
      });
    }
    if (json['flat_rate'] != null) {
      flatRate = new List<FlatRate>();
      json['flat_rate'].forEach((v) {
        flatRate.add(new FlatRate.fromJson(v));
      });
    }
    if (json['local_pickup'] != null) {
      localPickup = new List<LocalPickup>();
      json['local_pickup'].forEach((v) {
        localPickup.add(new LocalPickup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.freeShipping != null) {
      data['free_shipping'] = this.freeShipping.map((v) => v.toJson()).toList();
    }
    if (this.flatRate != null) {
      data['flat_rate'] = this.flatRate.map((v) => v.toJson()).toList();
    }
    if (this.localPickup != null) {
      data['local_pickup'] = this.localPickup.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FreeShipping {
  int id;
  String title;
  String methodId;
  String cost;

  FreeShipping({this.id, this.title, this.methodId, this.cost});

  FreeShipping.fromJson(Map<String, dynamic> json) {
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

class FlatRate {
  int id;
  String title;
  String methodId;
  String cost;
  String classCost;
  String calculationType;
  bool taxable;
  List<ShippingClasses> shippingClasses;

  FlatRate(
      {this.id,
      this.title,
      this.methodId,
      this.cost,
      this.classCost,
      this.calculationType,
      this.taxable,
      this.shippingClasses});

  FlatRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    methodId = json['method_id'];
    cost = json['cost'];
    classCost = json['class_cost'];
    calculationType = json['calculation_type'];
    taxable = json['taxable'];
    if (json['shipping_classes'] != null) {
      shippingClasses = new List<ShippingClasses>();
      json['shipping_classes'].forEach((v) {
        shippingClasses.add(new ShippingClasses.fromJson(v));
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
          this.shippingClasses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShippingClasses {
  String id;
  String cost;

  ShippingClasses({this.id, this.cost});

  ShippingClasses.fromJson(Map<String, dynamic> json) {
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

class LocalPickup {
  int id;
  String title;
  String methodId;
  bool taxable;
  String cost;

  LocalPickup({this.id, this.title, this.methodId, this.taxable, this.cost});

  LocalPickup.fromJson(Map<String, dynamic> json) {
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
