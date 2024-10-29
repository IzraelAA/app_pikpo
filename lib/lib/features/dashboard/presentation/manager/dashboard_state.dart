part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final LocalParticipant? localParticipant;
  final RemoteParticipant? remoteParticipant;
  final bool isConnected;
  final bool isVideoEnable;
  final bool isAudioEnable;
  final String? errorMessage;

  const DashboardState({
    this.localParticipant,
    this.remoteParticipant,
    this.isVideoEnable = false,
    this.isAudioEnable = false,
    this.isConnected = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        localParticipant,
        isAudioEnable,
        isAudioEnable,
        remoteParticipant,
        isConnected,
        errorMessage
      ];

  DashboardState copyWith({
    LocalParticipant? localParticipant,
    RemoteParticipant? remoteParticipant,
    bool? isConnected,
    bool? isAudioEnable,
    bool? isVideoEnable,
    String? errorMessage,
  }) {
    return DashboardState(
      localParticipant: localParticipant ?? this.localParticipant,
      remoteParticipant: remoteParticipant ?? this.remoteParticipant,
      isConnected: isConnected ?? this.isConnected,
      errorMessage: errorMessage ?? this.errorMessage,
      isVideoEnable: isVideoEnable ?? this.isVideoEnable,
      isAudioEnable: isAudioEnable ?? this.isAudioEnable,
    );
  }
}
