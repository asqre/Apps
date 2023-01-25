//Hot Reload:- it is a feature in Flutter that allows you to quickly and easily update the code.
//key? key :- means it can take null value as well
//padding is actually a space between its content and border.
// MaterialApp is used once in whole Program. there must be scaffold used with material app.
// routing means In flutter, the pages or screens are called Routes
// if there is single item used in row/column, then use child , whereas for multiple item , we use children
import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}
//widget means simply interface
//state means stithi for visualization of code convert in hindi
class CallDetails{
  final String name; //we declare variable having data type first letter capital
  final String email; //final is a keyword in Java and other programming languages that indicates that a variable or field is a constant and cannot be reassigned.
  final String phoneNo;
  CallDetails({ //creating constructor
    required this.name, //required is a keyword that can be used in the constructor of a class to indicate that a particular parameter is required
    required this.email,
    required this.phoneNo,
});
}
//create a list to append person detail
// ignore: non_constant_identifier_names
List<CallDetails> SavedContacts=[
  CallDetails(name: "xyz", email: "xyz@gmail.com", phoneNo: "1234")
];

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //as it is a widget function. so, it must return widget. so, widget materialApp is returning.
        debugShowCheckedModeBanner: false,// command to remove debug banner from android screen. by-default, it is true.
        title: 'Contact List', //here, variable is declared only, it is not getting printed
        theme: ThemeData(
          // This is the theme of your application.
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold( //visual structure of app
          appBar: AppBar(title: const Text("Contact List"),), //print the title in the appBar
          body: const AppView(), //it gives the object of AppView
        )
    );
  }
// return const Placeholder();
}
// MaterialApp is used only once in code. coz, it is front widget.

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

final phoneController=TextEditingController();
final nameController=TextEditingController();
final emailController=TextEditingController();

class _AppViewState extends State<AppView> {
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//as materialApp is used. so , we use scaffold.coz, material app is used only one times
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child:
          SingleChildScrollView(child: //SingleChildScrollView is a widget in Flutter that allows a single child to be scrolled
          Column(
            children: [
              const SizedBox(height: 20,), // it is apparent height b/w Appbar and name box i.e 20
              Row(
                children: [
                  const SizedBox(width: 10,),
                  const Icon(IconData(0xe18f, fontFamily: 'MaterialIcons'),color: Colors.blue,),
                  const SizedBox(width: 30,),
                  SizedBox(
                    width: 250,
                    height: 70,
                    child:
                        //Always use textFormField rather than TextField .coz, it has validators(
                    // The validator field takes in the user input and checks to see if it satisfies our given condition). and more properties
                    TextFormField( //TextField/TextFormField is a widget in Flutter that allows the user to enter a single line of text
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        hintText: "abc",
                        labelText: "Enter Name",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const SizedBox(width: 10,),
                  const Icon(IconData(0xe22a, fontFamily: 'MaterialIcons'),color: Colors.blue,),
                  const SizedBox(width: 30,),
                  SizedBox(
                    width: 250,
                    height: 70,
                    child:
                    TextFormField( //TextField is a widget in Flutter that allows the user to enter a single line of text
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        hintText: "syz@gmail.com",
                        labelText: "Enter Email Id",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const SizedBox(width: 10,),
                  const Icon(IconData(0xe4a2, fontFamily: 'MaterialIcons'),color: Colors.blue,),
                  const SizedBox(width: 30,),
                  SizedBox(
                    width: 250,
                    height: 70,
                    child:
                    TextFormField( //TextField is a widget in Flutter that allows the user to enter a single line of text
                      controller: phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        hintText: "+91-xxxxxxxxx",
                        labelText: "Enter Phone No",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Expanded( //it is used to cover whole area
                    child:
                    ElevatedButton(onPressed: ()=> {
                      nameController.clear(),
                      emailController.clear(),
                      phoneController.clear(),
                    }, child: const Text("Reset",),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(
                      child:
                      ElevatedButton(
                          onPressed: (){
                            //append the particular data to the list
                            SavedContacts.add(CallDetails(name: nameController.text, email: emailController.text, phoneNo: phoneController.text));
                            for(int i=0;i<SavedContacts.length;i++){
                              debugPrint(SavedContacts[i].name); //always use debugPrint to print list of item
                            }

                            phoneController.clear();
                            emailController.clear();
                            nameController.clear();
                            setState(() {});
                          }, child: const Text("Submit"))

                  ),

                ],
              ),
              const SizedBox(height: 30,),
              SizedBox(height: 300,
                // padding: const EdgeInsets.all(16),// edge-insets means give space from edge to insets of any box assume
                // decoration: BoxDecoration(
                //   color: Colors.lightBlueAccent,
                //   border: Border.all()
                // ),
                child:ListView.builder( //it is a widget in Flutter that allows you to create a list of items that scrolls horizontally or vertically.
                    itemCount: SavedContacts.length,
                    itemBuilder: (context,index) { //In Flutter, the itemBuilder is a callback function that's used to build the items in a ListView

                      final item=SavedContacts[index];
                      //controller is used to take data from text-field
                      return Row(children: [
                        Expanded(child: Column(
                          children: [
                            const SizedBox(height: 6,),
                            Text(item.name),
                            const SizedBox(height: 4,),
                            Text(item.email),
                            const SizedBox(height: 4,),
                            Text(item.phoneNo),
                            const SizedBox(height: 6,),
                          ],
                        ),
                        ),
                        ElevatedButton.icon(onPressed: (){
                          //to edit the contact details, we use dialogue box
                          showDialog(context: context, builder: build);
                          setState((){});
                        }, icon: const Icon(Icons.edit),label: const Text("")),
                        const SizedBox(width: 6,),
                        ElevatedButton.icon(onPressed: ()=> {
                          showDialog(
                              context: context,
                              builder: (ctx)=> AlertDialog(
                                title: const Text("Do you really want to delete?"),
                                content: const Text("This user will be deleted."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("No")),
                                    TextButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        }, child: const Text("Yes")),
                                ],
                              ),),
                          SavedContacts.removeAt(index),
                          setState((){}),
                        }, icon:const Icon(Icons.delete),label:const Text(""))
                      ],);
                    }
                ),
              ),
            ],
          )
            ,)
      ),
    );
  }
}

// Widget ShowDialoguePopUp(int index){
//   return Dialog(
//     shape: RoundedRectangleBorder(
//       borderRadius:
//         BorderRadius.circular(20)
//           child:
//         Container(
//         height: 410,
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Text("Update Form",style: TextStyle(fontSize:20,fontWeight:10),)
//             ],
//           ),
//         ),
//     )
//     ),
//
//   );
// }



// class ContactView extends StatefulWidget {
//   const ContactView({Key? key}) : super(key: key);
//
//   @override
//   State<ContactView> createState() => _ContactViewState();
// }

// class _ContactViewState extends  State<AppView> {
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }




// we write that code in stateless, whose value is not changing
// class MyApp extends StatelessWidget {//creating a stateless class of MyApp name in which we are calling stateful class of MyHomePage
//   const MyApp({super.key}); //constructor
//
//   //MyApp is a StatelessWidget that extends the StatelessWidget class and takes a key value in its constructor.
//   // The key is then passed to the parent class's constructor using the super keyword.
//   // The MyApp class overrides the build method to return a MaterialApp widget
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     //we declare some controller for read,edit and clear
//     final nameController=TextEditingController();
//     final emailController=TextEditingController();
//     final phoneController=TextEditingController();
//
//     return MaterialApp( //The MaterialApp widget is a top-level widget . It displays the app's title, initial route, and the app's theme.
//       //to remove banner debug in right side of widget.
//       debugShowCheckedModeBanner: false,
//       title: 'Contact List',
//       theme: ThemeData(
//         // This is the theme of your application.
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       // home: const MyHomePage(title: 'Contact List'), // home: it actually shows the direction which class or function should be call
//       home:Scaffold(
//         appBar: AppBar(
//           title: const Text("Contact List",textAlign: TextAlign.center,),
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
//           child:
//             SingleChildScrollView(child: //SingleChildScrollView is a widget in Flutter that allows a single child to be scrolled
//               Column(
//                 children: [
//                   const SizedBox(height: 20,), // it is apparent height b/w Appbar and name box i.e 20
//                   Row(
//                     children: [
//                       const SizedBox(width: 10,),
//                       const Icon(IconData(0xe18f, fontFamily: 'MaterialIcons'),color: Colors.blue,),
//                       const SizedBox(width: 30,),
//                       SizedBox(
//                         width: 250,
//                         height: 70,
//                         child:
//                         TextField( //TextField is a widget in Flutter that allows the user to enter a single line of text
//                         controller: nameController,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(
//                           ),
//                           hintText: "abc",
//                           labelText: "Enter Name",
//                         ),
//                       ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       const SizedBox(width: 10,),
//                       const Icon(IconData(0xe22a, fontFamily: 'MaterialIcons'),color: Colors.blue,),
//                       const SizedBox(width: 30,),
//                       SizedBox(
//                         width: 250,
//                         height: 70,
//                         child:
//                         TextField( //TextField is a widget in Flutter that allows the user to enter a single line of text
//                           controller: emailController,
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(
//                             ),
//                             hintText: "syz@gmail.com",
//                             labelText: "Enter Email Id",
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       const SizedBox(width: 10,),
//                       const Icon(IconData(0xe4a2, fontFamily: 'MaterialIcons'),color: Colors.blue,),
//                       const SizedBox(width: 30,),
//                       SizedBox(
//                         width: 250,
//                         height: 70,
//                         child:
//                         TextField( //TextField is a widget in Flutter that allows the user to enter a single line of text
//                           controller: nameController,
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(
//                             ),
//                             hintText: "+91-xxxxxxxxx",
//                             labelText: "Enter Phone No",
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 30,),
//                   Row(
//                     children: [
//                       Expanded( //it is used to cover whole area
//                         child:
//                         ElevatedButton(onPressed: ()=> {
//                           nameController.clear(),
//                           emailController.clear(),
//                           phoneController.clear(),
//                         }, child: const Text("Reset",),
//                         ),
//                       ),
//                       const SizedBox(width: 30,),
//                       Expanded(
//                           child:
//                           ElevatedButton(
//                               onPressed: (){
//                             //append the particular data to the list
//                             SavedContacts.add(CallDetails(name: nameController.text, email: emailController.text, phoneNo: phoneController.text));
//                             for(int i=0;i<SavedContacts.length;i++){
//                               debugPrint(SavedContacts[i].name); //use debugPrint to print list of item
//                             }
//
//                             phoneController.clear();
//                             emailController.clear();
//                             nameController.clear();
//
//                           }, child: const Text("Submit"))
//
//                       ),
//
//                     ],
//                   ),
//                       const SizedBox(height: 30,),
//                       Container(height: 300,
//                         // padding: const EdgeInsets.all(16),// edge-insets means give space from edge to insets of any box assume
//                         // decoration: BoxDecoration(
//                         //   color: Colors.lightBlueAccent,
//                         //   border: Border.all()
//                         // ),
//                         child:
//                       const ContactView(),
//                       ),
//                 ],
//               )
//               ,)
//         ),
//       )
//     );
//
//   }
// }
//
//
//
// // class MyCustomForm extends StatelessWidget{
// //   const MyCustomForm({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       children: const [
// //         Text("Contacts", textAlign: TextAlign.center),
// //         Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
// //           child: TextField(
// //             decoration: InputDecoration(
// //               border: OutlineInputBorder(),
// //               hintText: "Enter Name",
// //             ),
// //           ),
// //         ),
// //         Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
// //           child: TextField(
// //             decoration: InputDecoration(
// //               border: OutlineInputBorder(),
// //               hintText: "Enter Phone"
// //             ),
// //           ),
// //         ),
// //         Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
// //           child: TextField(
// //             decoration: InputDecoration(
// //               border: OutlineInputBorder(),
// //               hintText: "Enter Email"
// //             ),
// //           )
// //         ),
// //       ],
// //
// //     );
// //   }
// // }
//
//
// // we write code in stateful-widget, there value is is changing,
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title}); //
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override //The @override annotation indicates that this method/function is being overridden from a parent class
//   State<MyHomePage> createState() => _MyHomePageState(); //createState is a method that belongs to the MyHomePage class.
//   // prefix underscore'_' is used in variable to public that variable.
// }
//
// class _MyHomePageState extends State<MyHomePage> { //if there is private class then we can access this class inside this file
//                                                   // but we cant access this class from other file in same repo coz, this class is private for this file.so, we can access this class anywhere inside this file
//   int _counter = 0; // created a private variable
//
//   void _incrementCounter() { //private function
//       setState(() { //set-state is function in stateful-widget class. it is used to indicate internal state of stateful widget has changed and need to be rebuild
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) { //BuildContext is a Flutter framework class. it provides information about the location of a widget in the tree
//     //context :it provide of location of a widget in the tree of widgets.
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(//in the flutter framework , the "scaffold" is a widget, it is basic layout element that provides a visual structure of a app.
//         endDrawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             ListTile(
//               title: Text('Home'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text('About'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       // It includes a app bar, a bottom navigation bar, and a body area where you can place your main content.
//       appBar: AppBar( //top of interface in app is called navigationBar/AppBar
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//
//
//         // appBar: AppBar(
//         //   title: Text('My App'),
//         // ),
//         // body: Center(
//         //   child: Text('Welcome to the home page!'),
//         // ),
//
//
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have clicked the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }








