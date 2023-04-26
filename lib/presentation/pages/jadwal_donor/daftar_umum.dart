import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../custom_textStyle.dart';

class DaftarUmum extends StatefulWidget {
  const DaftarUmum({super.key});

  @override
  State<DaftarUmum> createState() => _DaftarUmumState();
}

class _DaftarUmumState extends State<DaftarUmum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white249Color,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
              backgroundColor: white249Color,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: IconButton(
                    onPressed: () => context.go('/detailjadwal'),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      size: 20,
                    )),
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                height: 96,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: white230Color)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Group 3 (1).png",
                          height: 32,
                          width: 32,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Kantor Kecamatan Ketapang",
                          style: CustomStyle08(),
                        )
                      ],
                    ),
                    Container(
                      height: 22,
                      width: 42,
                      margin: const EdgeInsets.only(left: 240, top: 12),
                      padding: const EdgeInsets.only(top: 6),
                      decoration: BoxDecoration(
                          color: white204Color,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Umum",
                        style: CustomStyle261(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Image(image: AssetImage("assets/images/DD18.png")),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Senin, 23 Januari 2023",
                      style: CustomStyle264(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Image(image: AssetImage("assets/images/DD19.png")),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "08:00 - 10:00 WIB",
                      style: CustomStyle264(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 25),
                    child: Image(
                      image: AssetImage("assets/images/DD20.png"),
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text:
                            "Jl. Sisingamangaraja No.56a, Sampit,\nDelta Pawan, Kabupaten Ketapang,\nKalimantan Barat 78811, Indonesia",
                        style: CustomStyle02(),
                      ),
                    ]),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () => context.go('/lihattiketdonor'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  backgroundColor: const Color.fromRGBO(217, 30, 42, 1),
                ),
                child: Text(
                  "Ikut Partisipasi",
                  style: CustomStyle2492(),
                ),
              )
            ],
          ),
        ));
  }
}
