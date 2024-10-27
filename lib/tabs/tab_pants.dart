import 'package:flutter/material.dart';

class TabPants extends StatelessWidget {
  const TabPants({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            //Get.to(() => const PantDetails());
          },
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.asset("assets/image/pants.png"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/profile/logo_levi.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: const Text(
                    "Coca Cola",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: const Text("coke"),
                  trailing: const Text("\$ 100"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
