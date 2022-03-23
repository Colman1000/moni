import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:moni/config/constants.dart';
import 'package:moni/models/cluster_detail.dart';
import 'package:moni/models/loan_agent.dart';
import 'package:moni/utils/helpers.dart';

class ClusterModel extends ChangeNotifier {
  ClusterModel(this._getClient, {this.silent = false});

  final bool silent; // for tests.. when set to true, snack bars wont be shown

  //------------------------------------------------------------

  final Future<Response> Function(Uri url, {Map<String, String>? headers})
      _getClient;

  //------------------------------------------------------------
  bool _isQueryingServer = false;

  bool get isQueryingServer => _isQueryingServer;

  //------------------------------------------------------------

  late ClusterDetail detail;

  //------------------------------------------------------------

  UnmodifiableListView<LoanAgent> get dueAgents =>
      UnmodifiableListView(detail.due);

  UnmodifiableListView<LoanAgent> get overDueAgents =>
      UnmodifiableListView(detail.overdue);

  UnmodifiableListView<LoanAgent> get activeAgents =>
      UnmodifiableListView(detail.active);

  UnmodifiableListView<LoanAgent> get inactiveAgents =>
      UnmodifiableListView(detail.inactive);

  //------------------------------------------------------------

  int get totalAgents =>
      dueAgents.length +
      overDueAgents.length +
      activeAgents.length +
      inactiveAgents.length;

  Future query() async {
    if (_isQueryingServer) return;

    _isQueryingServer = true;

    try {
      final response = await _getClient(Constants.api);
      if (response.statusCode >= 200 && response.statusCode < 400) {
        detail = ClusterDetail.fromMap(jsonDecode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to load data - Try again');
      }
    } on HttpException catch (e) {
      detail = ClusterDetail.empty();

      if (silent) {
        rethrow;
      } else {
        Helpers.showSnackBar(
          'Server Error - Try again later',
          type: SnackbarType.error,
        );
      }
    } on SocketException catch (e) {
      detail = ClusterDetail.empty();

      if (silent) {
        rethrow;
      } else {
        Helpers.showSnackBar(
          'Check your internet connection',
          type: SnackbarType.error,
        );
      }
    } catch (e) {
      detail = ClusterDetail.empty();

      if (silent) {
        rethrow;
      } else {
        Helpers.showSnackBar(
          e.toString(),
          type: SnackbarType.error,
        );
      }
    } finally {
      _isQueryingServer = false;
      notifyListeners();
    }
  }

  void viewPurse() {
    //NO OP
  }
}
