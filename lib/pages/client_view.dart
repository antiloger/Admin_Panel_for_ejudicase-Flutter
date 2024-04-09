import 'package:flutter/material.dart';
import 'package:pone/Util/dbManager.dart';

class ClientView extends StatefulWidget {
  const ClientView({Key? key}) : super(key: key);

  @override
  State<ClientView> createState() => _ClientView();
}

class _ClientView extends State<ClientView> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchDocuments();
  }

  void updateList() {
    fetchDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clients"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return LawyerTile(
              user: users[index],
              onupdate: updateList,
            );
          }),
    );
  }

  void topnom() {
    print("object");
  }

  void fetchDocuments() async {
    try {
      List<Map<String, dynamic>> documents = await fbAdmin.getAllDocs("users");
      print(";pppp -> $documents");
      setState(() {
        users = documents;
      });
    } catch (e) {
      // Handle any errors
      print('Error fetching documents: $e');
    }
  }
}

class LawyerTile extends StatelessWidget {
  final Map<String, dynamic> user;
  final Function onupdate;

  const LawyerTile({Key? key, required this.user, required this.onupdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user['avatar'] ?? ''),
        ),
        title: Text(user['Name'] ?? ''),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Mobile: ${user['mob_number'] ?? ''}"),
            Text("email: ${user['email'] ?? ''}"),
            Text("ID: ${user['id'] ?? ''}")
          ],
        ),
        subtitleTextStyle: const TextStyle(color: Colors.black45),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => deletelawyer(user['id']),
        ),
      ),
      const Divider(
        height: 0,
      ),
    ]);
  }

  void deletelawyer(String docid) async {
    try {
      await fbAdmin.deleteDoc("users", docid);
      onupdate();
    } catch (e) {
      print("object");
    }
  }
}
