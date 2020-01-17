# http://clojure.or.kr/books/clojure-complete/guide/asciidoctor.pdf

PATH_STR=$(find . -type f -name '*.adoc')
PATH_ARR=($(echo "$PATH_STR" | tr -s ".adoc" ".adoc"))

for DOC_PATH in "${PATH_ARR[@]}"
do
    PDF_PATH=$(echo $DOC_PATH | sed -e 's/documents/build/g' | sed -e 's/.adoc/.pdf/g')
    asciidoctor-pdf -a allow-uri-read -o $PDF_PATH $DOC_PATH
    echo $PDF_PATH ' created ...'

    # HTML_PATH=$(echo $DOC_PATH | sed -e 's/documents/build\/html/g' | sed -e 's/.adoc/.html/g')
    # asciidoctor -a allow-uri-read -o $HTML_PATH $DOC_PATH
    # echo $HTML_PATH ' created ...'
done

echo 'done ... '

read  word

# asciidoctor documents\FOLDER1\index1.adoc
# asciidoctor documents\FOLDER2\INNER_FOLDER\index_inner_folder\index1.adoc
# asciidoctor documents\FOLDER2\index2.adoc
# asciidoctor documents\FOLDER3\index3.adoc
# asciidoctor documents\index.acod
