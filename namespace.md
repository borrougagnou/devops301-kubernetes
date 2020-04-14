I. Mise en place des namespaces
------------

J'ai choisi de mettre en place 3 namespaces

- un namespace monitoring

- un namespace backend

- un namespace frontend

Dans le namespace monitoring j'ai décidé de mettre :

Mon service  prometheus
Mon service  grafana
Mon service  mysql exporter

Dans le namespace frontend j'ai décidé de mettre :

Mon service wordpress avec mon deployment wordpress


Dans le namespace backend j'ai décidé de mettre :

Mon MYSQl répliqué avec ses backups

II.  Répartition des ressources
------------

backend : 3Gi RAM | 500M CPU
frontend: 100Mi RAM | 50M CPU
monitoring: 1Gi RAM | 500M CPU
registry: 50Mi RAM | 50M CPU
~                              
