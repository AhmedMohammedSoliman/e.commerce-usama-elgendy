import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/person_controller.dart';

class PersonView extends GetView<PersonController> {
  const PersonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PersonView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PersonView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
