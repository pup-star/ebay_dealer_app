import 'package:flutter/material.dart';

class TabClothes extends StatelessWidget {
  const TabClothes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            //Get.to(() => const DetailPage());
          },
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.asset("assets/image/hoodie.png"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/profile/hm.png',
                      fit: BoxFit.cover,
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
