all: build deploy 

build: 
	Rscript -e 'bookdown::render_book("Index.Rmd","bookdown::gitbook")'
	
clean:
	rm -rf ../book/*

deploy:
	./deploy.sh
	
pdf:
Rscript -e 'bookdown::render_book("index.Rmd","bookdown::pdf_book")'