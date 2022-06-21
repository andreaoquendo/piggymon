import 'dart:math';

class Account {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String birthday;
  final String gender;
  final num balance;
  final String photoLink;

  const Account({
    this.id = 0,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.birthday,
    required this.gender,
    this.balance = 0,
    this.photoLink = ''
  });

}