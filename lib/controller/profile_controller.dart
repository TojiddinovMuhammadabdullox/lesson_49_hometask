import 'package:hometask/model/profile.dart';


class ProfileController {
  User user = User(
    name: 'John',
    surname: 'Doe',
    phoneNumber: '123456789',
  );

  void updateUser(String name, String surname, String phoneNumber) {
    user.name = name;
    user.surname = surname;
    user.phoneNumber = phoneNumber;
  }
}
