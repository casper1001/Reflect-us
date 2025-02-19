import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../assets/assets.dart';

class StorageHandler {
  StorageHandler._();

  static StorageHandler? _instance;

  factory StorageHandler() => _instance ??= StorageHandler._();

  final _storage = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  Future<void> setToken(String token) => _storage.write('token', token);

  Future<void> removeToken() => _storage.remove('token');

  String get token => _storage.read('token');

  bool get hasToken => _storage.hasData('token');

  Future<void> setId(String id) => _storage.write('id', id);

  Future<void> removeId() => _storage.remove('id');

  String get id => _storage.read('id');

  bool get hasId => _storage.hasData('id');

  Future<void> setUser(UserModel user) => _storage.write('user', user.toString());

  Future<void> removeUser() => _storage.remove('user');

  UserModel get user => UserModel.fromString(_storage.read('user'));

  bool get hasUser => _storage.hasData('user');


}

class UserModel {
  final String name;
  final String email;
  final int image;

  UserModel({
    required this.name,
    required this.email,
    this.image = 1
  });

  factory UserModel.fromString(String str){
    var json = jsonDecode(str);
    return UserModel(
      name: json['name'],
      email: json['email'],
      image: json['image'] ?? 1
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    int? image
  })=>
      UserModel(
          name: name ?? this.name ,
          email: email ?? this.email ,
          image: image ?? this.image
      );

  @override
  String toString() {
    return jsonEncode({
      'email':email,
      'name':name,
      'image':image
    });
  }

  String get imagePath => AssetsConst.getAvatar(image);
}