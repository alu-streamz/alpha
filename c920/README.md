Streamer une camera Logitech C920 vers un laptop: méthode manuelle
======================

Pour streamer le flux video d'une caméra Logitech C920 vers votre laptop, vous pouvez utiliser une solution basée côté beaglebone sur GStreamer (projet Bonecam) et côté client sur vlc (http://www.videolan.org).
L'installation de Vlc n'est pas détaillée ici.


Voici la procédure à suivre pour installer et utiliser Bonecam sur votre kit:
<ul>
<li>Créez un répertoire pour y mettre les scripts, par exemple le répertoire /home/root/c920</li>
<li>Copiez le fichier gst-start.sh sur votre beaglebone dans le répertoire que vous avez créé à cet effet, et rendez le executable:
<code>chmod +x gst-start.sh</code></li>
<li>Copiez le répertoire bonecam sur votre beaglebone dans le répertoire que vous avez créé à cet effet</li>
<li>Dans le répertoire bonecam, compilez bonecam: <code>chmod +x build; ./build</code></li>
<li>Installez le plugin gstreamer pour supporter le flux h264 généré par la camera C920:
<code>opkg install gst-plugins-bad-h264parse</code></li>
<li>Copiez le fichier c920.sdp sur votre laptop</li>
<li>Sur votre beaglebone, lancez le script gst-start.sh suivi de l'adresse IP de votre laptop
<code>./gst_start.sh 172.27.31.12</code></li>
<li>Sur votre laptop, double-cliquez sur le fichier <code>c920.sdp</code>. Vlc devrait alors se lancer et afficher le flux de votre C920 au bout de quelques secondes.</li>
<li>Pour arrêter le flux video sur votre Beaglebone, faites Ctrl+C</li>
</ul>


Automatiser le Streaming d'une camera Logitech C920 vers un laptop
======================

Une façon de faire est d'utiliser l'IDE Cloud9 pour faire tourner un service web, et de lui faire lancer des script pour démarrer ou arrêter le flux video de la C920.
Il est aussi nécessaire de pouvoir atteindre votre kit à distance depuis votre laptop via IPv6 (adresse ou url DynHost).

<ul>
<li>Copiez le fichier stream.sh dans le répertoire dans lequel vous avez précédemment mis le script pour gstreamer (dans notre exemple /home/root/c920), et rendez le executable:
<code>chmod +x stream.sh</code></li>
<li>Installez le middleware "express" pour nodejs via npm comme suit:
<code>npm set strict-ssl false<br />
npm install -g express</code></li>
<li>Via l'IDE cloud9 de votre Beaglebone, créez dans le répertoire demo un nouveau fichier via menu File>New File (ou en utilisant le raccourci Ctrl+N), copiez-y le contenu du fichier stream.js et sauvegardez le(Ctrl+S)</li>
<li>Dans votre navigateur web, glissez le fichier stream.js dans le répertoire "autorun"</li>
<li>Ouvrez un nouveau navigateur web sur l'adresse de votre kit (adresse IPv6 ou url du DynHost) suivie de ":3001/video"</li>
<li>Pour démarrer le flux vidéo de la C920, cliquez dans votre navigateur web sur le lien "start video stream"</li>
<li>Sur votre laptop, double-cliquez sur le fichier c920.sdp. Vlc devrait alors se lancer et afficher le flux de votre C920 au bout de quelques secondes.</li>
<li>Pour arrêter le flux vidéo de la C920, cliquez dans votre navigateur web sur le lien "stop video stream"</li>
</ul>
