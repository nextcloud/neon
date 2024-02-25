import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

abstract class TalkCallParticipant {
  TalkCallParticipant(
    this.userID,
    this.sessionID,
    this.renderer,
    this.stream,
  );

  final String userID;
  final String sessionID;
  RTCVideoRenderer? renderer;
  MediaStream? stream;

  void dispose() {
    stream?.getTracks().forEach((track) => unawaited(track.stop()));
    unawaited(stream?.dispose());
    renderer?.srcObject = null;
    unawaited(renderer?.dispose());
  }
}

class TalkLocalCallParticipant extends TalkCallParticipant {
  TalkLocalCallParticipant(
    super.userID,
    super.sessionID,
    super.renderer,
    super.stream,
  );
}

class TalkRemoteCallParticipant extends TalkCallParticipant {
  TalkRemoteCallParticipant(
    super.userID,
    super.sessionID,
    super.renderer,
    super.stream,
    this._connection,
    this._senders, {
    this.audioEnabled = false,
    this.videoEnabled = false,
  });

  RTCPeerConnection? _connection;
  List<RTCRtpSender>? _senders;
  final List<RTCIceCandidate> _candidates = [];
  bool audioEnabled;
  bool videoEnabled;

  RTCPeerConnection? get connection => _connection;
  List<RTCRtpSender>? get senders => _senders;

  Future<void> _clearSenders() async {
    if (_senders != null && _connection != null) {
      for (final sender in _senders!) {
        await _connection!.removeTrack(sender);
      }
    }
    if (_senders != null) {
      for (final sender in _senders!) {
        try {
          await sender.dispose();
        } catch (_) {
          // TODO: Somehow peerConnection is null when calling this on disposing the participant
        }
      }
      _senders = null;
    }
  }

  Future<void> acceptNewConnection(RTCPeerConnection? connection) async {
    await _clearSenders();
    await _connection?.close();
    _connection = connection;
    if (_connection != null) {
      for (final candidate in _candidates) {
        debugPrint('Loading candidate');
        await _connection!.addCandidate(candidate);
      }
      _candidates.clear();
    }
  }

  Future<void> acceptNewLocalStream(MediaStream? stream) async {
    await _clearSenders();
    if (_connection != null && stream != null) {
      _senders = [];
      for (final track in stream.getTracks()) {
        _senders!.add(await _connection!.addTrack(track, stream));
      }
    }
  }

  Future<void> addCandidate(RTCIceCandidate candidate) async {
    if (connection != null) {
      await connection!.addCandidate(candidate);
    } else {
      _candidates.add(candidate);
      debugPrint('Storing candidate for later use');
    }
  }

  @override
  void dispose() {
    unawaited(_clearSenders());
    unawaited(_connection?.close());
    super.dispose();
  }
}
