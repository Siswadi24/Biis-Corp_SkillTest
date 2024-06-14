import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/provider/profile_provider_provider.dart';

class AddController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  Map response = {};
  String? createdUserId;

  // Membuat controller tambah User
  Future<void> createUser(String name, String job) async {
    try {
      response = await ProfileProviderProvider().createUserAPI(name, job);
      createdUserId =
          response['id']; // Asumsikan response berisi ID user yang dibuat
      Get.snackbar('Success', 'User created successfully');
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      nameController.clear();
      jobController.clear();
    }
  }

  // Update Controller User
  Future<void> updateUser(String name, String job) async {
    if (createdUserId == null) {
      Get.snackbar('Error', 'No user created to update');
      return;
    }
    try {
      response = await ProfileProviderProvider()
          .updateUserAPI(createdUserId!, name, job);
      Get.snackbar('Success', 'Profile updated successfully');
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      nameController.clear();
      jobController.clear();
    }
  }

  // Delete Controller User
  Future<void> deleteUser() async {
    if (createdUserId == null) {
      Get.snackbar('Error', 'No user created to delete');
      return;
    }
    try {
      await ProfileProviderProvider().deleteUserAPI(createdUserId!);
      Get.snackbar('Success', 'User deleted successfully');
      createdUserId = null;
      response = {}; // Kosongkan response setelah penghapusan
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      nameController.clear();
      jobController.clear();
    }
  }

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
