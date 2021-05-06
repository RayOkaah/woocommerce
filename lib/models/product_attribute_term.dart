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

class WooProductAttributeTerm {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? menuOrder;
  int? count;
  WooProductAttributeTermLinks? links;

  WooProductAttributeTerm(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.menuOrder,
      this.count,
      this.links});

  WooProductAttributeTerm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    menuOrder = json['menu_order'];
    count = json['count'];
    links = json['_links'] != null
        ? new WooProductAttributeTermLinks.fromJson(json['_links'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['menu_order'] = this.menuOrder;
    data['count'] = this.count;
    if (this.links != null) {
      data['_links'] = this.links!.toJson();
    }
    return data;
  }

  @override
  toString() => this.toJson().toString();
}

class WooProductAttributeTermLinks {
  List<WooProductAttributeTermSelf>? self;
  List<WooProductAttributeTermCollection>? collection;

  WooProductAttributeTermLinks({this.self, this.collection});

  WooProductAttributeTermLinks.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self!.add(new WooProductAttributeTermSelf.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection!.add(new WooProductAttributeTermCollection.fromJson(v));
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

  @override
  toString() => this.toJson().toString();
}

class WooProductAttributeTermSelf {
  String? href;

  WooProductAttributeTermSelf({this.href});

  WooProductAttributeTermSelf.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class WooProductAttributeTermCollection {
  String? href;

  WooProductAttributeTermCollection({this.href});

  WooProductAttributeTermCollection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
