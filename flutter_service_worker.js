'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "31e6ad4affd50b780e16e83f21d4a740",
"assets/assets/fonts/Poppins-Bold.ttf": "c23534acbeddbaadfd0ab2d2bbfdfc84",
"assets/assets/fonts/Poppins-Regular.ttf": "41e8dead03fb979ecc23b8dfb0fef627",
"assets/assets/fonts/Poppins-SemiBold.ttf": "342ba3d8ac29ac8c38d7cef8efbf2dc9",
"assets/assets/images/darshan.jpg": "c0aa6f28fc25c9700607c6ecc9854824",
"assets/assets/rive/bouncing_arrow.flr": "251d237d8e7fe4f5e4dab0b2e57e7f89",
"assets/assets/social%2520icons/Github.png": "472739dfb5857b1f659f4c4c6b4568d0",
"assets/assets/social%2520icons/LinkedIn.png": "80d6a6fb036c9fb2e0fb66067f9bb912",
"assets/assets/social%2520icons/Mail.png": "1152c4c33166de10749e72afe26dd19f",
"assets/assets/social%2520icons/Twitter.png": "1f75d678b5526b783b2918b76f3262e7",
"assets/FontManifest.json": "1bcbf261a1ae70ef69d6bd4509236fb0",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "cb5924c39f4eb57ee92ee193dcc1c0c9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "f51878196a6decb51e0927df8889379d",
"/": "f51878196a6decb51e0927df8889379d",
"main.dart.js": "e56fb08abac64565dbdf52f638b0806e",
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
