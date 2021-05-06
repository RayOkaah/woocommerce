/*
 * BSD 3-Clause License

    Copyright (c) 2020, RAY OKAAH - MailTo: ray@flutterengineer.com, Twitter: Rayscode
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

class WooShippingZoneMethod {
  int? instanceId;
  String? title;
  int? order;
  bool? enabled;
  String? methodId;
  String? methodTitle;
  String? methodDescription;
  WooShippingZoneMethodSettings? settings;
  WooShippingZoneMethodLinks? links;

  WooShippingZoneMethod(
      {this.instanceId,
      this.title,
      this.order,
      this.enabled,
      this.methodId,
      this.methodTitle,
      this.methodDescription,
      this.settings,
      this.links});

  WooShippingZoneMethod.fromJson(Map<String, dynamic> json) {
    instanceId = json['instance_id'];
    title = json['title'];
    order = json['order'];
    enabled = json['enabled'];
    methodId = json['method_id'];
    methodTitle = json['method_title'];
    methodDescription = json['method_description'];
    settings = json['settings'] != null
        ? new WooShippingZoneMethodSettings.fromJson(json['settings'])
        : null;
    links = json['_links'] != null
        ? new WooShippingZoneMethodLinks.fromJson(json['_links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instance_id'] = this.instanceId;
    data['title'] = this.title;
    data['order'] = this.order;
    data['enabled'] = this.enabled;
    data['method_id'] = this.methodId;
    data['method_title'] = this.methodTitle;
    data['method_description'] = this.methodDescription;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    if (this.links != null) {
      data['_links'] = this.links!.toJson();
    }
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooShippingZoneMethodSettings {
  WooShippingZoneMethodTitle? title;
  WooShippingZoneMethodTaxStatus? taxStatus;
  WooShippingZoneMethodCost? cost;
  WooShippingZoneMethodClassCosts? classCosts;
  WooShippingZoneMethodClassCost92? classCost92;
  WooShippingZoneMethodClassCost91? classCost91;
  WooShippingZoneMethodNoClassCost? noClassCost;
  WooShippingZoneMethodType? type;

  WooShippingZoneMethodSettings(
      {this.title,
      this.taxStatus,
      this.cost,
      this.classCosts,
      this.classCost92,
      this.classCost91,
      this.noClassCost,
      this.type});

  WooShippingZoneMethodSettings.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null
        ? new WooShippingZoneMethodTitle.fromJson(json['title'])
        : null;
    taxStatus = json['tax_status'] != null
        ? new WooShippingZoneMethodTaxStatus.fromJson(json['tax_status'])
        : null;
    cost = json['cost'] != null
        ? new WooShippingZoneMethodCost.fromJson(json['cost'])
        : null;
    classCosts = json['class_costs'] != null
        ? new WooShippingZoneMethodClassCosts.fromJson(json['class_costs'])
        : null;
    classCost92 = json['class_cost_92'] != null
        ? new WooShippingZoneMethodClassCost92.fromJson(json['class_cost_92'])
        : null;
    classCost91 = json['class_cost_91'] != null
        ? new WooShippingZoneMethodClassCost91.fromJson(json['class_cost_91'])
        : null;
    noClassCost = json['no_class_cost'] != null
        ? new WooShippingZoneMethodNoClassCost.fromJson(json['no_class_cost'])
        : null;
    type = json['type'] != null
        ? new WooShippingZoneMethodType.fromJson(json['type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.taxStatus != null) {
      data['tax_status'] = this.taxStatus!.toJson();
    }
    if (this.cost != null) {
      data['cost'] = this.cost!.toJson();
    }
    if (this.classCosts != null) {
      data['class_costs'] = this.classCosts!.toJson();
    }
    if (this.classCost92 != null) {
      data['class_cost_92'] = this.classCost92!.toJson();
    }
    if (this.classCost91 != null) {
      data['class_cost_91'] = this.classCost91!.toJson();
    }
    if (this.noClassCost != null) {
      data['no_class_cost'] = this.noClassCost!.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class WooShippingZoneMethodTitle {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? titleDefault;
  String? tip;
  String? placeholder;

  WooShippingZoneMethodTitle(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.titleDefault,
      this.tip,
      this.placeholder});

  WooShippingZoneMethodTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    titleDefault = json['default'];
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
    data['default'] = this.titleDefault;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class WooShippingZoneMethodTaxStatus {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? taxDefault;
  String? tip;
  String? placeholder;
  WooShippingZoneMethodOptions? options;

  WooShippingZoneMethodTaxStatus(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.taxDefault,
      this.tip,
      this.placeholder,
      this.options});

  WooShippingZoneMethodTaxStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    taxDefault = json['default'];
    tip = json['tip'];
    placeholder = json['placeholder'];
    options = json['options'] != null
        ? new WooShippingZoneMethodOptions.fromJson(json['options'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['description'] = this.description;
    data['type'] = this.type;
    data['value'] = this.value;
    data['default'] = this.taxDefault;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    return data;
  }
}

class WooShippingZoneMethodOptions {
  String? taxable;
  String? none;

  WooShippingZoneMethodOptions({this.taxable, this.none});

  WooShippingZoneMethodOptions.fromJson(Map<String, dynamic> json) {
    taxable = json['taxable'];
    none = json['none'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxable'] = this.taxable;
    data['none'] = this.none;
    return data;
  }
}

class WooShippingZoneMethodCost {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? costDefault;
  String? tip;
  String? placeholder;

  WooShippingZoneMethodCost(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.costDefault,
      this.tip,
      this.placeholder});

  WooShippingZoneMethodCost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    costDefault = json['default'];
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
    data['default'] = this.costDefault;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class WooShippingZoneMethodClassCosts {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? classCostsDefault;
  String? tip;
  String? placeholder;

  WooShippingZoneMethodClassCosts(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.classCostsDefault,
      this.tip,
      this.placeholder});

  WooShippingZoneMethodClassCosts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    classCostsDefault = json['default'];
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
    data['default'] = this.classCostsDefault;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class WooShippingZoneMethodClassCost92 {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? classCost92Default;
  String? tip;
  String? placeholder;

  WooShippingZoneMethodClassCost92(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.classCost92Default,
      this.tip,
      this.placeholder});

  WooShippingZoneMethodClassCost92.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    classCost92Default = json['default'];
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
    data['default'] = this.classCost92Default;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class WooShippingZoneMethodClassCost91 {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? classCost91Default;
  String? tip;
  String? placeholder;

  WooShippingZoneMethodClassCost91(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.classCost91Default,
      this.tip,
      this.placeholder});

  WooShippingZoneMethodClassCost91.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    classCost91Default = json['default'];
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
    data['default'] = this.classCost91Default;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class WooShippingZoneMethodNoClassCost {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? noClassCostDefault;
  String? tip;
  String? placeholder;

  WooShippingZoneMethodNoClassCost(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.noClassCostDefault,
      this.tip,
      this.placeholder});

  WooShippingZoneMethodNoClassCost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    noClassCostDefault = json['default'];
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
    data['default'] = this.noClassCostDefault;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class WooShippingZoneMethodType {
  String? id;
  String? label;
  String? description;
  String? type;
  String? value;
  String? typeDefault;
  String? tip;
  String? placeholder;
  WooShippingZoneMethodOptions? options;

  WooShippingZoneMethodType(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.typeDefault,
      this.tip,
      this.placeholder,
      this.options});

  WooShippingZoneMethodType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    typeDefault = json['default'];
    tip = json['tip'];
    placeholder = json['placeholder'];
    options = json['options'] != null
        ? new WooShippingZoneMethodOptions.fromJson(json['options'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['description'] = this.description;
    data['type'] = this.type;
    data['value'] = this.value;
    data['default'] = this.typeDefault;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    return data;
  }
}

class WooShippingZoneMethodLinks {
  List<WooShippingZoneMethodSelf>? self;
  List<WooShippingZoneMethodCollection>? collection;
  List<WooShippingZoneMethodDescribes>? describes;

  WooShippingZoneMethodLinks({this.self, this.collection, this.describes});

  WooShippingZoneMethodLinks.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <WooShippingZoneMethodSelf>[];
      json['self'].forEach((v) {
        self!.add(new WooShippingZoneMethodSelf.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = <WooShippingZoneMethodCollection>[];
      json['collection'].forEach((v) {
        collection!.add(new WooShippingZoneMethodCollection.fromJson(v));
      });
    }
    if (json['describes'] != null) {
      describes = <WooShippingZoneMethodDescribes>[];
      json['describes'].forEach((v) {
        describes!.add(new WooShippingZoneMethodDescribes.fromJson(v));
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
    if (this.describes != null) {
      data['describes'] = this.describes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WooShippingZoneMethodSelf {
  String? href;

  WooShippingZoneMethodSelf({this.href});

  WooShippingZoneMethodSelf.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class WooShippingZoneMethodCollection {
  String? href;

  WooShippingZoneMethodCollection({this.href});

  WooShippingZoneMethodCollection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class WooShippingZoneMethodDescribes {
  String? href;

  WooShippingZoneMethodDescribes({this.href});

  WooShippingZoneMethodDescribes.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
