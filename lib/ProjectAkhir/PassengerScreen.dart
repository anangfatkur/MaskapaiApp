import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/ProjectAkhir/DrawerScreen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'Models/passenger_model.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({Key? key}) : super(key: key);

  @override
  _PassengerScreenState createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  int currentPage = 1;

  late int totalPages;

  List<Passenger> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    final Uri uri = Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = passengersDataFromJson(response.body);

      if (isRefresh) {
        passengers = result.data;
      } else {
        passengers.addAll(result.data);
      }
      currentPage++;

      totalPages = result.totalPages;

      print(response.body);
      setState(() {});

      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        title: Text('Data Penumpang Pesawat'),
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getPassengerData(isRefresh: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getPassengerData();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: ListView.separated(
          itemBuilder: (context, index) {
            final passenger = passengers[index];

            return ListTile(
              title: Text(passenger.name),
              subtitle: Text(passenger.airline.country),
              trailing: Text(passenger.airline.name),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: passengers.length,
        ),
      ),
    );
  }
}
