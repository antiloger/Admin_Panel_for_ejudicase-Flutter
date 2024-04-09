import 'package:flutter/material.dart';
import 'package:pone/main.dart';
import 'package:pone/pages/lawyer_approve_view.dart';
import 'package:pone/Util/dbManager.dart';

class LawyerAprrove extends StatefulWidget {
  const LawyerAprrove({Key? key}) : super(key: key);

  @override
  State<LawyerAprrove> createState() => _LawyerAprroveState();
}

class _LawyerAprroveState extends State<LawyerAprrove> {
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
        title: const Text("Lawyer Approve"),
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
    Map<String, dynamic> criteria = {'status': "pending"};

    // Call retrieveSpecificDocs with the collection path and criteria
    try {
      List<Map<String, dynamic>> documents =
          await fbAdmin.retrieveSpecificDocs('Lawyers', criteria);
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
          backgroundImage: NetworkImage(lawyer['avatar']),
        ),
        title: Text(lawyer['Name']),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "license_no: ${lawyer['legal_credentials']['license_number']}"),
            Text("email: ${lawyer['email']}")
          ],
        ),
        subtitleTextStyle: const TextStyle(color: Colors.black45),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LawyerAproveView(
                lawyerName: lawyer['Name'],
                image1: lawyer['legal_documents']['gov_id'],
                image2: lawyer['legal_documents']['liability_insuarance'],
                image3: lawyer['legal_documents']['license_proof'],
                lawid: lawyer['id'],
                onupdate: onupdate,
              ),
            ),
          );
          fetchDocuments();
        },
      ),
      const Divider(
        height: 0,
      ),
    ]);
  }
}
