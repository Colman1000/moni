import 'dart:convert';

import 'package:moni/models/cluster_detail.dart';
import 'package:moni/providers/cluster_model.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

import '../helpers/test_http_client.dart';
import '../helpers/mock_data.dart';

void main() {
  group('ClusterModel', () {
    test('throws exception when status code is not 200', () async {
      final _mockRequest = MockRequest(Response("", 500));

      final _clusterModel = ClusterModel(_mockRequest.request, silent: true);

      expectLater(_clusterModel.query(), throwsA(isA<Exception>()));
    });
  });

  group('ClusterModel', () {
    test('.query transforms response into CluserDetail object', () async {
      final _mockRequest =
          MockRequest(Response(jsonEncode(mockClusterModelResponse), 200));

      final _c = ClusterModel(_mockRequest.request, silent: true);

      expect(await _c.query(), null); // completes without throwing an exception

      expect(_c.detail, isA<ClusterDetail>());
      expect(_c.totalAgents, 6);
      expect(_c.dueAgents.length, 1);
      expect(_c.activeAgents.length, 1);
      expect(_c.inactiveAgents.length, 2);
      expect(_c.overDueAgents.length, 2);

      /*
      "cluster_purse_balance": 300200,
      "total_interest_earned": 100,
      "total_owed_by_members": 20,
       */
      expect(_c.detail.name, 'Test Cluster');
      expect(_c.detail.repaymentDayString, 'Every Monday');
      expect(_c.detail.repaymentPercentage, '45%');

      expect(_c.detail.purseBalance, 300200);
      expect(_c.detail.totalInterestEarned, 100);
      expect(_c.detail.totalOwedByMembers, 20);
    });
  });
}
