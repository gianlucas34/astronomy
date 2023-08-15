import 'package:astronomy/app/presentation/states/apod_today/apod_today_bloc.dart';
import 'package:astronomy/app/presentation/widgets/error.dart';
import 'package:astronomy/app/presentation/widgets/loading.dart';
import 'package:astronomy/providers.dart';
import 'package:astronomy/ui/templates/template.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApodTodayScreen extends StatefulWidget {
  const ApodTodayScreen({super.key});

  @override
  State<ApodTodayScreen> createState() => _ApodTodayScreenState();
}

class _ApodTodayScreenState extends State<ApodTodayScreen> {
  final _bloc = getIt<ApodTodayBloc>();

  @override
  void initState() {
    super.initState();

    _bloc.event.add(FetchApodTodayEvent());
  }

  @override
  void dispose() {
    _bloc.event.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final fonts = theme.textTheme;

    return Template(
      child: StreamBuilder<ApodTodayState>(
        stream: _bloc.state,
        builder: (context, snapshot) {
          final state = snapshot.data;

          if (state is ApodTodayLoadingState) {
            return const Loading();
          } else if (state is ApodTodayErrorState) {
            return Error(message: state.message);
          } else if (state is ApodTodaySucessState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Picture of the day: ${DateFormat.yMMMd().format(state.apod.date ?? DateTime.now())}",
                    style: fonts.titleLarge,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: Image.network(state.apod.url ?? ""),
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.apod.title ?? "",
                            style: fonts.titleLarge,
                          ),
                        ),
                        const Icon(
                          Icons.file_download_outlined,
                          color: Colors.white,
                        ),
                      ],
                    )),
                Text(
                  state.apod.explanation ?? "",
                  style: fonts.bodyMedium,
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
