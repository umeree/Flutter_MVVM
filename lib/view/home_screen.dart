import 'package:flutter/material.dart';
import 'package:mvvmarc/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Utils.flushBarErrorMessage("No Internet Connection", context);
          },
            child: Text("Home")),
      ),
    );
  }
}
