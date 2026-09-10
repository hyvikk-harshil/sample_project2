import 'package:flutter/material.dart';
import 'package:sample_project2/components/tab_bar.dart';
import 'bottom_bar.dart';
import 'check_box.dart';
import 'chips.dart';
import 'list_tile.dart';
import 'navigation_rail.dart';

class ListItems extends StatelessWidget {
  final List<ListItemData> listItems = [
  ListItemData(title: 'List_tile0', category: '', icon: Icons.list),
  ListItemData(title: 'List_tile1', category: '', icon: Icons.format_list_numbered_rtl),
  ListItemData(title: 'List_tile2', category: '', icon: Icons.lens_blur_sharp),
  ListItemData(title: 'List_tile3', category: '', icon: Icons.landscape_outlined),
  ListItemData(title: 'List_tile4', category: '', icon: Icons.join_inner_sharp),
  ListItemData(title: 'Bottom Bar', category: '', icon: Icons.back_hand_outlined),
  ListItemData(title: 'Bottom Bar2', category: '', icon: Icons.deblur_sharp),
  ListItemData(title: 'NavigationRail', category: '', icon: Icons.directions_railway_filled_outlined),
  ListItemData(title: 'Default Tab_bar', category: '', icon: Icons.restart_alt),
  ListItemData(title: 'Tab_bar using TabController', category: '', icon: Icons.sanitizer_outlined),
  ListItemData(title: 'Nested Tab_bar using both', category: '', icon: Icons.flare),
  ListItemData(title: 'scroll Tab-Bar', category: '', icon: Icons.tab_unselected_sharp),
  ListItemData(title: 'Customised scroll Tab-Bar', category: '', icon: Icons.tab_sharp),
  ListItemData(title: 'Check-Box', category: '', icon: Icons.check_box),
  ListItemData(title: 'Chip', category: '', icon: Icons.catching_pokemon),
  ListItemData(title: 'InputChip', category: '', icon: Icons.electric_bike_outlined),
  ListItemData(title: 'Editable Chip', category: '', icon: Icons.health_and_safety_rounded),
  ];
  ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ListView.builder(
        itemCount: listItems.length,
          itemBuilder: (context, index) {
          final item = listItems[index];
            return Dismissible(
              onDismissed: (DismissDirection direction){
                listItems.removeAt(index);
              },
              background: Container(color: Colors.red,),
              key: ValueKey(listItems[index]),
              child: Card(
                clipBehavior: .hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(item.icon, size: 36.0, color: Colors.blue),
                        const Spacer(),
                        // Displays the completely unique item title
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                      ],
                    ),
                  ),
                  onTap: (){
                    if(index==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListTileExample()));
                    }if(index==1){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListTileExample1()));
                    }if(index==2){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListTileExample2()));
                    }if(index==3){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListTileExample3()));
                    }if(index==4){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListTileExample4()));
                    }if(index==5){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomAppBarDemo()));
                    }if(index==6){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomAppBarDemo2()));
                    }if(index==7){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationRailEx()));
                    }if(index==8){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExampleTabBar()));
                    }if(index==9){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExampleTabBar2()));
                    }if(index==10){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExampleTabBar3()));
                    }if(index==11){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExampleTabBar4()));
                    }if(index==13){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExampleCheckBox()));
                    }if(index==14){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExampleChips()));
                    }if(index==15){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChipExample1()));
                    }if(index==16){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditableChipFieldExample()));
                    }
                  },
                ),
              ),
            );
          },
      ),
    );
  }
}


///Model Class of Listview
class ListItemData {
  final String title;
  final String category;
  final IconData icon;

  ListItemData({
    required this.title,
    required this.category,
    required this.icon,
  });
}