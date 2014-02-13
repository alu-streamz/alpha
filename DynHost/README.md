Accéder à distance à son kit: DynHost
======================

Pour accéder à votre kit à distance, vous avez besoin de connaitre son adresse IPv6. Comme cette adresse change au fil du temps, il est plus simple d'utiliser un service de type DynHost pour n'avoir à retenir qu'un seul pointeur vers votre kit sous la forme d'une URL.<ul>

Voici la procédure à suivre pour configurer DynHost sur votre kit:
<ul>
<li>Créez un répertoire pour y mettre les scripts, par exemple le répertoire /home/root/4G_ddns</li>
<li>Copiez les fichiers dynhost, ipcheck.py et old.ip sur votre beaglebone dans le répertoire que vous avez créé à cet effet.</li>
<li>Rendez le fichier dynhost executable:
<code>chmod +x dynhost</code></li>
<li>Editez le fichier dynhost et renseignez les paramètres HOST, LOGIN, et PASSWORD (lignes 15, 16, et 17), par exemple:
<pre><code>HOST=monkit.alu-streamz.mobi
LOGIN=alu-streamz.mobi-fred
PASSWORD=monmotdepasse
</code>
</pre></li>
<li>Lancez le script dynhost une fois connecté en IPv6, par exemple en ajoutant la ligne <code>/home/root/4G_ddns/dynhost</code> dans le fichier /home/root/4Glink</li>
</ul>

Voilà. Vous devriez maintenant être capable de vous connecter à distance à votre kit via l'URL que vous avez renseignée dans le paramètre HOST.
Essayez de vous connecter à Cloud9 en tapant dans un navigateur internet l'URL suivie de ":3000", par exemple http://monkit.alu-streamz.mobi:3000

