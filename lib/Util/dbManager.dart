import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseManager fbAdmin = FirebaseManager();
final AuthManager authAdmin = AuthManager();

class FirebaseManager {
  static FirebaseFirestore db =
      FirebaseFirestore.instance; //initial intializing with empty instanc e

  Future<void> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    db = FirebaseFirestore.instance;
  }

  Future<List<Map<String, dynamic>>> retrieveSpecificDocs(
      String collectionPath, Map<String, dynamic> criteria) async {
    try {
      Query query = FirebaseFirestore.instance.collection(collectionPath);
      criteria.forEach((key, value) {
        print("key : $key and value : $value");
        if (value is Map) {
          value.forEach((nestedKey, nestedValue) {
            query = query.where('$key.$nestedKey', isEqualTo: nestedValue);
          });
        } else {
          print("this query will be executed");
          query = query.where(key, isEqualTo: value);
        }
      });

      QuerySnapshot querySnapshot = await query.get();
      List<Map<String, dynamic>> docs = []; // array that wull be returned
      for (var doc in querySnapshot.docs) {
        print("doc data : ${doc.data()}");
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        docs.add(data);
      }

      print('Specific documents retrieved successfully');
      return docs;
    } catch (e) {
      print('Error retrieving specific documents: $e');
      throw e; // Or handle the exception as needed
    }
  }

  Future<void> updateSpecificDoc(String collectionPath, String docId,
      Map<String, dynamic> fieldsToUpdate) async {
    try {
      // Get a reference to the document
      DocumentReference docRef =
          FirebaseFirestore.instance.collection(collectionPath).doc(docId);

      // Update the specified fields
      await docRef.update(fieldsToUpdate);

      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
      throw e; // Or handle the exception as needed
    }
  }

  Future<List<Map<String, dynamic>>> getAllDocs(String collection) async {
    List<Map<String, dynamic>> allDocs = [];
    QuerySnapshot<Object?> querySnapshot =
        await db.collection(collection).get();
    for (var doc in querySnapshot.docs) {
      //print(doc.data());
      Map<String, dynamic> tempDataHold = doc.data() as Map<String, dynamic>;
      tempDataHold["id"] = doc.id;
      allDocs.add(tempDataHold);
    }
    return allDocs;
  }

  Future<void> deleteDoc(String collectionName, String docID) async {
    try {
      await db.collection(collectionName).doc(docID).delete();
      print(
          "Document with ID $docID successfully deleted from collection $collectionName.");
    } catch (e) {
      print("Error deleting document: $e");

      throw e; // Rethrowing the error for caller to handle
    }
  }
}

class AuthManager {
  static FirebaseAuth fbAuth = FirebaseAuth.instance;

  Future<User?> signInUser(
      {required String emailAddr, required String Passwd}) async {
    try {
      final credential = await fbAuth.signInWithEmailAndPassword(
          email: emailAddr, password: Passwd);
      final User? user = credential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<void> signOutUser() async {
    await fbAuth.signOut();
  }
}
