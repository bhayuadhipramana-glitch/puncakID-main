// ============================================================
// FILE    : lib/features/mountains/data/repositories/forum_repository.dart
// FEATURE : Mountains / Forum
// PURPOSE : Repository for forum threads and replies API calls
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/forum_thread_model.dart';
import '../models/forum_reply_model.dart';

/// Provider for [ForumRepository].
final forumRepositoryProvider = Provider<ForumRepository>((ref) {
  return ForumRepository(dio: ref.read(dioProvider));
});

/// Handles forum-related API interactions.
///
/// Endpoints mapped from ForumDiskusi.jsx API calls.
class ForumRepository {
  final Dio _dio;

  ForumRepository({required Dio dio}) : _dio = dio;

  /// Fetch forum threads for a specific mountain.
  Future<List<ForumThreadModel>> getThreads(String mountainSlug) async {
    try {
      final response = await _dio.get(ApiConstants.kThreads(mountainSlug));
      final data = response.data;
      if (data is List) {
        return data
            .map((j) => ForumThreadModel.fromJson(j as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Fetch replies for a specific thread.
  Future<List<ForumReplyModel>> getReplies(int threadId) async {
    try {
      final response = await _dio.get(ApiConstants.kReplies(threadId));
      final data = response.data;
      if (data is List) {
        return data
            .map((j) => ForumReplyModel.fromJson(j as Map<String, dynamic>))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Create a new forum thread.
  Future<ForumThreadModel> createThread({
    required String mountainSlug,
    required String title,
    required String body,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.kThreads(mountainSlug),
        data: {'title': title, 'body': body},
      );
      return ForumThreadModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }

  /// Create a reply to a thread.
  Future<ForumReplyModel> createReply({
    required int threadId,
    required String body,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.kReplies(threadId),
        data: {'body': body},
      );
      return ForumReplyModel.fromJson(response.data);
    } on DioException catch (e) {
      throw extractApiException(e);
    }
  }
}
