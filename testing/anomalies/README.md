
# 🐛 Qualification & Gestion des Anomalies (Bug Reports)

## 📌 Contexte & Objectif de l'exercice
L'exemple présenté ci-dessous est issu d'un exercice pratique réalisé dans le cadre d'une formation en test logiciel suivie sur Udemy.
[Consulter le support complet d'exécution et d'anomalie](.https://github.com/loubna-eng/-portfolio-technique/blob/master/testing/anomalies/test%2Blogiciel%2B-Ex%C3%A9cution%2Bdes%2Btests.pdf)

Lors de l'exécution du cas de test CT-001 – Achat d'un article, une anomalie a été détectée dans le module « Vente Flash ».
La quantité du produit ne pouvait pas être modifiée alors que ce comportement était attendu dans le scénario de test. 
Cette anomalie a ensuite été documentée en détaillant les prérequis, les étapes de reproduction, le résultat attendu et le résultat obtenu afin de faciliter son analyse et sa correction.
Cet exercice illustre la démarche de détection, de déclaration et de suivi d'une anomalie au cours d'une campagne de test.


## 🔑 Points essentiels abordés
* **Cycle de vie du bug :* Détection ➔ Validation par le Test Lead ➔ Assignation au développeur ➔ Correction ➔ Retest par le tester ➔ Clôture.
* **Anatomie d'un rapport de bug clair :**
   *Titre explicite* : Résumé synthétique du problème (Composant + Symptôme).
  * Sévérité / Impact* : Distinction entre bug bloqueur/critique (crash, perte de données) et bug cosmétique.
  * Étapes de reproduction* : Séquence minimale et précise pour réitérer le dysfonctionnement à 100 %.
  * Écarts* : Description nette du *Comportement Attendu* vs *Comportement Obtenu*.

## 💡 Ce que j'ai appris & Liens avec mon parcours
*Communication factuelle :** Une bonne fiche de bug évite tout jugement de valeur et se concentre sur les faits techniques et la traçabilité.
*Analogie avec la chimie :** Traiter un bug informatique équivaut à gérer une fiche de non-conformité (OOS - *Out of Specification*) en laboratoire analytique : identifier l'anomalie, isoler le facteur déclenchant et documenter le constat de manière irréfutable.
