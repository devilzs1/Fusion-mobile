import 'package:flutter/material.dart';
import 'rebate_form.dart';
import 'rebate_history.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';

class RebateMenu extends StatefulWidget {
  @override
  _RebateMenuState createState() => _RebateMenuState();
}

class _RebateMenuState extends State<RebateMenu> {
  @override
  Widget build(BuildContext context) {
    final ProfileData data = ModalRoute.of(context)!.settings.arguments as ProfileData;
    String user = data.profile!['user_type'];
    user = user.toLowerCase();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:DefaultAppBar().buildAppBar(titleText: "Central Mess"),
      drawer: SideDrawer(),
      body:Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 5.0),
          DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  //color: Colors.deepOrangeAccent,
                  child: TabBar(
                    labelColor: Colors.deepOrange,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(child: Text("Rebate Form",style: TextStyle(fontWeight: FontWeight.bold),),),
                      Tab(child: Text("Rebate History",style: TextStyle(fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ),
                Container(
                    height: 590, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      RebateForm(),
                      RebateHistory(),

                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
}
