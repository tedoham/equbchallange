import 'package:equbchallange/presentation/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 70),
          Container(
            // height: 160,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: kProfileColor,
                  ),
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 32, 32.0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 250,
                    child: RichText(
                      maxLines: 14,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      text: TextSpan(
                        text: 'Hi, ',
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Alem',
                              style: TextStyle(
                                  decoration: TextDecoration.underline)),
                          TextSpan(text: ' have'),
                          TextSpan(
                              text: ' ETB 40,000',
                              style: TextStyle(color: kGreenColor)),
                          TextSpan(text: ' unpaid debt.'),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_up,
                    color: kProfileColor,
                    size: 28.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
