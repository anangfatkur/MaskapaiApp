import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:finalproject/ProjectAkhir/LoginScreen.dart';

class DrawerScreen extends StatefulWidget {
  // Future<void> _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  // }

  @override
  _DrawwerScreenState createState() => _DrawwerScreenState();

  // FirebaseAuth auth = FirebaseAuth.instance;

  // if (auth.currentUser != null) {
  //   print(auth.currentUser!.email);
  // }
}

class _DrawwerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("Anang Fatkurrohman"),
          currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/img/anangfatkur.jpg")),
          accountEmail: Text("anangfatkurrr@gmail.com"),
        ),
        DrawerListTile(
          iconData: Icons.account_circle,
          title: "Profile",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.notifications,
          title: "Notifications",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.book_online,
          title: "Schedule",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.settings,
          title: "Setting",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.arrow_back,
          title: "Sign Out",
          onTilePressed: () {
            // _signOut().then((value) => Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => LoginScreen())));
          },
        ),
        // Container(
        //     child: ElevatedButton(
        //         onPressed: () {
        //           _signOut().then((value) => Navigator.of(context)
        //               .pushReplacement(MaterialPageRoute(
        //                   builder: (context) => LoginScreen())));
        //         },
        //         child: Text('Sign Out'))),
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
