import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../payment/paymentScreen.dart';

class ReservationTicket extends StatefulWidget {
  const ReservationTicket({
    Key? key,
  }) : super(key: key);

  @override
  State<ReservationTicket> createState() => _ReservationTicketState();
}

class _ReservationTicketState extends State<ReservationTicket> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Detail'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("tickets")
                .where("email", isEqualTo: currentUser.email)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    var data = snapshot.data!.docs[i];
                    return Card(
                      shadowColor: Colors.grey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: size.height / 20,
                          ),
                          //Departure & Arrival Field
                          SizedBox(
                            height: size.height / 20,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                Text(
                                  'From:\t' + data['departureCity'],
                                  //textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                const Icon(
                                  Icons.directions_bus,
                                  size: 32,
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                Text(
                                  'To:\t' + data['arrivalCity'],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            indent: 20,
                            height: 1,
                            color: Colors.grey,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: size.height / 20,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Bus Service: \t' + data['busService'],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Departure Time:\t' + data['time'],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: size.height / 20,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Passenger Name:\t' + data['fullName'],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Seat Number:\t' + data['seatNumber'],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            indent: 20,
                            height: 1,
                            color: Colors.grey,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: size.height / 20,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Bus Class:\t' + data['busClass'],
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Ticket Price: 1150',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/qrcode.png',
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PaymentScreen(),
                                ),
                              );
                            },
                            child: const Text('Proceed To Payment!'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: const CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
