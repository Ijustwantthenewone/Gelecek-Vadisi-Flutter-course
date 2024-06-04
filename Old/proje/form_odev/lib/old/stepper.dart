import 'package:flutter/material.dart';

class Stepper1 extends StatefulWidget {
  Stepper1({super.key});

  @override
  State<Stepper1> createState() => _Stepper1State();
}

class _Stepper1State extends State<Stepper1> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> adimlar = [
      Step(
          state: StepState.complete,
          subtitle: Text("Alt başlık"),
          isActive: selectedIndex == 0,
          title: Text("Kimlik bilgileri"),
          content: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Ad"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Soyad"),
              ),
            ],
          )),
      Step(
          isActive: selectedIndex == 1,
          title: Text("Adres bilgileri"),
          content: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "İl"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "İlçe"),
              ),
            ],
          )),
      Step(
          isActive: selectedIndex == 2,
          title: Text("Ulaşım bilgileri"),
          content: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Telefon"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Mail"),
              ),
            ],
          )),
    ];
    return Scaffold(
      appBar: _appbarim(),
      body: Stepper(
        currentStep: selectedIndex,
        onStepTapped: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        onStepCancel: selectedIndex == 0
            ? null
            : () {
                setState(() {
                  selectedIndex--;
                });
              },
        onStepContinue: selectedIndex == adimlar.length - 1
            ? null
            : () {
                setState(() {
                  selectedIndex++;
                });
              },
        steps: adimlar,
      ),
    );
  }

  AppBar _appbarim() {
    return AppBar(
      backgroundColor: Colors.amber,
    );
  }
}
