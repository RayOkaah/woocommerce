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


class WooCustomerDownload {
  String? downloadId;
  String? downloadUrl;
  int? productId;
  String? productName;
  String? downloadName;
  int? orderId;
  String? orderKey;
  String? downloadsRemaining;
  String? accessExpires;
  String? accessExpiresGmt;
  WooCustomerDownloadFile? file;

  WooCustomerDownload(
      {this.downloadId,
        this.downloadUrl,
        this.productId,
        this.productName,
        this.downloadName,
        this.orderId,
        this.orderKey,
        this.downloadsRemaining,
        this.accessExpires,
        this.accessExpiresGmt,
        this.file});

  WooCustomerDownload.fromJson(Map<String, dynamic> json) {
    downloadId = json['download_id'];
    downloadUrl = json['download_url'];
    productId = json['product_id'];
    productName = json['product_name'];
    downloadName = json['download_name'];
    orderId = json['order_id'];
    orderKey = json['order_key'];
    downloadsRemaining = json['downloads_remaining'];
    accessExpires = json['access_expires'];
    accessExpiresGmt = json['access_expires_gmt'];
    file = json['file'] != null ? new WooCustomerDownloadFile.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['download_id'] = this.downloadId;
    data['download_url'] = this.downloadUrl;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['download_name'] = this.downloadName;
    data['order_id'] = this.orderId;
    data['order_key'] = this.orderKey;
    data['downloads_remaining'] = this.downloadsRemaining;
    data['access_expires'] = this.accessExpires;
    data['access_expires_gmt'] = this.accessExpiresGmt;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class WooCustomerDownloadFile {
  String? name;
  String? file;

  WooCustomerDownloadFile({this.name, this.file});

  WooCustomerDownloadFile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['file'] = this.file;
    return data;
  }
}
