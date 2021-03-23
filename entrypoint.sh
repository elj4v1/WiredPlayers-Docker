#!/bin/sh

echo "Copy server files"
cp -p -R /tmpfiles/* /ragemp/

# Rewrite true/false to enabled/disabled for consistency
# to allow all boolean variables to be set with true/false
if [ "$CONF_CSHARP" = "true" ]; then

    sed "s/{CSHARP}/${CONF_CSHARP:=enabled}/g" -i /ragemp/conf.json
    sed "s/{ENABLE_NODEJS}/${CONF_ENABLE_NODEJS:=false}/g" -i /ragemp/conf.json

    # check if environment variable is set to true to clone repository

    if [ "$GIT_CLONE" = "true" ]; then

        # check if a name has been defined for the resource (dotnet/resource/GM) or use the default name "WiredPlayers".
        if [ -z "$DOTNET_GM_NAME"  ]; then

            gm_folder="WiredPlayers"

        else

            gm_folder=$DOTNET_GM_NAME

        fi
        
        # and download your game mode from the github repository.
        ## $GIT_USERNAME - Your username
        ## $GIT_TOKEN - Github secure password token (you should generate it in github options)
        ## #GIT_URL - (Repository URL wthout https://github.com of the repository for example: xabier1989/WiredPlayers-RP)
      
        echo "Clone repository"
        git clone "https://$GIT_USERNAME:$GIT_TOKEN@github.com/$GIT_URL" /tmp/"$gm_folder"    
        cp -p -R /tmp/"$gm_folder"/* /ragemp/
        
        # move the meta.xml file to your GM folder in (dotnet/resource/GM) to rewrite the values ​​with environment variables
        mv -f /ragemp/meta.xml /ragemp/dotnet/resources/"$gm_folder"/

        ########################
        ## Meta.xml variables ##
        ########################
        echo "Set meta variables"
        sed "s/{HOST}/${DB_HOST=127.0.0.1}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{USERNAME}/${DB_USER=USERNAME}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{PASSWORD}/${DB_PASSWD=PASSWORD}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{DATABASE}/${DB=DATABASE}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{SSL}/${DB_SSL=NONE}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{LANG}/${META_LANG=en-GB}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{APP}/${META_APP=0}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{MONEY}/${META_MONEY=10000}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{BLIPS}/${META_BLIP=true}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{ISLAND}/${META_ISLAND=true}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml
        sed "s/{NEEDS}/${META_NEEDS=true}/g" -i /ragemp/dotnet/resources/"$gm_folder"/meta.xml

        # if the variable is set to true it will compile the solution using the dotnet build command
        if [ "$COMPILE_GM" = "true" ]; then
        
            echo "Compile CSharp GameMode"
            dotnet build -v:q /ragemp/dotnet/resources/"$gm_folder"/"$gm_folder.sln"
        fi
    fi
else
    sed "s/{CSHARP}/${CONF_CSHARP:=disabled}/g" -i /ragemp/conf.json
fi

###########################
##  Conf.json variables  ##
###########################

echo "Set config variables"
sed "s/{ANNOUNCE}/${CONF_ANNOUNCE:=false}/g" -i /ragemp/conf.json
sed "s/{BIND}/${CONF_BIND:=0.0.0.0}/g" -i /ragemp/conf.json
sed "s/{GAMEMODE}/${CONF_GAMEMODE:=freeroam}/g" -i /ragemp/conf.json
sed "s/{ENCRYPTION}/${CONF_ENCRYPTION:=false}/g" -i /ragemp/conf.json
sed "s/{MAXPLAYERS}/${CONF_MAXPLAYERS:=100}/g" -i /ragemp/conf.json
sed "s/{NAME}/${CONF_NAME:=RAGE:MP Unofficial server}/g" -i /ragemp/conf.json
sed "s/{STREAM_DISTANCE}/${CONF_STREAM_DISTANCE:=500}/g" -i /ragemp/conf.json
sed "s/{PORT}/${CONF_PORT:=22005}/g" -i /ragemp/conf.json
sed "s/{DISALLOW_MULTIPLE_CONNECTIONS_PER_IP}/${CONF_DISALLOW_MULTIPLE_CONNECTIONS_PER_IP:=false}/g" -i /ragemp/conf.json
sed "s/{LIMIT_TIME_OF_CONNECTIONS_PER_IP}/${CONF_LIMIT_TIME_OF_CONNECTIONS_PER_IP:=0}/g" -i /ragemp/conf.json
sed "s/{URL}/$CONF_URL/g" -i /ragemp/conf.json
sed "s/{LANGUAGE}/${CONF_LANGUAGE:=en}/g" -i /ragemp/conf.json
sed "s/{SYNC_RATE}/${CONF_SYNC_RATE:=40}/g" -i /ragemp/conf.json
sed "s/{RESOURCE_SCAN_THREAD_LIMIT}/${CONF_RESOURCE_SCAN_THREAD_LIMIT:=0}/g" -i /ragemp/conf.json
sed "s/{MAX_PING}/${CONF_MAX_PING:=120}/g" -i /ragemp/conf.json
sed "s/{MIN_FPS}/${CONF_MIN_FPS:=30}/g" -i /ragemp/conf.json
sed "s/{MAX_PACKET_LOSS}/${CONF_MAX_PACKET_LOSS:=0.2}/g" -i /ragemp/conf.json
sed "s/{ALLOW_CEF_DEBUGGING}/${CONF_ALLOW_CEF_DEBUGGING:=false}/g" -i /ragemp/conf.json
sed "s/{ENABLE_NODEJS}/${CONF_ENABLE_NODEJS:=true}/g" -i /ragemp/conf.json
sed "s/{CSHARP}/${CONF_CSHARP:=disabled}/g" -i /ragemp/conf.json
sed "s/{ENABLE_HTTP_SECURITY}/${CONF_ENABLE_HTTP_SECURITY:=false}/g" -i /ragemp/conf.json
sed "s/{VOICE_CHAT}/${CONF_VOICE_CHAT:=true}/g" -i /ragemp/conf.json
sed "s/{ALLOW_VOICE_CHAT_INPUT}/${CONF_ALLOW_VOICE_CHAT_INPUT:=1}/g" -i /ragemp/conf.json
sed "s/{VOICE_CHAT_SAMPLE_RATE}/${CONF_VOICE_CHAT_SAMPLE_RATE:=24000}/g" -i /ragemp/conf.json
sed "s/{FASTDL_HOST}/$CONF_FASTDL_HOST/g" -i /ragemp/conf.json
sed "s/{SERVER_SIDE_WEAPONS_ONLY_MODE}/${CONF_SERVER_SIDE_WEAPONS_ONLY_MODE:=true}/g" -i /ragemp/conf.json
sed "s/{API_THREADING_DEBUGGIN}/${CONF_API_THREADING_DEBUGGIN:=false}/g" -i /ragemp/conf.json
sed "s/{FQDN}/$CONF_FQDN/g" -i /ragemp/conf.json
sed "s/{RESOURCES_COMPRESSION_LEVEL}/${CONF_RESOURCES_COMPRESSION_LEVEL:=1}/g" -i /ragemp/conf.json
sed "s/{NODE_COMMANDLINE_FLAGS}/$CONF_NODE_COMMANDLINE_FLAGS/g" -i /ragemp/conf.json
sed "s/{SYNCHRONIZATION_EXTRAPOLATION_MULTIPLIER}/${CONF_SYNCHRONIZATION_EXTRAPOLATION_MULTIPLIER:=0.0}/g" -i /ragemp/conf.json
sed "s/{HTTP_THREATS}/${CONF_HTTP_THREATS:=50}/g" -i /ragemp/conf.json
sed "s/{TRIGGER_COMPRESSION_LOGGIN}/${CONF_TRIGGER_COMPRESSION_LOGGIN:=false}/g" -i /ragemp/conf.json
sed "s/{TRIGGER_COMPRESSION_TRAINING}/${CONF_TRIGGER_COMPRESSION_TRAINING:=false}/g" -i /ragemp/conf.json
sed "s/{TRIGGER_COMPRESSION_DICTIONARY}/$CONF_TRIGGER_COMPRESSION_DICTIONARY/g" -i /ragemp/conf.json
sed "s/{CREATE_FASTDL_SNAPSHOT}/${CONF_CREATE_FASTDL_SNAPSHOT:=false}/g" -i /ragemp/conf.json
sed "s/{DISABLE_CLINET_PACKAGES_RAM_CACHE}/${DISABLE_CLINET_PACKAGES_RAM_CACHE:=false}/g" -i /ragemp/conf.json
sed "s/{CLIENT_PACKAGES_SHARED_FOLDER}/$CONF_CLIENT_PACKAGES_SHARED_FOLDER/g" -i /ragemp/conf.json


echo "Run Server"
cd /ragemp
# Start server command
/ragemp/ragemp-server

