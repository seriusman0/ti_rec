import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Item extends StatelessWidget {
  String documentId;

  Item({this.documentId = 'uf0yMsJZ2HYFytOSQM43'});

  @override
  Widget build(BuildContext context) {
    CollectionReference items = FirebaseFirestore.instance.collection('items');

    return FutureBuilder<DocumentSnapshot>(
      future: items.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['name']} ${data['price']}");
        }

        return Text("loading");
      },
    );
  }
}
