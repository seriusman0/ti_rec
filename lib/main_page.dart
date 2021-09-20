import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      body: InteractiveViewer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    labelText: 'Item Name',
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: priceController,
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: fDateController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    labelText: 'Date Of Buy' + DateTime.now().toString(),
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0)),
              child: TextButton(
                onPressed: () {
                  items.add({
                    'name': nameController.text ?? 0,
                    'fDate': DateTime.now(),
                    'price': int.tryParse(priceController.text) ?? 0,
                    'lDate': DateTime.now(),
                    'recomended': false,
                    'note': '',
                  });
                  nameController.text = '';
                  fDateController.text = '';
                  priceController.text = '';
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
