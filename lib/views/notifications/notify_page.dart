import 'package:flutter/material.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Notify"),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset('assets/profile/hm.png'),
                title: Text(
                  "New Message Notify",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                trailing: Icon(Icons.notifications),
              ),
            );
          }),
    );
  }
}
