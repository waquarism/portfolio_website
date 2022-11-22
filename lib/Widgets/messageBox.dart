import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart' as http;
import '../Model/colors.dart';

Future<Widget> MessageBox(final s) async {

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
      print(error);
      platformResponse = error.toString();
    }
  }




  return Positioned(
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
                send();
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
  );
}

// Future sendEmail(
//   String name,
//    String email,
//   String message,
// ) async {
//   final serviceId = 'service_85sh6a9';
//   final templeteId = 'template_p01ehns';
//   final userId = 'SyxnJEHyIN7eRD8se';
//
//   final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
//   final response  = await http.post(
//     url,
//
//     headers: {
//       'Context-Type' : 'application/json',
//     },
//
//     body: json.encode({
//       'service_id' : serviceId,
//       'templete_id' : templeteId,
//       'user_id' : userId,
//       'template_params' : {
//         'user_name' : name,
//         'user_email' : email,
//         'user_message' : message,
//       }
//     })
//   );
//   print(response.body);
// }



// Future sendEmail(String name,String email,String msg) async {
//   final email = 'hello@waquar.com';
//
//   final m = Message()
//     ..from = Address(email, 'Waquar')
//     ..recipients = ['waquarh599@gamil.com']
//     ..subject = 'From $name'
//     ..text = '$msg';
//
//   try {
//     await send(m);
//     print('msg sent');
//   } on MailerException catch (e){
//     print(e);
//   }
// }