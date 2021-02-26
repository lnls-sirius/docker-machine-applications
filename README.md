## Build
É importante utilizar tags diferentes na construção da imagem. O formato da tag é escolha dos desenvolvedores e não existe um padrão.

Sugestões:

* Usar timestamp
* Versionamento numério e.g. 1.0.0
* Hash do repositório
* Qualquer combinação única etc.

Isso evita o uso acidental de imagens desatualizadas e podemos restaurar para algum estado anterior.
Para apenas construir as imagens:
```command
docker-compose build
```
Para construir as imagens limpando o cache e outros artefatos:
```command
docker-compose --file docker-compose.yml build --force-rm --no-cache <nome_servico>
```

### Injeção de variáveis no .yml

O comando `docker-compose` pode fazer substituição de variáveis nos arquivos yml.
Isso não funciona no `docker swarm`, porém pode ser útil para versionar a construção.
O arquivo `.env` foi criado para demonstar essa funcionalidade.

Para que variáveis sejam substituidas no Dockerfile no momento da construção da imagem ela deve ser declarada previamente usando `ARG <NOME>`.
Elas são passadas pelo `docker-compose.yml` dentro de build.

** Substituição de variáveis não é realizada pelo docker stack ! **

## Limpeza de images
```command
docker system prune --filter "label=br.com.lnls-sirius.department=FAC" --all --force
```
