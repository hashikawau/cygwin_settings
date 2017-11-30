
if [ $? -ne 1 ]; then
    echo 'Usage: command {jar_dir_path}'
fi

jar_dir_path="$1"
jar_name=${jar_dir_path}.jar

#unzip -d ${jar_dir_path} ${jar_name}

cd ${jar_dir_path} && zip ../${jar_name} -r * -n jar

#java -jar ${jar_name}

