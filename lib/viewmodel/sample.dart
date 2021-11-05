import 'package:stacked/stacked.dart';
import 'package:todo_app/services/counter.dart';

class Sample extends BaseViewModel {

  //This is a viewModel class, Check out the BaseViewModel extension.
  //That is class is called from the View.
  //This class gets the data from the Service class
  //This class also get the input from the user via the View.
  //All the Logic for an page is processed in the ViewModel.
  //Check out the pubspec.yaml for the stacked package details.

  

  var mCounter = Counter();

   int get getCounter => mCounter.counter;

   void incrementCounter() {
        mCounter.counter++;
        notifyListeners();
   }

   void decrementCounter() {
     mCounter.counter--;
     notifyListeners();
   }
}