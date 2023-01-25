// import 'dart:collection';

// import 'package:answer_sheet/provider/count_provider.dart';
import 'package:answer_sheet/model/models.dart';
import 'package:answer_sheet/provider/count_provider.dart';
import 'package:answer_sheet/screen/student_login_routes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../main.dart';
// import 'package:provider/provider.dart';

// ignore: camel_case_types
class studentData extends StatelessWidget {
  final String idValue;
  const studentData({Key? key, required this.idValue}) : super(key: key); //created a class of studentsData which will take idValue as input argument.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Data"),
        backgroundColor: Colors.blue,
      ),
        body:  StudentDetails( id: idValue,),

    );
  }
}


class StudentDetails extends StatefulWidget { //creating class of StudentDetails which will take id as input argument
  final String id;
  const StudentDetails({Key? key, required this.id,}) : super(key: key);
  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}
//declare controller
// final idController=TextEditingController();

//parent class of _StudentDetailsState is studentDetails
class _StudentDetailsState extends State<StudentDetails> {
  final _nameController=TextEditingController();
  final _emailController=TextEditingController();
  // final _timeController=TextEditingController();
  final _idController=TextEditingController();

  //create _form key to use validation in textFormField
  final _formKey=GlobalKey<FormState>();
  Future<PlatformFile?> _pickFile() async {//it will allow you to take file  using _pickleFile and return future(means ek future ko return karega.)

    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    final result =  await FilePicker.platform.pickFiles(allowMultiple: true); //if u just remove await and u Point on (result) it becomes future.
                                                                        // so for future variable/function we always use await.

    // if no file is picked
    if (result == null) return null;

    // we get the file from result object
    final file = result.files.first;
    return file; //file path is also a future.coz, we don't know we get file or not .so it is future.
  }

  // Future<String?> _pickFile() async {
  //   // opens storage to pick files and the picked file or files
  //   // are assigned into result and if no file is chosen result is null.
  //   // you can also toggle "allowMultiple" true or false depending on your need
  //   //Todo:check permission handler
  //   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  //
  //   // if no file is picked
  //   if (result == null) return "";
  //
  //   // we will log the name, size and path of the
  //   // first picked file (if multiple are selected)
  //   // debugPrint(result.files.first.n
  //   return result.files.single.path;
  // }


  @override
  Widget build(BuildContext context) {//context store the widget location in widget tree
    //create an object of class globalProvider
    //to use provider in scaffold we create a object globalProvider.
    // final globalProvider = Provider.of<GlobalProvider>(context,listen:false);
    //initialize it later
    late Submission submission;
    final submissionProvider=Provider.of<SubmissionNotifier> (context, listen: false);
    return Form(
      key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child:
            SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  Center(
                    child: Text(
                      "Id : ${widget.id}", //it will return a widget and widget has value id. so, to print ID, we type "$widget.id" for formatting use $.
                      style: const TextStyle(color:Colors.blue,fontSize: 55,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                   children:  [
                     const Text("Name : ",
                     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     const SizedBox(width: 30,),
                     SizedBox(
                       width: 200,
                       height: 70,
                       child:
                       TextFormField(
                         validator: (value){
                           if(value==null || value.isEmpty){
                             return "Enter your name";
                           }
                           return null;
                         },
                         controller: _nameController,
                         decoration: const InputDecoration(
                           border: OutlineInputBorder(
                           ),
                           hintText: "abc",
                           labelText: "Enter your Name",
                         ),
                       ),
                     ),
                   ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children:  [
                      const Text("Email :  ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(width: 30,),
                      SizedBox(
                        width: 200,
                        height: 70,
                        child:
                        TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return "Enter your mail id";
                            }
                            return null;
                          },
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                            ),
                            hintText: "xyz@gmail.com",
                            labelText: "Enter your email Id",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children:  [
                      const Text("File :  ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(width: 50,),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child:
                        MaterialButton(
                          onPressed: () async{
                            var localFilePath =await _pickFile(); //this will take file path as a string.as it is variable under future function.so, type await.
                            // ignore: use_build_context_synchronously
                            //create an object localFile of class file
                            File localFile=File(fileName: localFilePath?.name,localFileName: localFilePath?.name,filePath: localFilePath?.path); //filename and localFilePath have same name for a file.
                            //create an object of class Submission
                            submission = Submission(name: _nameController.text, emailAddress: _emailController.text, file: localFile);//we cant type await here,'await' applied to 'Submission', which is not a 'Future
                          },
                          color: Colors.green,
                          child: const Text(
                            'Upload file',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        // TextFormField(
                        //   controller: nameController,
                        //   decoration: const InputDecoration(
                        //     border: OutlineInputBorder(
                        //     ),
                        //     hintText: "xyz@gmail.com",
                        //     labelText: "Enter your email Id",
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          debugPrint("valid");
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const MyApp(),
                              )).then((value) {
                            _idController.clear();
                            _nameController.clear();
                            _emailController.clear();
                            // passwordController.clear();
                          });
                        }
                        //creating an object of class
                        // var data=Details(id: idController.text, name: nameController.text, email: emailController.text);
                        // globalProvider.map[idController.text]=data;
                        await submissionProvider.addSubmission(submission,submission.file.filePath!);
                      }, child: const Text("Submit")),
                  const SizedBox(height: 30,),
                  ]
              ),
            )
        ),
    );
  }
}
