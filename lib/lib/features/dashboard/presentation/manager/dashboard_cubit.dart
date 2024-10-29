import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:livekit_client/livekit_client.dart';

part 'dashboard_state.dart';

@Injectable()
class DashboardCubit extends Cubit<DashboardState> {
  late Room _room;
  late EventsListener<RoomEvent> _listener;

  bool ready = false;

  DashboardCubit() : super(const DashboardState());

  // Initialize the room and set up the initial configuration
  Future<void> connectToLiveKit(String url, String token) async {
    print(url);
    _room = Room(
      roomOptions: const RoomOptions(
        defaultCameraCaptureOptions: CameraCaptureOptions(
          cameraPosition: CameraPosition.front,
          params: VideoParametersPresets.h720_169,
        ),
        defaultAudioCaptureOptions: AudioCaptureOptions(
          noiseSuppression: true,
          echoCancellation: true,
          autoGainControl: true,
          highPassFilter: true,
          typingNoiseDetection: true,
        ),
      ),
    );

    try {
      await _room.prepareConnection(url, token);
      await _room.connect(url, token);

      _setupListeners();
      await enableVideo(true);
      await enableAudio(true);
      emit(state.copyWith(
        localParticipant: _room.localParticipant,
        isConnected: true,
      ));
    } catch (error) {
      print(error);
      emit(state.copyWith(
        errorMessage: "Could not connect: $error",
      ));
    }
  }

  // Method to enable/disable video
  Future<void> enableVideo(bool isEnabled) async {
    try {
      print(isEnabled);
      print("enableVideo");
      await _room.localParticipant?.setCameraEnabled(isEnabled);
      emit(state.copyWith(
        localParticipant: _room.localParticipant,
        isVideoEnable: isEnabled,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: "Could not toggle video: $error",
      ));
    }
  }

  // Method to enable/disable audio
  Future<void> enableAudio(bool isEnabled) async {
    try {
      await _room.localParticipant?.setMicrophoneEnabled(isEnabled);
      emit(state.copyWith(
          localParticipant: _room.localParticipant,
          isAudioEnable: isEnabled));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: "Could not toggle audio: $error",
      ));
    }
  }

  // Setup listeners for room events
  void _setupListeners() {
    _listener = _room.createListener();
    _listener
      ..on<RoomDisconnectedEvent>((event) {
        emit(state.copyWith(
          isConnected: false,
        ));
      })
      ..on<ParticipantConnectedEvent>((event) {
        print("ParticipantConnectedEvent");
        _addParticipant(event.participant);
      })
      ..on<ParticipantDisconnectedEvent>((event) {
        print("ParticipantDisconnectedEvent");
        emit(state.copyWith(
          remoteParticipant: event.participant,
        ));
      })
      ..on<TrackSubscribedEvent>((event) async {
        print("TrackSubscribedEvent");
        if (event.track is VideoTrack) {
          if (ready == false) {
            var localVideo = await LocalVideoTrack.createCameraTrack();
            await _room.localParticipant?.publishVideoTrack(localVideo);
            ready = true;
          }
          emit(state.copyWith(
            remoteParticipant: event.participant,
          ));
        }
      })
      ..on<TrackUnsubscribedEvent>((event) {
        print("TrackUnsubscribedEvent");
        if (event.track is VideoTrack) {
          emit(state.copyWith(
            remoteParticipant: null,
          ));
        }
      })
      ..on<LocalTrackUnpublishedEvent>(
          (_) => print("TrackStreamStateUpdatedEvent"));
  }

  void _addParticipant(RemoteParticipant participant) {
    emit(state.copyWith(
      remoteParticipant: participant,
    ));
  }

  @override
  Future<void> close() async {
    await _listener.dispose();
    await _room.disconnect();
    return super.close();
  }
}
