final String tableAccounts = 'accounts';

class AccountFields {
  static final List<String> values = [
    id, firstName, lastName, email, password, birthday, gender, photoLink
  ];

  static final String id = '_id';
  static final String firstName = 'firstName';
  static final String lastName = 'lastName';
  static final String email = 'email';
  static final String password = 'password';
  static final String birthday = 'birthday';
  static final String gender = 'gender';
  static final String photoLink = 'photoLink';
}

class Account {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String birthday;
  final String gender;
  final String photoLink;

  const Account({
    this.id,
    required this.firstName,
    this.lastName = ' ',
    required this.email,
    required this.password,
    required this.birthday,
    required this.gender,
    this.photoLink = ''
  });

  Account copy({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? birthday,
    String? gender,
    String? photoLink,
  }) => Account(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    password: password ?? this.password,
    birthday: birthday ?? this.birthday,
    gender: gender ?? this.gender,
    photoLink: photoLink ?? this.photoLink
  );

  Map<String, Object?> toJson() => {
    AccountFields.id: id,
    AccountFields.firstName: firstName,
    AccountFields.lastName: lastName,
    AccountFields.email: email,
    AccountFields.password: password,
    AccountFields.birthday: birthday,
    AccountFields.gender: gender,
    AccountFields.photoLink: photoLink
  };

  static Account fromJson(Map<String, Object?> json) => Account(
    id: json[AccountFields.id] as int,
    firstName: json[AccountFields.firstName] as String,
    lastName: json[AccountFields.lastName] as String,
    email: json[AccountFields.email] as String,
    password: json[AccountFields.password] as String,
    birthday: json[AccountFields.birthday] as String,
    gender: json[AccountFields.gender] as String,
    photoLink: json[AccountFields.photoLink] as String,
  );

}