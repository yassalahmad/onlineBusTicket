// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:online_buss_tickets/Busservices_homescreen/home_page_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Screen',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ListTile(
                title: Text(
                  'Payment Mode',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
                subtitle: Text("Select your prefered payment mode"),
                leading: Icon(
                  Icons.payments,
                  color: Colors.blue,
                ) // for Right
                ),
            CreditCard(
                cardNumber: "5450 7879 4864 7854",
                cardExpiry: "10/25",
                cardHolderName: "M Talib Khor",
                cvv: "456",
                bankName: "HBL",
                cardType: CardType
                    .masterCard, // Optional if you want to override Card Type
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
                textExpDate: 'Exp. Date',
                textName: 'Name',
                textExpiry: 'MM/YY'),
            const SizedBox(
              height: 30,
            ),
            const Text('or Checkout With'),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.12,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    //primary: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                  ),
                  child: const Text(
                    'easypaisa',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {}),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.12,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    //primary: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // <-- Radius
                    ),
                  ),
                  child: const Text(
                    'jazzcash',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {}),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // <-- Radius
                  ),
                ),
                child: const Text('Confirm Payment'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Center(
                        child: Text(
                          'Payment Recieved',
                        ),
                      ),
                      content: Wrap(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'We have Received Your Payment',
                          )
                        ],
                      ),
                    ),
                  );
                  Future.delayed(const Duration(seconds: 2)).then((value) {
                    Navigator.pop(context);
                  }).then((value) {
                    // print("Signed Out");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  });
                },
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height / 15,
            //   width: MediaQuery.of(context).size.width / 1.12,
            //   color: Colors.transparent,
            //   child: GestureDetector(
            //       onTap: () {
            //         print('click on edit');
            //       },
            //       child: Image(
            //         image: AssetImage('assets/images/jazzcash.PNG'),
            //       )),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height / 15,
            //   width: MediaQuery.of(context).size.width / 1.12,
            //   color: Colors.transparent,
            //   child: GestureDetector(
            //       onTap: () {
            //         print('click on edit');
            //       },
            //       child: Image(
            //         image: AssetImage('assets/images/easypaisa.PNG'),
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
