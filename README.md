  GNU nano 4.8                                                                                                                                              README.md                                                                                                                                                        <h1 align="center">Welcome to WiredPlayers-Docker 👋</h1>
<p>
</p>

> Docker image for Rage:MP linux server based on WiredPlayers GameMode

### 🏠 [Homepage](https://github.com/elj4v1/WiredPlayers-Docker)

## Usage

```sh
docker run \
  --name=ragemp-WP \
  -e CONF_CSHARP=true \
  -e WP_GIT_CLONE=true \
  -e DOTNET_RESOURCE=WiredPlayers \
  -e GIT_USERNAME=USERNAME \
  -e GIT_TOKEN=TOKEN_PASSWORD \
  -e GIT_URL=xabier1989/WiredPlayers-RP.git \
  -e COMPILE_GM=true \
  -e CONF_GAMEMODE=Roleplay \
  -e CONF_NAME=WiredPlayers Roleplay \
  -e CONF_LANGUAGE=en \
  -e DB_HOST=127.0.0.1 \
  -e DB=DATABASE \
  -e DB_USER=DB_USER \
  -e DB_PASSWD=DB_PASSWORD \
  -e META_LANG=en-GB \
  -p 22005:22005/udp \
  -p 22006:22006 \
  -v /opt/ragemp:/ragemp \
```

## Author

👤 **Javidot**

* Github: [@elj4v1](https://github.com/elj4v1)

## Show your support

Give a ⭐ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
