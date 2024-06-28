import 'package:crud/controller/controller.dart';
import 'package:crud/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEmployeeDetails extends StatefulWidget {
  const EditEmployeeDetails({super.key});

  @override
  State<EditEmployeeDetails> createState() => _EditEmployeeDetailsState();
}

class _EditEmployeeDetailsState extends State<EditEmployeeDetails> {
  final controller = Get.put(HomeController());
  setData() {
    controller.updateNameController.value.text = Get.arguments["name"].toString();
    controller.docId.value = Get.arguments["nameId"].toString();
    controller.updateAgeController.value.text = Get.arguments["age"].toString();
    controller.updateLocationController.value.text = Get.arguments["location"].toString();
  }
  @override
  void initState() {
    // TODO: implement initState
    setData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: Text(
                "Update",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Form",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.00, right: 30.00, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10.00),
              ),
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: controller.updateNameController.value,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Age",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10.00),
              ),
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: controller.updateAgeController.value,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Location",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10.00),
              ),
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: controller.updateLocationController.value,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.updateFun(
                    context: context,
                    name: controller.updateNameController.value.text,
                    age: controller.updateAgeController.value.text,
                    location: controller.updateLocationController.value.text
                  );
                  Get.snackbar(
                    "Data Update",
                    "SuccessFully",
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.black,
                  );
                  Get.offAll(const HomePage());
                },
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
