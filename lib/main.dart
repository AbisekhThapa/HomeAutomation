import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: App(),
    );
  }
}

class App extends StatefulWidget {

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool OnL = false;
  bool Fan = false;
  bool Pump = false;
  bool Lock = false;
  final dbR = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomeAutomation"),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnL?Icon(
                  Icons.lightbulb,
                  size:100,
                  color:Colors.white10
              ):Icon(
                Icons.lightbulb,
                size:100,
                color:Colors.amber.shade700,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor:OnL?Colors.white10:Colors.green),
                  onPressed: (){
                    dbR.child("Light").set({"Switch":!OnL});
                    setState(() {
                      OnL=!OnL;
                    });
                  },
                  child: OnL?Text("Led Off"):Text("Led On")
              ),
              Fan?Icon(
                  FontAwesomeIcons.fan,
                  size:100,
                  color:Colors.white10
              ):Icon(
                FontAwesomeIcons.fan,
                size:100,
                color:Colors.amber.shade700,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor:Fan?Colors.white10:Colors.green),
                  onPressed: (){
                    dbR.child("Fan").set({"Switch":!Fan});
                    setState(() {
                      Fan=!Fan;
                    });
                  },
                  child: Fan?Text("Fan Off"):Text("Fan On")
              ),
              Pump?Icon(
                  FontAwesomeIcons.radiationAlt,
                  size:100,
                  color:Colors.white10
              ):Icon(
                FontAwesomeIcons.radiationAlt,
                size:100,
                color:Colors.amber.shade700,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor:Pump?Colors.white10:Colors.green),
                  onPressed: (){
                    dbR.child("Pump").set({"Switch":!Pump});
                    setState(() {
                      Pump=!Pump;
                    });
                  },
                  child: Pump?Text("Pump Off"):Text("Pump On")
              ),
              Lock?Icon(
                  FontAwesomeIcons.lock,
                  size:100,
                  color:Colors.white10
              ):Icon(
                FontAwesomeIcons.lockOpen,
                size:100,
                color:Colors.amber.shade700,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor:Lock?Colors.white10:Colors.green),
                  onPressed: (){
                    dbR.child("Lock").set({"Switch":!Lock});
                    setState(() {
                      Lock=!Lock;
                    });
                  },
                  child: Lock?Text("Lock Off"):Text("Lock On")
              ),
            ],
          ),
        )
    );
  }
}

