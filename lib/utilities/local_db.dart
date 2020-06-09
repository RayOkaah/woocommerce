
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
