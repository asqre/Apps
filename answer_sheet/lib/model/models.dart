//MultiPart request is used to take file from Postman
// import 'package:flutter/material.dart';
class StudentDetails{
  final String id;
  final String name;
  final String email;
  StudentDetails({
    required this.id,
    required this.name,
    required this.email,
  });
}


class File{
  String? fileName;
  String? localFileName;
  String? fileSize;
  String? filePath;
  File({ //creating constructor of class file.
    this.fileName,
    this.localFileName,
    this.fileSize,
    this.filePath,
  });
  //A factory constructor is a constructor that can be used when you don't necessarily want a constructor to create a new instance/object of your class
  factory File.fromJson(Map<String,dynamic> json){ //fromJson factory constructor initializes a final variable from a JSON object.
    return File(fileName:json["file_name"],
                localFileName:json["local_file_name"],
                filePath: json["file_path"],
                fileSize: json["file_size"]);
  }
  Map toJson()=>{
    "file_name": fileName,
    "local_file_name":localFileName,
    "file_size":fileSize,
    "file_path":filePath,
  };
  
}


class Submission{
  late String name;
  late String emailAddress;
  late File file;

  factory Submission.fromJson(Map<String,dynamic> json){
    return Submission(
      name: json["student_name"] as String,
      emailAddress:json["student_email_address"] as String,
      file: File.fromJson(json["file"]),
    );
  }

  Submission({
    required this.name,
    required this.emailAddress,
    required this.file,
  });

  Map toJson()=> {
    "student_name":name,
    "student_email_address":emailAddress,
    "file":file.toJson()
  };
}

// class User {
//   late String secretCode;
//
//   User({required String secretCode});
//
//   Map toJson() => {
//     'secretCode': secretCode
//   };
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(secretCode: json['secretCode'] as String);
//   }
// }
