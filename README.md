<h1 align="center">Welcome to WiredPlayers-Docker 👋</h1>
<p>
</p>

### Docker image for Rage:MP linux server for [WiredPlayers Game Mode](https://github.com/xabier1989/WiredPlayers-RP)

### 🏠 [Homepage](https://github.com/elj4v1/WiredPlayers-Docker)

## Usage

Docker Run command example
 

```sh
docker run -d \
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
  imagename
```

## Repository variables to clone / compile the WiredPlayer based structure Game Mode

- DOTNET_GM_FOLDER = Name of your dotnet/resource/Folder. Fr example dotnet/resources/WiredPlayers

- GIT_USERNAME (Your github username)

- GIT_TOKEN (Password token of your github account)

- GIT_URL (Wthout https://github.com of the repository for example: xabier1989/WiredPlayers-RP)

- COMPILE_GM (If you want to compile the GM when you create the docker, put true)


<h4>The variables have been implemented with default values, so they do not have to be set.</h4>

## Conf.json

- CONF_ANNOUNCE=false
- CONF_BIND=0.0.0.0
- CONF_GAMEMODE=freeroam
- CONF_ENCRYPTION=false
- CONF_MAXPLAYERS=100
- CONF_NAME=RAGE:MP Unofficial server
- CONF_STREAM_DISTANCE=500
- CONF_PORT=22005
- CONF_DISALLOW_MULTIPLE_CONNECTIONS_PER_IP=false
- CONF_LIMIT_TIME_OF_CONNECTIONS_PER_IP=0
- CONF_URL=
- CONF_LANGUAGE=en
- CONF_SYNC_RATE=40
- CONF_RESOURCE_SCAN_THREAD_LIMIT=0
- CONF_MAX_PING=120
- CONF_MIN_FPS=24
- CONF_MAX_PACKET_LOSS=0.2
- CONF_ALLOW_CEF_DEBUGGING=false
- CONF_ENABLE_NODEJS=true
- CONF_CSHARP=false
- CONF_ENABLE_HTTP_SECURITY=false
- CONF_VOICE_CHAT=false
- CONF_ALLOW_VOICE_CHAT_INPUT=1
- CONF_VOICE_CHAT_SAMPLE_RATE=2400
- CONF_FASTDL_HOST=
- CONF_SERVER_SIDE_WEAPONS_ONLY_MODE=true
- CONF_API_THREADING_DEBUGGIN=false
- CONF_FQDN=
- CONF_RESOURCES_COMPRESSION_LEVEL=1
- RAGEMP_NODE_COMMANDLINE_FLAGS=
- CONF_SYNCHRONIZATION_EXTRAPOLATION_MULTIPLIER=0.0
- CONF_HTTP_THREATS=50
- CONF_TRIGGER_COMPRESSION_LOGGIN=false
- CONF_TRIGGER_COMPRESSION_TRAINING=false
- CONF_TRIGGER_COMPRESSION_DICTIONARY=
- CONF_CREATE_FASTDL_SNAPSHOT=false
- DISABLE_CLINET_PACKAGES_RAM_CACHE=false
- CONF_CLIENT_PACKAGES_SHARED_FOLDER=

## Meta.xml

- DB_HOST=127.0.0.1
- DB_USER=USERNAME
- DB_PASSWD=PASSWORD
- DB=DATABASE
- DB_SSL=NONE
- META_LANG=en-GB
- META_APP=0
- META_MONEY=10000
- META_BLIP=true
- META_ISLAND=true
- META_NEEDS=true

## Expose Ports

- 22005/udp
- 22006

## Volume

/ragemp

## Author

👤 **Javidot** * Github: [@elj4v1](https://github.com/elj4v1)

## 📝 License

Copyright © 2021 [Javidot](https://github.com/elj4v1).<br />
This project is [MIT](https://github.com/BamButz/docker-ragemp/blob/master/LICENSE) licensed.

Based on [BamButz](https://github.com/BamButz/docker-ragemp) docker image<br />

## Show your support
***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
