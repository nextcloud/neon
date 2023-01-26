part of '../neon.dart';

class NeonLogo extends StatelessWidget {
  const NeonLogo({
    this.withoutText = false,
    super.key,
  });

  final bool withoutText;

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          SvgPicture.asset(
            'assets/logo_neon.svg',
            width: 100,
            height: 100,
          ),
          if (!withoutText) ...[
            Text(
              AppLocalizations.of(context).appName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ],
      );
}
