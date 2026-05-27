// ============================================================
// FILE    : lib/features/mountains/domain/providers/forum_provider.dart
// FEATURE : Mountains / Forum
// PURPOSE : Riverpod providers for forum thread and reply state
// AUTHOR  : PuncakID Team
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/forum_thread_model.dart';
import '../../data/models/forum_reply_model.dart';
import '../../data/repositories/forum_repository.dart';

/// Forum threads provider for a specific mountain.
final forumThreadsProvider =
    FutureProvider.family<List<ForumThreadModel>, String>(
  (ref, mountainSlug) async {
    final repository = ref.read(forumRepositoryProvider);
    return repository.getThreads(mountainSlug);
  },
);

/// Forum replies provider for a specific thread.
final forumRepliesProvider =
    FutureProvider.family<List<ForumReplyModel>, int>(
  (ref, threadId) async {
    final repository = ref.read(forumRepositoryProvider);
    return repository.getReplies(threadId);
  },
);
