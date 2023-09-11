import 'package:astronomy/app/presentation/states/last10_apods/last10_apods_bloc.dart';
import 'package:astronomy/app/presentation/widgets/error.dart';
import 'package:astronomy/app/presentation/widgets/loading.dart';
import 'package:astronomy/providers.dart';
import 'package:flutter/material.dart';

class Last10Screen extends StatefulWidget {
  const Last10Screen({super.key});

  @override
  State<Last10Screen> createState() => _Last10ScreenState();
}

class _Last10ScreenState extends State<Last10Screen> {
  final _bloc = getIt<Last10ApodsBloc>();

  @override
  void initState() {
    super.initState();

    _bloc.event.add(FetchLast10ApodsEvent());
  }

  @override
  void dispose() {
    _bloc.event.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fonts = theme.textTheme;

    return StreamBuilder(
      stream: _bloc.state,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is Last10ApodsLoadingState) {
          return const Loading();
        } else if (state is Last10ApodsErrorState) {
          return Error(message: state.message);
        } else if (state is Last10ApodsSucessState) {
          return ListView.builder(
              itemCount: state.apods.length,
              itemBuilder: (context, index) {
                final apod = state.apods[index];

                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      child: apod.url!.contains('/image')
                          ? Image.network(
                              apod.url ?? "",
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 250.0,
                            )
                          : Image.asset('assets/images/default.png'),
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        apod.title ?? "",
                        style: fonts.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                  ],
                );
              });
        } else {
          return Container();
        }
      },
    );
  }
}
