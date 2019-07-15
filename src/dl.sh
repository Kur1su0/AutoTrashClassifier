
END=5

for ((i=1;i<=END;i++));do

    input="$(sed -n ${i}p trash_info.csv)"
#    echo "$input"

    cropped="$(cut -d"," -f1 <<< $input)"
    echo "#${i}: $cropped"
    trans=$(echo "$cropped" | iconv -f utf-8 -t gbk)
    echo "$trans"
    googleimagesdownload -o "data" -i "${i}" -k "${trans}" -l 10
    #googleimagesdownload -o "data" -i "${i}" -k "${cropped}" -l 10


done

