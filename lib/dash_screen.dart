import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project2/providers/bottom_navigation_provider.dart';
import 'components/drawer.dart';
import 'components/grid_view.dart';
import 'components/list_view.dart';
import 'components/todo_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});
  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = .alwaysShow;
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavigationProvider>();
     return Scaffold(
      body: provider.currentIndex==0?DynamicTitlesGrid():
      provider.currentIndex==1?ListItems():provider.currentIndex==2?DrawerExample():Container(
              child: Center(child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (contex)=>TodoScreen()));
              }, child: Text("go Todo"),)),
            ),
      bottomNavigationBar:  NavigationBar(
            labelBehavior: labelBehavior,
            selectedIndex: provider.currentIndex,
            onDestinationSelected:
                (int index) {
              context.read<BottomNavigationProvider>().onIndexChanged(index);
              // setState(() {
              //   currentPageIndex = index;
              // if(currentPageIndex==3){
              //   bottomsheet();
              // }
              // }
              //);
            },
            destinations: const <Widget>[
              NavigationDestination(icon: Icon(Icons.widgets), label: 'Widgets'),
              NavigationDestination(icon: Icon(Icons.currency_lira), label: 'List pg'),
              NavigationDestination(icon: Icon(Icons.earbuds), label: 'Drawer pg'),
              NavigationDestination(icon: Icon(Icons.edit), label: 'Edit Nav'),
            ],
          )
    );
  }

  bottomsheet() {
   return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: <Widget>[
                Text('Navigation Label Behaviors'),
                const SizedBox(height: 10),
                OverflowBar(
                  spacing: 10.0,
                  overflowAlignment: .center,
                  overflowSpacing: 10.0,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          labelBehavior =NavigationDestinationLabelBehavior.alwaysShow;
                        });
                      },
                      child: const Text('alwaysShow'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;
                        });
                      },
                      child: const Text('onlyShowSelected'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          labelBehavior =NavigationDestinationLabelBehavior.alwaysHide;
                        });
                        debugPrint("$labelBehavior");
                      },
                      child: const Text('alwaysHide'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




