import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final locationController = TextEditingController().obs;
  final docId = "".obs;

// Create Employee
  empAdd({
    String? name,
    String? age,
    String? docName,
    String? location,
    BuildContext? context,
  }) async {
    await FirebaseFirestore.instance.collection("Employee").doc(docName).set(
      {
        "name": name,
        "age": age,
        "location": location,
        "nameId":docName,
      },
    );
  }

// update Employee
  final updateNameController = TextEditingController().obs;
  final updateAgeController = TextEditingController().obs;
  final updateLocationController = TextEditingController().obs;

  updateFun({
    String? name,
    String? age,
    String? location,
    BuildContext? context,
  }) async {
    await FirebaseFirestore.instance
        .collection("Employee")
        .doc()
        .update(
      {
        "name": name,
        "age": age,
        "location": location,
      },
    );
  }

  // delete Employee
  deleteEmp({
    BuildContext? context,
    String? name,
  }) async {
    await FirebaseFirestore.instance.collection("Employee").doc(name).delete();
  }
}
