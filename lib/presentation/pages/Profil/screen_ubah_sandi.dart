// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenUbahSandi extends StatefulWidget {
  const ScreenUbahSandi({super.key});

  @override
  State<ScreenUbahSandi> createState() => _ScreenUbahSandiState();
}

class _ScreenUbahSandiState extends State<ScreenUbahSandi> {
  bool hidePassword = true;
  bool hidePasswordConfirm = true;

  void changePasswordVisibility2() {
    setState(() {
      hidePasswordConfirm = !hidePasswordConfirm;
    });
  }

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
              backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
              flexibleSpace: Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 17.67, left: 14),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => context.go('/dasboard'),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          )),
                      Text("Ubah Kata Sandi", style: CustomStyle02()),
                    ],
                  ),
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(24, 14, 201, 0),
                  child: Text("Buat Kata Sandi Baru", style: CustomStyle05())),
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: "input text",
                    hintStyle: CustomStyle1532(),
                    labelText: "Kata Sandi Baru",
                    labelStyle: CustomStyle1532(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordVisibility();
                      },
                      child: Icon(
                        (hidePassword)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextField(
                  obscureText: hidePasswordConfirm,
                  decoration: InputDecoration(
                    hintText: "input text",
                    labelText: "Konfirmasi Kata Sandi Baru",
                    hintStyle: CustomStyle1532(),
                    labelStyle: CustomStyle1532(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordVisibility2();
                      },
                      child: Icon(
                        (hidePasswordConfirm)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(
                height: 385,
              ),
              ElevatedButton(
                onPressed: () {
                  showFlash(
                      context: context,
                      duration: const Duration(seconds: 5),
                      builder: ((context, controller) {
                        return Flash(
                            controller: controller,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(36),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(230, 230, 230, 1),
                            margin: const EdgeInsets.only(bottom: 100),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Text(
                                "Kata Sandi berhasil disimpan",
                                style: TextStyle(
                                    fontFamily: "Plus Jakarta Sans",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(51, 51, 51, 1)),
                              ),
                            ));
                      }));
                  setState(() {
                    context.go('/dasboard');
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(217, 34, 42, 1),
                  padding: const EdgeInsets.fromLTRB(126.5, 14, 126.5, 14),
                ),
                child: Text(
                  "Simpan",
                  style: CustomStyle2493(),
                ),
              )
            ],
          ),
        ));
  }
}
