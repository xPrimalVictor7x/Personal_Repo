#!/bin/bash

### Overview: This is for the lab/exam reports for most of Offensive Security's exams. I will also be using this for eLearnSecurity's exams and general report taking
### 		   I already write in Markdown, but now I can turn my markdown into a PDF, just by using my terminal. I can also just use Obsidian, but a centralized way of 
###		      converting files and storing them on GitHub is the best way to work for storage and continuity.

### Requirements: 
### 	mkdir Report
### 	apt-get install pandoc texlive-fulltexlive-latex-recommended texlive-fonts-extra texlive-latex-extra p7zip-full evince
### 	git clone  https://github.com/noraj/OSCP-Exam-Report-Template-Markdown.git
### 	download https://raw.githubusercontent.com/tshu-w/pandoc-templates/master/eisvogel.latex to directory

### Directory:
### 	_config.yml  eisvogel.latex  FAQ.md  generate.rb  gen_report.sh  LICENSE  <input.md>  output  README.md  src

### Input.md
### 	src has a ton of examples/templates but I like the whoisflynn one the best for OSCP and the norja for OSWE, Name the .md file whatever and name the .pdf whatever but
###		they will eventually be the same file. Also, evince is the same as open.

if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <input.md> <output.pdf>"
	exit
fi

if [ ! -e /usr/share/pandoc/data/templates/eisvogel.latex ]
then
	sudo cp eisvogel.latex /usr/share/pandoc/data/templates
fi 

pandoc $1 -o $2 \
--from markdown+yaml_metadata_block+raw_html \
--template eisvogel \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=chapter \
--highlight-style breezedark

if [ $? -eq 0 ]
then
	open $2
fi