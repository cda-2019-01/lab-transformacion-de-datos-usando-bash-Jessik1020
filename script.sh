# Escriba su código aquí

#Copiar Archivo 
for filename in *csv ; do  cp $filename Original-$filename; done

#Eliminar campos en blanco
sed "$ d" Original-data1.csv  > c1.csv
sed "1 d" Original-data2.csv > c2.csv
#Agregar numero de linea *ln o nl 
awk 'BEGIN{i=1} /.*/{printf "%d,% s\n",i,$0; i++}' c1.csv > pdata1.csv
awk 'BEGIN{i=1} /.*/{printf "%d,% s\n",i,$0; i++}' c2.csv > pdata2.csv
awk 'BEGIN{i=1} /.*/{printf "%d,% s\n",i,$0; i++}' Original-data3.csv > pdata3.csv

#Agregar nombre de archivo 
for f in p*.csv; do  sed -i " s/^/$f,/" "$f" ; done

# Quitar letra t del archivo
sed 's/p//g' pdata1.csv > f1.csv
sed 's/p//g' pdata2.csv > f2.csv
sed 's/p//g' pdata3.csv > f3.csv


#Separar la primera letra 
sed 's/\s/,/' f1.csv > p1.csv
sed 's/\s/,/' f2.csv > c2.csv
sed 's/\s/,/' f3.csv > p3.csv
sed 's/\s //' c2.csv > p2.csv
rm c2.csv


#Ciclo for data1
for LINEA in p1.csv ; do  
awk -F, '{print $1","$2","$3","$4}' p1.csv; 
awk -F, '{print $1","$2","$3","$5}' p1.csv; 
awk -F, '{print $1","$2","$3","$6}' p1.csv; 
awk -F, '{print $1","$2","$3","$7}' p1.csv; 
awk -F, '{print $1","$2","$3","$8}' p1.csv; 
awk -F, '{print $1","$2","$3","$9}' p1.csv; done > out1.csv

#Ciclo for data2
for LINEA in p2.csv ; do  
awk -F, '{print $1","$2","$3","$4}' p2.csv; 
awk -F, '{print $1","$2","$3","$5}' p2.csv; 
awk -F, '{print $1","$2","$3","$6}' p2.csv; 
awk -F, '{print $1","$2","$3","$7}' p2.csv;
awk -F, '{print $1","$2","$3","$8}' p2.csv;  
awk -F, '{print $1","$2","$3","$9}' p2.csv; done > out2.csv


#Ciclo for data3
for LINEA in p3.csv ; do  
awk -F, '{print $1","$2","$3","$4}' p3.csv; 
awk -F, '{print $1","$2","$3","$5}' p3.csv; 
awk -F, '{print $1","$2","$3","$6}' p3.csv; 
awk -F, '{print $1","$2","$3","$7}' p3.csv;
awk -F, '{print $1","$2","$3","$8}' p3.csv;  
awk -F, '{print $1","$2","$3","$9}' p3.csv; done > out3.csv


#Eliminar campos en blanco 
sed '/,$/d' out1.csv > temp1.csv
sed '/,$/d' out2.csv > temp2.csv
sed '/,$/d' out3.csv > temp3.csv

#Ordenar campos
sort -t, -s  -n -k 2,2 temp1.csv > final1.csv
sort -t, -s  -n -k 2,2 temp2.csv > final2.csv
sort -t, -s  -n -k 2,2 temp3.csv > final3.csv

#Mostrar archivo final
cat final1.csv final2.csv final3.csv 

#Eliminar archivos
rm o*.csv
rm O*.csv
rm p*.csv
rm t*.csv
rm f*.csv
rm c*.csv