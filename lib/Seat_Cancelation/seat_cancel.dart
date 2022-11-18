import 'package:flutter/material.dart';

import '../constantvariable/text_style_constant.dart';
class SeatCancel extends StatefulWidget {
  const SeatCancel({Key? key}) : super(key: key);

  @override
  State<SeatCancel> createState() => _SeatCancelState();
}

class _SeatCancelState extends State<SeatCancel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title:  const Text('Seat Cancellation ',
          //  style: TextStyle(
          //   fontSize:30 ,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.white,
          //  ),
           ),
           centerTitle:true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  const [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text("Welcome",
                style: TextStyle(
                fontSize:30 ,
                fontWeight: FontWeight.bold,
                color: Colors.black,
            ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
               ListTile(
                 //: Icon(Icons.payment),
                 title: Text("Two days before departure time ",
                 style: TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
                   fontStyle: FontStyle.normal,
                   color: Colors.black,
                 ),
                 ),
                 subtitle: Text(" Deduction 10% ",
                 style: TextStyle(
                   fontSize:20,
                   fontWeight: FontWeight.normal,
                   fontStyle: FontStyle.normal,
                   color: Colors.black38,
                 )
                 ),
               ),
              SizedBox(
                height: 100,
              ),
              ListTile(
                //: Icon(Icons.payment),
                title: Text("With in 24 Hours ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,             
                ),
                ),
                subtitle: Text(" Not Refund ",
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Colors.black38,
                ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}