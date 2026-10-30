### Issues

- 

L'erreur affichée sur ton émulateur Android est claire : `Duplicate keys found`.

Ce problème ne vient pas de ton widget `LoadingButton.dart`. Il vient d'un autre endroit de ton interface Flutter, probablement dans `AppLayout.dart` ou dans un widget enfant.

Le message rouge indique notamment :

```
Duplicate keys found.

If multiple keyed widgets exist as children of another widget,
they must have unique keys.

Column(
  direction: vertical,
  mainAxisAlignment: start,
  crossAxisAlignment: stretch
)

[ LabeledGlobalKey<FormState>#abf48 ]
```

## 1. Pourquoi cette erreur se produit-elle ?

Tu as probablement créé plusieurs widgets avec la même clé Flutter, par exemple :

```
final formKey = GlobalKey<FormState>();
```

Puis tu réutilises cette clé dans plusieurs formulaires :

```
Form(
  key: formKey,
  child: ...
),

Form(
  key: formKey,
  child: ...
),
```

Flutter exige qu'une même `GlobalKey` ne soit associée qu'à un seul widget à la fois dans l'arbre des widgets.

Cela arrive fréquemment lorsque :

- Plusieurs formulaires utilisent la même `GlobalKey<FormState>`.
- Une clé globale est déclarée en dehors du widget puis réutilisée dans plusieurs pages.
- Plusieurs widgets d'une liste ou d'une navigation partagent accidentellement la même clé.

## 2. Comment corriger le problème ?

Ouvre `WeatherForm.dart` et recherche une déclaration similaire à :

```
final _formKey = GlobalKey<FormState>();
```

Si tu as plusieurs formulaires indépendants, chacun doit avoir sa propre clé.

Par exemple :

```
class WeatherForm extends StatefulWidget {
  const WeatherForm({super.key});

  @override
  State<WeatherForm> createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Champs du formulaire
        ],
      ),
    );
  }
}
```

Ainsi, chaque instance de `WeatherForm` possède sa propre clé.

Important : ne déclare pas une seule `GlobalKey<FormState>` partagée entre plusieurs instances de `WeatherForm`.

## 3. Vérifie également `AppLayout.dart`

Dans l'explorateur de fichiers, je vois que tu as notamment :

- `AppLayout.dart`
- `WeatherForm.dart`
- `WeatherPage.dart`
- `WeatherDetailPage.dart`

Puisque l'erreur mentionne un `Column` et une `GlobalKey<FormState>`, recherche dans ces fichiers les déclarations de `GlobalKey<FormState>` et les endroits où elles sont utilisées.

Tu peux utiliser la recherche globale de VS Code avec `Ctrl + Shift + F` et rechercher :

```
GlobalKey<FormState>
```

Puis vérifie que chaque formulaire indépendant possède une clé distincte.

## 4. Pour identifier précisément la ligne fautive

Envoie-moi le contenu de `WeatherForm.dart` et `AppLayout.dart`. Je pourrai repérer la clé dupliquée et te donner la correction exacte sans modifier inutilement le reste de ton application.










J'ai trouvé l'erreur exacte dans ton code ! Elle se trouve ici :

```
LoadingButton(
  key: _formKey, // ❌ C'est le problème
  loading: _loading,
  label: 'Rechercher',
  onPressed: _onSubmit,
),
```

Tu réutilises `_formKey`, qui est une `GlobalKey<FormState>`, à deux endroits différents :

1. Sur le widget `Form` :
   ```
   Form(key: _formKey, ...)
   ```
2. Sur le widget `LoadingButton` :
   ```
   LoadingButton(key: _formKey, ...)
   ```

Une `GlobalKey` ne doit pas être partagée entre deux widgets différents dans l'arbre Flutter. C'est exactement ce qui provoque l'erreur `Duplicate keys found`.

## La correction

Supprime simplement `key: _formKey` dans `LoadingButton` :

```
LoadingButton(
  loading: _loading,
  label: 'Rechercher',
  onPressed: _onSubmit,
),
```

Tu peux conserver `_formKey` sur le formulaire, car c'est lui qui en a besoin pour la validation.

### Pourquoi cela fonctionne-t-il ?

- `_formKey` permet d'accéder à l'état du formulaire et d'appeler `validate()`.
- `LoadingButton` n'a pas besoin de cette clé pour afficher le chargement.
- Flutter attribuera automatiquement une clé appropriée au bouton si nécessaire, ou le laissera sans clé explicite.

Après cette modification, enregistre le fichier et effectue un Hot Restart dans VS Code. L'erreur rouge devrait disparaître.

Petite amélioration supplémentaire : pense à ajouter `mounted` et un bloc `try/finally` autour de ton appel asynchrone à `WeatherApi().fetch(...)` pour gérer les erreurs réseau et éviter d'appeler `setState()` après la destruction de la page.