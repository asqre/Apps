import 'package:answer_sheet/screen/student_data.dart';
import 'package:flutter/material.dart';
//todo: filename as  a class name


// ignore: camel_case_types
class studentLoginRoutes extends StatelessWidget {
  const studentLoginRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Login Credential'),
        backgroundColor: Colors.green,
      ),
      body: const StudentLogin(),
    );
  }
}


class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {

  // final nameController=TextEditingController();
  // final passwordController=TextEditingController();
  final _idController=TextEditingController();
  //create a form with global key variable for using validator in textFormField.
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form( //return form for formKey.
        key: _formKey,
        child:
      Padding( //we cant use two times scaffold in a single widget.
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child:
        Column(
          children: [
            const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(width: 10,),
              const Icon(IconData(0xe559, fontFamily: 'MaterialIcons'),color: Colors.green,), const SizedBox(width: 30,),
              const SizedBox(width: 30,),
              SizedBox(
                  width: 200,
                  height: 70,
                  child:
                  TextFormField(
                    // onSaved: ,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null; // return null means if u enter valid value, it will not show any warning.
                    },
                    controller: _idController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "id",
                      labelText: "Enter Id",
                    ),

                  )
              ),
            ],
          ),
            const SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: (){
                      // debugPrint('called');
                      // debugPrint(_idController.text);
                      if(_formKey.currentState!.validate()){ //currentState! means currentState should not be null
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  studentData(idValue: _idController.text.toUpperCase()), //it will take input argument idController as input
                            )).then((value) {
                          _idController.clear();
                          // passwordController.clear();
                        });
                      }

                      // setState(() {}); //no need to rebuild the widget. coz, we want to go on different widget.
                    }, child: const Text("Signin"))
          ],
        )
      )
    );
  }
}
