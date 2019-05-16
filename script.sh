# Escriba su código aquí

#Copiar Archivo 
for filename in *csv ; do  cp $filename New-$filename; done

#Agregar nombre de archivo 
for f in N*.csv; do  sed -i "s/^/$f,/" "$f" ; done
sed -e 's/New-//' -e 's/.csv//'  N*.csv > out.csv

#Eliminar columnas innecesarias 
cut -d, -f1,2,3 out.csv > out1.csv

#Eliminar campo innecesario 
colrm 8 13 < out1.csv > out2.csv

#Eliminar caracter faltante
sed -e 's/,A:9,/,A,/' out2.csv > out3.csv

#Mostrar archivo final
Cat -n out3.csv

#Eliminar archivos
rm o*.csv
rm N*.csv