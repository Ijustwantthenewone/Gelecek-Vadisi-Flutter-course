import 'package:flutter/material.dart';

class name extends StatefulWidget {
  name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  bool? b1 = false;
  String language = "tr";
  bool isDarkMode = false;
  double? oran = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey : Colors.amber[50],
      appBar: AppBar(
        title: const Text("Form Inputs"),
      ),
      body: Center(
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text("Kabul ediyor musun"),
              value: b1,
              activeColor: Colors.orange,
              tristate: true, //null da olabilir  üçüncü durum
              onChanged: (value) {
                setState(() {
                  b1 = value;
                });
              },
              secondary: const Icon(Icons.add),
            ),
            const Divider(),
            RadioListTile(
              activeColor: Colors.red,
              title: const Text("Türkçe"),
              value: "tr",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: Colors.red,
              title: const Text("İngilizce"),
              value: "en",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: Colors.red,
              title: const Text("Fransızca"),
              value: "fr",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value!;
                });
              },
            ),
            RadioListTile(
              activeColor: Colors.red,
              title: const Text("Almanca"),
              subtitle: language == "de"
                  ? const Text("Almanca biliyor musunuz")
                  : null,
              value: "de",
              groupValue: language,
              onChanged: (value) {
                setState(() {
                  language = value!;
                  print(language);
                });
              },
            ),
            const Divider(),
            SwitchListTile(
              title: Text(!isDarkMode ? "Koyu mod" : "Açık mod"),
              value: isDarkMode,
              onChanged: (bool? evet) {
                setState(() {
                  isDarkMode = evet!;
                });
              },
            ),
            const Divider(),
            Slider(
              min: 0.0,
              max: 100.0,
              label: oran!.toStringAsFixed(0),
              allowedInteraction: SliderInteraction.tapAndSlide,
              divisions: 3,
              value: oran!,
              onChanged: (value) {
                setState(() {
                  oran = value;
                  print(oran);
                });
              },
            ),
            Text(oran!.toStringAsFixed(0)),
          ],
        ),
      ),
    );
  }
}
