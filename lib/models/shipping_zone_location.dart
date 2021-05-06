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
