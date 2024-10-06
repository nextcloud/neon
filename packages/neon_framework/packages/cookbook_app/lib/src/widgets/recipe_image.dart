import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;
import 'package:vector_graphics/vector_graphics.dart';

/// Displays the image for a given recipe.
class RecipeImage extends StatelessWidget {
  /// Creates a new recipe image.
  const RecipeImage({
    required this.recipeID,
    this.size,
    super.key,
  });

  /// The id of the recipe to display the image for.
  final String recipeID;

  /// The size of the recipe image to fetch.
  ///
  /// Uses [cookbook.GetImageSize] for the sizes and falls back to the full
  /// resolution if hone is specified.
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final sizeParam = switch (size?.longestSide) {
      != null && <= 16 => cookbook.GetImageSize.thumb16,
      != null && <= 250 => cookbook.GetImageSize.thumb,
      _ => cookbook.GetImageSize.full,
    };

    return NeonApiImage(
      key: Key('recipe-image-$recipeID-$sizeParam'),
      getRequest: (client) {
        return client.cookbook.recipes.$getImage_Request(id: recipeID, size: sizeParam);
      },
      etag: null,
      expires: null,
      account: context.read<Account>(),
      errorBuilder: (context, error) {
        return VectorGraphic(
          key: Key('recipe-image-fallback-$sizeParam'),
          width: size?.width,
          height: size?.height,
          loader: const AssetBytesLoader(
            'assets/app.svg.vec',
            packageName: 'neon_cookbook',
          ),
        );
      },
      fit: BoxFit.fill,
      size: size,
    );
  }
}
