class UserEntity {
  String password;
  String code;
  String name;

  UserEntity({this.password, this.code, this.name});

  UserEntity.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}
