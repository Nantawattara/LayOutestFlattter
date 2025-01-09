import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Student List'),
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
  List<Student> data = [
    Student(
        name: "นันธวัฒน์ แผ่ความดี",
        id: "653450291-6",
        image: 'assets/images/IMG_1336.jpg'),
    Student(
        name: "นายภานุวัฒน์ สารวงษ์",
        id: "653450295-8",
        image: 'assets/images/Paw.jpg'),
    Student(
        name: "	นายวรชิต ทองเลิศ",
        id: "653450298-2",
        image: 'assets/images/woas.jpg'),
    Student(
        name: "นายกฤตชวกร ชวลิตกิตติวงศ์",
        id: "653450279-6",
        image: 'assets/images/kisa.png'),
    Student(
        name: "นายนภสินธุ์ ศรีบุรินทร์",
        id: "653450290-8",
        image: 'assets/images/nopa.jpg'),
    Student(
        name: "นันธวัฒน์ แผ่ความดี",
        id: "653450291-6",
        image: 'assets/images/nanti.jpg'),
    Student(
        name: "นายวรโชติ ทองเลิศ",
        id: "	653450299-0",
        image: 'assets/images/worsha.jpg'),
    Student(
      name: "นายธนาโชค สุวรรณ์",
        id: "653450287-7",
        image: 'assets/images/tnk.jpeg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lay Out Test"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView(
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
              image: student.image,
            ),
          );
        }).toList(),
      ),
    );
  }

  ListTile studentListItem({
    required String name,
    required String id,
    required String image,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      leading: Hero(
        tag: id,
        child: ClipOval(
          child: Image.asset(
            image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(id, style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 75, 217, 56))),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDetailPage(
                student: Student(name: name, id: id, image: image)),
          ),
        );
      },
    );
  }
}

class Student {
  final String name;
  final String id;
  final String image;

  Student({
    required this.name,
    required this.id,
    required this.image,
  });
}

class StudentDetailPage extends StatelessWidget {
  final Student student;

  const StudentDetailPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: student.id,
              child: ClipOval(
                child: Image.asset(
                  student.image,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              student.name,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              student.id,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}