// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_buss_tickets/Seat_Cancelation/seat_cancel.dart';
import 'package:online_buss_tickets/User/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_buss_tickets/booking/booking_screen2.dart';
import 'package:online_buss_tickets/booking/busbook.dart';
import '../User/about_us.dart';
import '../User/contact_us.dart';
import '../User/profile_screen.dart';
import '../booking/reservationTicket.dart';
import '../feedback/feedback_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        elevation: 8.0,
        child: ListView(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .where("email address", isEqualTo: currentUser.email)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      var data = snapshot.data!.docs[i];
                      return UserAccountsDrawerHeader(
                        accountName: Text(
                          data['first name'] + " " + data['last name'],
                        ),
                        accountEmail: Text(
                          data['email address'],
                        ),
                      );
                    },
                  );
                } else {
                  return LinearProgressIndicator();
                }
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.feedback,
                color: Colors.blue,
              ),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeedbackScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.bus_alert,
                color: Colors.blue,
              ),
              title: const Text('Reserved Ticket'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReservationTicket()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.cancel,
                color: Colors.blue,
              ),
              title: const Text('Seat Cancellation '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SeatCancel()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_page,
                color: Colors.blue,
              ),
              title: const Text('Contact US'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ContactUs()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.add_business_outlined,
                color: Colors.blue,
              ),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Center(
                      child: const Text(
                        'Logout',
                      ),
                    ),
                    content: Wrap(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'You will be Successfully Logout from the Application',
                        )
                      ],
                    ),
                  ),
                );
                Future.delayed(const Duration(seconds: 2)).then((value) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }).then((value) {
                  // print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Online Bus Ticket',
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        // ignore: sized_box_for_whitespace
        child: Container(
          height: size.height / 12,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReservationTicket()));
                },
                icon: Icon(Icons.bus_alert),
                color: Colors.white,
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUs()));
                },
                icon: Icon(
                  Icons.contact_page,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        notchMargin: 20,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MyProfileScreen()));
        },
        child: Icon(
          Icons.person,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Top Blue Container Under Appbar
            Container(
              height: size.height * .28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.elliptical(50, 50),
                  bottomRight: const Radius.elliptical(50, 50),
                ),
                color: Colors.blue,
              ),
              child: CarouselSlider(
                items: [
                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/app_icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/app_icon_1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/faisal_movers_1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //4th Image Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/daewoo_1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //5th Image Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/daewoo_2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //6th Image Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/faisal_movers_2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
                //Slider Container properties
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnManualNavigate: true,
                  aspectRatio: 16 / 8,
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Busbook(1, "Seater")));
                    },
                    child: Container(
                      height: size.height / 7,
                      width: size.width / 3.25,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/daewoo_2.png'))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Busbook(1, "Seater")));
                    },
                    child: Container(
                      height: size.height / 7,
                      width: size.width / 3.25,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/faisal_movers_2.png'))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Busbook(1, "Seater")));
                    },
                    child: Container(
                      height: size.height / 7,
                      width: size.width / 3.25,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/shalimar_bus.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
