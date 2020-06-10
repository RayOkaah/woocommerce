/*
 * BSD 3-Clause License

    Copyright (c) 2020, RAY OKAAH - ray@flutterengineer.com
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
/**
import 'package:woocommerce/models/user.dart';

String _token;
Map<String, String> _urlHeader = {
  'Authorization': '',
};
Future<bool> isUserLoggedIn() async {
  //_localDbService.deleteSecurityToken();
  //_token = await _localDbService.getSecurityToken();
  if (_token == null){
    print('token validation unsucessful, token is null ');
    return false;
  }
  print('here is the token you ordered : '+_token);
  _urlHeader['Authorization'] = 'Bearer ${_token}';
  var response; //= await fetchMeUser();
  if (response is User ) {
    print('token validation response is user');
    _populateAppUser(response);
    return true;
  }
  print('token validation unsucessful' +response.toString());
  //throw new WordPressError(message: response.body);
  return false;
}

_populateAppUser(User user){
  var appUser = user;
  //var box = Hive.box('user');
  //box.putAll(user.toJson());
  //print('account user added : ' + user.toString());
}

    */