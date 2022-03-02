import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gangapp_flutter/ui/profile/screens/profile_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:http/http.dart' as http;

class PrincipalProfile extends StatelessWidget {
  const PrincipalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFunctions functions = FirebaseFunctions.instance;

    Future<void> writeMessage(String message) async {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('writeMessage');
      final resp = await callable.call(<String, dynamic>{
        'text': message,
      });
      log("result: ${resp.data}");
    }

    // Future createData() async {
    //   try {
    //     final result = await http.post(
    //       Uri.parse(
    //           "https://us-central1-gangapp-nebulova.cloudfunctions.net/data"),
    //       body: jsonEncode({"name": "proof"}),
    //       headers: <String, String>{
    //         'Content-Type': 'application/json; charset=UTF-8',
    //       },
    //     );
    //     print(result);
    //   } catch (e) {
    //     print(e);
    //   }
    // }

    Future createData() async {
      try {
        functions.httpsCallable(
            "https://us-central1-gangapp-nebulova.cloudfunctions.net/data");
        // final result = await http.post(
        //   Uri.parse(
        //       "https://us-central1-gangapp-nebulova.cloudfunctions.net/data"),
        //   body: {
        //     "name": "proof",
        //     "email": "jose@jose.com",
        //     "edad": "26",
        //   },
        // );

      } catch (e) {
        print(e);
      }
    }

    Future helloWorld() async {
      try {
        functions.httpsCallable(
            "https://us-central1-gangapp-nebulova.cloudfunctions.net/helloWorld");
        // final result = await http.post(
        //   Uri.parse(
        //       "https://us-central1-gangapp-nebulova.cloudfunctions.net/data"),
        //   body: {
        //     "name": "proof",
        //     "email": "jose@jose.com",
        //     "edad": "26",
        //   },
        // );

      } catch (e) {
        print(e);
      }
    }

    Future deleteData() async {
      try {
        final result = await http.delete(
          Uri.parse(
                  "https://us-central1-gangapp-nebulova.cloudfunctions.net/data")
              .replace(queryParameters: {
            "id": "vUYBBpzpXBPQBY7g07lk",
          }),
        );
        print(result);
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          helloWorld();
          // createData();
          // writeMessage("Hola desde CF");
        },
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
        children: [
          //Share social media
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(
                Icons.share,
                size: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              size: 30,
            ),
            title: const Text("Share"),
            subtitle: const Text("Comparte con tus amigos"),
            onTap: () {
              _onShare(context);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          //CALL
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(
                Icons.phone,
                size: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              size: 30,
            ),
            title: const Text("Llamar"),
            subtitle: const Text("Entra en contacto con nosotros"),
            onTap: () {
              _callNumber();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          //SMS
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey[300]!,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(
                Icons.sms,
                size: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              size: 30,
            ),
            title: const Text("SMS"),
            subtitle: const Text("Envíanos un SMS"),
            onTap: () {
              _smsNumber();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          //EMAIL
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(
                Icons.email,
                size: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              size: 30,
            ),
            title: const Text("Email"),
            subtitle: const Text("Envíanos un email"),
            onTap: () {
              _sendEmail();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          //Settings
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(
                Icons.settings,
                size: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              size: 30,
            ),
            title: const Text("Settings"),
            subtitle: const Text("Configura tu perfil"),
            onTap: () {
              Get.to(
                const ProfileScreen(),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(
      'check out my website https://example.com',
      subject: 'Look what I made!',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  Future<void> _callNumber() async {
    String phoneNumber = "+346666";
    String url = "tel://" + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "No se puede realizar la llamada";
    }
  }

  Future<void> _smsNumber() async {
    String phoneNumber = "+346666";
    String url = "sms://" + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "No se puede enviar el SMS";
    }
  }

  Future<void> _sendEmail() async {
    String email = "jose09511@gmail.com";
    String url = "mailto:" + email;
    //mailto:smith@example.org?subject=News&body=New%20plugin
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "No se puede enviar el email";
    }
  }
}
