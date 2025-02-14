import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 130, 56, 8)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final random = Random();
  late List<Student> data;
  @override
  void initState() {
    super.initState();
    data = List.generate(40, (index) {
      return Student(
        name: "Student ${index + 1}",
        id: "64398400${index + 1}",
        sex: random.nextBool() ? 'Female' : 'Male',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My CIS"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: data.map((student) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDetailPage(student: student),
                  ),
                );
              },
              child: studentListItem(
                name: student.name,
                id: student.id,
                sex: student.sex,
                image: student.image,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget studentListItem(
      {required String name,
      required String id,
      required String image,
      required String sex}) {
    return Container(
      color: sex == 'Male'
          ? Color.fromARGB(255, 173, 216, 230) // Light Blue for Male
          : Color.fromARGB(255, 255, 182, 193), // Light Pink for Female
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Hero(
            tag: id,
            child: ClipOval(
              child: Container(
                color: const Color.fromARGB(246, 255, 255, 255),
                width: 100,
                height: 100,
                child: Image.asset(image),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sex,
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                id,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Student {
  final String name;
  final String id;
  final String sex;
  final String image;

  Student(
      {required this.name,
      required this.sex,
      required this.id,
      this.image = "assets/images/student.jpg"});
}

class StudentDetailPage extends StatelessWidget {
  final Student student;

  const StudentDetailPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
        backgroundColor: student.sex == 'Male'
            ? Color.fromARGB(255, 11, 62, 202)
            : Color.fromARGB(255, 189, 102, 9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: student.id,
                child: ClipOval(
                  child: Container(
                    color: student.sex == 'Male'
                        ? Color.fromARGB(255, 11, 62, 202)
                        : Color.fromARGB(255, 189, 102, 9),
                    width: 300,
                    height: 300,
                    child: Image.asset(student.image),
                  ),
                ),
              ),
              Text(
                'Name: ${student.name}',
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(height: 8),
              Text(
                'Id: ${student.id}',
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
