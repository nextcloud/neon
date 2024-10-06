import 'package:cookbook_app/l10n/l10n.dart';
import 'package:cookbook_app/src/categories/categories.dart';
import 'package:cookbook_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The material design view for the categories page.
class CategoriesView extends StatelessWidget {
  /// Creates a new categories view.
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingRefreshIndicator(
        isLoading: context.select<CategoriesBloc, bool>(
          (bloc) => bloc.state.status == CategoriesStatus.loading,
        ),
        onRefresh: () {
          context.read<CategoriesBloc>().add(const RefreshCategories());
        },
        child: BlocConsumer<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            if (state.status == CategoriesStatus.failure) {
              final theme = Theme.of(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.l10n.errorLoadFailed,
                    style: TextStyle(
                      color: theme.colorScheme.onErrorContainer,
                    ),
                  ),
                  backgroundColor: theme.colorScheme.errorContainer,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == CategoriesStatus.initial) {
              return const SizedBox();
            }

            if (state.status != CategoriesStatus.loading && state.categories.isEmpty) {
              return Center(
                child: Text(context.l10n.noRecipes),
              );
            }

            // TODO: this is ugly code
            final extent = CategoryCard.hightExtend(context);
            return GridView.builder(
              key: const Key('CategoriesView-grid'),
              padding: const EdgeInsets.all(16),
              gridDelegate: CategoryGridDelegate(extent: extent),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];

                return CategoryCard(
                  category: category,
                  key: Key('categoryCard-item-$index'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
