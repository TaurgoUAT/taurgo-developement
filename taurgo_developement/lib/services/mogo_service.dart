// import 'package:realm/realm.dart';
//
// class MongoService {
//   static final _app = App(AppConfiguration("your-app-id"));
//
//   Future<User> login(String email, String password) async {
//     final credentials = Credentials.emailPassword(email, password);
//     return await _app.logIn(credentials);
//   }
//
//   Realm getRealm(User user) {
//     final config = Configuration.flexibleSync(user, [ImageInfo.schema]);
//     return Realm(config);
//   }
// }
