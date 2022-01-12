


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
