import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  _textMe() async {
    const uri = 'sms:+923066769726?body=hello%20there';
    await launch(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Contact Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Get in Touch! ',
                style: TextStyle(
                  color: Colors.black,
                  //color: Color(0xFF795548),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'We`d Love to hear from you.\nOur friendly team is always here to chat',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              title: GestureDetector(
                child: const Text('+923066769726'),
                onTap: () {
                  // ignore: deprecated_member_use
                  launch('tel:+92 3066769726');
                },
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.message,
                color: Colors.blue,
              ),
              title: GestureDetector(
                child: const Text('+923066769726'),
                onTap: _textMe,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              title: GestureDetector(
                child: const Text('malikmtalibkhor@gmail.com'),
                onTap: () {
                  // ignore: deprecated_member_use
                  launch(
                      'mailto:malikmtalibkhor@gmail.com?subject=This is Subject Title&body=This is Body of Email And All user can easily acces through E-Mail ');
                },
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.facebook,
                color: Colors.blue,
              ),
              title: GestureDetector(
                child: const Text('Malik Talib Khor'),
                onTap: () async {
                  const url = 'https://www.facebook.com/talib.khor/';
                  //launchURL(url);
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could Not Launch $url';
                  }
                },
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.map,
                color: Colors.blue,
              ),
              title: GestureDetector(
                child: const Text('Kaims College Multan'),
                onTap: () async {
                  const url =
                      'https://www.google.com/maps/dir/30.0521502,70.6382584/Kaims+College+multan/@30.1706174,70.5153377,9z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x393b34893c3ea1f5:0xa97ce7569dbd772e!2m2!1d71.5152904!2d30.3093822';
                  //launchURL(url);
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could Not Launch $url';
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
