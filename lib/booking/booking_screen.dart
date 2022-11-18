// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'reservationTicket.dart';
import 'package:intl/intl.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  final TextEditingController _departCityCon = TextEditingController();
  final TextEditingController _arrivalCityCon = TextEditingController();
  final TextEditingController _busServiceCon = TextEditingController();
  final TextEditingController _busClassCon = TextEditingController();
  final TextEditingController _seatNumberCon = TextEditingController();
  final TextEditingController _ticketPriceCon = TextEditingController();
  final TextEditingController _fullNameCon = TextEditingController();
  final TextEditingController _phoneNumberCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _cnicNumberCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();
  final TextEditingController _timeCon = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  void initState() {
    _dateCon.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  void dispose() {
    _seatNumberCon.dispose();
    _ticketPriceCon.dispose();
    _fullNameCon.dispose();
    _phoneNumberCon.dispose();
    _emailCon.dispose();
    _cnicNumberCon.dispose();
    _dateCon.dispose();
    _timeCon.dispose();
    _departCityCon.dispose();
    _arrivalCityCon.dispose();
    _busServiceCon.dispose();
    _busClassCon.dispose();
    super.dispose();
  }

  //ignore: non_constant_identifier_names
  Future bookTicket() async {
    // Ticket Reservation
    addTicketDetails(
      _seatNumberCon.text.trim(),
      _ticketPriceCon.text.trim(),
      _fullNameCon.text.trim(),
      _phoneNumberCon.text.trim(),
      _emailCon.text.trim(),
      _cnicNumberCon.text.trim(),
      _dateCon.text.trim(),
      _timeCon.text.trim(),
      _departCityCon.text.trim(),
      _arrivalCityCon.text.trim(),
      _busServiceCon.text.trim(),
      _busClassCon.text.trim(),
    );
  }

  Future addTicketDetails(
    String seatNumber,
    String ticketPrice,
    String fullName,
    String phoneNumber,
    String email,
    String cnic,
    String date,
    String time,
    String departureCity,
    String arrivalCity,
    String busService,
    String busClass,
  ) async {
    await FirebaseFirestore.instance.collection('tickets').add({
      'seatNumber': seatNumber,
      'ticketPrice': ticketPrice,
      'fullName': fullName,
      'email': email,
      'cnic': cnic,
      'date': date,
      'time': time,
      'departureCity': departureCity,
      'arrivalCity': arrivalCity,
      'busService': busService,
      'busClass': busClass,
    });
  }

  @override
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                //Seat Number field
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.trim().length < 1) {
                          return ('Seat Number must be of 1 Digit');
                        }
                        return null;
                      },
                      controller: _seatNumberCon,
                      decoration: const InputDecoration(
                        labelText: 'Seat Number',
                        hintText: 'Seat Number',
                        icon: Icon(Icons.event_seat),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 6.0),
                        ),
                      ),
                    ),
                  ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(border: Border.all(width: 1.0)),
                      child: Text(
                        'Ticket Price 1150',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.trim().length < 3) {
                        return ('Name must be of 3 characters');
                      }
                      return null;
                    },
                    controller: _fullNameCon,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Enter Full Name',
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 6.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      bool phoneValidator =
                          RegExp(r"^[0-9+]{4}[0-9+]{7}").hasMatch(value!);
                      if (!phoneValidator) {
                        return 'Enter Valid Phone Number';
                      }
                      return null;
                    },
                    controller: _phoneNumberCon,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'XXXX-XXXXXXX',
                      icon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 6.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      bool emailFormat = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (!emailFormat) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                    controller: _emailCon,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter Valid Email Address',
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 6.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value) {
                      bool cnicValidator =
                          RegExp(r"^[0-9+]{5}-[0-9+]{7}-[0-9]{1}")
                              .hasMatch(value!);
                      if (!cnicValidator) {
                        return 'Enter CNIC / Passport Number';
                      }
                      return null;
                    },
                    controller: _cnicNumberCon,
                    decoration: const InputDecoration(
                      labelText: 'CNIC / Passport Number',
                      hintText: 'Enter CNIC / Passport Number',
                      icon: Icon(Icons.nineteen_mp_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 6.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          // validator: (value) {
                          //   if (value!.trim().length < 6) {
                          //     return ('Enter Valid Date');
                          //   }
                          //   return null;
                          // },
                          controller: _dateCon,
                          //editing controller of this TextField
                          decoration: const InputDecoration(
                              icon: Icon(
                                  Icons.calendar_today), //icon of text field
                              labelText: "Enter Date" //label text of field
                              ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                _dateCon.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                      ),
                      Text(
                        '   ',
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.trim().length < 2) {
                              return ('Enter Valid Time');
                            }
                            return null;
                          },
                          controller: _timeCon,
                          decoration: const InputDecoration(
                            labelText: 'Time',
                            hintText: 'Enter Time',
                            icon: Icon(Icons.timer),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 6.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
                    child: const Text('Book Ticket'),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        bookTicket();
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReservationTicket()));
                      } else {}
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
