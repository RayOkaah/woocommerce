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

class WooShippingZoneMethod {
  int instanceId;
  String title;
  int order;
  bool enabled;
  String methodId;
  String methodTitle;
  String methodDescription;
  Settings settings;
  Links links;

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
        ? new Settings.fromJson(json['settings'])
        : null;
    links = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
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
      data['settings'] = this.settings.toJson();
    }
    if (this.links != null) {
      data['_links'] = this.links.toJson();
    }
    return data;
  }
  @override toString() => this.toJson().toString();
}

class Settings {
  Title title;
  TaxStatus taxStatus;
  Cost cost;
  ClassCosts classCosts;
  ClassCost92 classCost92;
  ClassCost91 classCost91;
  NoClassCost noClassCost;
  Type type;

  Settings(
      {this.title,
      this.taxStatus,
      this.cost,
      this.classCosts,
      this.classCost92,
      this.classCost91,
      this.noClassCost,
      this.type});

  Settings.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    taxStatus = json['tax_status'] != null
        ? new TaxStatus.fromJson(json['tax_status'])
        : null;
    cost = json['cost'] != null ? new Cost.fromJson(json['cost']) : null;
    classCosts = json['class_costs'] != null
        ? new ClassCosts.fromJson(json['class_costs'])
        : null;
    classCost92 = json['class_cost_92'] != null
        ? new ClassCost92.fromJson(json['class_cost_92'])
        : null;
    classCost91 = json['class_cost_91'] != null
        ? new ClassCost91.fromJson(json['class_cost_91'])
        : null;
    noClassCost = json['no_class_cost'] != null
        ? new NoClassCost.fromJson(json['no_class_cost'])
        : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.taxStatus != null) {
      data['tax_status'] = this.taxStatus.toJson();
    }
    if (this.cost != null) {
      data['cost'] = this.cost.toJson();
    }
    if (this.classCosts != null) {
      data['class_costs'] = this.classCosts.toJson();
    }
    if (this.classCost92 != null) {
      data['class_cost_92'] = this.classCost92.toJson();
    }
    if (this.classCost91 != null) {
      data['class_cost_91'] = this.classCost91.toJson();
    }
    if (this.noClassCost != null) {
      data['no_class_cost'] = this.noClassCost.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}

class Title {
  String id;
  String label;
  String description;
  String type;
  String value;
  String titleDefault;
  String tip;
  String placeholder;

  Title(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.titleDefault,
      this.tip,
      this.placeholder});

  Title.fromJson(Map<String, dynamic> json) {
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

class TaxStatus {
  String id;
  String label;
  String description;
  String type;
  String value;
  String taxDefault;
  String tip;
  String placeholder;
  Options options;

  TaxStatus(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.taxDefault,
      this.tip,
      this.placeholder,
      this.options});

  TaxStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    taxDefault = json['default'];
    tip = json['tip'];
    placeholder = json['placeholder'];
    options =
        json['options'] != null ? new Options.fromJson(json['options']) : null;
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
      data['options'] = this.options.toJson();
    }
    return data;
  }
}

class Options {
  String taxable;
  String none;

  Options({this.taxable, this.none});

  Options.fromJson(Map<String, dynamic> json) {
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

class Cost {
  String id;
  String label;
  String description;
  String type;
  String value;
  String costDefault;
  String tip;
  String placeholder;

  Cost(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.costDefault,
      this.tip,
      this.placeholder});

  Cost.fromJson(Map<String, dynamic> json) {
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

class ClassCosts {
  String id;
  String label;
  String description;
  String type;
  String value;
  String classCostsDefault;
  String tip;
  String placeholder;

  ClassCosts(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.classCostsDefault,
      this.tip,
      this.placeholder});

  ClassCosts.fromJson(Map<String, dynamic> json) {
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

class ClassCost92 {
  String id;
  String label;
  String description;
  String type;
  String value;
  String classCost92Default;
  String tip;
  String placeholder;

  ClassCost92(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.classCost92Default,
      this.tip,
      this.placeholder});

  ClassCost92.fromJson(Map<String, dynamic> json) {
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

class ClassCost91 {
  String id;
  String label;
  String description;
  String type;
  String value;
  String classCost91Default;
  String tip;
  String placeholder;

  ClassCost91(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.classCost91Default,
      this.tip,
      this.placeholder});

  ClassCost91.fromJson(Map<String, dynamic> json) {
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

class NoClassCost {
  String id;
  String label;
  String description;
  String type;
  String value;
  String noClassCostDefault;
  String tip;
  String placeholder;

  NoClassCost(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.noClassCostDefault,
      this.tip,
      this.placeholder});

  NoClassCost.fromJson(Map<String, dynamic> json) {
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

class Type {
  String id;
  String label;
  String description;
  String type;
  String value;
  String typeDefault;
  String tip;
  String placeholder;
  Options options;

  Type(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.typeDefault,
      this.tip,
      this.placeholder,
      this.options});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    typeDefault = json['default'];
    tip = json['tip'];
    placeholder = json['placeholder'];
    options =
        json['options'] != null ? new Options.fromJson(json['options']) : null;
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
      data['options'] = this.options.toJson();
    }
    return data;
  }
}

class Links {
  List<Self> self;
  List<Collection> collection;
  List<Describes> describes;

  Links({this.self, this.collection, this.describes});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = new List<Self>();
      json['self'].forEach((v) {
        self.add(new Self.fromJson(v));
      });
    }
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
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v.toJson()).toList();
    }
    if (this.describes != null) {
      data['describes'] = this.describes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
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
