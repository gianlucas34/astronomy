import 'package:astronomy/providers.dart';
import 'package:astronomy/ui/states/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _bloc = getIt<BottomNavigationBloc>();

  void _onTap(int index) {
    _bloc.event.add(TabChangeEvent(index));

    switch (index) {
      case 0:
        context.go('/');

        break;
      case 1:
        context.go('/last10');

        break;
      default:
        context.go('/');

        break;
    }
  }

  @override
  void dispose() {
    _bloc.event.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BottomNavigationState>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        final state = snapshot.data;

        return BottomNavigationBar(
          currentIndex: state?.currentIndex ?? 0,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.auto_awesome),
              icon: Icon(Icons.auto_awesome_outlined),
              label: "APOD",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.dashboard),
              icon: Icon(Icons.dashboard_outlined),
              label: "Last 10",
            ),
          ],
        );
      },
    );
  }
}
