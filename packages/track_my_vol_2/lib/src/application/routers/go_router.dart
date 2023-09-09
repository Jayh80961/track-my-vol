import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/pages.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'my',
          builder: (BuildContext context, GoRouterState state) {
            return const MyPage();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const SignInPage();
          },
          redirect: (BuildContext context, GoRouterState state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return '/';
            }
            return null;
          },
        ),
        GoRoute(
          path: 'vol/:volId',
          builder: (BuildContext context, GoRouterState state) {
            return const VolPage();
          },
        ),
        GoRoute(
          path: 'post',
          builder: (BuildContext context, GoRouterState state) {
            return const PostPage();
          },
        ),
      ],
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/login';
    }
    return null;
  },
);
