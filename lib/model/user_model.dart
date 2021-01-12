class User{
  String name;
  String email;
  String phone;
  String password;
  String c_password;

  User({this.name, this.email, this.phone, this.password, this.c_password});
  User.from({this.name, this.password});

  User.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      email = json['email'],
      phone = json["phone"],
      password = json['password'],
      c_password = json['c_password'];

  Map<String, dynamic> toJson() =>{
    'name' : name,
    'email' : email,
    'phone' : phone,
    'password' : password,
    'c_password' : c_password
  };

}