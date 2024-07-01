import 'package:flutter/material.dart';

class anaSayfa extends StatefulWidget {
  const anaSayfa({super.key});

  @override
  State<anaSayfa> createState() => _anaSayfaState();
}

class _anaSayfaState extends State<anaSayfa> {
  var tfcontroller = TextEditingController();
  String alinanVeri = "";
  String resimadi = "baklava.png";
  bool switchControl = false;
  bool checkBoxControl = false;
  int radioDeger = 0;
  bool progress = false;
  double slider = 0.0;
  var saaticin = TextEditingController();
  var gunicin = TextEditingController();
  List<String> sehirlerListesi = [];
  String seciliSehir = "Van";

  @override
  void initState() {
    sehirlerListesi.add("İstanbul");
    sehirlerListesi.add("İzmir");
    sehirlerListesi.add("Kayseri");
    sehirlerListesi.add("Bursa");
    sehirlerListesi.add("Batman");
    sehirlerListesi.add("Erzincan");
    sehirlerListesi.add(seciliSehir);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets"), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: tfcontroller,
                  decoration: const InputDecoration(hintText: "Gelen veri"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      alinanVeri = tfcontroller.text;
                      print(alinanVeri);
                    });
                  },
                  child: const Text("Veriyi Al")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          resimadi = "sutlac.png";
                        });
                      },
                      child: const Text("Resim 1")),
                  Image.network(
                      "http://kasimadalan.pe.hu/yemekler/resimler/$resimadi",
                      width: 200,
                      height: 200),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          resimadi = "pizza.png";
                        });
                      },
                      child: const Text("Resim 2")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    child: SwitchListTile(
                      value: switchControl,
                      title: const Text("Dart"),
                      onChanged: (value) {
                        setState(() {
                          switchControl = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 200,
                    child: CheckboxListTile(
                      value: checkBoxControl,
                      title: const Text("Flutter"),
                      onChanged: (c) {
                        setState(() {
                          checkBoxControl = c!;
                        });
                      },
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: RadioListTile(
                      title: const Text("İstanbul"),
                      value: 3,
                      groupValue: radioDeger,
                      onChanged: (value) {
                        setState(() {
                          radioDeger = value!;
                          print(radioDeger);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 150,
                    child: RadioListTile(
                      title: const Text("Ankara"),
                      value: 1,
                      groupValue: radioDeger,
                      onChanged: (value) {
                        setState(() {
                          radioDeger = value!;
                          print(radioDeger);
                        });
                      },
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          progress = true;
                        });
                      },
                      child: const Text("Başla")),
                  Visibility(
                    visible: progress,
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          progress = false;
                        });
                      },
                      child: const Text("Dur")),
                ],
              ),
              Slider(
                value: slider,
                divisions: 11,
                max: 100,
                min: 0,
                onChanged: (value) {
                  setState(() {
                    slider = value;
                    print(value.toInt());
                  });
                },
              ),
              Text("${slider.toInt()}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: TextField(
                      controller: saaticin,
                      decoration: const InputDecoration(hintText: "Saat"),
                      keyboardType: TextInputType.number,
                      obscureText: false,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then(
                          (value) {
                            saaticin.text = "${value!.hour} : ${value.minute}";
                          },
                        );
                      },
                      icon: const Icon(Icons.access_time_filled_rounded)),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: TextField(
                      controller: gunicin,
                      decoration: const InputDecoration(hintText: "Tarih"),
                      keyboardType: TextInputType.number,
                      obscureText: false,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                firstDate: DateTime(1997),
                                lastDate: DateTime(2100))
                            .then(
                          (value) {
                            gunicin.text =
                                "${value!.day} / ${value.year} / ${value.month}";
                          },
                        );
                      },
                      icon: const Icon(Icons.date_range_outlined)),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    print(
                        "Switch'in durumu $switchControl Checkbox'ın durumu $checkBoxControl"); //20:25
                  },
                  child: const Text("Göster")),
              DropdownButton<String>(
                value: seciliSehir,
                items: sehirlerListesi.map((value1) {
                  return DropdownMenuItem(
                    value: value1,
                    child: Text(value1),
                  );
                }).toList(),
                onChanged: (veri) {
                  setState(() {
                    seciliSehir = veri!;
                  });
                },
              ),
              GestureDetector(
                onLongPress: () => print("uzun basıldı"), // 9:21
                onTap: () => print("Merhaba"),
                onDoubleTap: () => print("2 Kere"),
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
