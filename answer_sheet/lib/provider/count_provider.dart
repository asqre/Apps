// import 'dart:collection';
// import 'package:answer_sheet/student_data.dart';
// import "package:flutter/foundation.dart";
// //changeNotifier work as a set state , it has a global context
// // create a provider with ChangeNotifier(it actually notify the changes).
// class GlobalProvider   with ChangeNotifier{
//   HashMap map=HashMap<String,Details>();
//
//
// }

import 'dart:async';
import 'dart:convert';
// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

// import 'models.dart';

import 'dart:collection';

// import 'package:flutter/cupertino.dart';

import '../api_tester/api_file.dart';
import '../model/models.dart';

class SubmissionNotifier extends ChangeNotifier {
  final List<Submission> _submissionList = [];

  UnmodifiableListView<Submission> get submissions => UnmodifiableListView(_submissionList);

  void add(Submission submission) {
    var result = _submissionList.firstWhere((element) => element.name == submission.name, orElse: () => Submission( name: "-1", emailAddress: "", file: File(fileName: "", filePath: "", fileSize: "0", localFileName: "")));
    if (result.name == '-1') {
      _submissionList.add(submission);
      notifyListeners();
    }
  }

  void update(Submission submission, int index) {
    _submissionList[index] = submission;
    notifyListeners();
  }

  void delete(int index) {
    _submissionList.removeAt(index);
    notifyListeners();
  }
  //create url variable
  //format is: "http://localhost:8080/login" so just replace local host by $ip.coz,we are using local ip.
  final String addSubmissionRoute = "http://$ip:8080/addSubmission";

  // final String getSubmissionById="http://$ip:8080/getSubmissionById";
  // final String getAllSubmissionByIds="http://$ip:8080/getAllSubmissionByIds";
  final String getAllSubmissions = "http://$ip:8080/getAllSubmissions";
  final String updateSubmissionById = "http:$ip:8080/updateSubmissionById";
  final String deleteSubmissionById = "http:$ip:8080/deleteSubmissionById";
  final String getUrlRequestCounter = "http:$ip:8080/getUrlRequestCounter";


  Future<bool> addSubmission(Submission newSubmission, String filePath) async{
    bool status=false;
    var request=MultipartRequest("POST", Uri.parse(addSubmissionRoute));
    request.fields["data"]=jsonEncode(newSubmission.toJson());
    request.files.add(await MultipartFile.fromPath("file",filePath));
    var response =await request.send();
    debugPrint("hello");
    if (response.statusCode==200){
      debugPrint("uploaded");
      status=true;
    }else{
      // debugPrint(request.fields["data"]);
      status=false;
    }
    return status;
  }

  // //
  // ignore: non_constant_identifier_names
  Future<List<Submission>?> GetAllSubmission() async {
    // const storage = FlutterSecureStorage();
    // headers['secret-code'] = (await storage.read(key: 'secret-code'))!;
    Response response = await get(
        Uri.parse(getAllSubmissions), headers: headers);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      body = body['data'];
      // debugPrint(body.keys.first);
      List<Submission> submission = [];
      if (body.isNotEmpty) {
        body.forEach((key, value) {
          debugPrint(value.toString());
          submission.add(Submission.fromJson(value));
        });
        return submission;
      }
    }
    return null;
  }

  Future<bool> deleteSubmission() async {
    // const storage = FlutterSecureStorage();
    // headers['secret-code'] = (await storage.read(key: 'secret-code'))!;
    // Response response = await delete(Uri.parse(deleteSubmissionById), headers: headers);
    // if (response.statusCode == 200) {
    //   return true;
    // } else {
    //   debugPrint(response.statusCode.toString());
    //   return false;
   return false;
    // }
  }

}