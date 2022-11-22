import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waquar_portfolia/Model/colors.dart';
import 'package:waquar_portfolia/Widgets/messageBox.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}
TextEditingController _nameEditingController = TextEditingController();
TextEditingController _emailEditingController = TextEditingController();
TextEditingController _msgEditingController = TextEditingController();

Future<void> send() async {
  final Email email = Email(
    body: 'Waquar you got a message from ${_emailEditingController
        .text} aka ${_nameEditingController.text}',
    subject: '${_msgEditingController.text}',
    recipients: ['inbox@waquar.com'],
    // cc: ['cc@example.com'],
    // bcc: ['bcc@example.com'],
    // attachmentPaths: ['/path/to/attachment.zip'],
    isHTML: false,
  );

  String platformResponse;

  try {
    await FlutterEmailSender.send(email);
    platformResponse = 'success';
  } catch (error) {
    print("Error is : $error");
    platformResponse = error.toString();
  }
}
class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Container(
      height: s.height - 148,
      width: s.width,
      child: Stack(
        children: [
          // MessageBox(s),
      Positioned(
      right: s.width / 14,
        top: s.width / 32,
        child: Container(
          height: 332,
          width: s.width / 5.8,
          decoration: BoxDecoration(
            color: msgBoxColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameEditingController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                          color: Color(0xffCF4D6F),
                        )),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffCF4D6F).withOpacity(.5),
                        )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffCF4D6F).withOpacity(.5),
                        )),
                    hintText: 'name',
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                TextField(
                  controller: _emailEditingController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                          color: underLineColor,
                        )),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: underLineColor.withOpacity(.5),
                        )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: underLineColor.withOpacity(.5),
                        )),
                    hintText: 'email',
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: s.height / 44,
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  height: s.width / 10.5,
                  decoration: BoxDecoration(
                    color: shapeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _msgEditingController,
                    style: TextStyle(
                      color: primaryTextColor,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'leave a message',
                        hintStyle: TextStyle(
                          color: Colors.white30,
                        )),
                    expands: false,
                    maxLines: 10,
                  ),
                ),
                SizedBox(
                  height: s.width / 78,
                ),
                MaterialButton(
                  onPressed: () async {

                    //    TODO :Implement SMTP server in mailer...
                    // send();
                    // await sendEmail(
                    //   _nameEditingController.toString(),
                    //   _emailEditingController.toString(),
                    //   _msgEditingController.toString(),
                    // );
                  },
                  color: shapeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  // height: s.height/22,
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: primaryTextColor.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
          Positioned(
            right: s.width / 24,
            bottom: s.width/44,
            child: Row(children: [
              GestureDetector(
                onTap: (){
                  launch('https://www.waquar.com/instagram/');
                },
                child: Image.asset(
                  'assets/images/instagram.png',
                  height: s.width / 20,
                  width: s.width / 20,
                ),
              ),
              SizedBox(
                width: s.width / 24,
              ),
              GestureDetector(
                onTap: (){
                  launch('https://www.waquar.com/twitter/');
                },
                child: Image.asset(
                  'assets/images/twitter.png',
                  height: s.width / 20,
                  width: s.width / 20,
                ),
              ),
              SizedBox(
                width: s.width / 24,
              ),
              GestureDetector(
                onTap: (){
                  launch('https://www.waquar.com/youtube/');
                },
                child: Image.asset(
                  'assets/images/youtube.png',
                  height: s.width / 20,
                  width: s.width / 20,
                ),
              ),
            ],),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Hello! I am ',
                              style: TextStyle(
                                  fontSize: s.width / 32,
                                  color: primaryTextColor)),
                          TextSpan(
                              text: 'Waquar ',
                              style: TextStyle(
                                  fontSize: s.width / 16,
                                  color: primaryTextColor)),
                          TextSpan(
                              text: '\nDeveloper Based in\nNew Delhi, India.',
                              style: TextStyle(
                                  fontSize: s.width / 32,
                                  color: primaryTextColor))
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: s.height / 12,
              ),
              Row(
                children: [
                  SizedBox(
                    width: s.width / 32,
                  ),
                  GestureDetector(
                    onTap: (){
                      launch('https://www.waquar.com/linkedin/');
                    },
                    child: Image.asset(
                      'assets/images/linkedin.png',
                      height: s.width / 18.32,
                      width: s.width / 18.32,
                    ),
                  ),
                  SizedBox(
                    width: s.width / 24,
                  ),
                  GestureDetector(
                    onTap: (){
                      launch('file:///D:/General/Resume/waquar_res.pdf');
                    },
                    child: Image.asset(
                      'assets/images/resume.png',
                      height: s.width / 18.32,
                      width: s.width / 18.32,
                    ),
                  ),
                  SizedBox(
                    width: s.width / 24,
                  ),
                  GestureDetector(
                    onTap: (){
                      launch('https://www.waquar.com/github/');
                    },
                    child: Image.asset(
                      'assets/images/github.png',
                      height: s.width / 18.32,
                      width: s.width / 18.32,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
