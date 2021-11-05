import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/viewmodel/sample.dart';


//Run this App in a phone. 
//Go through  the whole code, including the pubspec.yaml.
//This is the View, Users are only able to interact with this class.
//Do this whole project by yourself. Don't by heart the code.
//Understand the flow and working and create a new project and work on it. 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


 @override
  Widget build(BuildContext context) {
     return MaterialApp(
       theme: ThemeData(
         primarySwatch: Colors.blue
       ),
       home: const TodoApp(),
     );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoApp();
}

class _TodoApp extends State<TodoApp> {
  
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Sample>.reactive(viewModelBuilder: () => Sample(), builder: (context, model, child) => 
    Scaffold(
        floatingActionButton : Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => model.incrementCounter()
            ),
            const SizedBox(
              height: 20.0
            ),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () => model.decrementCounter()
            )
          ],
        ),
        body: Center(
          child: Text("Counter pressed ${model.getCounter}"),
        ),
    ));
  }
}
