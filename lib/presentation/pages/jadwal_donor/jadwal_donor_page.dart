// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/base/widget/BaseColor.dart';
import 'package:donor_darah/data/utilities/commons.dart';
import 'package:donor_darah/presentation/pages/jadwal_donor/cubit/jadwal_donor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const List<String> list = [
  'UDD PMI Ketapang',
  'UDD PMI Ketapang 2',
  'UDD PMI Ketapang 3',
  'UDD PMI Ketapang 4',
];

formatTanggal(String tanggal) {
  if (tanggal == "") {
    return "";
  }
  initializeDateFormatting('id', null);
  DateTime parse = DateTime.parse(tanggal).toLocal();
  String date = DateFormat('EEEE, dd MMMM yyyy', 'id').format(parse);

  return date;
}

class JadwalDonorPage extends StatefulWidget {
  const JadwalDonorPage({super.key});

  @override
  State<JadwalDonorPage> createState() => _JadwalDonorPageState();
}

class _JadwalDonorPageState extends State<JadwalDonorPage> {
  String dropdownvalue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => context.goNamed('udd'),
        ),
        title: const Text(
          'Jadwal Donor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: BlocConsumer<JadwalDonorCubit, JadwalDonorState>(
        listener: (context, state) {
          if (state is JadwalDonorIsError) {
            Commons().showSnackBarErrorr(context, state.message!);
          }
        },
        builder: (context, state) {
          if (state is JadwalDonorIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: BaseColor.red,
              ),
            );
          } else if (state is JadwalDonorIsSuccess) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 14, left: 24, right: 24),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Color(0xffD4D4D4),
                          ),
                        ),
                      ),
                      child: DropdownButtonFormField(
                        value: dropdownvalue,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/images/udd_icon.png',
                            alignment: Alignment.centerLeft,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        items: list.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(value),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownvalue = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    Column(
                      children: [
                        Container(
                          height: 36,
                          color: const Color(0xffFCE9EA),
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Image.asset('assets/images/kalender_icon.png'),
                              const SizedBox(width: 12),
                              Text(
                                formatTanggal(state.data!.date),
                                style: const TextStyle(
                                  color: Color(0xffD91E2A),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 0,
                          leading: Image.asset(
                            'assets/images/udd_icon.png',
                            scale: 1.1,
                          ),
                          title: Text(dropdownvalue),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 8),
                              Text(
                                  'Jl. Sisingamangaraja No.56a, Sampit, Del...'),
                              SizedBox(height: 8),
                              Text(
                                '08:00 - 10:00 WIB',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          trailing: SizedBox(
                            height: 24,
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffCCCCCC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Tertutup',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 0,
                          leading: Image.asset(
                            'assets/images/udd_icon.png',
                            scale: 1.1,
                          ),
                          title: Text(state.data!.schedule.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(state.data!.schedule.address),
                              const SizedBox(height: 8),
                              Text(
                                '${state.data!.schedule.timeStart} - ${state.data!.schedule.timeEnd} WIB',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          trailing: SizedBox(
                            height: 24,
                            child: ElevatedButton(
                              onPressed: () => context.goNamed(
                                'detail-jadwal-donor',
                                extra: state.data!.schedule.address,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffCCCCCC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                state.data!.schedule.type,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
