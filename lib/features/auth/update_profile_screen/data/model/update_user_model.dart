class UpdateUserModel {
  // String id;
  // String email;
  // String password;
  String name;
  String phoneNumber;
  int? indexOfImage;

  UpdateUserModel({
    required this.name,
    // required this.email,
    // required this.password,
    // this.id ="",
    required this.phoneNumber,
    this.indexOfImage,
  });

  UpdateUserModel.fromJson(Map<String , dynamic> json):this (
    // id: json['id'],
    name: json['name'],
    // password: json['password'],
    // email: json['email'],
    phoneNumber: json['phoneNumber'],
    indexOfImage: json['indexOfImage'] as int,
  );

  Map<String , dynamic>toJson (){
    return {
      // 'id': id,
      'name': name,
      // 'password': password,
      // 'email': email,
      'phoneNumber': phoneNumber,
      'indexOfImage': indexOfImage,
    };
  }
}