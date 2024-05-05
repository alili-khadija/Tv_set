import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class OnOffTv extends StatefulWidget {
  final bool isActivated;
  final Function(bool) onChanged;
  OnOffTv({required this.isActivated, required this.onChanged});

  @override
  State<OnOffTv> createState() => _OnOffTvState();
}

class _OnOffTvState extends State<OnOffTv> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.isActivated;
  }

  void _toggleTvState() {
    setState(() {
      _isOn = !_isOn;
    });
    widget.onChanged(_isOn);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Container(
        padding: EdgeInsets.only(left: 15),
        child: Switch(
          value: _isOn,
          onChanged: (newValue) {
            _toggleTvState();
          },
          activeColor: const Color(0xFFA58BFF),
          inactiveThumbColor: const Color(0xFFFAF7FF),
          inactiveTrackColor: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _isSwitchOn = false; // Track the state of the switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAFA),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(17, 120, 0, 145),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Smart TV',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      height: 1.4,
                      letterSpacing: 0.4,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: OnOffTv(
                  isActivated: true,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitchOn = value;
                    });
                  },
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 20),
                  child: SizedBox(
                    width: 300,
                    height: 241.9,
                    child: _isSwitchOn
                        ? Image.asset('lib/Images/tv2.png')
                        : Image.asset('lib/Images/tv.png'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 100, 30, 400),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 239,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFA58BFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(16.8, 10.5, 16.8, 10.5),
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                height: 1,
                                letterSpacing: 0.1,
                                color: const Color(0xFFFFFAFA),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF6900FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.5, horizontal: 20),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                height: 1,
                                letterSpacing: 0.1,
                                color: const Color(0xFFFFFAFA),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
