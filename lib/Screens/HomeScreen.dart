import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:spot_buy/Screens/DrawerScreens/FavoritesScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/FriendsScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/NotificationsScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/PoliciesScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/ProfileScreen.dart';
import 'package:spot_buy/Screens/GoogleMapPage.dart';
import 'package:spot_buy/Screens/SearchPage.dart';
import 'package:spot_buy/Screens/SettingPage.dart';
import 'package:spot_buy/Utils/SpotColors.dart';

import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [
    const GoogleMapPage(),
    const SearchPage(),
    const SettingPage(),
  ];

  String get text => "Test Share";

  get subject =>"Share The App link";


  @override
  Widget build(BuildContext context) {


    return WillPopScope( onWillPop: showExitPopup,
    child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: const [
              Expanded(child: Text("Spot park pro")),
              Icon(Icons.location_on),
              Text("Bhopal", textAlign: TextAlign.end)
            ],
          ),
          backgroundColor: SpotColors.colorPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
        ),

        body: SizedBox(

          child: pages[pageIndex],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),

        drawer: Drawer(
          elevation: 16.0,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
             InkWell(
               onTap: (){
                 Navigator.pop(context);
               Navigator.of(context).pushAndRemoveUntil(
                   MaterialPageRoute(builder: (context){
                     return const ProfileScreen();
                   }
                   ), (Route<dynamic> route) => true);

               },
             child:  const DrawerHeader(
               decoration: BoxDecoration(
                 color: SpotColors.colorPrimary,
               ), //BoxDecoration

               child: UserAccountsDrawerHeader(

                 decoration: BoxDecoration(color: SpotColors.colorPrimary),
                 accountName: Text(
                   "Abhishek Mishra",
                   style: TextStyle(fontSize: 18),
                 ),
                 accountEmail: Text("abhishekm977@gmail.com"),
                 currentAccountPictureSize: Size.square(50),
                 currentAccountPicture: CircleAvatar(
                   backgroundColor: SpotColors.colorPrimary,
                   child: Text(
                     "A",
                     style: TextStyle(fontSize: 30.0, color: Colors.blue),
                   ), //Text
                 ),

               ),

             ),),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('favorites'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context){
                        return const FavoritesScreen() ;
                      }
                      ), (Route<dynamic> route) => true);

                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Friends'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context){
                        return const FriendsScreen() ;
                      }
                      ), (Route<dynamic> route) => true);


                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                  _onShareData(context);
                  },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context){
                        return const NotificationsScreen() ;
                      }
                      ), (Route<dynamic> route) => true);

                },
                trailing: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: const Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context){
                        return const SettingPage() ;
                      }
                      ), (Route<dynamic> route) => true);

                },
              ),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('polices'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context){
                        return const PoliciesScreen() ;
                      }
                      ), (Route<dynamic> route) => true);

                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Exit'),
                onTap: (){
                  Navigator.pop(context);
                  showExitPopup();},
              )
            ],
          ),
        ),

        bottomNavigationBar: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          decoration: const BoxDecoration(
            color: SpotColors.colorPrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Home
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  print("Home pressed00");
                  setState(() {
                    pageIndex = 0;
                    print("Home pressed");
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: 28,
                )
                    : const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              //Search
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    print("Search pressed 00");
                    setState(() {
                      pageIndex = 1;
                      print("Search pressed");
                    });
                  },
                  icon: const Icon(Icons.search_outlined,
                      color: Colors.white, size: 28)),

              //Settings
              IconButton(
                  enableFeedback: false,
                  onPressed: ()  {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: const Icon(Icons.settings,
                      color: Colors.white, size: 28)),
            ],
          ),
        ),

        floatingActionButton: SpeedDial(
          icon: Icons.add,
          //icon on Floating action button
          activeIcon: Icons.close,
          //icon when menu is expanded on button
          backgroundColor: SpotColors.colorPrimary,
          //background color of button
          foregroundColor: Colors.white,
          //font color, icon color in button
          activeBackgroundColor: SpotColors.colorPrimary,
          //background color when menu is expanded
          activeForegroundColor: Colors.white,
          buttonSize: 58.0,
          //button size children size
          visible: true,
          elevation: 8.0,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,

          overlayOpacity: 0.5,

          onOpen: () => print('OPENING DIAL'),
          // action when menu opens
          onClose: () => print('DIAL CLOSED'),
          //action when menu closes


          //shadow elevation of button
          shape: const CircleBorder(),
          //shape of button
          children: [
            SpeedDialChild(
              child: const Icon(Icons.charging_station),
              labelWidget: Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  child: const Text("Charging",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end)),
              backgroundColor: SpotColors.colorGreen,
              foregroundColor: Colors.white,
              label: 'Charging',
              labelStyle: const TextStyle(fontSize: 16.0),
              onTap: () => print('Charging'),
              onLongPress: () => print('Charging FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: const Icon(Icons.local_parking),
              backgroundColor: SpotColors.colorBlue,
              labelWidget: Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  child: const Text("Park",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end)),
              foregroundColor: Colors.white,
              label: 'Park',
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () => print('Park SECOND CHILD'),
              onLongPress: () => print('Park SECOND CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: const Icon(Icons.add_business_outlined),
              labelWidget: Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  child: const Text("Fuel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end)),
              foregroundColor: Colors.white,
              backgroundColor: SpotColors.colorOrange,
              label: "Fuel",
              labelStyle: const TextStyle(fontSize: 18.0),
            ),
            SpeedDialChild(
              child: const Icon(Icons.two_wheeler_outlined),
              backgroundColor: SpotColors.colorYellow,
              foregroundColor: Colors.white,
              labelWidget: Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  child: const Text("Flat tire",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end)),
              label: 'Flat tire',
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () => print('Park SECOND CHILD'),
              onLongPress: () => print('Park SECOND CHILD LONG PRESS'),
            ),
          ],
        )


    ),
    );
  }


  _onShareData(BuildContext context) async {
    final RenderObject? box = context.findRenderObject();;
    {
      await Share.share(text,
          subject: subject);
    }
  }

  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Do you want to exit an App?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:const Text('No'),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child:const Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
}
