import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ti_rec/item_card.dart';

class MainPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fDateController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference items = firestore.collection('items');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(child: Text("TI-REC")),
      ),
      body: Column(children: <Widget>[
        Flexible(
          flex: 5,
          child: ListView(children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: items.orderBy('price', descending: true).snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data.docs
                          .map((e) => ItemCard(e.get('name'), e.get('price'),
                                  onUpdate: () {
                                items.doc(e.id).update({
                                  'price': e.get('price') + 1,
                                });
                              }, onDelete: () {
                                items.doc(e.id).delete();
                              }))
                          .toList(),
                    );
                  } else {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[Center(child: Text('Loading'))]);
                  }
                }),
            Flexible(
              flex: 1,
              child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {
                    print('pressed');
                  }),
            ),
          ]),
        ),
      ]),
    );
  }
}
