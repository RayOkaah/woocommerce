

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalDatabaseService {

  final securityToken = new FlutterSecureStorage();

  updateSecurityToken(String? token) async{
    await securityToken.write(key: 'token', value: token);
  }

  deleteSecurityToken() async{
    await securityToken.delete(key: 'token');
  }

  Future<String> getSecurityToken () async{
    String? token = await securityToken.read(key: 'token');
    if(token == null){
      token = '0';
    }
    return token;
  }

}