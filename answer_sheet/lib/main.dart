//stateless widget means that cant be rebuild. that means we cant change there appearance or data. it is mutable
//stateful widget means that can be rebuild.it is immutable
//Routes;-the pages or screens are called Routes
//Navigator:- Navigator is a widget that helps us to navigate between the routes
// import 'package:answer_sheet/api_tester/api_file.dart';
import 'package:answer_sheet/provider/count_provider.dart';
import 'package:answer_sheet/screen/student_login_routes.dart';
import 'package:answer_sheet/screen/teacher_login_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //to use provider in code, run changeNotifierProvider in main function
    ChangeNotifierProvider(
        create: (_)=>SubmissionNotifier(), //create a changeNotifier inside create
        child:
        const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//Here , material app is parent for title, theme and primary search
      title: 'Answer Submission',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Answer Submission"),),
        body: const MyPage(), //creates constructor of class myPage
      ),
    );
  }
}
//create an object of httpService and call function apiCall() in  button.
// var httpService =HttpService();

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(//padding is actually make the symmetric distance b/w the edge of border and inset editor.
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child:
        SingleChildScrollView(// it create a box in which single widget can be scrolled
          child:
          Column(
            children: [
              const SizedBox(height: 80,),
              const Center(
                child: Text(
                  "Sign in ",
                  style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40,),
              const Center(
                child: Icon(
                  IconData(0xe559, fontFamily: 'MaterialIcons'),color: Colors.green,size: 150,),
              ),
              const SizedBox(height: 5,),
              Center(
                child:
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const studentLoginRoutes()),
                    );
                    //setState must be called at the time of pressed button
                    // setState(() {});
                  }, child: const Text(
                  "Student",
                  style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal),
                ),
                ),
              ),
              const SizedBox(height: 15,),
              const Center(
                child: Icon(
                  IconData(0xe491, fontFamily: 'MaterialIcons'),
                  size: 150,
                  color: Colors.red,
              ),
              ),
              Center(
                child:
                ElevatedButton(
                  onPressed: (){

                    // httpService.apiCall();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );
                    //setState must be called at the time of pressed button
                    // setState(() {});
                  }, child: const Text(
                  "Teacher",
                  style: TextStyle(fontSize: 23,fontWeight: FontWeight.normal),
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
