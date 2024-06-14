import 'package:get/get.dart';
import 'package:psikotes_app/app/data/model/profile_model.dart';

class ProfileProviderProvider extends GetConnect {
  //Mendapatkan User dari API
  static const _apiUrlUser = 'https://reqres.in/api/users';

  Future<ProfileModel> getUserAPI(int page) async {
    final response = await get("$_apiUrlUser?page=$page");
    if (response.statusCode == 200) {
      return ProfileModel.fromMap(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  //Menambahkan User
  Future<Map> createUserAPI(String name, String job) async {
    final response = await post(_apiUrlUser, {"name": name, "job": job});
    try {
      if (response.statusCode == 201) {
        return response.body;
      } else {
        throw Exception('Failed to create profile');
      }
    } catch (e) {
      print("Exception $e");
      rethrow;
    }
  }

  // Mengupdate User Method PUT
  Future<Map> updateUserAPI(String id, String name, String job) async {
    final response = await put('$_apiUrlUser/$id', {"name": name, "job": job});
    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to update profile: ${response.statusText}');
      }
    } catch (e) {
      print("Exception $e");
      rethrow;
    }
  }

  // Mengupdate User Method PATCH
  Future<Map> updateUserAPIPatch(String id, String name, String job) async {
    final response = await put('$_apiUrlUser/$id', {"name": name, "job": job});
    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to update profile: ${response.statusText}');
      }
    } catch (e) {
      print("Exception $e");
      rethrow;
    }
  }

  // Menghapus User
  Future<void> deleteUserAPI(String id) async {
    final response = await delete('$_apiUrlUser/$id');
    try {
      if (response.statusCode != 204) {
        throw Exception('Failed to delete profile: ${response.statusText}');
      }
    } catch (e) {
      print("Exception $e");
      rethrow;
    }
  }
}

  // @override
  // void onInit() {
  //   httpClient.baseUrl = 'YOUR-API-URL';
  // }

