// import 'dart:convert';
import 'dart:async';
import 'dart:convert';
// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../model/models.dart';

//no need to write http, coz, http is already imported.
// class HttpService{
//   Future apiCall() async{
//     //Error resolve: "Error: XMLHttpRequest error." in terminal
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     };
//     Response response=await get(Uri.parse("http://localhost:8080/getAllSubmissions"));
//     debugPrint(response.statusCode.toString());
// }
// }
//
String ip="192.168.1.176";
var headers={'Content-Type': 'application/json; charset=UTF-8'};


class HttpService {
  
  //create url variable
  //format is: "http://localhost:8080/login" so just replace local host by $ip.coz,we are using local ip.
  final String addSubmissionRoute = "http://$ip:8080/addSubmission";

  // final String getSubmissionById="http://$ip:8080/getSubmissionById";
  // final String getAllSubmissionByIds="http://$ip:8080/getAllSubmissionByIds";
  final String getAllSubmissions = "http://$ip:8080/getAllSubmissions";
  final String updateSubmissionById = "http://$ip:8080/updateSubmissionById";
  final String deleteSubmissionById = "http://$ip:8080/deleteSubmissionById";
  final String getUrlRequestCounter = "http://$ip:8080/getUrlRequestCounter";


  Future<bool> addSubmission(Submission newSubmission, String filePath) async{
    bool status=false;
    var request=MultipartRequest("POST", Uri.parse(addSubmissionRoute));
    request.fields["data"]=jsonEncode(newSubmission.toJson());
    request.files.add(await MultipartFile.fromPath("Upload File",filePath));
    var response =await request.send();
    if (response.statusCode==200){
      debugPrint("uploaded");
      status=true;
    }else{
      debugPrint(request.fields["data"]);
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
    debugPrint("step -1");
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      // body = body['1'];
      // debugPrint(body.keys.first);
      List<Submission> submission = [];
      if (body.isNotEmpty) {
        debugPrint(body.toString());
        body.forEach((key, value) {
          debugPrint(value.toString());
          submission.add(Submission.fromJson(value));
        });
        return submission;
      }
    }
    return null;
  }

  Future<bool> deleteSubmission(String index) async {
    // const storage = FlutterSecureStorage();
    // headers['secret-code'] = (await storage.read(key: 'secret-code'))!;
    Response response = await post(Uri.parse(deleteSubmissionById), headers: headers, body: jsonEncode({'Id': index}));
    if (response.statusCode == 200) {
      return true;
    } else {
      debugPrint(response.statusCode.toString());
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  Future UpdateSubmissionById(String index) async {
    Response response = await post(Uri.parse(updateSubmissionById), headers: headers,body: jsonEncode({'Id': index}));
    if (response.statusCode == 200) {
      debugPrint("File Received");
    } else {
      return;
    }
  }

  // // API call for addSubmission request
  // Future AddSubmission(User user) async {
  //   Response response = await post(Uri.parse(addSubmission),
  //       body: JsonEncoder(user.toJson()), headers: headers);
  //   if (response.statusCode == 200) {
  //     debugPrint("Successfully Submitted");
  //   } else {
  //     return;
  //   }
  // }

  // Future GetSubmissionById(User user) async {
  //   Response response = await post(Uri.parse(getSubmissionById),
  //       body: JsonEncoder(user.toJson()), headers: headers);
  //   if (response.statusCode == 200) {
  //     debugPrint("File Achieved");
  //   } else {
  //     return;
  //   }
  // }



  //
  // Future DeleteSubmissionById() async {
  //   Response response = await post(Uri.parse(deleteSubmissionById),
  //       body: JsonEncoder(user.toJson()), headers: headers);
  //   if (response.statusCode == 200) {
  //     debugPrint("File Received");
  //   } else {
  //     return;
  //   }
  // }
  //
  // Future GetUrlRequestCounter(User user) async {
  //   Response response = await post(Uri.parse(getUrlRequestCounter),
  //       body: JsonEncoder(user.toJson()), headers: headers);
  //   if (response.statusCode == 200) {
  //     debugPrint("File Received");
  //   } else {
  //     return;
  //   }
  // }


}



// class HttpService extends StatefulWidget {
//   const HttpService({Key? key}) : super(key: key);
//
//   @override
//   State<HttpService> createState() => _HttpServiceState();
// }
//
// String stringResponse="null";
// class _HttpServiceState extends State<HttpService> {
//   Future apiCall()async{
//     Response response;
//     response=await get(Uri.parse("http://localhost:8080/"));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
