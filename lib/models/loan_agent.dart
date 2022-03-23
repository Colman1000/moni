import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/utils/extensions.dart';
import 'package:moni/utils/helpers.dart';

class LoanAgent {
  LoanAgent({
    required this.id,
    required this.name,
    required this.status,
    this.dueDate,
    this.dueAmount,
    this.avatar,
  });

  factory LoanAgent.fromMap(dynamic m, {required LoanDateStatus status}) {
    final _agent = m['agent'] as Map<String, dynamic>;

    return LoanAgent(
        id: _agent['id'],
        name: '${_agent['first_name']} ${_agent['last_name']}'.trim(),
        avatar: _agent['media_url'],
        dueDate: (_agent['recent_loan']?['agent_loan']?['loan_due_date'] ?? '')
            as String,
        dueAmount: (_agent['recent_loan']?['agent_loan']?['loan_amount_due'] ??
            0) as int,
        status: status);
  }

  String get subtitleString {
    String _prefix = Format.toCurrency(dueAmount ?? 0);

    switch (status) {
      case LoanDateStatus.overdue:
        return '$_prefix Late loan';

      case LoanDateStatus.due:
        return '$_prefix Late loan';

      case LoanDateStatus.active:
        return '$_prefix Active loan';

      case LoanDateStatus.inactive:
        return '';
    }
  }

  String get captionString {
    if (status == LoanDateStatus.inactive) {
      return '';
    }
    if (status == LoanDateStatus.due) {
      return 'Due today';
    }
    final _date = DateTime.tryParse(dueDate!);

    if (_date == null) {
      return '';
    }

    final _diff = _date.daysBetween();
    final _prefix = '$_diff day${_diff < 2 ? '' : 's'}';

    return '$_prefix ${status == LoanDateStatus.overdue ? 'over due' : 'to due date'}';
  }

  Color get subtitleColor {
    switch (status) {
      case LoanDateStatus.overdue:
        return MoniColors.redDarkest;
      case LoanDateStatus.due:
        return MoniColors.yellowDarkest;
      case LoanDateStatus.active:
        return MoniColors.greenDarkest;
      case LoanDateStatus.inactive:
        return MoniColors.dark;
    }
  }

  Color get captionColor {
    switch (status) {
      case LoanDateStatus.overdue:
        return MoniColors.redDarkest;
      case LoanDateStatus.due:
        return MoniColors.yellowDarkest;
      case LoanDateStatus.active:
        return MoniColors.greenDarkest;
      case LoanDateStatus.inactive:
        return MoniColors.greenLighter;
    }
  }

  final String name, id;
  final String? dueDate, avatar;
  final int? dueAmount;
  final LoanDateStatus status;
}

enum LoanDateStatus { overdue, due, active, inactive }
