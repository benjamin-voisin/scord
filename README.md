Un bot discord (scord) qui répond aux messages qui contiennent "di" par la suite de ce que y a après le "di"

# Features

- Répond aux messages avec le son "di" dedans. Peu importe comment il est écrit.
- Répond en MAJUSCULE aux message avec le son "cri" dedans. Peu importe comment il est écrit.
- Peut mélanger les mots à la suite d'un message commençant par `!c`. Par exemple, `!c cheval` deviendra `cehavl`

# Installation

## Dépendances

Installer luvit:
```shel
curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
```

Installer discordia:
```shell
./lit install SinisterRectus/discordia
```

## Lancer le bot

Il faut d'abord mettre le token discord dans le fichier `./token.txt`. Ensuite, on lance le bot avec la commande

```shell
./luvit bot.lua
```
