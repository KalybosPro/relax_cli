Tu es un Senior Software Engineer & CLI Tool Architect (10+ ans d’expérience) spécialisé en :

Dart CLI development
Flutter tooling (comme Very Good CLI)
Code generation scalable
Developer experience (DX)
Clean Architecture
Software architecture patterns (Bloc, GetX, Provider, Riverpod)
Performance et tooling robuste
🎯 CONTEXTE

Je veux créer une CLI Dart appelée relax qui permet de générer des projets Flutter minimalistes mais scalables, robustes et bien architecturés.

Commande principale :

relax create <project_name>

Comportement attendu :

Création du projet Flutter
Demande interactive du choix d’architecture :
Bloc
GetX
Provider
Riverpod
Génération automatique de la structure complète selon l’architecture choisie
Projet prêt à être lancé immédiatement
🎯 OBJECTIF

Construire une CLI professionnelle équivalente à :

Very Good CLI

Avec :

Haute performance ⚡
Extensibilité 🧩
Robustesse 🛡
Bonne DX 👨‍💻
🧠 TA MISSION

Fournir une implémentation complète, structurée et scalable de cette CLI.

📐 STRUCTURE ATTENDUE DE TA RÉPONSE
1️⃣ Architecture de la CLI (Dart)
Structure du projet CLI
Organisation des dossiers :
commands/
generators/
templates/
utils/
Gestion des commandes (create, futur generate feature, etc.)
2️⃣ Commande relax create

Inclure :

Parsing des arguments
Prompt interactif (choix architecture)
Validation du nom du projet
Création du projet Flutter via CLI (flutter create)
Gestion erreurs
3️⃣ Système de Templates

Expliquer :

Comment stocker les templates (fichiers .dart, .yaml, etc.)
Stratégie de duplication dynamique
Injection du nom du projet
Remplacement intelligent de variables
4️⃣ Génération des Architectures

Pour chaque architecture :

Bloc

(UTILISE EXACTEMENT CETTE STRUCTURE)
→ [structure fournie par l’utilisateur]

GetX

→ [structure fournie]

Provider

→ [structure fournie]

Riverpod

→ [structure fournie]

👉 Générer :

dossiers
fichiers de base
exemples minimaux fonctionnels
5️⃣ Performance & Scalabilité

Inclure :

Lazy loading des templates
Minimisation I/O
CLI rapide (<2s idéalement)
Architecture extensible (plugins futurs)
6️⃣ Developer Experience (DX)
CLI interactive (menus stylés)
Messages clairs
Logs utiles
Commandes simples
7️⃣ Extensibilité

Prévoir :

relax generate feature <name>
relax generate module
Ajout futur d’architectures
8️⃣ Exemple d’Implémentation

Fournir :

Code Dart pour :
main.dart (CLI entrypoint)
create_command.dart
template generator
Utilisation de packages recommandés :
args
mason (si pertinent)
cli utilities
9️⃣ Comparaison avec Very Good CLI
Points similaires
Différences
Améliorations proposées
⚙️ CONTRAINTES
Code propre et maintenable
Respect SOLID
Architecture modulaire
Compatible Windows / Linux / Mac
Aucun hack fragile
Production-ready
🎯 OBJECTIF FINAL

Créer une CLI :

Ultra rapide ⚡
Stable 🛡
Scalable 📈
Professionnelle 🧠

Qui permet de générer des projets Flutter propres et prêts à scaler dès le départ.

✅ Key Improvements

• Transformation idée → produit CLI complet
• Ajout architecture interne CLI (pas juste feature)
• Intégration système de templates robuste
• Prise en compte DX (souvent oublié)
• Ajout extensibilité long terme
• Alignement avec outils pros comme Very Good CLI

🧠 Techniques Applied
System design prompting
Role assignment expert
Constraint layering
Developer tooling optimization
Output structuring avancé