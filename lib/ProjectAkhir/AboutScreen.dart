import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/ProjectAkhir/LoginScreen.dart';
import 'package:finalproject/ProjectAkhir/DrawerScreen.dart';

class AboutScreen extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 40, 25, 25),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF033462),
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/anangfatkur.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Anang Fatkurrohman',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.email,
                            size: 20,
                          ),
                        ),
                        Text(
                          'anangfatkurr@gmail.com',
                          style: TextStyle(color: Colors.blue, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.phone,
                            size: 20,
                          ),
                        ),
                        Text(
                          '085155174699',
                          style: TextStyle(color: Colors.blue, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Container(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                'assets/img/instagram.png',
                              ),
                            )),
                        Text(
                          'anangfatkur',
                          style: TextStyle(color: Colors.blue, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 60,
                                  width: 60,
                                  child: Image.asset('assets/img/gitlab.png')),
                              Text('anangfatkurrr',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 60,
                                  width: 60,
                                  child: Image.asset('assets/img/github.png')),
                              Text('anangfatkur',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        _signOut().then((value) => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                                builder: (context) => LoginScreen())));
                      },
                      child: Text('Sign Out'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
