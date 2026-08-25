### React Native `reactnative.dev` 

- npx create-expo-app@latest
    > Un framework qui permet de créer une application mobile native qui va avoir un moteur javascript qui est capable d'interprêter notre code react sauf que une fois qu'on a ce `virtualDOM` on ne vas pas le monter sur du `DOM` réel mais on aura une surcouche qui va venir créer des composants natifs et propre au téléphone
    > `expo` un framework qui permet de travailler avec `React Native` plus simplement
    > On.. un inspecteur si on utilise un émulateur en.. `CTRL + M` puis `Show Element inspector`

- **Command**
    > npm run web : Permet de bundler pour le web
    > npm run ios : !! pour ios
    > npm run android : !! pour android, mais on aura une erreur si aucun périphérique ou émulateur n'est connecté sinon si on a un téléphone à porté de main on peut lancer `npm run start`
        > Dans le cas d'un simulateur on a l'outil `Android Studio` qui permet de travailler sur des applications android
    > npm run start : !! le projet, va démarré le serveur `metro` et va nous donné un `QRCode` pour mobile qu'on peut scanner avec l'application `expo`
        > La touche `a` si on veut lancer sur un émulateur ou un telephone connecté par `USB` après la commande
        > !! `r` permet de recharger l'application si on utilise un composant qui ne peut pas être changer dynamiquement
        > !! `w` pour l'ouvrir dans le web
    > npm run reset-project : Pour partir de rien, va déplacer le contenu de `app` dans `app-example`

- **Important !**
    > Le.. `expo` utilise un système de router basé sur les fichiers dans `app/` et aussi `app.json` contient toute les informations sur notre application
    > Les élément qui compose une application react native
        > Le composant `View` est comme une div
        > !! `Text` permet d'insérer du texte
    > !! vues en react native fonctionne comme des éléments en `display flex`
    > La structure des fichiers `app/`
        > `_layout.tsx` va englober les éléments qui sont au même niveau ou un niveau inférieur sachant qu'on peut en avoir dans des sous dossiers
            > Dans.. `Stack` permet d'indiquer le type de navigation qui va être utiliser
            > Pour masquer le header on.. `_layout.tsx` - `headerShown` mais le problème est que nos textes vont apparaître en dessous des éléments qui sont visible par le téléphone pour ça on a le composant `SafeAreaView` va rajouter des paddings qui correspond aux éléments visible par l'écran pour bien les placé
    > Pour gérer le thème ou le style de texte on.. `components/ThemeText`
    > !! les couleurs `dark mode`, dans `constants/Colors.ts` puis `hooks/useThemeColors.ts` et on.. ``
    > !! l'ombre porté côté android on a la propriété `elevation` dans `Shadows.ts`, doc
    > !! récupérer des données on.. `fetch` mais pour simplifier et d'avoir la gestion du cache.. on a utiliser `@tanstack/react-query`, dans `hooks/useFetchQuery.ts`
        > Puis utiliser `QueryClientProvider` pour fonctionner, dans `_layout.tsx`
    > !! plus d'informations sur la navigation on a `expo-router`
    > !! faire des animations du genre que la partie couleur genre avec un éffet d'opacité on.. `react-native-reanimated`, dans `RootView`, `PokemonStat`
    > !! l'audio du crie on.. `npx expo install expo-av`
    > !! le swipp et aller d'un pokémon à l'autre on.. `npx expo install react-native-pager-view`
    > !! la maquette on a utilisé celui de `pokedex` dans `Figma Community` et pour l'api `pokeapi.co`

- **Build**
    > Pour gérer le build on.. `expo build` via le service `eas` qui permet de déployer l'application, dans `docs.expo.dev/build/introduction`, va tout gérer sur le cloud et peut publier sur les différents plateformes, aussi il est gratuit pour les applications léger

- **Packages**
    > `tanstack.com` permet de travailler plus simplement avec `fetch`
        > npm i @tanstack/react-query
    > `reactnativepaper.com` un material design
        > npm install react-native-paper
    > `reactnavigation.org` pour la navigation
        > npm install @react-navigation/native
    > `docs.swmansion.com` pour les animations
        > npm install react-native-reanimated : La par.. l'animation va être gérer par l'os et sera fluid sans être ralenti par le système
            > `motifview` permet d'avoir une animation un peu plus orienté react
- - 

npm i @react-navigation/elements
npm i @react-navigation/bottom-tabs
heroui.com : Le shadcn de react native






This is an [Expo](https://expo.dev) project created with [`create-expo-app`](https://www.npmjs.com/package/create-expo-app).

## Get started

1. Install dependencies

   ```bash
   npm install
   ```

2. Start the app

   ```bash
   npx expo start
   ```

In the output, you'll find options to open the app in a

- [development build](https://docs.expo.dev/develop/development-builds/introduction/)
- [Android emulator](https://docs.expo.dev/workflow/android-studio-emulator/)
- [iOS simulator](https://docs.expo.dev/workflow/ios-simulator/)
- [Expo Go](https://expo.dev/go), a limited sandbox for trying out app development with Expo

You can start developing by editing the files inside the **app** directory. This project uses [file-based routing](https://docs.expo.dev/router/introduction).

## Get a fresh project

When you're ready, run:

```bash
npm run reset-project
```

This command will move the starter code to the **app-example** directory and create a blank **app** directory where you can start developing.

### Other setup steps

- To set up ESLint for linting, run `npx expo lint`, or follow our guide on ["Using ESLint and Prettier"](https://docs.expo.dev/guides/using-eslint/)
- If you'd like to set up unit testing, follow our guide on ["Unit Testing with Jest"](https://docs.expo.dev/develop/unit-testing/)
- Learn more about the TypeScript setup in this template in our guide on ["Using TypeScript"](https://docs.expo.dev/guides/typescript/)

## Learn more

To learn more about developing your project with Expo, look at the following resources:

- [Expo documentation](https://docs.expo.dev/): Learn fundamentals, or go into advanced topics with our [guides](https://docs.expo.dev/guides).
- [Learn Expo tutorial](https://docs.expo.dev/tutorial/introduction/): Follow a step-by-step tutorial where you'll create a project that runs on Android, iOS, and the web.

## Join the community

Join our community of developers creating universal apps.

- [Expo on GitHub](https://github.com/expo/expo): View our open source platform and contribute.
- [Discord community](https://chat.expo.dev): Chat with Expo users and ask questions.
