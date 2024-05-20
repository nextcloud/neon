import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/blocs/unified_search.dart';
import 'package:neon_framework/src/utils/global_options.dart' as global_options;
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/account_switcher_button.dart';
import 'package:neon_framework/src/widgets/unified_search_results.dart';
import 'package:rxdart/rxdart.dart';

/// Global app bar for the Neon app.
@internal
class NeonAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Creates a new Neon app bar.
  const NeonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<NeonAppBar> createState() => _NeonAppBarState();
}

class _NeonAppBarState extends State<NeonAppBar> {
  late global_options.GlobalOptions globalOptions;
  late UnifiedSearchBloc unifiedSearchBloc;
  late AppsBloc appsBloc;
  final searchTermController = StreamController<String>();
  late final StreamSubscription<String> searchTermSubscription;
  final searchController = SearchController();

  @override
  void initState() {
    super.initState();

    globalOptions = NeonProvider.of<global_options.GlobalOptions>(context);
    unifiedSearchBloc = NeonProvider.of<UnifiedSearchBloc>(context);
    appsBloc = NeonProvider.of<AppsBloc>(context);

    searchTermSubscription =
        searchTermController.stream.debounceTime(const Duration(milliseconds: 250)).listen(unifiedSearchBloc.search);
  }

  @override
  void dispose() {
    searchController.dispose();
    unawaited(searchTermSubscription.cancel());
    unawaited(searchTermController.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: StreamBuilder(
          stream: appsBloc.activeApp,
          builder: (context, activeAppSnapshot) {
            if (!activeAppSnapshot.hasData) {
              return const Align(
                alignment: Alignment.topRight,
                child: AccountSwitcherButton(),
              );
            }
            final activeApp = activeAppSnapshot.requireData;

            final localizations = NeonLocalizations.of(context);
            final hintText = localizations.searchIn(activeApp.nameFromLocalization(localizations));

            return SearchAnchor(
              isFullScreen: true,
              viewHintText: hintText,
              textInputAction: TextInputAction.search,
              searchController: searchController,
              builder: (context, controller) {
                return ValueListenableBuilder(
                  valueListenable: globalOptions.navigationMode,
                  builder: (context, navigationMode, _) {
                    final drawerAlwaysVisible = navigationMode == global_options.NavigationMode.drawerAlwaysVisible;
                    return ResultBuilder.behaviorSubject(
                      subject: appsBloc.appImplementations,
                      builder: (context, appImplementations) {
                        final showDrawer = appImplementations.hasData && appImplementations.requireData.length > 1;
                        return SearchBar(
                          hintText: hintText,
                          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                          textInputAction: TextInputAction.search,
                          leading: showDrawer && !drawerAlwaysVisible ? const DrawerButton() : null,
                          trailing: const [
                            AccountSwitcherButton(),
                          ],
                          onTap: () {
                            controller.openView();
                          },
                        );
                      },
                    );
                  },
                );
              },
              viewBuilder: (_) => Padding(
                padding: const EdgeInsets.all(8),
                child: NeonUnifiedSearchResults(
                  onSelected: (entry) {
                    context.go(entry.resourceUrl);
                    searchController.closeView('');
                  },
                ),
              ),
              viewOnChanged: searchTermController.add,
              // The view is completely custom rendered, so we don't need the suggestions
              suggestionsBuilder: (context, controller) async {
                return [];
              },
            );
          },
        ),
      ),
    );
  }
}
