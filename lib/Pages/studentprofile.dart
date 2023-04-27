import 'package:attendenceapp/Models/faculty.dart';
import 'package:attendenceapp/Models/student.dart';
import 'package:attendenceapp/Repository/Student/myprofile.dart';
import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<StudentModel?>(
          future: getMyProfileStudent(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            }
            final student = snapshot.data;
            if (student == null) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue[400]!,
                        Colors.blue[800]!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          student.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        const SizedBox(height: 10),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.black.withOpacity(0.1),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          margin: const EdgeInsets.all(0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  'Contact Information',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ListTile(
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                                  leading: const Icon(Icons.email),
                                  title: const Text('Email'),
                                  subtitle: Text(student.email),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.phone),
                                  title: const Text('PRN'),
                                  subtitle: Text(student.prn),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.work),
                                  title: const Text('Department'),
                                  subtitle: Text(student.department),
                                ),
                                ListTile(
                                  leading: Icon(Icons.calendar_today),
                                  title: Text('Start Year'),
                                  subtitle: Text(student.dateofjoining),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.calendar_today),
                                  title: Text('End Year'),
                                  subtitle: Text(student.dateofleaving),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Edit Profile'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[800],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
