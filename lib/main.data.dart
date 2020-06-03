

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering

import 'dart:io';
import 'package:flutter_data/flutter_data.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:mayim/data/message.dart';
import 'package:mayim/data/user.dart';
import 'package:mayim/data/conversation.dart';

extension FlutterData on DataManager {

  static Future<DataManager> init(Directory baseDir, {bool autoModelInit = true, bool clear, bool remote, bool verbose, List<int> encryptionKey, Function(void Function<R>(R)) also}) async {
    assert(baseDir != null);

    final injection = DataServiceLocator();

    final manager = await DataManager(autoModelInit: autoModelInit).init(baseDir, injection.locator, clear: clear, verbose: verbose);
    injection.register(manager);
    final messageLocalAdapter = await $MessageLocalAdapter(manager, encryptionKey: encryptionKey).init();
    injection.register(messageLocalAdapter);
    injection.register<Repository<Message>>($MessageRepository(messageLocalAdapter, remote: remote, verbose: verbose));

    final userLocalAdapter = await $UserLocalAdapter(manager, encryptionKey: encryptionKey).init();
    injection.register(userLocalAdapter);
    injection.register<Repository<User>>($UserRepository(userLocalAdapter, remote: remote, verbose: verbose));

    final conversationLocalAdapter = await $ConversationLocalAdapter(manager, encryptionKey: encryptionKey).init();
    injection.register(conversationLocalAdapter);
    injection.register<Repository<Conversation>>($ConversationRepository(conversationLocalAdapter, remote: remote, verbose: verbose));


    if (also != null) {
      // ignore: unnecessary_lambdas
      also(<R>(R obj) => injection.register<R>(obj));
    }

    return manager;

}

  List<SingleChildWidget> get providers {
  return [
    Provider<Repository<Message>>.value(value: locator<Repository<Message>>()),
Provider<Repository<User>>.value(value: locator<Repository<User>>()),
Provider<Repository<Conversation>>.value(value: locator<Repository<Conversation>>()),
  ];
}

  
}



List<SingleChildWidget> dataProviders(Future<Directory> Function() directory, {bool clear, bool remote, bool verbose, List<int> encryptionKey}) => [
  FutureProvider<DataManager>(
    create: (_) => directory().then((dir) {
          return FlutterData.init(dir, clear: clear, remote: remote, verbose: verbose, encryptionKey: encryptionKey);
        })),


    ProxyProvider<DataManager, Repository<Message>>(
      lazy: false,
      update: (_, m, __) => m?.locator<Repository<Message>>(),
    ),


    ProxyProvider<DataManager, Repository<User>>(
      lazy: false,
      update: (_, m, __) => m?.locator<Repository<User>>(),
    ),


    ProxyProvider<DataManager, Repository<Conversation>>(
      lazy: false,
      update: (_, m, __) => m?.locator<Repository<Conversation>>(),
    ),];
