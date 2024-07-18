import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:turkiyetakvimi/constant.dart';
import 'package:turkiyetakvimi/model/yaprakModel.dart';

class TakvimSayfasi extends StatefulWidget {
   TakvimSayfasi({Key? key,  required this.yaprak}) : super(key: key);
  final Yaprak yaprak;

  @override
  State<TakvimSayfasi> createState() => _TakvimSayfasiState();
}

class _TakvimSayfasiState extends State<TakvimSayfasi> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.red[100],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.yaprak.miladiTarih!,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: accentColor,
                  height: 1,
                  thickness: 2,
                ),
                Text(
                  widget.yaprak.hicriTarih!,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: accentColor,
                  height: 1,
                  thickness: 2,
                ),
                Text(
                  widget.yaprak.hicriSemsi.toString()!,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: accentColor,
                  height: 1,
                  thickness: 2,
                ),
                Text(
                widget.yaprak.rumi!,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: accentColor,
                  height: 1,
                  thickness: 2,
                ),
                Text(
                widget.yaprak.hizirKasim!,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: accentColor,
                  height: 1,
                  thickness: 2,
                ),
                Text(
                widget.yaprak.gunDurumu!,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: accentColor,
                  height: 1,
                  thickness: 2,
                ),
                Text(
                widget.yaprak.ezaniDurum!,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: accentColor,
                  height: 1,
                  thickness: 2,
                ),
                Text(
                widget.yaprak.gununSozu!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: accentColor,
                  height: 1,
                  thickness: 2,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height / 1.9,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child:  SingleChildScrollView(
                    child: Html(
                      data: """
             ${widget.yaprak.arkayuz!.baslik}+${widget.yaprak.arkayuz!.yazi}
                """
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


