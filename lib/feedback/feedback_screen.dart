import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Busservices_homescreen/home_page_screen.dart';
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _staffCorporation = TextEditingController();
  final TextEditingController _busStandard = TextEditingController();
  final TextEditingController _facilities = TextEditingController();
  final TextEditingController _timePunctuality = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  void dispose() {
    _staffCorporation.dispose();
    _busStandard.dispose();
    _facilities.dispose();
    _timePunctuality.dispose();

    super.dispose();
  }

  Future feedBack() async {
    // add user details
    addFeedback(_staffCorporation.text.trim(), _busStandard.text.trim(),
        _facilities.text.trim(), _timePunctuality.text.trim());
  }

  Future addFeedback(
    String staffCorporation,
    String busStandard,
    String facilities,
    String timePunctuality,
  ) async {
    await FirebaseFirestore.instance.collection('feedBack').add({
      'staff Corporation': staffCorporation,
      'bus Standard': busStandard,
      'facilities': facilities,
      'time Punctuality': timePunctuality,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                'Give Your Feedback',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 9),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 5) {
                      return ('Staff Corporation Contains must be of 30 characters');
                    }
                    return null;
                  },
                  controller: _staffCorporation,
                  decoration: const InputDecoration(
                    labelText: 'Staff Coopration',
                    hintText: 'Give Your Staff Coepration',
                    prefixIcon: Icon(Icons.feedback),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 6.0),
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 5) {
                      return ('Bus Standard Contains must be of 30 characters');
                    }
                    return null;
                  },
                  controller: _busStandard,
                  decoration: const InputDecoration(
                    labelText: 'Bus Standard',
                    hintText: 'What About the Bus Standards?',
                    prefixIcon: Icon(Icons.high_quality),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 6.0),
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 5) {
                      return ('Facilities Contains must be of 30 characters');
                    }
                    return null;
                  },
                  controller: _facilities,
                  decoration: const InputDecoration(
                    labelText: 'Facilities',
                    hintText: 'What About the Bus Facilities?',
                    prefixIcon: Icon(Icons.high_quality),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 6.0),
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.trim().length < 5) {
                      return ('Time Punctuality Contains must be of 30 characters');
                    }
                    return null;
                  },
                  controller: _timePunctuality,
                  decoration: const InputDecoration(
                    labelText: 'Time Punctuality',
                    hintText: 'What About the Time Punctuality?',
                    prefixIcon: Icon(Icons.high_quality),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 6.0),
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //primary: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                  ),
                  child: const Text('Submit'),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      feedBack();
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Center(
                            child: Text(
                              'Feedback',
                            ),
                          ),
                          content: Wrap(
                            children: const [
                              Text(
                                'Your feedback has been successfully Submitted.',
                              ),
                              Text(
                                'Thanks for your Kind Words',
                              )
                            ],
                          ),
                        ),
                      );
                      Future.delayed(const Duration(seconds: 3)).then((value) {
                        Navigator.pop(context);
                      }).then((value) {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
