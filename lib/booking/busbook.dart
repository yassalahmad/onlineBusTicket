// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:online_buss_tickets/User/profile_screen.dart';
import 'package:online_buss_tickets/booking/booking_screen.dart';
import 'package:online_buss_tickets/booking/reservationTicket.dart';

import 'busSeats.dart';
import 'busSeats_2.dart';
class Busbook extends StatefulWidget {
  int a = 0;
  late String b;

  Busbook(int c, String d, {Key? key}) : super(key: key) {
    a = c;
    b = d;
  }

  @override
  // ignore: no_logic_in_create_state
  _BusbookState createState() => _BusbookState(a, b);
}

class _BusbookState extends State<Busbook> {
  int a = 0;
  late String b;

  _BusbookState(int c, String d) {
    a = c;
    b = d;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Seat',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (a == 1)
                ? Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Busseats())
                : Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Busseats2()),
            Container(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //primary: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                child: const Text('Next'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyBookingScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
