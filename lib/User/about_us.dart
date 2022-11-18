import 'package:flutter/material.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AbousUsScreenState();
}

class _AbousUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('About Us',
        style: TextStyle(
          // color: Colors.black
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [ const SizedBox(height: 3,),
              Row( 
                children: const [ 
                  Text('Who We Are?',
                  style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 22),),
                ],
             ),
             Column(
              children: const [
                Text('We are Students of Computer Science Department. And this Application is Our Final Year Project. Our Team Consists of three members named as:-',
                  style: TextStyle(fontSize: 15),
                maxLines: null,
                textAlign: TextAlign.justify,
                  ),
                
                  Text('Muhammad Talib , Muhammad Sufyan and Muhammad Fiaz.',
                  style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 15),
                maxLines: null,
                textAlign: TextAlign.justify,
                  ),
               ], 
             ),
             const SizedBox(height: 5,),
              Row(
                children: const [
                  Text('Why We Need This Application?',
                  style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 22),),
       
                ],
             ),
              Column(
            children:  const [
                Text('A Online bus Tickets reservation system is a mobile software solution designed to provide customers with a personalized easy-to-utilize user experience for booking and purchasing tickets online. It stores customers personal data records, scheduled routes, frequent trips, drop points, and other information.',
                  //'In the era of hustle and bustle, everyone tries to save their crucial time. So That’s whywe are providing a mobile based application, through this application customercan find the solution of their issues in that hectic time.',
                  style: TextStyle(fontSize: 15),
                maxLines: null,
                textAlign: TextAlign.justify,
                  ),
                  Text('So That’s whywe are providing a mobile based application, through this application all users find the all of bus services and get ticket.',
                  style: TextStyle(fontSize: 15),
                maxLines: null,
                textAlign: TextAlign.justify,
                  ),
            ],
          ),
           const SizedBox(height: 5,),
              Row(
                children: const [
                  Text('Our Aim for this Application.',
                  style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 22),),
       
                ],
             ),

               Column(
            children: const [
                Text('The main scope is to help people who have to travel in an emergency or on a daily basis but they do not know which bus to choose to start their journey and which bus will be better for them. This app which will provide all time services and provided affordable fare according to the passenger’s capacity and in this app we will provide information of all type local and luxury buses and this app will also have facility for local passengers. All this information must be available in one platform and passengers should be reserve there seat only by one click.',
                  style: TextStyle(fontSize: 15),
                maxLines: null,
                textAlign: TextAlign.justify,
                  ),
            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}