import 'package:flutter/material.dart';
import 'package:food/core.dart';
import 'package:food/module/login/login.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage(
                  "assets/img/cat.jpeg",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Admin",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "admin@gmail.com",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Card(
                child: ListTile(
                  title: Text("Settings"),
                  subtitle: Text("Your app settings"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text("TOS"),
                  subtitle: Text("Terms of Service"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text("Privacy Policy"),
                  subtitle: Text("-"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
