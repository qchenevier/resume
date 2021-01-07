all: resume.pdf index.html

resume.html: resume.md style.css
	pandoc -s \
	-c style.css \
	-c https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css \
	--from markdown --to html \
	-o resume.html \
	resume.md

index.html: resume.html
	cp resume.html index.html

resume.pdf: resume.html
	weasyprint resume.html resume.pdf

clean:
	rm resume.pdf resume.html
