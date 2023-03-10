
import 'package:flutter/material.dart';
import 'package:go_wake_app/home/widgets/custom_drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(centerTitle: true,
      title:  Image.asset(
          'lib/assets/logo_bar.png',
          height: 30,
        ),
        iconTheme: const IconThemeData(color: Colors.white),

        actions: const [

        ],
      ),
    );
  }

}