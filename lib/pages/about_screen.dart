import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static const routeName = '/about-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About us'),
      ),
      drawer: const MainDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 60),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Text('Delecious Meals For You.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 27), softWrap: true, textAlign: TextAlign.center,)),
            SizedBox(height: 10,),
            Center(child: Text('Meals App', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),),
            Center(child: Text('Version 1.0.0', style: TextStyle(fontSize: 13, fontFamily: 'RobotoCondensed'),),),
          ],
        ),
      )
    );
  }
}