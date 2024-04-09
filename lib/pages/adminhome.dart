import 'package:flutter/material.dart';
import 'package:pone/pages/client_view.dart';
import 'package:pone/pages/lawyer_approve.dart';
import 'package:pone/Util/dbManager.dart';
import 'package:pone/pages/lawyer_view.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Home"),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.approval),
            title: const Text("Lawyer approvals"),
            subtitle: const Text("to approve the lawyers"),
            trailing: const Icon(Icons.arrow_forward),
            subtitleTextStyle: const TextStyle(color: Colors.black45),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LawyerAprrove(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.gavel),
            title: Text("Lawyer View"),
            subtitle: Text("edit and delete the lawyers"),
            trailing: Icon(Icons.arrow_forward),
            subtitleTextStyle: TextStyle(color: Colors.black45),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LawyerView(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Client View"),
            subtitle: Text("edit and delete the Client"),
            trailing: Icon(Icons.arrow_forward),
            subtitleTextStyle: TextStyle(color: Colors.black45),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ClientView()),
              );
            },
          ),
        ],
      ),
    );
  }

  void fetchDocuments() async {
    // Define your criteria
    Map<String, dynamic> criteria = {'status': "pending"};

    // Call retrieveSpecificDocs with the collection path and criteria
    try {
      List<Map<String, dynamic>> documents =
          await fbAdmin.retrieveSpecificDocs('Lawyers', criteria);
      // Handle the retrieved documents
      print('Retrieved documents:');
      print(documents);
      documents.forEach((doc) {
        print(doc['id']);
      });
    } catch (e) {
      // Handle any errors
      print('Error fetching documents: $e');
    }
  }
}
