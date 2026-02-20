import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/src/models/app_capabilities.dart';

/// Extension on [AppsBloc] for easier handling of app capabilities in the UI layer.
extension AppCapabilityExtension on AppsBloc {
  /// Finds a handler for the given capability and invokes it, returning the result if available.
  /// 
  /// This function is syntactic sugar for easier handling of app capabilities. 
  /// It was implemented as extension to not expose the [AppsBloc] to the UI layer.
  Future<C>? handleAppCapability<C extends AppCapability>(BuildContext context, C? capability) => capability == null ? null :
    findAppCapabilityHandler(capability)?.handle(context, capability);
}
