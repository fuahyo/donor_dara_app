import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repository/notifikasi/notifikasi_repository_impl.dart';
import '../../../utility/commons.dart';
import '../BLOC/notifikasi/cubit/notifikasi_detail_cubit.dart';

class ResponseNotif extends StatefulWidget {
  const ResponseNotif({Key? key}) : super(key: key);

  @override
  State<ResponseNotif> createState() => _ResponseNotifState();
}

class _ResponseNotifState extends State<ResponseNotif> {
  late NotifikasiDetailCubit _notifikasiDetailCubit;

  @override
  void initState() {
    // TODO: implement initState
    _notifikasiDetailCubit = NotifikasiDetailCubit(
      NotifikasiRemoteRepositoryImpl(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _notifikasiDetailCubit.close();
    super.dispose();
  }

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
                  onPressed: () => context.go('/dasboard'),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    size: 20,
                  )),
            ),
          )),
      body: BlocConsumer<NotifikasiDetailCubit, NotifikasiDetailState>(
        listener: (context, notifikasiDetailState) {
          if (notifikasiDetailState is NotifikasiDetailIsFailed) {
            Commons()
                .showSnackBarInfo2(context, notifikasiDetailState.message!);
          }
        },
        builder: (context, notifikasiDetailState) {
          if (notifikasiDetailState is NotifikasiDetailIsLoading) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          } else if (notifikasiDetailState is NotifikasiDetailIsSucces) {}
          {
            return Container(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jadwal Donor Darah",
                        style: CustomStyle265(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                          text:
                              "Anda memiliki jadwal donor darah selanjutnya pada ",
                          style: TextStyle(
                              wordSpacing: 2,
                              fontSize: 10,
                              fontFamily: "Plus Jakarta Sans",
                              color: greyColor,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "23 Januari 2023. ",
                          style: TextStyle(
                              wordSpacing: 2,
                              fontSize: 10,
                              fontFamily: "Plus Jakarta Sans",
                              color: black26Color,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text:
                              "Mohon untuk segera mengajukan donor darah dan berpartisipasi dalam kegiatan donor darah tersebut.",
                          style: TextStyle(
                              wordSpacing: 2,
                              fontSize: 10,
                              fontFamily: "Plus Jakarta Sans",
                              color: greyColor,
                              fontWeight: FontWeight.w500),
                        )
                      ])),
                      const SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () => context.go('/udd'),
                        child: const Text(
                          "Ajukan Donor Darah Sekarang",
                          style: TextStyle(
                              wordSpacing: 1,
                              fontSize: 10,
                              fontFamily: "Plus Jakarta Sans",
                              color: redColor,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ]));
          }
        },
      ),
    );
  }
}
