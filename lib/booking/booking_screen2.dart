import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_buss_tickets/booking/busbook.dart';

class BookingScreen2 extends StatefulWidget {
  const BookingScreen2({Key? key}) : super(key: key);

  @override
  State<BookingScreen2> createState() => _BookingScreen2State();
}

class _BookingScreen2State extends State<BookingScreen2> {
  final TextEditingController _departCityCon = TextEditingController();
  final TextEditingController _arrivalCityCon = TextEditingController();
  final TextEditingController _busServiceCon = TextEditingController();
  final TextEditingController _busClassCon = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();
  @override
  void dispose() {
    _departCityCon.dispose();
    _arrivalCityCon.dispose();
    _busServiceCon.dispose();
    _busClassCon.dispose();
    super.dispose();
  }

  //ignore: non_constant_identifier_names
  Future bookTicket() async{
    // Ticket Reservation
    addTicketDetails(
      _departCityCon.text.trim(),
      _arrivalCityCon.text.trim(),
      _busServiceCon.text.trim(),
      _busClassCon.text.trim(),
    );
  }
  Future addTicketDetails(
    String departureCity,
    String arrivalCity,
     String busService,
    String busClass,
  ) async {
    await FirebaseFirestore.instance.collection('busticket').add({
      'departureCity': departureCity,
      'arrivalCity': arrivalCity,
      'busService': busService,
      'busClass': busClass,
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Booking'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     validator: (value) {
                       if (value!.trim().length < 4) {
                         return ('Departure City must be of 6 characters');
                       }
                       return null;
                     },
                     controller: _departCityCon,
                     decoration: const InputDecoration(
                       labelText: 'Departure City',
                       hintText: 'Multan,Lahore,Islamabad,Karachi,',
                       icon: Icon(Icons.departure_board),
                       border: OutlineInputBorder(
                         borderSide: BorderSide(width: 6.0),
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(
                  height: 20,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     validator: (value) {
                       if (value!.trim().length < 4) {
                         return ('Arrival City must be of 4 characters');
                       }
                       return null;
                     },
                     controller: _arrivalCityCon,
                     decoration: const InputDecoration(
                       labelText: 'Arrival City',
                       hintText: 'Multan,Lahore,Islamabad,Karachi,',
                       icon: Icon(Icons.departure_board),
                       border: OutlineInputBorder(
                         borderSide: BorderSide(width: 6.0),
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(
                  height: 20,
                 ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.trim().length < 6) {
                          return ('Bus Service must be of 6 characters');
                        }
                        return null;
                      },
                      controller: _busServiceCon,
                      decoration: const InputDecoration(
                        labelText: 'Bus Service',
                        hintText: 'Faisal Movers,Daewoo,Shalimar ',
                        icon: Icon(Icons.bus_alert_sharp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 6.0),
                        ),
                      ),
                    ),
                  ),
                
                 const SizedBox(
                  height: 20,
                 ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.trim().length < 6) {
                          return ('Bus Class must be of 6 characters');
                        }
                        return null;
                      },
                      controller: _busClassCon,
                      decoration: const InputDecoration(
                        labelText: 'Bus Class',
                        hintText: 'Executive,Economy,Luxury ',
                        icon: Icon(Icons.bus_alert_sharp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 6.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                          //height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width / 1.12,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              //primary: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // <-- Radius
                              ),
                            ),
                            child: const Text('Book Ticket'),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                bookTicket();
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             Busbook(1, "Seater")));
                              } else {}
                              
                            },
                          ),
                        ),
                  ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}