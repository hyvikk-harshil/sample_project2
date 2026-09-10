import 'package:flutter/material.dart';
import 'package:sample_project2/components/segment_button.dart';
import 'package:sample_project2/components/slider.dart';
import 'package:sample_project2/components/snackbar.dart';
import 'package:sample_project2/components/switch.dart';
import 'package:sample_project2/components/text_field.dart';
import 'alert_dialog.dart';
import 'app_bar.dart';
import 'badge_example.dart';
import 'buttons.dart';
import 'date_picker.dart';
import 'icon_buttons.dart';
import 'menus.dart';
import 'navigation_button.dart';
import 'time_picker.dart';

class DynamicTitlesGrid extends StatelessWidget {
  // 1. Your data source populated with unique text strings
  final List<GridItemData> gridItems = [
    GridItemData(title: 'Button Demo', category: '', icon: Icons.smart_button),
    GridItemData(title: 'AppBar Overview', category: 'Analytics', icon: Icons.dashboard),
    GridItemData(title: 'Alert Dialog', category: 'Warning', icon: Icons.warning_amber),
    GridItemData(title: 'Icon Button', category: 'icon', icon: Icons.cloud),
    GridItemData(title: 'Navigation Bar', category: '', icon: Icons.navigation),
    GridItemData(title: 'Push Notifications', category: 'System', icon: Icons.notifications),
    GridItemData(title: 'Security Logs', category: 'Privacy', icon: Icons.security),
    GridItemData(title: 'SnackBar', category: '', icon: Icons.airplanemode_active),
    GridItemData(title: 'DatePicker1', category: '', icon: Icons.date_range),
    GridItemData(title: 'TimePicker1', category: '', icon: Icons.access_time),
    GridItemData(title: 'TimePicker2', category: '', icon: Icons.av_timer),
    GridItemData(title: 'Switch', category: '', icon: Icons.switch_access_shortcut),
    GridItemData(title: 'Slider', category: '', icon: Icons.landslide_rounded),
    GridItemData(title: 'Menu1', category: '', icon: Icons.menu),
    GridItemData(title: 'TextField', category: '', icon: Icons.text_fields),
  ];

  DynamicTitlesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Titles Grid')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: gridItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (BuildContext context, int index) {
          // 2. Fetch the specific object for the current row index
          final item = gridItems[index];

          // 3. Bind the unique properties directly into the UI components
          return Card(
            clipBehavior: .hardEdge,
            //elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    // Displays secondary descriptive metadata
                    Text(
                      item.category,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),

              onTap: (){
                if(index==0){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Buttons()));
                }if(index==1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarApp()));
                }if(index==2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DialogExample()));
                } if(index==3){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IconButtonToggleApp()));
                }if(index==4){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FloatingActionButtonExampleApp()));
                }if(index==5){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BadgeExample()));
                }if(index==6){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SegmentedButtonApp()));
                }if(index==7){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SnackBarExampleApp()));
                }if(index==8){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DatePicker1()));
                }if(index==9){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TimePicker1()));
                }if(index==10){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowTimePickerApp()));
                }if(index==11){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Switch_S()));
                }if(index==12){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sliderr()));
                }if(index==13){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu1()));
                }
                if(index==14){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TextFieldExample()));
                }
              },
            ),
          );
        },
      ),
    );
  }
}


///Model Class of Gridview
class GridItemData {
  final String title;
  final String category;
  final IconData icon;

  GridItemData({
    required this.title,
    required this.category,
    required this.icon,
  });
}