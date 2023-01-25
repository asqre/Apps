import 'package:answer_sheet/api_tester/api_file.dart';
import 'package:flutter/material.dart';
import 'get_all_submission.dart';

// ignore: camel_case_types
class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Login Credential'),
        backgroundColor: Colors.red,
      ),
      body: const TeacherLogin(),
    );
  }
}


class TeacherLogin extends StatefulWidget {
  const TeacherLogin({Key? key}) : super(key: key);
  @override
  State<TeacherLogin> createState() => _TeacherLoginState();
}
// ignore: non_constant_identifier_names
var SubmittedAnswer = HttpService();


class _TeacherLoginState extends State<TeacherLogin> {
  // final nameController=TextEditingController();
  final passwordController=TextEditingController();
  final idController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child:


              Column(
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const SizedBox(width: 10,),
                      const Icon(IconData(0xe491  , fontFamily: 'MaterialIcons'),color: Colors.green,), const SizedBox(width: 30,),
                      const SizedBox(width: 30,),
                      SizedBox(
                          width: 200,
                          height: 70,
                          child:
                          TextFormField(
                            controller: idController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "id",
                              labelText: "Enter Id",
                            ),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const SizedBox(width: 10,),
                      const Icon(IconData(0xe47a, fontFamily: 'MaterialIcons'),color: Colors.blue,), const SizedBox(width: 30,),
                      const SizedBox(width: 30,),
                      SizedBox(
                          width: 200,
                          height: 70,
                          child:
                          TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "******",
                              labelText: "Enter Password",
                            ),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AllSubmissionsScreen()),
                            );
                            // SubmittedAnswer.GetAllSubmissions();
                            idController.clear();
                            passwordController.clear();
                            setState(() {});
                          }, child: const Text("Get all sheets"))
                ],
              )


      ),
    );
  }
}
