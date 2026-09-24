import 'package:flutter_test/flutter_test.dart';
import 'package:yorsho_mobile/core/utils/app_version_comparator.dart';

void main() {
  group('AppVersionComparator.isLocalOutdated', () {
    test('uses build numbers when both are ints', () {
      expect(
        AppVersionComparator.isLocalOutdated(
          localVersion: '2.0.0',
          localBuild: '10',
          remoteVersion: '1.0.0',
          remoteBuild: '11',
        ),
        isTrue,
      );
      expect(
        AppVersionComparator.isLocalOutdated(
          localVersion: '1.0.0',
          localBuild: '12',
          remoteVersion: '9.0.0',
          remoteBuild: '11',
        ),
        isFalse,
      );
    });

    test('falls back to semver when builds are not ints', () {
      expect(
        AppVersionComparator.isLocalOutdated(
          localVersion: '1.2.0',
          localBuild: 'abc',
          remoteVersion: '1.2.1',
          remoteBuild: 'xyz',
        ),
        isTrue,
      );
      expect(
        AppVersionComparator.isLocalOutdated(
          localVersion: '1.3.0',
          localBuild: 'abc',
          remoteVersion: '1.2.9',
          remoteBuild: 'xyz',
        ),
        isFalse,
      );
    });
  });

  group('AppVersionComparator.compareSemver', () {
    test('compares dotted versions', () {
      expect(AppVersionComparator.compareSemver('1.0.0', '1.0.1'), lessThan(0));
      expect(AppVersionComparator.compareSemver('1.2', '1.2.0'), 0);
      expect(AppVersionComparator.compareSemver('2.0.0', '1.9.9'), greaterThan(0));
    });
  });
}
