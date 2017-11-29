
jar_name='sample.jar'
jar_dir='sample'

#unzip -d ${jar_dir} ${jar_name}

cd ${jar_dir} && zip ${jar_name} -r * -n jar

#java -jar ${jar_name}

