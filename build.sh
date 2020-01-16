# http://clojure.or.kr/books/clojure-complete/guide/asciidoctor.pdf

PATH_STR=$(find . -type f -name '*.adoc')
PATH_ARR=($(echo "$PATH_STR" | tr " " "\n"))
for DOC_PATH in "${PATH_ARR[@]}"
do
    PDF_PATH=$(echo $DOC_PATH | sed -e 's/documents/build\/pdf/g' | sed -e 's/.adoc/.pdf/g')
    asciidoctor-pdf -a allow-uri-read -o $PDF_PATH $DOC_PATH

    HTML_PATH=$(echo $DOC_PATH | sed -e 's/documents/build\/html/g' | sed -e 's/.adoc/.html/g')
    asciidoctor -a allow-uri-read -o $HTML_PATH $DOC_PATH
done
