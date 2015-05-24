all: watch

deploy: build
	find _site -type f | xargs chmod 644
	find _site -type d | xargs chmod 755
	rsync -av _site/ alpha:jflex.web/
	rsync -av _site/ lsf37,jflex@web.sourceforge.net:htdocs/
	rsync -av _site/ login.cse.unsw.edu.au:public_html/jflex/

site: site.hs
	ghc --make site

watch: siteclean
	./site watch

build: siteclean
	./site build

siteclean: site
	./site clean

clean: 
	rm -rf _cache _site
	rm -f site.o site site.hi