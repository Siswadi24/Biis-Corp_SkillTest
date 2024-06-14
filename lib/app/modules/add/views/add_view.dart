import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Form'),
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                //Event Title Form
                const SizedBox(height: 15),
                GetBuilder<AddController>(
                  builder: (_) => TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      label: Text("Name"),
                      border: OutlineInputBorder(),
                      hintText: "Insert Name",
                    ),
                  ),
                ),

                //Event Location Form
                const SizedBox(height: 15),
                GetBuilder<AddController>(
                  builder: (_) => TextFormField(
                    controller: controller.jobController,
                    decoration: const InputDecoration(
                      label: Text("Job"),
                      border: OutlineInputBorder(),
                      hintText: "Insert Your Job",
                    ),
                  ),
                ),

                //Tombol Submit
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width,
                  child: FilledButton(
                    onPressed: () async {
                      await controller.createUser(
                        controller.nameController.text,
                        controller.jobController.text,
                      );

                      // Update state setelah createUser
                      controller.update();
                    },
                    child: const Text("Create"),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width,
                  child: FilledButton(
                    onPressed: () async {
                      await controller.updateUser(
                        controller.nameController.text,
                        controller.jobController.text,
                      );

                      // Update state setelah createUser
                      controller.update();
                    },
                    child: const Text("Update"),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width,
                  child: FilledButton(
                    onPressed: () async {
                      await controller.updateUser(
                        controller.nameController.text,
                        controller.jobController.text,
                      );

                      // Update state setelah createUser
                      controller.update();
                    },
                    child: const Text("Update Menggunakan Patch"),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width,
                  child: FilledButton(
                    onPressed: () async {
                      await controller.deleteUser();

                      // Update state setelah createUser
                      controller.update();
                    },
                    child: const Text("Delete"),
                  ),
                ),

                // Menampilkan data hasil created
                const SizedBox(height: 15),
                const Text("Result: ", style: TextStyle(fontSize: 20)),
                GetBuilder<AddController>(
                  builder: (_) => Text(controller.response.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
