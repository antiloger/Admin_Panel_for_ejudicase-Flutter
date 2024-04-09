import 'package:flutter/material.dart';
import 'package:pone/Util/dbManager.dart';

class LawyerAproveView extends StatefulWidget {
  final String lawyerName;
  final String image1;
  final String image2;
  final String image3;
  final String lawid;
  final Function onupdate;
  const LawyerAproveView(
      {Key? key,
      required this.lawyerName,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.lawid,
      required this.onupdate})
      : super(key: key);

  @override
  State<LawyerAproveView> createState() => _LawyerAproveViewState();
}

class _LawyerAproveViewState extends State<LawyerAproveView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lawyerName),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        children: <Widget>[
          const Text("gov_id"),
          Center(
            child: Image.network(widget.image1),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
          const Text("liability_insuarance"),
          Center(
            child: Image.network(widget.image2),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
          const Text("license_proof"),
          Center(
            child: Image.network(widget.image3),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
          FilledButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () => giveApprove(context, widget.lawid),
            child: const Text("aprove"),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
          FilledButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black26,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () => topnom(),
            child: const Text("Reject"),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
        ],
      ),
    );
  }

  void giveApprove(BuildContext context, String docid) async {
    try {
      await fbAdmin.updateSpecificDoc("Lawyers", docid, {'status': 'approved'});
      widget.onupdate();
      Navigator.pop(context);
    } catch (e) {
      print("object");
    }
  }

  void topnom() {
    print("object");
  }
}
