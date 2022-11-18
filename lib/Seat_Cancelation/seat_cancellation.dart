import 'package:flutter/material.dart';
class SeatCancellation extends StatefulWidget {
  const SeatCancellation({Key? key}) : super(key: key);

  @override
  State<SeatCancellation> createState() => _SeatCancellationState();
}

class _SeatCancellationState extends State<SeatCancellation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Seat Cancellation '),
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
             const SizedBox(height: 100,),
                         const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              const Text('Name :'),
              Container(
                  height: 40,
                  width: 210,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0,
                    color: Colors.black),
                ),
                child: const Text('Muhammad Talib',
                textAlign: TextAlign.center),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Route :',
            ),
            Container(
                  height: 40,
                  width: 210,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0,
                    color: Colors.black),
                ),
                child: const Text('MTN TO LHR ',
                textAlign: TextAlign.center),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
              Text('Serial Number'),
              Text('Issue Date')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0,
                    color: Colors.black),
                ),
                child: const Text('1234567',
                textAlign: TextAlign.center,),
                ),
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0,
                    color: Colors.black),
                ),
                child: const Text('dd/mm/yy',
                textAlign: TextAlign.center),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
              Text('Fare'),
              Text('Deduction')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0,
                    color: Colors.black),
                ),
                child: const Text('250',
                textAlign: TextAlign.center,),
                ),
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0,
                    color: Colors.black),
                ),
                child: const Text('100',
                textAlign: TextAlign.center),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
              Text('Departure Date'),
              Text('Time')
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0,
                    color: Colors.black),
                ),
                child: const Text('dd/mm/yy',
                textAlign: TextAlign.center,),
                ),
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0,
                    color: Colors.black),
                ),
                child: const Text('--:--:-- AM/PM',
                textAlign: TextAlign.center),
                ),
              ],
            ),
          ],
        ),
        
      ),
    );
  }
}