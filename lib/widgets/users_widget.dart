import 'package:flutter/material.dart';
import 'package:providerdemo/services/users_service.dart';
class UsersList extends StatelessWidget {
   final UsersDataProvider usersData;
   const UsersList({ Key? key,required this.usersData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("Name: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(usersData.post[index].name.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("Username: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(usersData.post[index].username.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("E-mail: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(usersData.post[index].email.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("Phone: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(usersData.post[index].phone.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("Website: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(usersData.post[index].website.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex:1, child: Text("Address: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(usersData.post[index].address!.street.toString()+", "+
                        usersData.post[index].address!.suite.toString()+", "+
                        usersData.post[index].address!.city.toString()+", "+
                        usersData.post[index].address!.zipcode.toString()+"."))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex:1, child: Text("Company: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(usersData.post[index].company!.name.toString()+", "+
                    usersData.post[index].company!.catchPhrase.toString()+", "+
                    usersData.post[index].company!.bs.toString()))
                    ],
                  ),
                ],
            ),
          ),
        );
        }) );
  }
}
