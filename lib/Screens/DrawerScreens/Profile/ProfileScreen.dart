import 'package:flutter/material.dart';
import 'package:spot_buy/Screens/DrawerScreens/Profile/UserProfileFilling.dart';
import 'package:spot_buy/Utils/SpotColors.dart';
import 'package:spot_buy/Utils/SpotSharedPref.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "User Name";
  String userEmail = "useremail@gmail.com";

  @override
  Widget build(BuildContext context) {
    setInitState();

    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Profile",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: SpotColors.colorPrimary, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            color: SpotColors.colorPrimary,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                //Profile Card
                Card(
                  color: SpotColors.colorPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 12,
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child:
                                  Image.asset("assets/images/userDefault.png"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  userEmail,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const UserProfileFilling();
                                },
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit_outlined),
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                //Profile Action Card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 1,
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: SpotColors.colorGrayLight2,
                          radius: 24,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child:
                                  Image.asset("assets/images/userDefault.png"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "My Account",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: TextStyle(
                                      color: SpotColors.colorPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Make changes to your account",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: TextStyle(
                                      color: SpotColors.colorGrayLight2,
                                      fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Column(
                      children: [
                        Row(
                          children:  [
                            CircleAvatar(
                              backgroundColor: SpotColors.colorPrimary,
                              radius: 18,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: const Center(
                                  child: Icon(Icons.directions_car_filled_sharp,color: Colors.white,size: 24, )
                                  ,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16,),
                            const Expanded(
                              child: Text("Park",style: TextStyle(color: SpotColors.colorPrimary,fontSize: 16,fontWeight: FontWeight.bold),),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),

                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children:  [
                            CircleAvatar(
                              backgroundColor: SpotColors.colorPrimary,
                              radius: 18,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: const Center(
                                  child: Icon(Icons.charging_station,color: Colors.white,size: 24, )
                                  ,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16,),
                            const Expanded(
                              child: Text("Charge",style: TextStyle(color: SpotColors.colorPrimary,fontSize: 16,fontWeight: FontWeight.bold),),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),

                          ],
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          children:  [
                            CircleAvatar(
                              backgroundColor: SpotColors.colorPrimary,
                              radius: 18,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: const Center(
                                  child: Icon(Icons.local_gas_station,color: Colors.white,size: 24, )
                                  ,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16,),
                            const Expanded(
                              child: Text("Fuel",style: TextStyle(color: SpotColors.colorPrimary,fontSize: 16,fontWeight: FontWeight.bold),),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),

                          ],
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          children:  [
                            CircleAvatar(
                              backgroundColor: SpotColors.colorPrimary,
                              radius: 18,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: const Center(
                                  child: Icon(Icons.local_parking,color: Colors.white,size: 24, )
                                  ,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16,),
                            const Expanded(
                              child: Text("Flat tire",style: TextStyle(color: SpotColors.colorPrimary,fontSize: 16,fontWeight: FontWeight.bold),),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),

                          ],
                        ),
                        const SizedBox(height: 8,),


                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),


                //Setting Card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Column(
                      children: [
                        Row(
                          children:  [
                            CircleAvatar(
                              backgroundColor: SpotColors.colorProfileBackground,
                              radius: 24,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Center(
                                  child: Icon(Icons.help_outline_sharp,color: SpotColors.colorPrimary,size: 30, )
                                  ,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Help & Support",style: TextStyle(color: SpotColors.colorPrimary,fontSize: 16,fontWeight: FontWeight.bold),),
                                ],
                              ),

                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),

                          ],
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children:  [
                            CircleAvatar(
                              backgroundColor: SpotColors.colorProfileBackground,
                              radius: 24,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Center(
                                  child: Icon(Icons.language_outlined,color: SpotColors.colorPrimary,size: 30, )
                                  ,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Language",style: TextStyle(color: SpotColors.colorPrimary,fontSize: 16,fontWeight: FontWeight.bold),),
                                  Text("Choose the language you prefer",style: TextStyle(color: SpotColors.colorGrayLight,fontSize: 14),),
                                ],
                              ),

                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),

                          ],
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children:  [
                            CircleAvatar(
                              backgroundColor: SpotColors.colorProfileBackground,
                              radius: 24,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Center(
                                  child: Icon(Icons.share_outlined,color: SpotColors.colorPrimary,size: 30, )
                                  ,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Referral",style: TextStyle(color: SpotColors.colorPrimary,fontSize: 16,fontWeight: FontWeight.bold),),
                                  Text("Share about this app in your community",style: TextStyle(color: SpotColors.colorGrayLight,fontSize: 14),),
                                ],
                              ),

                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),

                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children:  [
                            CircleAvatar(
                              backgroundColor: SpotColors.colorProfileBackground,
                              radius: 24,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Center(
                                  child: Icon(Icons.login_outlined,color: SpotColors.colorPrimary,size: 30, )
                                  ,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Log out",style: TextStyle(color: SpotColors.colorPrimary,fontSize: 16,fontWeight: FontWeight.bold),),
                                  Text("Further secure your account for safety",style: TextStyle(color: SpotColors.colorGrayLight,fontSize: 14),),
                                ],
                              ),

                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),

                          ],
                        ),
                        const SizedBox(height: 8),





                      ],
                    ),
                  ),
                ),

                // Action Card
              ],
            )));
  }

  void setInitState() async{
    userName = await SpotSharedPref.getUserName() ?? "User Name";
    userEmail =  await SpotSharedPref.getUserEmail() ?? "useremail@gmail.com";
    setState(() {

    });
  }
}
