import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/unified_search.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/theme/sizes.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:neon/src/widgets/cached_image.dart';
import 'package:neon/src/widgets/error.dart';
import 'package:neon/src/widgets/image_wrapper.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:neon/src/widgets/list_view.dart';
import 'package:neon/src/widgets/server_icon.dart';
import 'package:nextcloud/nextcloud.dart';

@internal
class NeonUnifiedSearchResults extends StatelessWidget {
  const NeonUnifiedSearchResults({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final bloc = accountsBloc.activeUnifiedSearchBloc;
    return ResultBuilder.behaviorSubject(
      stream: bloc.results,
      builder: (final context, final results) {
        final values = results.data?.entries.toList();

        return NeonListView(
          isLoading: results.isLoading,
          error: results.error,
          onRefresh: bloc.refresh,
          itemCount: values?.length,
          itemBuilder: (final context, final index) {
            final snapshot = values![index];

            return AnimatedSize(
              duration: const Duration(milliseconds: 100),
              child: _buildProvider(
                context,
                accountsBloc,
                bloc,
                snapshot.key,
                snapshot.value,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProvider(
    final BuildContext context,
    final AccountsBloc accountsBloc,
    final UnifiedSearchBloc bloc,
    final CoreUnifiedSearchProvider provider,
    final Result<CoreUnifiedSearchResult> result,
  ) {
    final entries = result.data?.entries ?? <CoreUnifiedSearchResultEntry>[];
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
            if (entries.isEmpty) ...[
              ListTile(
                leading: const Icon(
                  Icons.close,
                  size: largeIconSize,
                ),
                title: Text(AppLocalizations.of(context).searchNoResults),
              ),
            ],
            for (final entry in entries) ...[
              ListTile(
                leading: NeonImageWrapper(
                  size: const Size.square(largeIconSize),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
  }

  Widget _buildThumbnail(final BuildContext context, final Account account, final CoreUnifiedSearchResultEntry entry) {
    if (entry.thumbnailUrl.isNotEmpty) {
      return NeonCachedImage.url(
        size: const Size.square(largeIconSize),
        url: entry.thumbnailUrl,
        account: account,
        // The thumbnail URL might be set but a 404 is returned because there is no preview available
        errorBuilder: (final context, final _) => _buildFallbackIcon(context, account, entry),
      );
    }

    return _buildFallbackIcon(context, account, entry) ?? const SizedBox.shrink();
  }

  Widget? _buildFallbackIcon(
    final BuildContext context,
    final Account account,
    final CoreUnifiedSearchResultEntry entry,
  ) {
    final size = Size.square(IconTheme.of(context).size!);
    if (entry.icon.startsWith('/')) {
      return NeonCachedImage.url(
        size: size,
        url: entry.icon,
        account: account,
      );
    }

    if (entry.icon.startsWith('icon-')) {
      return NeonServerIcon(
        size: size,
        color: Theme.of(context).colorScheme.primary,
        icon: entry.icon,
      );
    }

    return null;
  }
}
