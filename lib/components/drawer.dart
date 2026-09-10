import 'package:flutter/material.dart';

import '../lifecycle.dart';
class ExampleDestionations{
  const ExampleDestionations(this.lable, this.icon, this. selectedIcon);

  final String lable;
  final Widget icon;
  final Widget selectedIcon;
}

List<ExampleDestionations> destinations = [
  ExampleDestionations("Tools", Icon(Icons.pan_tool), Icon(Icons.pan_tool_outlined)),
  ExampleDestionations("Wid", Icon(Icons.widgets), Icon(Icons.widgets_outlined)),
  ExampleDestionations("Check Statefull Lifecycle", Icon(Icons.message), Icon(Icons.message_outlined))
];

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});
  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}
class _DrawerExampleState extends State<DrawerExample> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer = true;

  void openEndDrawer(){
    scaffoldKey.currentState?.openEndDrawer();
  }
  void openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }
  void handelScreenChange(int selectedScreen){
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer?
        buildDrawerScaffold(context):
        buildBottomBarScaffold();
  }

  Widget buildBottomBarScaffold(){
    return Scaffold(
      body: Center(child: Text("Page Index : $screenIndex"),),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index){
          setState(() {
            screenIndex = index;
          });
        },
        destinations: destinations.map((ExampleDestionations destination){
          return NavigationDestination(
              label: destination.lable,
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            tooltip: destination.lable,
          );
      }).toList(),
      ),
    );
  }
  Widget buildDrawerScaffold(BuildContext context){
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: [IconButton(onPressed: openEndDrawer, icon: Icon(Icons.electric_bolt))],
        leading: IconButton(
            onPressed: openDrawer,
            icon: Icon(Icons.list_outlined)),
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: destinations.length,
            itemBuilder: (context,index){
              final item=destinations[index];
              return InkWell(
                child: Card(
                  clipBehavior: .hardEdge,
                  child: ListTile(
                    leading: item.icon,
                    title: Text(item.lable),
                    trailing: item.selectedIcon,
                  ),
                ),
                onTap: (){
                  if(index==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LifeCycleExample()));
                  }
                },
              );
            }),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handelScreenChange,
        selectedIndex: screenIndex,
        children: [
          ...destinations.map((ExampleDestionations destination){
            return NavigationDrawerDestination(
                label: Text(destination.lable),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                );
            })
        ],
      ),
    );
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   showNavigationDrawer = MediaQuery.widthOf(context) >= 450;
  // }
}
