part of '../harbour.dart';

class HarbourLogo extends StatelessWidget {
  const HarbourLogo({
    this.withoutText = false,
    super.key,
  });

  final bool withoutText;

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          SvgPicture.asset(
            'assets/logo_harbour.svg',
            width: 100,
            height: 100,
          ),
          if (!withoutText) ...[
            Text(
              AppLocalizations.of(context).appName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ],
      );
}
