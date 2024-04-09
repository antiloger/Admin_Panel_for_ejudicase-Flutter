import 'package:flutter/material.dart';
import 'package:pone/Util/dbManager.dart';
import 'pages/adminhome.dart';

void main() async {
  await fbAdmin.initializeFirebase();
  fetchDocuments();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdminHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Define a function to call retrieveSpecificDocs
void fetchDocuments() async {
  // Define your criteria
  Map<String, dynamic> criteria = {'status': "pending"};

  // Call retrieveSpecificDocs with the collection path and criteria
  try {
    List<Map<String, dynamic>> documents =
        await fbAdmin.retrieveSpecificDocs('Lawyers', criteria);
    // Handle the retrieved documents
    print('Retrieved documents:');
    documents.forEach((doc) {
      print(doc);
    });
  } catch (e) {
    // Handle any errors
    print('Error fetching documents: $e');
  }
}

// Now you can call fetchDocuments from anywhere in your code to retrieve specific documents
