import 'package:chat_app_firebase/Auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static final routeName='profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context,listen: false).getUserFromFireStore();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder:(context,provider,x)=>
    Scaffold(
    appBar: AppBar(
      title: Text("Profile"),
    ),
        body:Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(provider.user.imageUrl),),
        WidgetItem('Email',provider.user.email),
        WidgetItem('First Name',provider.user.fName),
        WidgetItem('Last Name',provider.user.lName),
        WidgetItem('Country Name',provider.user.country),
        WidgetItem('City Name',provider.user.city),
        WidgetItem('Email',provider.user.email),

      ],

    )),
       );
  }
}
class WidgetItem extends StatelessWidget {
  String lable,value;


  WidgetItem(this.lable, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(lable),
        Text(value),
        ],
      ),
    );
  }
}





