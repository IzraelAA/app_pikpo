import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:livekit_client/livekit_client.dart';

part 'dashboard_state.dart';

@Injectable()
class DashboardCubit extends Cubit<DashboardState> {
  late Room _room;
  late EventsListener<RoomEvent> _listener;


  DashboardCubit() : super(DashboardInitial());

  // Inisialisasi room dan pengaturan awal
  Future<void> connectToLiveKit(String url, String token) async {
    _room = Room(
      roomOptions: RoomOptions(
        defaultCameraCaptureOptions: const CameraCaptureOptions(
          cameraPosition: CameraPosition.front,
          params: VideoParametersPresets.h720_169,
        ),
        defaultAudioCaptureOptions: const AudioCaptureOptions(
          noiseSuppression: true,
          echoCancellation: true,
          autoGainControl: true,
          highPassFilter: true,
          typingNoiseDetection: true,
        ),
        defaultVideoPublishOptions: VideoPublishOptions(
          videoEncoding: VideoParametersPresets.h720_169.encoding,
          videoSimulcastLayers: [
            VideoParametersPresets.h180_169,
            VideoParametersPresets.h360_169,
          ],
        ),
        defaultAudioPublishOptions: const AudioPublishOptions(
          dtx: true,
        ),
      ),
    );

    try {
      await _room.connect(url, token);
      emit(DashboardConnected(_room));  // Emit state saat terkoneksi

      // Aktifkan video dan audio setelah terhubung
      await enableVideo(true);
      await enableAudio(true);

      _setupListeners();
    } catch (error) {
      emit(DashboardError("Could not connect: $error"));
    }
  }

  // Metode untuk mengaktifkan/mematikan video
  Future<void> enableVideo(bool isEnabled) async {
    try {
      await _room.localParticipant?.setCameraEnabled(isEnabled);
      emit(DashboardParticipantConnected(_room.localParticipant!));  // Emit perubahan status video
    } catch (error) {
      emit(DashboardError("Could not toggle video: $error"));
    }
  }

  // Metode untuk mengaktifkan/mematikan audio
  Future<void> enableAudio(bool isEnabled) async {
    try {
      await _room.localParticipant?.setMicrophoneEnabled(isEnabled);
      emit(DashboardParticipantConnected(_room.localParticipant!));  // Emit perubahan status audio
    } catch (error) {
      emit(DashboardError("Could not toggle audio: $error"));
    }
  }

  // Pengaturan listener untuk event room
  void _setupListeners() {
    _listener = _room.createListener();
    _listener
      ..on<RoomDisconnectedEvent>((event) {
        emit(DashboardDisconnected());
      })
      ..on<ParticipantConnectedEvent>((event) {
        emit(DashboardParticipantConnected(event.participant));
      })
      ..on<ParticipantDisconnectedEvent>((event) {
        emit(DashboardParticipantDisconnected(event.participant));
      });
  }

  @override
  Future<void> close() async {
    await _listener.dispose();
    await _room.disconnect();
    return super.close();
  }
}
