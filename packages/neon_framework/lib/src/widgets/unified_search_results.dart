import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/unified_search.dart';
import 'package:neon_framework/src/theme/icons.dart';
import 'package:neon_framework/src/theme/sizes.dart';
import 'package:neon_framework/src/utils/adaptive.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/adaptive_widgets/list_tile.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/image.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';
import 'package:neon_framework/src/widgets/list_view.dart';
import 'package:neon_framework/src/widgets/server_icon.dart';
import 'package:nextcloud/core.dart' as core;

@internal
class NeonUnifiedSearchResults extends StatelessWidget {
  const NeonUnifiedSearchResults({
    required this.onSelected,
    super.key,
  });

  final void Function(core.UnifiedSearchResultEntry entry) onSelected;

  @override
  Widget build(BuildContext context) {
    final bloc = NeonProvider.of<UnifiedSearchBloc>(context);
    return StreamBuilder(
      stream: bloc.isExtendedSearch,
      builder: (context, isExtendedSearchSnapshot) => ResultBuilder.behaviorSubject(
        subject: bloc.providers,
        builder: (context, providers) => StreamBuilder(
          stream: bloc.results,
          builder: (context, resultsSnapshot) {
            final results = resultsSnapshot.data;

            return NeonListView(
              scrollKey: 'unified-search',
              isLoading: providers.isLoading,
              error: providers.error,
              onRefresh: bloc.refresh,
              topFixedChildren: [
                if (!(isExtendedSearchSnapshot.data ?? true))
                  Align(
                    child: ElevatedButton.icon(
                      onPressed: bloc.enableExtendedSearch,
                      label: Text(NeonLocalizations.of(context).searchGlobally),
                      icon: Icon(AdaptiveIcons.search),
                    ),
                  ),
                if (results != null && results.isEmpty) _buildNoResultsTile(context),
              ],
              itemCount: providers.data?.length ?? 0,
              itemBuilder: (context, index) {
                final provider = providers.data![index];
                final result = results?[provider.id];
                if (result == null) {
                  return const SizedBox.shrink();
                }

                return _buildResult(
                  context: context,
                  provider: provider,
                  result: result,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildResult({
    required BuildContext context,
    required core.UnifiedSearchProvider provider,
    required Result<core.UnifiedSearchResult> result,
  }) {
    final account = NeonProvider.of<Account>(context);
    final bloc = NeonProvider.of<UnifiedSearchBloc>(context);

    final showCupertino = isCupertino(context);
    final title = Text(provider.name);

    final children = <Widget>[
      if (!showCupertino)
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall!,
          child: title,
        ),
      if (result.hasError)
        NeonError(
          result.error,
          onRetry: bloc.refresh,
        ),
      if (result.isLoading) const NeonLinearProgressIndicator(),
      if (result.hasData && result.requireData.entries.isEmpty) _buildNoResultsTile(context),
      if (result.hasData)
        for (final entry in result.requireData.entries)
          AdaptiveListTile(
            leading: NeonImageWrapper(
              size: const Size.square(largeIconSize),
              child: _buildThumbnail(context, account, entry),
            ),
            title: Text(entry.title),
            subtitle: Text(entry.subline),
            onTap: () {
              onSelected(entry);
            },
          ),
    ];

    if (isCupertino(context)) {
      return CupertinoListSection.insetGrouped(
        header: title,
        children: children,
      );
    } else {
      return Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      );
    }
  }

  Widget _buildNoResultsTile(BuildContext context) {
    return AdaptiveListTile(
      leading: Icon(
        AdaptiveIcons.close,
        size: largeIconSize,
      ),
      title: Text(NeonLocalizations.of(context).searchNoResults),
    );
  }

  Widget _buildThumbnail(
    BuildContext context,
    Account account,
    core.UnifiedSearchResultEntry entry,
  ) {
    if (entry.thumbnailUrl.isNotEmpty) {
      return NeonUriImage(
        size: const Size.square(largeIconSize),
        uri: Uri.parse(entry.thumbnailUrl),
        account: account,
        // The thumbnail URL might be set but a 404 is returned because there is no preview available
        errorBuilder: (context, _) => _buildFallbackIcon(context, account, entry),
      );
    }

    return _buildFallbackIcon(context, account, entry) ?? const SizedBox.shrink();
  }

  Widget? _buildFallbackIcon(
    BuildContext context,
    Account account,
    core.UnifiedSearchResultEntry entry,
  ) {
    if (entry.icon.startsWith('/')) {
      return NeonUriImage(
        size: Size.square(IconTheme.of(context).size!),
        uri: Uri.parse(entry.icon),
        account: account,
      );
    }

    if (entry.icon.startsWith('icon-')) {
      return NeonServerIcon(
        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        icon: entry.icon,
      );
    }

    return null;
  }
}
