import 'package:flutter/material.dart';

class ExMenus {
  const ExMenus({required this.label,required this.icon,required this.selectedIcon});
  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

List<ExMenus> menuList = [
  ExMenus(label: "One",icon:  Icon(Icons.place), selectedIcon: Icon(Icons.place_outlined)),
  ExMenus(label: "Two",icon:  Icon(Icons.home), selectedIcon: Icon(Icons.home_outlined)),
  ExMenus(label: "three",icon:  Icon(Icons.back_hand), selectedIcon: Icon(Icons.back_hand_outlined)),
  ExMenus(label: "Four",icon:  Icon(Icons.landscape), selectedIcon: Icon(Icons.landscape_outlined)),
  ExMenus(label: "Five",icon:  Icon(Icons.headset_mic), selectedIcon: Icon(Icons.headset_mic_outlined)),
  ExMenus(label: "Six",icon:  Icon(Icons.thunderstorm), selectedIcon: Icon(Icons.thunderstorm_outlined)),
];
class NavigationRailEx extends StatefulWidget {
  const NavigationRailEx({super.key});
  @override
  State<NavigationRailEx> createState() => _NavigationRailExState();
}

class _NavigationRailExState extends State<NavigationRailEx> {
  int screenIndex = 0;
  NavigationRailLabelType labelType = .all;
  bool svitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: NavigationRail(
              minWidth: 40,
              labelType: labelType,//NavigationRailLabelType.all,
              destinations: menuList.map((ExMenus m){
                  return NavigationRailDestination(
                      label: Text(m.label),
                      icon: m.icon,
                      selectedIcon: m.selectedIcon
                  );
                }).toList(),
              selectedIndex: screenIndex,
              onDestinationSelected: (int index){
                  setState(() {
                    screenIndex = index;
                  });
                },
            ),
          ),
          VerticalDivider(thickness: 1,width: 1,),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("page Index = $screenIndex"),
                SizedBox(height: 10,),
                SegmentedButton<NavigationRailLabelType>(
                  segments: const <ButtonSegment<NavigationRailLabelType>>[
                    ButtonSegment<NavigationRailLabelType>(
                        value: NavigationRailLabelType.none,
                        label: Text("None")
                    ),
                    ButtonSegment<NavigationRailLabelType>(
                        value: NavigationRailLabelType.selected,
                        label: Text("sele")
                    ),
                    ButtonSegment(
                        value: NavigationRailLabelType.all,
                        label: Text("all")
                    )
                  ],
                  selected: <NavigationRailLabelType>{labelType},
                  onSelectionChanged: (Set<NavigationRailLabelType> newSelection){
                    setState(() {
                      labelType = newSelection.first;
                    });
                  },
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 200,
                  child: SwitchListTile(
                    title: Text(
                      svitch ? 'Hide' : 'Show',
                    ),
                    value: svitch,
                    onChanged: (bool value) {
                      setState(() {
                        svitch = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
