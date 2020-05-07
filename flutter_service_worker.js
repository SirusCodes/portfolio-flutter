'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "d7a52db793086f2dc80e1dd9ef866c87",
"assets/assets/fonts/Poppins-Bold.ttf": "c23534acbeddbaadfd0ab2d2bbfdfc84",
"assets/assets/fonts/Poppins-Regular.ttf": "41e8dead03fb979ecc23b8dfb0fef627",
"assets/assets/fonts/Poppins-SemiBold.ttf": "342ba3d8ac29ac8c38d7cef8efbf2dc9",
"assets/assets/social%2520icons/Github.png": "472739dfb5857b1f659f4c4c6b4568d0",
"assets/assets/social%2520icons/LinkedIn.png": "80d6a6fb036c9fb2e0fb66067f9bb912",
"assets/assets/social%2520icons/Mail.png": "1152c4c33166de10749e72afe26dd19f",
"assets/assets/social%2520icons/Twitter.png": "1f75d678b5526b783b2918b76f3262e7",
"assets/FontManifest.json": "2ef1fa161105b1c1e37fc0dd7c55d6d1",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "de5d27f460594305eb9ab77a9bae57d8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "f51878196a6decb51e0927df8889379d",
"/": "f51878196a6decb51e0927df8889379d",
"main.dart.js": "ce19489c8750b020ea0dcc0f2fafd269",
"manifest.json": "43b77533487762ba5654a181ea2dec2f"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
