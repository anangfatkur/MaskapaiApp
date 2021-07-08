import 'package:flutter/material.dart';
import 'package:finalproject/ProjectAkhir/DrawerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  get item => null;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
      drawer: DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Welcome,\n",
                    style: TextStyle(color: Colors.blue[200]),
                  ),
                  TextSpan(
                      text: auth.currentUser!.email,
                      style: TextStyle(color: Color(0xFF033462), fontSize: 20)),
                ],
              ),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: TextField(
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, size: 25),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Search',
              )),
            ),
            SizedBox(height: 10),
            Text(
              "Maskapai Penerbangan",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            Divider(),
            // SizedBox(
            //   height: 150,
            //   child: GridView.count(
            //     padding: EdgeInsets.all(6),
            //     crossAxisCount: 2,
            //     childAspectRatio: 1.491,
            //     crossAxisSpacing: 10,
            //     physics: NeverScrollableScrollPhysics(),
            //     children: [
            //       // for (var item in programminglanguage)
            //       for (var item in datamaskapai)
            // Container(
            //   margin: EdgeInsets.only(
            //     right: 5.0,
            //     left: 5,
            //     bottom: 5,
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 2, bottom: 2),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Image.asset(
            //           'assets/img/$item.png',
            //           height: 50,
            //           width: 50,
            //         ),
            //         Text('$item', style: TextStyle(fontSize: 10)),
            //       ],
            //     ),
            //   ),
            // ),
            //     ],
            //   ),
            // )

            SizedBox(
              height: 250,
              child: GridView.count(
                padding: EdgeInsets.all(5),
                crossAxisCount: 2,
                childAspectRatio: 1.491,
                crossAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  for (var country in datamaskapai)
                    Container(
                      margin: EdgeInsets.only(
                        right: 5.0,
                        left: 5,
                        bottom: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/img/$country.png',
                              width: 100,
                              height: 50,
                            ),
                            Text('$country', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// final places = ["Tokyo", "Berlin", "Roma", "Monas", "London", "Paris"];
final datamaskapai = [
  "singapore",
  "garudaindonesia",
  "eva",
  "emirates",
  "japan",
  "thai"
];
