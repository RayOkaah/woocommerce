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

class WooOrderPayload {
  String paymentMethod;
  String paymentMethodTitle;
  bool setPaid;
  String status;
  String currency;
  int customerId;
  String customerNote;
  int parentId;
  List<MetaData> metaData;
  List<FeeLines> feeLines;
  List<CouponLines> couponLines;
  Billing billing;
  Shipping shipping;
  List<LineItems> lineItems;
  List<ShippingLines> shippingLines;

  WooOrderPayload(
      {this.paymentMethod,
      this.paymentMethodTitle,
      this.setPaid,
      this.status,
      this.currency,
      this.customerId,
      this.customerNote,
      this.parentId,
      this.metaData,
      this.feeLines,
      this.couponLines,
      this.billing,
      this.shipping,
      this.lineItems,
      this.shippingLines});

  WooOrderPayload.fromJson(Map<String, dynamic> json) {
    paymentMethod = json['payment_method'];
    paymentMethodTitle = json['payment_method_title'];
    setPaid = json['set_paid'];
    status = json['status'];
    currency = json['currency'];
    customerId = json['customer_id'];
    customerNote = json['customer_note'];
    parentId = json['parent_id'];
    if (json['meta_data'] != null) {
      metaData = new List<MetaData>();
      json['meta_data'].forEach((v) {
        metaData.add(new MetaData.fromJson(v));
      });
    }
    if (json['fee_lines'] != null) {
      feeLines = new List<FeeLines>();
      json['fee_lines'].forEach((v) {
        feeLines.add(new FeeLines.fromJson(v));
      });
    }
    if (json['coupon_lines'] != null) {
      couponLines = new List<CouponLines>();
      json['coupon_lines'].forEach((v) {
        couponLines.add(new CouponLines.fromJson(v));
      });
    }
    billing =
        json['billing'] != null ? new Billing.fromJson(json['billing']) : null;
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    if (json['line_items'] != null) {
      lineItems = new List<LineItems>();
      json['line_items'].forEach((v) {
        lineItems.add(new LineItems.fromJson(v));
      });
    }
    if (json['shipping_lines'] != null) {
      shippingLines = new List<ShippingLines>();
      json['shipping_lines'].forEach((v) {
        shippingLines.add(new ShippingLines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method'] = this.paymentMethod;
    data['payment_method_title'] = this.paymentMethodTitle;
    data['set_paid'] = this.setPaid;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['customer_id'] = this.customerId;
    data['customer_note'] = this.customerNote;
    data['parent_id'] = this.parentId;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    if (this.feeLines != null) {
      data['fee_lines'] = this.feeLines.map((v) => v.toJson()).toList();
    }
    if (this.couponLines != null) {
      data['coupon_lines'] = this.couponLines.map((v) => v.toJson()).toList();
    }
    if (this.billing != null) {
      data['billing'] = this.billing.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping.toJson();
    }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems.map((v) => v.toJson()).toList();
    }
    if (this.shippingLines != null) {
      data['shipping_lines'] =
          this.shippingLines.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override toString() => this.toJson().toString();
}

class MetaData {
  String key;
  String value;

  MetaData({this.key, this.value});

  MetaData.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class FeeLines {
  String name;
  String taxClass;
  String taxStatus;
  String total;
  List<MetaData> metaData;

  FeeLines(
      {this.name, this.taxClass, this.taxStatus, this.total, this.metaData});

  FeeLines.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    taxClass = json['tax_class'];
    taxStatus = json['tax_status'];
    total = json['total'];
    if (json['meta_data'] != null) {
      metaData = new List<MetaData>();
      json['meta_data'].forEach((v) {
        metaData.add(new MetaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tax_class'] = this.taxClass;
    data['tax_status'] = this.taxStatus;
    data['total'] = this.total;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CouponLines {
  String code;
  List<MetaData> metaData;

  CouponLines({this.code, this.metaData});

  CouponLines.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['meta_data'] != null) {
      metaData = new List<MetaData>();
      json['meta_data'].forEach((v) {
        metaData.add(new MetaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Billing {
  String firstName;
  String lastName;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;
  String email;
  String phone;

  Billing(
      {this.firstName,
      this.lastName,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country,
      this.email,
      this.phone});

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName ?? "";
    data['last_name'] = this.lastName ?? "";
    data['address_1'] = this.address1 ?? "";
    data['address_2'] = this.address2 ?? "";
    data['city'] = this.city ?? "";
    data['state'] = this.state ?? "";
    data['postcode'] = this.postcode ?? "";
    data['country'] = this.country ?? "";
    if (this.email != null) {
      data['email'] = this.email ?? "";
    }
    if (this.phone != null) {
      data['phone'] = this.phone ?? "";
    }
    return data;
  }
}

class Shipping {
  String firstName;
  String lastName;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;

  Shipping(
      {this.firstName,
      this.lastName,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country});

  Shipping.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName ?? "";
    data['last_name'] = this.lastName ?? "";
    data['address_1'] = this.address1 ?? "";
    data['address_2'] = this.address2 ?? "";
    data['city'] = this.city ?? "";
    data['state'] = this.state ?? "";
    data['postcode'] = this.postcode ?? "";
    data['country'] = this.country ?? "";
    return data;
  }
}

class LineItems {
  int productId;
  String name;
  int variationId;
  String taxClass;
  String subtotal;
  String total;
  int quantity;

  LineItems(
      {this.productId,
      this.name,
      this.variationId,
      this.taxClass,
      this.subtotal,
      this.total,
      this.quantity});

  LineItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    variationId = json['variation_id'];
    taxClass = json['tax_class'];
    subtotal = json['subtotal'];
    total = json['total'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    if (this.variationId != null) {
      data['variation_id'] = this.variationId;
    }
    if (this.taxClass != null) {
      data['tax_class'] = this.taxClass;
    }
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['quantity'] = this.quantity;
    return data;
  }
}

class ShippingLines {
  String methodId;
  String methodTitle;
  String total;

  ShippingLines({this.methodId, this.methodTitle, this.total});

  ShippingLines.fromJson(Map<String, dynamic> json) {
    methodId = json['method_id'];
    methodTitle = json['method_title'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method_id'] = this.methodId;
    data['method_title'] = this.methodTitle;
    data['total'] = this.total;
    return data;
  }
}
