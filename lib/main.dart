import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/student_viewmodel.dart';
import 'views/student_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Info App",
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white, // Text/icon color
          centerTitle: true,
          elevation: 4, // Shadow depth
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
            minimumSize: const Size(100, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // TEXT THEME - styles all text
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),

      home: ChangeNotifierProvider(
        create: (context) => StudentViewModel(),
        // child: The first screen that can access this ViewModel
        child: const StudentView(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String studentName = "Koketso";
  String favoriteSubject = "TPG316C";
  int subjectIndex = 0;

  List<String> subjects = ["TPG316C", "SOD316C", "CMN316C", "ITS316C"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Student App"),
        actions: [
          IconButton(
            onPressed: () {
              print("Settings pressed");
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StudentInfoCard(
                  studentName: studentName,
                  favoriteSubject: favoriteSubject,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        subjectIndex = (subjectIndex + 1) % subjects.length;
                        favoriteSubject = subjects[subjectIndex];
                      });
                    },
                    child: const Text("Change Subject"),
                  ),
                ),

                Text(
                  "Student Name: $studentName",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text("Favorite subject: $favoriteSubject"),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB pressed");
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({
    super.key,
    required this.studentName,
    required this.favoriteSubject,
  });
  final String studentName;
  final String favoriteSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          Text("Student Name: $studentName", style: TextStyle(fontSize: 24)),
          SizedBox(height: 10),
          Text(
            "Favorite Subject: $favoriteSubject",
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

