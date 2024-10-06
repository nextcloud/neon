import 'package:cookbook_app/l10n/l10n.dart';
import 'package:cookbook_app/src/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The material design view for the home page.
class HomeView extends StatelessWidget {
  /// Creates a new home view.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select<HomeCubit, HomeTab>((cubit) => cubit.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [Placeholder(), Placeholder()],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        tooltip: context.l10n.recipeCreateButton,
        key: const Key('homeView_createRecipe_floatingActionButton'),
        onPressed: () {
          throw UnimplementedError('navigate to RecipeEditScreen');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.categories,
              icon: const Icon(Icons.receipt_long_outlined),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.timers,
              icon: const Icon(Icons.alarm_add_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      iconSize: 32,
      color: groupValue != value ? null : Theme.of(context).colorScheme.secondary,
      icon: icon,
    );
  }
}
