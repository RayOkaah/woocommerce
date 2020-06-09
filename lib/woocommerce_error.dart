class WooCommerceError {
  String _code;
  String _message;
  Data _data;

  WooCommerceError({String code, String message, Data data}) {
    this._code = code;
    this._message = message;
    this._data = data;
  }

  WooCommerceError.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  @override
  String toString() {
    return "WooCommerce Error!\ncode: $_code\nmessage: $_message\nstatus: ${_data.status}";
  }
}

class Data {
  int _status;

  Data({int status}) {
    this._status = status;
  }

  int get status => _status;

  Data.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    return data;
  }
}
