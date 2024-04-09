import 'package:flutter/material.dart';
import 'package:pone/Util/dbManager.dart';

class LawyerView extends StatefulWidget {
  const LawyerView({Key? key}) : super(key: key);

  @override
  State<LawyerView> createState() => _LawyerView();
}

class _LawyerView extends State<LawyerView> {
  List<Map<String, dynamic>> lawyer = [];

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
        title: const Text("Lawyers"),
      ),
      body: ListView.builder(
          itemCount: lawyer.length,
          itemBuilder: (context, index) {
            return LawyerTile(
              lawyer: lawyer[index],
              onupdate: updateList,
            );
          }),
    );
  }

  void topnom() {
    print("object");
  }

  void fetchDocuments() async {
    // Define your criteria
    Map<String, dynamic> criteria = {'status': "approved"};

    // Call retrieveSpecificDocs with the collection path and criteria
    try {
      List<Map<String, dynamic>> documents =
          await fbAdmin.retrieveSpecificDocs('Lawyers', criteria);
      print(documents);
      setState(() {
        lawyer = documents;
      });
    } catch (e) {
      // Handle any errors
      print('Error fetching documents: $e');
    }
  }
}

class LawyerTile extends StatelessWidget {
  final Map<String, dynamic> lawyer;
  final Function onupdate;

  const LawyerTile({Key? key, required this.lawyer, required this.onupdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(lawyer['avatar'] ?? ''),
        ),
        title: Text(lawyer['Name'] ?? ''),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "license_no: ${lawyer['legal_credentials'] != null ? lawyer['legal_credentials']['license_number'] ?? '' : ''}"),
            Text("email: ${lawyer['email'] ?? ''}"),
            Text("ID: ${lawyer['id'] ?? ''}")
          ],
        ),
        subtitleTextStyle: const TextStyle(color: Colors.black45),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => deletelawyer(lawyer['id']),
        ),
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => bslawyer(
            context,
            lawyer['Name'],
            lawyer['avatar'],
            lawyer['status'],
            lawyer['email'],
            lawyer['mob_number'],
            lawyer['legal_credentials']['license_number'],
            lawyer['legal_credentials']['barAssociations'],
          ),
        ),
      ),
      const Divider(
        height: 0,
      ),
    ]);
  }

  void bbclawyer(
      BuildContext context,
      String name,
      String img,
      String approve,
      String email,
      String mobnumber,
      String licensenumber,
      String barAssociations) {
    print(email);
  }

  Widget bslawyer(
      BuildContext context,
      String name,
      String img,
      String approve,
      String email,
      String mobnumber,
      String licensenumber,
      String barAssociations) {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(name),
          subtitle: const Text("Name"),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: Text(email),
          subtitle: const Text("Email"),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: Text(mobnumber),
          subtitle: const Text("Mobile Number"),
        ),
        ListTile(
          leading: const Icon(Icons.perm_identity),
          title: Text(licensenumber),
          subtitle: const Text("License NO"),
        ),
        ListTile(
          leading: const Icon(Icons.group),
          title: Text(barAssociations),
          subtitle: const Text("Bar Association"),
        ),
        ListTile(
          leading: const Icon(Icons.approval),
          title: Text(approve),
          subtitle: const Text("Status"),
        ),
      ],
    );
  }

  void deletelawyer(String docid) async {
    try {
      await fbAdmin.deleteDoc("Lawyers", docid);

      onupdate();
    } catch (e) {
      print("object");
    }
  }
}


              // lawyer['email'],
              // lawyer['mob_number'],
              // lawyer['legal_credentials']['license_number'],
              // lawyer['license_number']['barAssociations'],