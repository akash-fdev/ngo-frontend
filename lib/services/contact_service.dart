import 'package:cloud_firestore/cloud_firestore.dart';

class ContactService {
  final CollectionReference contacts =
      FirebaseFirestore.instance.collection("contacts");

  Future<void> submitForm({
    required String name,
    required String subject,
    required String phone,
    required String message,
  }) async {
    try {
      await contacts.add({
        "name": name,
        "subject": subject,
        "phone": phone,
        "message": message,
        "createdAt": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception("Failed to submit form: $e");
    }
  }
}
