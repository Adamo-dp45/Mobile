### Mobile

- On.. le logiciel `Android Studio` pour le mobile
    > Va.. 2 parties
        > La partie visuel pour les applications `android`, utilise le `xml` qui permet de structurer les données via des balises du genre `html`
        > !! logique via des langages comme `java` ou `kotlin`
    > Lors de création d'un projet on.. utiliser un `Minimum SDK` minime pour plus de support
- Le `Android SDK` pour avoir les ressources nécessaire pour développer sous `android`
- Le `Activity` est un morceau de l'application qui a une interface pour l'utilisateur
    > Activity Name, `MainActivity` recommandé
        > Generate Layout file, coché par défaut

- **Android Jetpack Compose** : Pur créer des interfaces graphiques sur `android` pour se passer du `xml` via `kotlin`
    > Vu qu'avant l'on créait des balises via `xml` pour avoir une interface à utiliser dans le code `kotlin` pour intéragir avec l'interface graphique mais avec `Jetpack..` on écrit que du code `koltin` pour tout faire



On a 2 manières pour développer des applications Android :
- Développement mobile natif :
    - Android : Java(Kotlin), Android SDK, Android Studio, Google Play
    - IOS : Objective C (Swift), IOS SDK, XCode, Apple App Store
    - Windows Phone : C#, Windows Phone SDK, Visual Studio, Microsoft Maketplace
- !! mobile Cross Platform :
    - Hybride : 
        - HTML, CSS, JavaScript pour la partie IHM
        - Apache CORDOVA pour la partie native
        - Platformes : Adobe PhoneGap, IBM MobileFirst, IONIC
    - Native Cross Platform :
        - React Native : JavaScript avec le Framework ReactJS
        - Xamarin : C# avec le Framework .Net
        - Flutter : Dart, Flutter Framework

- Hybride Approach (ICONIC, PhoneGap, Mobile First) :
    - Utilise le moteur de rendu HTML, CSS du Web View pour la logique présentation
    - Utilise du JavaScript pour exécuter les traitements
    - Pour accéder aux fonctionnalités natives de l'appareil mobile, il utilise Bridge(Plugings CORDOVA)
- Native Cross Platform (React Native, Xamarin) :
    - Utilise ses propres composants pour la logique de présentation, qui seront mappé en composant OEM Natif de l'appareil Mobile
    - Utilise JavaScript pour les traitements avec React JS comme Framework
    - Utilise un Brige JavaScript pour accéder aux fonctionnalités Natives
- Flutter Approach (Fluuter) :
    - Utilise ses propres composants pour la logique de présentation, Flutter utilise son propre moteur de rendu SKIA pour dessiner les éléments de l'interface
    - Utilise Native ARM Binary Code pour la logique applicative
    - Utilise un Channel pour la transmission de message aux fonctionnalités natives



Claude le principe d'application mobile.. des différenets approches