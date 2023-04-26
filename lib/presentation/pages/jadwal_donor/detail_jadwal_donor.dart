// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailJadwalDonor extends StatefulWidget {
  const DetailJadwalDonor({super.key});

  @override
  State<DetailJadwalDonor> createState() => _DetailJadwalDonorState();
}

class _DetailJadwalDonorState extends State<DetailJadwalDonor> {
  bool isOpen = false;

  String UDDPMIKetapang = 'UDD PMI Ketapang';
  List<String> UDD = [
    "UDD PMI Ketapang",
    "UDD PMI Ketapang 2",
    "UDD PMI Ketapang 3",
    "UDD PMI Ketapang 4",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: white249Color,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
              backgroundColor: white249Color,
              flexibleSpace: Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 17.67, left: 10),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => context.go('/udd2'),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: black01Color,
                          )),
                      Text(
                        "Stok Darah",
                        style: CustomStyle04(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        body: ListView(
          children: [
            Stack(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(212, 212, 212, 1))),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.fromLTRB(24, 14, 24, 0),
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          "assets/images/Group 3 (1).png")),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Text(UDDPMIKetapang, style: CustomStyle267()),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isOpen = !isOpen;
                                  });
                                },
                                child: Icon(isOpen
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      DetailColumn(
                          text3: "Senin, 23 Januari 2022",
                          text: "Kantor UDD PMI Ketapang",
                          text2: "Kantor Kecamatan Ketapang",
                          onTap: () {
                            context.go('/umum');
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailColumn(
                          text3: "Selasa, 24 Januari 2022",
                          text: "Kantor Kelurahan Ketapang",
                          text2: "Puskesmas Ketapang",
                          onTap: () {}),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailColumn(
                          text3: "Rabu, 25 Januari 2022",
                          text: "Kantor DPRP Ketapang",
                          text2: "Kantor UDD PMI Ketapang",
                          onTap: () {})
                    ]),
                if (isOpen)
                  ListUDD(
                    shrinkWrap: true,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: UDD
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 22),
                                  child: InkWell(
                                      onTap: (() {
                                        UDDPMIKetapang = e;
                                        isOpen = false;
                                        setState(() {});
                                      }),
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            fontFamily: "Plus Jakarta Sans",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(45, 45, 45, 1)),
                                      )),
                                ))
                            .toList()),
                  )
              ],
            ),
          ],
        ));
  }
}

class DetailColumn extends StatelessWidget {
  final String text;
  final String text2;
  final String text3;

  final void Function()? onTap;
  const DetailColumn({
    Key? key,
    required this.text,
    required this.text2,
    required this.text3,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 36,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 24, right: 24),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: pinkColor, borderRadius: BorderRadius.circular(4)),
          child: Row(
            children: [
              Image.asset("assets/images/kalender_icon.png"),
              const SizedBox(
                width: 10,
              ),
              Text(
                text3,
                style: CustomStyle2174(),
              )
            ],
          ),
        ),
        Container(
          height: 53,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 24, top: 15, right: 32),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/DD38.png"),
                  Container(
                    height: 22,
                    width: 50,
                    padding: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                        color: white204Color,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Tertutup",
                      style: CustomStyle261(),
                    ),
                  ),
                ],
              ),
              Positioned(
                  left: 32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: CustomStyle264(),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Jl. Sisingamangaraja No.56a, Sampit, Del...",
                        style: CustomStyle1531(),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "08:00 - 10:00 WIB",
                        style: CustomStyle262(),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          height: 53,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 24, top: 15, right: 32),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/DD38.png"),
                  InkWell(
                    onTap: onTap,
                    child: Container(
                      height: 22,
                      width: 42,
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
                  ),
                ],
              ),
              Positioned(
                  left: 32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text2,
                        style: CustomStyle264(),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Jl. Sisingamangaraja No.56a, Sampit, Del...",
                        style: CustomStyle1531(),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "08:00 - 10:00 WIB",
                        style: CustomStyle262(),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class ListUDD extends StatelessWidget {
  final bool shrinkWrap;
  final Widget child;

  ListUDD({Key? key, required this.shrinkWrap, required this.child})
      : super(key: key);

  String UDDPMIKetapang = 'UDD PMI Ketapang';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 16),
      margin: const EdgeInsets.only(top: 50, left: 24, right: 24),
      height: 180,
      width: 312,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(blurRadius: 5, color: Color.fromRGBO(0, 0, 0, 0.25))
      ], color: white255Color, borderRadius: BorderRadius.circular(4)),
      child: child,
    );
  }
}
