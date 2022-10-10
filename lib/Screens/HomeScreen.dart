import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spot_buy/Models/GoogleMapMarkerModel.dart';
import 'package:spot_buy/Screens/DrawerScreens/FavoritesScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/FriendsScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/NotificationsScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/PoliciesScreen.dart';
import 'package:spot_buy/Screens/DrawerScreens/Profile/ProfileScreen.dart';
import 'package:spot_buy/Screens/BottomNavScreens/GoogleMapPage.dart';
import 'package:spot_buy/Screens/BottomNavScreens/SearchPage.dart';
import 'package:spot_buy/Screens/BottomNavScreens/SettingPage.dart';
import 'package:spot_buy/Utils/SpotColors.dart';

import 'package:share/share.dart';
import 'package:spot_buy/Utils/SpotSharedPref.dart';
import 'Login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {
  //TODO- Needs Raw Data



  int pageIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static Set<GoogleMapMarkerModel> markerModels={};
  String UserName="User Name";
  String UserEmail="useremail@gmail.com";
  String CurrentLocation ="Bhopal";




  var pages = [
     GoogleMapPage(googleMapMarkers: markerModels),
     const SearchPage(),
     const SettingPage(),

  ];

  String get text => "Test Share";

  get subject =>"Share The App link";



  @override
  Widget build(BuildContext context) {
    setInitState();

    return WillPopScope( onWillPop: showExitPopup,
    child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Row(
            children:  [
              const Expanded(child: Text("Spot Way")),
              const Icon(Icons.location_on),
              Text(CurrentLocation, textAlign: TextAlign.end)
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
             child:   DrawerHeader(
               decoration: const BoxDecoration(
                 color: SpotColors.colorPrimary,
               ), //BoxDecoration

               child: UserAccountsDrawerHeader(

                 decoration: const BoxDecoration(color: SpotColors.colorPrimary),
                 accountName: Text(
                   UserName,
                   style: const TextStyle(fontSize: 18),
                 ),
                 accountEmail: Text(UserEmail),
                 currentAccountPictureSize: const Size.square(50),
                 currentAccountPicture:  CircleAvatar(
                   backgroundColor: SpotColors.colorPrimary,
                   child: Text(
                     UserName[0].toUpperCase(),
                     style: TextStyle(fontSize: 30.0, color: Colors.blue),
                   ), //Text
                 ),

               ),

             ),),
              ListTile(
                leading: const Icon(Icons.nature_rounded),
                title: const Text('Flat tire'),
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
                leading: const Icon(Icons.local_gas_station),
                title: const Text('Fuel'),
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
                leading: const Icon(Icons.park),
                title: const Text('Park'),
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
                leading: const Icon(Icons.charging_station),
                title: const Text('Charging'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context){
                        return const FriendsScreen() ;
                      }
                      ), (Route<dynamic> route) => true);


                },
              ),
              const Divider(),
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
                title: const Text('Privacy Policy'),
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
                  setState(() {
                    pageIndex = 0;
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
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
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
          //action when menu closes

          //shadow elevation of button
          shape: const CircleBorder(),
          //shape of button
          children: [

            //Charging
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
              onTap: () {
                setState(() {
                  setChargingMarkers();
                  pageIndex=0;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                  );

                });
              },
              onLongPress: () => print('Charging FIRST CHILD LONG PRESS'),
            ),

            //Park
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
              onTap: () {

                setState(() {
                  setParkMarkers();
                  pageIndex=0;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                  );

                });
              },
              onLongPress: () => print('Park SECOND CHILD LONG PRESS'),
            ),

            //Fuel
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
              onTap: () {
                setState(() {
                  setFuelMarkers();
                  pageIndex=0;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                  );

                });
              },


            ),

            //Flat Tire
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
              onTap: (){

                setState(() {
                  setFlatTireMarkers();
                  pageIndex=0;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                  );

                });
              },
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
        title: const Text('Logout App'),
        content: const Text('Do you want to Logout ?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:const Text('No'),
          ),

          ElevatedButton(
            onPressed: () => logout(),
            //return true when click on "Yes"
            child:const Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

  Future<void> logout() async {
    print("logout success");
    await _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
  }

//Todo Get Current Location Address and show it to the corner At CurrentLocation variable

  String? _currentAddress;
  Position? _currentPosition;

  Future<void> SetLocation()async {

    await _getCurrentPosition();
    await _getAddressFromLatLng(_currentPosition!);

  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = place.toString();
        CurrentLocation = place.locality!;
        print(_currentAddress);
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }


  void setInitState() async{
    UserName = await SpotSharedPref.getUserName() ?? "User Name";
    UserEmail =  await SpotSharedPref.getUserEmail() ?? "useremail@gmail.com";
    await SetLocation();
    setState(() {

    });
  }



  //Raw Data
  void setChargingMarkers(){
    markerModels.clear();
    markerModels.add(
      GoogleMapMarkerModel("Charging", "Charging Point 1", "charging", const LatLng(24.5200, 81.100)));

    markerModels.add(
      GoogleMapMarkerModel("Charging", "Charging Point 2", "charging", const LatLng(24.525, 81.15)));

    markerModels.add(
      GoogleMapMarkerModel("Charging", "Charging Point 3", "charging", const LatLng(24.5255, 81.155)));

    markerModels.add(
      GoogleMapMarkerModel("Charging", "Charging Point 4", "charging", const LatLng(24.526, 81.156)));

    markerModels.add(
      GoogleMapMarkerModel("Charging", "Charging Point 5", "charging", const LatLng(24.5265, 81.1565)));

  }

  void setFuelMarkers(){
   markerModels.clear();
    markerModels.add(
      GoogleMapMarkerModel("fuel", "fuel Point 1", "fuel", const LatLng(24.5200, 81.100)));

    markerModels.add(
      GoogleMapMarkerModel("fuel", "fuel Point 2", "fuel", const LatLng(24.525, 81.15)));

    markerModels.add(
      GoogleMapMarkerModel("fuel", "fuel Point 3", "fuel", const LatLng(24.5255, 81.155)));

    markerModels.add(
      GoogleMapMarkerModel("fuel", "fuel Point 4", "fuel", const LatLng(24.526, 81.156)));

    markerModels.add(
      GoogleMapMarkerModel("fuel", "fuel Point 5", "fuel", const LatLng(24.5265, 81.1565)));

  }

  void setParkMarkers(){
   markerModels.clear();
    markerModels.add(
      GoogleMapMarkerModel("Parking", "Parking Point 1", "Parking", const LatLng(24.5200, 81.100)));

    markerModels.add(
      GoogleMapMarkerModel("Parking", "Parking Point 2", "Parking", const LatLng(24.525, 81.15)));

    markerModels.add(
      GoogleMapMarkerModel("Parking", "Parking Point 3", "Parking", const LatLng(24.5255, 81.155)));

    markerModels.add(
      GoogleMapMarkerModel("Parking", "Parking Point 4", "Parking", const LatLng(24.526, 81.15655)));

    markerModels.add(
      GoogleMapMarkerModel("Parking", "Parking Point 5", "Parking", const LatLng(24.5265, 81.15650)));

  }

  void setFlatTireMarkers(){
   markerModels.clear();
    markerModels.add(
      GoogleMapMarkerModel("FlatTire", "FlatTire Point 1", "FlatTire", const LatLng(24.5200, 81.100)));

    markerModels.add(
      GoogleMapMarkerModel("FlatTire", "FlatTire Point 2", "FlatTire", const LatLng(24.525, 81.15)));

    markerModels.add(
      GoogleMapMarkerModel("FlatTire", "FlatTire Point 3", "FlatTire", const LatLng(24.5255, 81.155)));

    markerModels.add(
      GoogleMapMarkerModel("FlatTire", "FlatTire Point 4", "FlatTire", const LatLng(24.526, 81.15655)));

    markerModels.add(
      GoogleMapMarkerModel("FlatTire", "FlatTire Point 5", "FlatTire", const LatLng(24.5265, 81.15650)));

  }


}
