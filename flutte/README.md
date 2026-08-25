### Flutter `flutter.dev`

- 
- Pour l'installer on.. `git` puis on téléchage le `sdk` via `docs.flutter.dev/install` l'archive `flutter_windows_<version>-stable.zip` extraire le zip et l'ajouter au `Path`
    > On.. l'installer dans `Vscode` via les extensions et `CTRL + Shift + p` .. `>flutter` pour utiliser les commandes
    > !! sur `Android` on installe `Android Studio` qui.. un émulateur `Virtual Device Manager` et va automatiquement télécharger les `Sdk` puis l'ajouter au `Path`
        > Si on fais une installation `Custom` il faudra ajouter le `Sdk` d'android `Path` avec le nom `ANDROID_HOME`
        > !! certaines licences android n'ont pas été acceptées on.. `flutter doctor --android-licenses`
        > On.. installé les `Command-line Tools` dans les paramètres de android studio `Languages & Frameworks` - `Android SDK` - `SDK Tools` - `Android SDK Command-line Tools`
    > !! installer `flutter` avec `Android Studio` directement en.. le plugin `Flutter` et on pourra créer de nouveu projet
- !! voir les ressources d'apprentissage `docs.flutter.dev/reference/learning-resources`

- **Command**
    > flutter doctor : Pour vérifier les détails de l'installation
    > flutter create ..
    > flutter run : !! démarrer le serveur


- **Important !**
    > 







Ah, mon erreur ! Flutter n'est pas un langage de programmation en soi, c'est un **framework** (une boîte à outils) créé par Google pour développer des applications. Le langage qu'il utilise s'appelle **Dart**.

## Le principe de base

L'idée centrale de Flutter est de permettre d'écrire **une seule base de code** qui compile ensuite vers plusieurs plateformes : iOS, Android, web, Windows, macOS, Linux. Pas besoin d'écrire une version Swift pour iPhone et une version Kotlin pour Android séparément.

## Comment ça fonctionne concrètement

**1. Tout est un "widget"**
En Flutter, absolument tout ce qui compose l'interface est un widget : un bouton, un texte, une marge, une couleur de fond, une animation. Ces widgets s'emboîtent les uns dans les autres comme des poupées russes pour former l'arbre complet de l'interface.

**2. Pas de composants natifs**
Contrairement à d'autres frameworks (comme React Native), Flutter ne s'appuie pas sur les composants graphiques natifs du téléphone. Il dessine littéralement chaque pixel lui-même grâce à son propre moteur de rendu (Skia, puis Impeller plus récemment). C'est pour ça que l'apparence est identique sur iOS et Android, au pixel près.

**3. Compilation native**
Le code Dart est compilé en code machine natif (ARM ou x86) pour la version finale de l'application, ce qui donne de bonnes performances, proches du natif.

**4. Réactivité déclarative**
Comme React, Flutter est **déclaratif** : au lieu de dire "modifie ce bouton pour qu'il devienne rouge", on décrit à quoi l'interface doit ressembler *en fonction de l'état actuel*, et Flutter se charge de recalculer et redessiner ce qui a changé.

```dart
Widget build(BuildContext context) {
  return Text(compteur > 10 ? "Beaucoup !" : "Peu");
}
```

Dès que `compteur` change, Flutter reconstruit automatiquement cette partie de l'interface.

**5. Hot reload**
Un des grands atouts pratiques : on peut modifier le code et voir le résultat s'afficher instantanément dans l'application en cours d'exécution, sans redémarrer — ce qui accélère énormément le développement.

Tu veux que je détaille un aspect particulier (le State management, la différence avec React Native, ou un exemple de code plus complet) ?










Super, allons-y pour un vrai tour d'horizon du développement Flutter, de l'installation jusqu'à la construction d'une app simple.

## 1. Installation et outils

Pour développer en Flutter, il te faut :
- Le **SDK Flutter** (contient Dart, les outils de compilation, etc.)
- Un éditeur : **VS Code** ou **Android Studio** (les deux ont des extensions Flutter très complètes avec hot reload intégré)
- Un émulateur (Android) ou simulateur (iOS, nécessite un Mac) pour tester, ou simplement ton téléphone en mode développeur

La commande `flutter doctor` vérifie que tout est bien configuré sur ta machine.

## 2. Structure d'un projet

Quand tu crées un projet avec `flutter create mon_app`, tu obtiens principalement :

```
mon_app/
  lib/
    main.dart       ← point d'entrée de l'app
  android/          ← projet natif Android généré
  ios/              ← projet natif iOS généré
  pubspec.yaml      ← dépendances et configuration
```

Le dossier `lib/` est celui où tu passes 95% de ton temps. `pubspec.yaml` fonctionne comme un `package.json` en JavaScript : il liste les librairies externes (appelées "packages" ou "pub packages").

## 3. L'app la plus simple possible

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ma première app')),
        body: const Center(child: Text('Bonjour !')),
      ),
    );
  }
}
```

Quelques éléments clés à repérer :
- **`MaterialApp`** : enveloppe racine qui applique le thème visuel Material Design (Google)
- **`Scaffold`** : structure de base d'un écran (barre du haut, corps, éventuellement barre de navigation en bas)
- **`build()`** : méthode qui décrit l'interface. Elle est rappelée chaque fois que l'état change.

## 4. Deux types de widgets fondamentaux

C'est la distinction la plus importante à bien comprendre :

**StatelessWidget** — n'a pas de mémoire interne, son apparence dépend uniquement des paramètres qu'on lui passe.

**StatefulWidget** — a une mémoire interne (son "état") qui peut changer avec le temps, par exemple un compteur, une case cochée, du texte saisi.

```dart
class Compteur extends StatefulWidget {
  const Compteur({super.key});
  @override
  State<Compteur> createState() => _CompteurState();
}

class _CompteurState extends State<Compteur> {
  int valeur = 0;

  void incrementer() {
    setState(() {
      valeur++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Valeur : $valeur'),
        ElevatedButton(
          onPressed: incrementer,
          child: const Text('+1'),
        ),
      ],
    );
  }
}
```

Le point crucial : **`setState()`**. C'est cet appel qui dit à Flutter "l'état a changé, reconstruis l'interface". Sans lui, la variable changerait bien en mémoire, mais rien ne se rafraîchirait à l'écran.

## 5. La mise en page (layout)

Flutter organise l'interface avec des widgets d'agencement qu'on empile :

- **`Column`** : empile des widgets verticalement
- **`Row`** : les aligne horizontalement
- **`Container`** : une boîte avec marges, couleur, taille
- **`Padding`**, **`Center`**, **`Expanded`** : ajustent l'espace

Il n'y a pas de CSS séparé — tout se fait en imbriquant des widgets Dart les uns dans les autres.

## 6. Gestion d'état à plus grande échelle

Pour une petite app, `setState` suffit. Mais dès que l'état doit être partagé entre plusieurs écrans, les solutions courantes sont :

- **Provider** — la plus simple à apprendre, recommandée pour débuter
- **Riverpod** — une évolution plus robuste de Provider
- **Bloc** — plus structuré, basé sur des flux d'événements, adapté aux grosses apps

Pour débuter, je conseille de rester avec `setState` le temps de bien comprendre les widgets, puis de passer à **Provider**.

## 7. Un chemin d'apprentissage réaliste

1. Comprends bien la différence Stateless / Stateful et `setState`
2. Apprends les widgets de layout de base (Row, Column, Container, ListView)
3. Fais une petite app avec navigation entre 2-3 écrans (`Navigator.push`)
4. Ajoute une gestion d'état simple avec Provider
5. Connecte-la à une API (avec le package `http`)

Veux-tu qu'on construise ensemble un petit projet concret (par exemple une liste de tâches ou un appel à une API) pour mettre tout ça en pratique ?











Pourquoi j'ai le warning suivant avec flutter : flutter run --dart-define=API_BASE_URL=http://localhost:8000
Launching lib\main.dart on sdk gphone16k x86 64 in debug mode...
WARNING: A restricted method in java.lang.System has been called
WARNING: java.lang.System::load has been called by net.rubygrapefruit.platform.internal.NativeLibraryLoader in an unnamed module (file:/C:/Users/adamo/.gradle/wrapper/dists/gradle-9.1.0-all/7wzd0jkjit61aq2p43wpjgij9/gradle-9.1.0/lib/native-platform-0.22-milestone-28.jar)
WARNING: Use --enable-native-access=ALL-UNNAMED to avoid a warning for callers in this module
WARNING: Restricted methods will be blocked in a future release unless native access is enabled




Ce warning **ne vient pas de Flutter**, mais de **Java** (le JDK) utilisé par **Gradle** lors de la compilation de ton application Android.

Le message est :

```text
WARNING: A restricted method in java.lang.System has been called

java.lang.System::load has been called by
net.rubygrapefruit.platform.internal.NativeLibraryLoader
```

## Pourquoi ce warning apparaît ?

À partir des versions récentes de Java (JDK 24 et suivantes), Oracle a commencé à restreindre l'accès à certaines API natives.

Gradle utilise une bibliothèque appelée :

```
net.rubygrapefruit.platform
```

qui charge des bibliothèques natives via :

```java
System.load(...)
```

Cette pratique est maintenant signalée par Java avec un warning.

Il indique simplement :

> "Aujourd'hui je t'autorise à le faire, mais dans une future version de Java ce sera bloqué si tu n'actives pas explicitement cette fonctionnalité."

Donc :

* ❌ ce n'est pas une erreur Flutter ;
* ❌ ce n'est pas un problème dans ton code ;
* ❌ ce n'est pas un problème avec Symfony ou ton backend.

---

## Est-ce grave ?

Non.

Si l'application se lance ensuite :

```
Launching lib/main.dart...
Installing build...
Syncing files...
```

alors tu peux ignorer ce warning.

---

## Pourquoi toi tu l'as ?

Tu utilises probablement un JDK très récent.

Vérifie avec :

```bash
java -version
```

Si tu vois quelque chose comme :

```
openjdk 25
```

ou

```
openjdk 24
```

alors c'est exactement l'origine du warning.

---

## Que recommande Flutter ?

Flutter recommande actuellement d'utiliser :

* JDK 21 (LTS) ✅

C'est celui qui est le mieux testé avec Android Studio, Gradle et Flutter.

---

## Peut-on supprimer ce warning ?

Oui.

### Solution 1 (recommandée)

Utiliser le JDK 21.

Dans Android Studio :

```
Settings
→ Build, Execution, Deployment
→ Build Tools
→ Gradle
→ Gradle JDK
```

Choisir :

```
jbr-21
```

ou

```
OpenJDK 21
```

C'est la solution la plus propre.

---

### Solution 2

Attendre une nouvelle version de Gradle.

Le warning vient de :

```
net.rubygrapefruit.platform
```

Cette bibliothèque sera mise à jour pour les nouvelles versions de Java.

---

### Solution 3

Ajouter l'option Java :

```
--enable-native-access=ALL-UNNAMED
```

Mais ce n'est généralement pas nécessaire pour un projet Flutter, et ce n'est pas la solution privilégiée.

---

## Mon avis pour ton projet

Si ton projet Flutter est récent, je te conseille de vérifier que tu utilises :

* Flutter stable récente
* Android Gradle Plugin récent
* Gradle Wrapper récent
* **JDK 21**

Peux-tu me montrer le résultat des commandes suivantes ?

```bash
flutter doctor -v
```

et

```bash
java -version
```

Avec ces deux sorties, je pourrai te dire si ton environnement est correctement configuré ou s'il y a un composant à mettre à jour.
