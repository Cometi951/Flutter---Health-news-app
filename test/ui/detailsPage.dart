import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_health_code_challenge/Model/home_model_entity.dart';

class MockDetailsPage extends StatefulWidget {
  final String title;
  final String description;

  const MockDetailsPage(String this.title,String this.description, {super.key});

  @override
  State<MockDetailsPage> createState() => _MockDetailsPageState();
}

class _MockDetailsPageState extends State<MockDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Text(widget.title ?? "", style: const TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                child: Text(widget.description ?? "",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                    )),
              ),
            ],
          ),
        ),
    );
  }
}
