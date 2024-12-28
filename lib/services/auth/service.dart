import 'package:liga_inggris_mobile/app/core/base/base_service.dart';
import 'package:liga_inggris_mobile/services/auth/model.dart';

class AuthService extends BaseService {
  final List<UserModel> _userList = [
    UserModel(name: '', email: '@', password: ''),
    UserModel(name: 'Herlin', email: 'herlin@gmail.com', password: 'admin123'),
    UserModel(name: 'Sharon', email: 'sharon@gmail.com', password: 'admin123'),
    UserModel(name: 'Fanes', email: 'fanes@gmail.com', password: 'admin123'),
    UserModel(name: 'Steven', email: 'steven@gmail.com', password: 'admin123'),
  ];

  Future<bool> login(String email, String password) async {
    bool isValidUser = false;

    for (UserModel user in _userList) {
      if (user.email == email && user.password == password) {
        isValidUser = true;
        break;
      }
    }

    return isValidUser;
  }

  List<UserModel> get userList => _userList;
}
