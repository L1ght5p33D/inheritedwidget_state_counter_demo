import 'package:flutter/material.dart';
import 'inherited_counter.dart';


int _counter = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    InheritedWrapper(
      child: 
    MaterialApp(
      title: 'Flutter State Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StateDemoRoot(),
    )
  );
  }
    
}

class StateDemoRoot extends StatefulWidget {
  StateDemoRoot({Key? key}) : super(key: key);


  @override
  _StateDemoRootState createState() => _StateDemoRootState();
}

class _StateDemoRootState extends State<StateDemoRoot> {

  @override
  Widget build(BuildContext context) {

    InheritedWrapperState wrapper = InheritedWrapper.of(context);
      return Scaffold(
        appBar: AppBar(
          title: Text("Flutter State Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                  'Not using state:',
                ),
              ElevatedButton(
                onPressed: (){
                  print("root button pressed");
                  setState((){
                    _counter ++;
                  });
                },
                child:Text("Increment from Parent")
                ),

              Text(
                  '$_counter',
                ),
                
                Child_W(),

                Padding(padding:
                EdgeInsets.all(20.0)),

                Text( 'Using State') ,

                Text(
                    'Parent counter   ${wrapper.counter??0}',
                  ),

                ElevatedButton(onPressed:(){
                    wrapper.incrementCounter();
                  }, child: Text("Increment from parent")),

                Stlss_Child_Counter(),
                Stfl_Child_Counter(),
                Child_Incrementor(),

            ],
          ),
        ),
      // ),
    );
  }
}

class Child_W extends StatefulWidget {
  const Child_W({super.key});


  @override
  State<Child_W> createState() => _Child_W_State();
}


class _Child_W_State extends State<Child_W> {
  @override
  Widget build(BuildContext context) {
    return 
    Column(children:[
    
    ElevatedButton(
      onPressed: (){
        print("child button pressed");
        setState((){
          _counter ++;
        });
      },
      child:Text("Increment from child")
      ),
    
    Container(child:Text(_counter.toString()))

    ]);
  }

}

class Child_Incrementor extends StatefulWidget {
  const Child_Incrementor({Key? key}) : super(key: key);

  @override
  _Child_IncrementorState createState() => _Child_IncrementorState();
}

class _Child_IncrementorState extends State<Child_Incrementor> {

  onPressed() {
    InheritedWrapperState wrapper = InheritedWrapper.of(context);
    wrapper.incrementCounter();
  }


  @override
  Widget build(BuildContext context) {
    return
     ElevatedButton(onPressed: onPressed, child: Text("Increment from child"));
  }
}

class Stlss_Child_Counter extends StatelessWidget {
  const Stlss_Child_Counter({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    print("widget B");
    return new Column(
      children:[
      Text('Child counter ~ ${state.counter}')
      ]);
  }
}
 

class Stfl_Child_Counter extends StatefulWidget {
  const Stfl_Child_Counter({Key? key}) : super(key: key);

  @override
  _Stfl_Child_CounterState createState() => _Stfl_Child_CounterState();
}

class _Stfl_Child_CounterState extends State<Stfl_Child_Counter> {
  int stfl_counter = 0;

  initState(){
    stfl_counter = 3;
  }
  
  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    if (state.counter !=0){
      stfl_counter = state.counter;
    }
    return Text("Stfl child counter ~ ${stfl_counter}");
  
  }

}