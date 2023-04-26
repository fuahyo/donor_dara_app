// ignore_for_file: unused_import

import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/presentation/pages/Agenda/detail_agenda.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/notifikasi_detail.dart';

import 'package:donor_darah/presentation/pages/Profil/screen_akun.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

import '../BLOC/navbar/cubit/navbar_cubit.dart';
import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class ScreenDasboard extends StatefulWidget {
  const ScreenDasboard({super.key});

  @override
  State<ScreenDasboard> createState() => _ScreenDasboardState();
}

// ignore: camel_case_types
class _ScreenDasboardState extends State<ScreenDasboard> {
  //Untuk List Screen
  int selectedIndex = 0;
  var key = PageController();
  PageController pageController = PageController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white249Color,
        bottomNavigationBar: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            return BottomNavigationBar(

                // ignore: prefer_const_constructors
                selectedLabelStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                selectedItemColor: redColor,
                unselectedItemColor: greyColor,
                showUnselectedLabels: false,
                currentIndex: (state as BottomNavBarIsChanged).index,
                onTap: (value) {
                  BlocProvider.of<BottomNavBarCubit>(context)
                      .changeIndex(value);
                  if (value == 1) {}
                  if (value == 2) {}
                  if (value == 3) {}
                  if (value == 4) {}
                },
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Image.asset("assets/images/DD48.png"),
                    icon: Image.asset("assets/images/DD49.png"),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset("assets/images/Icon2.png"),
                    icon: Image.asset("assets/images/Icon.png"),
                    label: 'Agenda',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset("assets/images/DD50.png"),
                    icon: Image.asset("assets/images/DD51.png"),
                    label: 'Notifikasi',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset("assets/images/DD52.png"),
                    icon: Image.asset("assets/images/DD53.png"),
                    label: 'Profil',
                  ),
                ]);
          },
        ),
        body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            return pageItems[(state as BottomNavBarIsChanged).index];
          },
        ));
  }
}

const pageItems = [Home(), DetailAgenda(), Notifikasidetail(), ScreenAkun()];
