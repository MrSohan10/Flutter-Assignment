import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: SingleChildScrollView(
            child: orientation == Orientation.portrait
                ? const Column(
                    children: [ProfilePic(), Programing()],
                  )
                : const Row(
                    children: [ProfilePic(), Programing()],
                  )));
  }
}

class Programing extends StatelessWidget {
  const Programing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: orientation == Orientation.portrait
          ? size.width/1.05
          : size.width / 1.7,
      child: Column(
        children: [
          const Center(
              child: Text(
            "Mr. Sohan",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
            ),
          ),
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing:
                    10.0, // Adjust this value to reduce main axis spacing
                crossAxisSpacing: 10.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Image.network(
                    'https://img.freepik.com/premium-photo/cartoon-character-with-laptop-his-lap_911330-215.jpg');
              },
            ),
          )
        ],
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircleAvatar(
          radius: orientation == Orientation.portrait ? 180 : size.width / 6,
          backgroundImage: const NetworkImage(
              "https://t4.ftcdn.net/jpg/02/73/46/99/360_F_273469972_ESU9Rq3eIpSrK3xddlIEyDh7vrslbiGg.jpg"),
        ),
      ),
    );
  }
}
