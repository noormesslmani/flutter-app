class CurrentUser {
  final String id;
  String name;
  String country;
  String email;
  String dob;
  String? profilePicture;
  int phone;
  final String userType;

  CurrentUser({
    required this.id,
    required this.name,
    required this.country,
    required this.dob,
    required this.email,
    required this.phone,
    required this.userType,
    required this.profilePicture,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        id: json['user']['_id'],
        name: json['user']['name'],
        country: json['user']['country'],
        email: json['user']['email'],
        dob: json['user']['dob'],
        profilePicture: json['user']['profile_picture'],
        phone: json['user']['phone'] as int,
        userType: json['user']['user_type'],
      );
}
