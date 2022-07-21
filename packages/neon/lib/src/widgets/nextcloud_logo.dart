part of '../neon.dart';

class NextcloudLogo extends StatelessWidget {
  const NextcloudLogo({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => SvgPicture.asset(
        'assets/logo_nextcloud.svg',
        width: 100,
        height: 100,
      );
}
