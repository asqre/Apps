import 'package:answer_sheet/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api_tester/api_file.dart';
import '../model/models.dart';

class AllSubmissionsScreen extends StatelessWidget {
  const AllSubmissionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submitted Sheet',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: const AllSubmissionsApp(),
    );
  }
}

class AllSubmissionsApp extends StatefulWidget {
  const AllSubmissionsApp({super.key});

  @override
  State<AllSubmissionsApp> createState() => _AllSubmissions();
}

class _AllSubmissions extends State<AllSubmissionsApp> {
  // User user = User(secretCode: "");
  final httpService = HttpService();

  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<SubmissionNotifier>(context).submissions.isEmpty){
      return SizedBox(
        width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Empty")
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: Provider.of<SubmissionNotifier>(context).submissions.length,
      itemBuilder: (context, int index) {
        return getCard(context, index, () {
          setState(() {});
        });
      },
    );
  }

  Future<void> asyncInit() async {
    List<Submission>? result = await httpService.GetAllSubmission();
    // debugPrint('result');
    // result?.forEach((element) {debugPrint(element.name);});
    // Provider.of<SubmissionNotifier>(context, listen: false).addListener(() {mounted?setState((){}):null;});
    result?.forEach(
            (e) => Provider.of<SubmissionNotifier>(context, listen: false).add(e));
  }
}

dialog(context, index) async => showDialog<String>(
  context: context,
  builder: (BuildContext context) => AlertDialog(
    title: const Text('Confirmation'),
    content:
    const Text('Do you want to delete this submission?'),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('No'),
      ),
      TextButton(
        onPressed: () async {
          //create an object of httpService.
          final httpService = HttpService();
          if (await httpService.deleteSubmission(index.toString())) {
            debugPrint("delete hit");
            Provider.of<SubmissionNotifier>(context, listen: false).delete(index);
            Navigator.pop(context);
          }
        },
        child: const Text('Yes'),
      ),
    ],
  ),
);

// todo use https for https
//InkWell class in Flutter is a rectangular area in Flutter of a material that responds to touch in an application
InkWell getCard(BuildContext context, int index, void Function() setState) {
  SubmissionNotifier submissionNotifier =
  Provider.of<SubmissionNotifier>(context, listen: true);
  return InkWell(
    // onTap: () {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => EditSubmissionScreen(index: index),
    //       ));
    //   // Navigator.pushNamed(context, '/editSubmission',arguments: Provider.of<SubmissionNotifier>(context).submissions[index]);
    // },
    child: Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blue)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Submission logo
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.file_open,color: Colors.green,),
            ),

            // Display student name in submission
            SizedBox(
                width: 200,
                child: Text(submissionNotifier.submissions[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold))),

            // Delete submission
            IconButton(
                onPressed: () async {
                  dialog(context, index);
                },
                icon: const Icon(Icons.delete,color: Colors.red,))
          ],
        ),
      ),
    ),
  );
}