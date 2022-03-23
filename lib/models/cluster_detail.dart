import 'package:moni/models/loan_agent.dart';
import 'package:moni/utils/helpers.dart';

class ClusterDetail {
  ClusterDetail({
    required this.name,
    required this.repaymentRate,
    required this.repaymentDay,
    required this.purseBalance,
    required this.totalInterestEarned,
    required this.totalOwedByMembers,
    this.overdue = const [],
    this.due = const [],
    this.inactive = const [],
    this.active = const [],
  });

  factory ClusterDetail.fromMap(Map m) {
    final _data = m["data"] as Map<String, dynamic>;

    return ClusterDetail(
      name: _data['cluster_name'] ?? '',
      repaymentRate: _data['cluster_repayment_rate'] ?? 0,
      repaymentDay: _data['cluster_repayment_day'] ?? '',
      purseBalance: _data['cluster_purse_balance'] ?? 0,
      totalInterestEarned: _data['total_interest_earned'] ?? 0,
      totalOwedByMembers: _data['total_owed_by_members'] ?? 0,
      overdue: ((_data['overdue_agents'] ?? []) as List)
          .cast<Map<String, dynamic>>()
          .map((e) => LoanAgent.fromMap(e, status: LoanDateStatus.overdue))
          .toList(),
      due: ((_data['due_agents'] ?? []) as List)
          .cast<Map<String, dynamic>>()
          .map((e) => LoanAgent.fromMap(e, status: LoanDateStatus.due))
          .toList(),
      active: ((_data['active_agents'] ?? []) as List)
          .cast<Map<String, dynamic>>()
          .map((e) => LoanAgent.fromMap(e, status: LoanDateStatus.active))
          .toList(),
      inactive: ((_data['inactive_agents'] ?? []) as List)
          .cast<Map<String, dynamic>>()
          .map((e) => LoanAgent.fromMap(e, status: LoanDateStatus.inactive))
          .toList(),
    );
  }

  factory ClusterDetail.empty() {
    return ClusterDetail(
      name: ' - ',
      repaymentRate: 0,
      repaymentDay: '',
      purseBalance: 0,
      totalInterestEarned: 0,
      totalOwedByMembers: 0,
    );
  }

  String get repaymentPercentage => '${(repaymentRate * 100).toInt()}%';

  String get repaymentDayString =>
      repaymentDay.isEmpty ? ' - ' : 'Every $repaymentDay';

  String get formattedPurseBalance => purseBalance < 1 ? ' - ': Format.toCurrency(purseBalance);
  String get formattedTotalInterest => totalInterestEarned < 1 ? ' - ': Format.toCurrency(totalInterestEarned);
  String get formattedTotalOwed => totalOwedByMembers < 1 ? ' - ': Format.toCurrency(totalOwedByMembers);

  final String name;
  final num repaymentRate;
  final String repaymentDay;
  final num purseBalance;
  final num totalInterestEarned;
  final num totalOwedByMembers;

  final List<LoanAgent> overdue;
  final List<LoanAgent> due;
  final List<LoanAgent> active;
  final List<LoanAgent> inactive;
}
