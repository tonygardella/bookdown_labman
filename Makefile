all: bkdcheck build deploy 

bkdcheck:
	./check_bkdpack.R

build: 
	Rscript -e 'bookdown::render_book("Index.Rmd","bookdown::gitbook")'
	
clean:
	rm -rf ../book/*

deploy:
	./deploy.sh
	