
import 'package:reflectus2/api_service/api_const.dart';
import 'package:reflectus2/core/network/network_helper.dart';
import 'package:reflectus2/core/storage/storage_handler.dart';

class ApiService {


  static Future<void> signIn(String email,String password)async{
    var response = await NetworkHelper().post(
        ApiConst.signIn,
        body: {
          "email": email,
          "password": password
        }
    );
    var token = response.data['token'];
    var id = response.data['id'];
    await StorageHandler().setToken(token.toString());
    await StorageHandler().setId(id.toString());
  }

  static Future<void> signUp({
    required String email,
    required String username,
    required String password1,
    required String password2,
  })async{
    var response = await NetworkHelper().post(
        ApiConst.signUp,
        body: {
          "username": username,
          "email": email,
          "password1": password1,
          "password2": password2
        }
    );
    var token = response.data['token'];
    var id = response.data['id'];
    await StorageHandler().setToken(token.toString());
    await StorageHandler().setId(id.toString());
    await StorageHandler().setUser(UserModel(
        name: username,
        email: email
      )
    );
  }

  static Future<bool> advanceQuestion(String letter,String image)async{
    var response = await NetworkHelper().post(ApiConst.advance,
      body:{
        'expected_letter':letter
      },
      files: {
      'image':image
      }
    );
    return response.data['answer'] ?? false;
  }

  static Future<void> addMessage(String message)async{
    var response = await NetworkHelper().post(ApiConst.addMessage,
        body:{
          "user": StorageHandler().id,
          "message": message
        },
    );
  }

  static Future<List<String>> getAllMessages()async{
    var response = await NetworkHelper().get(ApiConst.allMessages);
    return (response.data as List).map((e) => e.toString()).toList();
  }

}