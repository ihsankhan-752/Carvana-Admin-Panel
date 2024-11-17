// import 'package:googleapis_auth/auth_io.dart';
//
// class FcmAccessToken {
//   static String firebaseMessagingScope = "https://www.googleapis.com/auth/firebase.messaging";
//
//   Future<String> getAccessToken() async {
//     final client = await clientViaServiceAccount(
//         ServiceAccountCredentials.fromJson({
//           "type": "service_account",
//           "project_id": "restaurant-automation-6f0aa",
//           "private_key_id": "b673dfc53568b5d2282715674d3a8c3debc83880",
//           "private_key":
//               "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDO81ad1WYSuW18\nHxqJBvUcInsvg0rOPVDuwNxXCv/HEKPA7ZZilGJRE455xYkNaVNfvxCh6f+8dKxZ\nDpMkwVb3ryPr36aNdyWFbCdO/oP/XR+MArk3mP9+kRGtUcCOTMq13QxHcU0/5c0F\nDi0VyrBXv6pQPDzbMVvfYh9UxN2EjEwsvkDeXcHsFwxZPR0/xzQfvpo16U8a/IIJ\nGx7PVuSqrwiGcaE0+OeBsUyDTVDw/6w6Mftz0UXJ9tIcWQUxqETFWc5Ij5bUhixY\n1e67SZi4M8n/WMWS2plwl/B1ekO5xqwJzzGnK3eAtmxU8IRV8jLu/7sZKFGzWbs3\n4q2mnOCPAgMBAAECggEARhw9Q2Jo3r4QH+U/rZ18S4hI+Gs/3Af8063l191DkvKJ\nr5IuCP6hIjuAYLOxvyfoFX9ayKfIOlXCj7c21VRkvKuKfV37BGERhpaB6KqkGE65\nocrIadP89ql59iBEnlDYue0FvGxfkd6t6uEHGCNfQ5MMxXrq2Q1rRQ3udF7vdvge\nAlfwGf1UTg//RIBNzv1+yk8PFq+C/Rl+rYZb5ki5D4bzUiv0Zqbdqmv91e4dKsQ4\nJLzOmndo7kcJ69gZcuuk+ZtThDQysRhRq5UdF/JAHvPVvXPAzEQTSjBpddlhMkpq\nlc+MbWc9xgyuqsAE3LNOYTFFNIKDeGDfA+1qkeL31QKBgQDPMVhkTG11Yf9149fU\nAF/vA6LQfQHmjshq/TZvqxZhvliHyGV8cLvr9wM+qk3SMqFF/KtfDeqdfLseIUnk\noiTa1qSywnxUCUbXbXveTOouKlFAQnmS65T6KUlwrECXRg3FTOXDoGmq7KTbtTXS\nPnxsxLAyYLuFCk8Ly1y6vkUfBQKBgQD/s2Ltg7v1uUmkdknVt5RbD1LA98/N0nr9\n81+zea8QqVXpLRGhlIF38CZf94TmFbBCYb4r00JkpVj80BGBOtcJu5obqWg78oZm\nqOTf58ylqWEXds740UoiuFu2Cd2ZM0o/QjkMj9gClSiianaV1ZMJcbc3ENqFeVHn\nKFn9aHvNgwKBgQCp3yc9dHv51ZMBMQDvTC9bY3vFu/gm88HWFizfeUIseUdUbDTo\nxfUNDcSXSEHtqJ0ZKIPItzw4St+PYHOZBGd7FKiL93C/5aszTQxVwnHtz7w2F0pd\n7tCCGf+gZVm/rSv1K4rlzUtVXBf+GqA59AlHlCtx4mVcOot8fAtXAFDjkQKBgGA7\nyjqrvpy/TEj6P9WQTuRqgvGfEnVbBvD2nIj2ff2eTXgBf0Y5lvRlzHuHs1vIw9pn\n4OOrkaxBUplrUXs6gt3l3h0VB+av4wdV/zWJjsq2UZU8IK8iTW19xv5e/ih/Vi0y\npjflFx35tx5RRSolBD6krpip3iQnwbxmwl+N6DIzAoGBAJC2MVgO2QZba1wYH+b2\nBUpgDMwJ61kz2KuQVjRqOfawN0UBnUZ/E80dqnPgSbbogO1/x1Xwfgn0JMOTIggJ\nayDkPWVLIGa4CrBMdwCfaPEsYtOBPhmbCquUZFnWr0BcyrzugUfs/ebLXCxXImp6\n/PsJOCfLkJ2llCCQPQrMS1Gs\n-----END PRIVATE KEY-----\n",
//           "client_email": "firebase-adminsdk-v4983@restaurant-automation-6f0aa.iam.gserviceaccount.com",
//           "client_id": "115545459876567461182",
//           "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//           "token_uri": "https://oauth2.googleapis.com/token",
//           "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//           "client_x509_cert_url":
//               "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-v4983%40restaurant-automation-6f0aa.iam.gserviceaccount.com",
//           "universe_domain": "googleapis.com"
//         }),
//         [firebaseMessagingScope]);
//     final accessToken = client.credentials.accessToken.data;
//     return accessToken;
//   }
// }
