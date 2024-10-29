part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardConnected extends DashboardState {
  final Room room;
  const DashboardConnected(this.room);

  @override
  List<Object?> get props => [room];
}

class DashboardParticipantConnected extends DashboardState {
  final Participant participant;
  const DashboardParticipantConnected(this.participant);

  @override
  List<Object?> get props => [participant];
}

class DashboardParticipantDisconnected extends DashboardState {
  final Participant participant;
  const DashboardParticipantDisconnected(this.participant);

  @override
  List<Object?> get props => [participant];
}

class DashboardDisconnected extends DashboardState {}

class DashboardError extends DashboardState {
  final String message;
  const DashboardError(this.message);

  @override
  List<Object?> get props => [message];
}
