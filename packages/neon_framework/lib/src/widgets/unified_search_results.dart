import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/theme/sizes.dart';
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final bloc = accountsBloc.activeUnifiedSearchBloc;
    return ResultBuilder.behaviorSubject(
      subject: bloc.providers,
      builder: (context, providers) => NeonListView(
        scrollKey: 'unified-search',
        isLoading: providers.isLoading,
        error: providers.error,
        onRefresh: bloc.refresh,
        itemCount: providers.data?.length ?? 0,
        itemBuilder: (context, index) {
          final provider = providers.requireData[index];

          return NeonUnifiedSearchProvider(provider: provider);
        },
      ),
    );
  }
}

@internal
class NeonUnifiedSearchProvider extends StatelessWidget {
  const NeonUnifiedSearchProvider({
    required this.provider,
    super.key,
  });

  final core.UnifiedSearchProvider provider;

  @override
  Widget build(BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final bloc = accountsBloc.activeUnifiedSearchBloc;

    return StreamBuilder(
      stream: bloc.results.map((results) => results[provider.id]),
      builder: (context, snapshot) {
        final result = snapshot.data;
        if (result == null) {
          return const SizedBox.shrink();
        }

        final entries = result.data?.entries ?? BuiltList<core.UnifiedSearchResultEntry>();

        return Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                NeonError(
                  result.error,
                  onRetry: bloc.refresh,
                ),
                NeonLinearProgressIndicator(
                  visible: result.isLoading,
                ),
                if (!result.isLoading && entries.isEmpty) ...[
                  AdaptiveListTile(
                    leading: const Icon(
                      Icons.close,
                      size: largeIconSize,
                    ),
                    title: Text(NeonLocalizations.of(context).searchNoResults),
                  ),
                ],
                for (final entry in entries) ...[
                  AdaptiveListTile(
                    leading: NeonImageWrapper(
                      size: const Size.square(largeIconSize),
                      child: _buildThumbnail(context, accountsBloc.activeAccount.value!, entry),
                    ),
                    title: Text(entry.title),
                    subtitle: Text(entry.subline),
                    onTap: () async {
                      context.go(entry.resourceUrl);
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildThumbnail(BuildContext context, Account account, core.UnifiedSearchResultEntry entry) {
    if (entry.thumbnailUrl.isNotEmpty) {
      return NeonUriImage.withAccount(
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
      return NeonUriImage.withAccount(
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
