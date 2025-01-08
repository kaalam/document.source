#!/usr/bin/Rscript

library(RCurl)


get_serial <- function(fn = '../Jazz/server/src/include/jazz_platform.h') {
	txt <- readLines(fn)

	rex <- '^#define JAZZ_VERSION *"?([0-9]+\\.[0-9]+\\.[0-9]+)"? *$'

	ix <- which(grepl(rex, txt))

	if (length(ix) != 1) stop('Failed to locate version (1)')

	gsub(rex, '\\1', txt[ix])
}

jazz_serial <- get_serial()
pages       <- data.frame(stringsAsFactors = FALSE)
files_moved <- FALSE


parse_yml <- function (fn = 'jazz_reference/_data/sidebars/mydoc_sidebar.yml') {
	txt <- readLines(fn)

	rex <- '^  version: [0-9]+.*$'

	ix <- which(grepl(rex, txt))

	if (length(ix) != 1) stop('Failed to locate version (2)')

	txt[ix]	<- paste('  version:', jazz_serial)

	txt <- gsub(' $', '', txt)

	writeLines(txt, fn)

	rex_tit <- '^    (    )?- title: ?([^ ].*[^ ]) *$'
	rex_url <- '^.*url: ?/([^ ]+)\\.html *$'

	ix <- which(grepl(rex_tit, txt))
	if (any(ix != which(grepl(rex_url, txt)) - 1)) stop('Strict title/url mismatch.')

	pages <<- data.frame(name  = gsub(rex_url, '\\1', txt[ix + 1]),
						 level = 1 + nchar(gsub(rex_tit, '\\1', txt[ix]))/4,
						 title = gsub(rex_tit, '\\2', txt[ix]), stringsAsFactors = FALSE)

	if (any(duplicated(pages$name)))  stop('Duplicated names')
	if (any(duplicated(pages$title))) stop('Duplicated titles')

	if (pages$name[1] != 'index')  stop('Index should be the first name')

	pages$level[1] <- 0
}

parse_yml()


search_files <- function(pat = 'jazz_reference/pages', index_pat = 'jazz_reference') {
	ist_fn  <- list.files(path = index_pat, pattern = '*.md', full.names = TRUE, recursive = TRUE)

	soll_fn    <- paste0(pat, '/', pages$name, '.md')
	soll_fn[1] <- paste0(index_pat, '/index.md')

	status <- rep('not_found', nrow(pages))
	status[soll_fn %in% ist_fn] <- 'found'

	ist_fn <- ist_fn[!(ist_fn %in% soll_fn)]

	if (length(ist_fn) > 0) {
		system('mkdir recycle')

		cmds <- paste0('mv ', ist_fn, ' recycle/', gsub('^.*/([^/]+)$', '\\1', ist_fn))

		for (cmd in cmds) {
			files_moved <- TRUE
			cat('Moving unused file: >', cmd, '\n')
			system(cmd, intern = TRUE)
		}
	}

	pages <<- data.frame(pages, fname = soll_fn, status = status, stringsAsFactors = FALSE)
}

search_files()


valid_urls <- function() {
	rex <- '^jazz_reference/pages/(.*).md$'

	ix <- which(grepl(rex, pages$fname))
	paste0(gsub(rex, '\\1', pages$fname[ix]), '.html')
}

valid_link <- valid_urls()

http_not_found <- function (url) {
	!url.exists	(url, useragent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36')
}

file_not_found <- function (fn) {
	!file.exists(paste0('../kaalam.github.io', fn))
}

check_md_links <- function(body, fn) {
	rex <- '^.*\\[([^\\[]+)\\]\\(([^\\(]+)\\).*$'

	ix <- which(grepl(rex, body))

	if (length(ix) == 0) return()

	link <- sort(unique(gsub(rex, '\\2', body[ix])))
	link <- link[!(link %in% valid_link)]

	if (length(link) == 0) return()

	rex <- '^https?:.*$'

	ix <- which(grepl(rex, link))

	if (length(ix) > 0) {
		for (i in ix)
			if (http_not_found(link[i]))
				cat(sprintf('Failed links in %36s : %s\n', gsub('jazz_reference/pages/', '', fn), link[i]))
		link <- link[-ix]
	}

	for (lnk in link)
		if (file_not_found(lnk) && lnk != 'index.html')
			cat(sprintf('Failed links in %36s : %s\n', gsub('jazz_reference/pages/', '', fn), lnk))
}

check_href_links <- function(body, fn) {
	rex <- '\\<href\\>'

	ix <- which(grepl(rex, body))

	if (length(ix) == 0) return()

	rex <- '^.*href="([^"]+)".*$'

	jx <- which(grepl(rex, body))

	stopifnot(all(ix == jx))

	link <- sort(unique(gsub(rex, '\\1', body[ix])))

	rex <- '^https?:.*$'

	ix <- which(grepl(rex, link))

	if (length(ix) > 0) {
		for (i in ix) {
			# cat(fn, link[i], '..\n')
			if (http_not_found(link[i]))
				cat(sprintf('Failed links in %36s : %s\n', gsub('kaalam/', '', fn), link[i]))
		}
		link <- link[-ix]
	}

	for (lnk in link) {
		# cat(fn, lnk, '..\n')
		if (file_not_found(lnk))
			cat(sprintf('Failed links in %36s : %s\n', gsub('kaalam/', '', fn), lnk))
	}
}

audit_file <- function(i) {
	fn  <- pages$fname[i]
	txt <- readLines(fn)

	ix <- which(txt == '---')

	if (length(ix) != 2 | ix[1] != 1) stop(paste('Header not delimited as expected in', fn))

	ix <- ix[1]:ix[2]

	head <- txt[ix]
	body <- txt[-ix]

	get <- function(key) {
		rex <- paste0('^', key, ':[ ]*([^ ].*[^ ])[ ]*$')
		gsub(rex, '\\1', head[grepl(rex, head)])
	}

	if (pages$title[i] != get('title')) cat(paste0('Changing title to "', pages$title[i], '" in ', fn, '\n'))

	if (length(get('tags'))     != 0) cat('Removing unused tags in', fn, '\n')
	if (length(get('keywords')) != 0) cat('Removing unused keywords in', fn, '\n')

	if (is.null(pages$summary)) pages$summary <- rep('', nrow(pages))

	summary <- get('summary')

	if (length(summary) == 1) pages$summary[i] <- summary

	pages <<- pages

	if (pages$summary[i] == '') cat('Empty summary in', fn, '\n')

	if (get('sidebar') != 'mydoc_sidebar') cat('Changing sidebar to mydoc_sidebar in', fn, '\n')

	permalink <- paste0(pages$name[i], '.html')

	if (get('permalink') != permalink) cat(paste0('Changing permalink to "', permalink, '" in ', fn, '\n'))

	head <- c('---',
			  paste('title:', pages$title[i]),
			  paste('summary:', pages$summary[i]),
			  paste('sidebar:', 'mydoc_sidebar'),
			  paste('permalink:', permalink),
			  '---')

	while (body[1] == '') body <- body[-1]

	check_md_links(body, fn)

	if (any(body == '## This is a template!')) cat('Template detected in', fn, '\n')
	if (any(body == '## Remove this!')) {
		cmd <- paste0('mv ', fn, ' recycle/', gsub('^.*/([^/]+)$', '\\1', fn))

		files_moved <- TRUE

		cat('Moving unused file: >', cmd, '\n')
		system(cmd, intern = TRUE)

		return (TRUE)
	}

	ix <- which(body == '{% include links.html %}')

	if (length(ix) != 1) {
		cat('No links in', fn, '\n')
	} else {
		body <- body[-ix]
	}

	while (body[length(body)] == '') body <- body[-length(body)]

	txt <- c(head, '', body, '', '{% include links.html %}')

	writeLines(txt, fn)
}

for (i in which(pages$status == 'found')) audit_file(i)

if (files_moved) stop ('Some files were moved, run again to create new files (or copy manually if move was wrong).')


new_file <- function(i) {
	fn <- pages$fname[i]

	head <- c('---',
			  paste('title:', pages$title[i]),
			  paste('summary:'),
			  paste('sidebar:', 'mydoc_sidebar'),
			  paste('permalink:', paste0(pages$name[i], '.html')),
			  '---')

	body <- readLines('template/template_body.md')

	txt <- c(head, '', body, '', '{% include links.html %}')

	cat('Creating new file from template', fn, '\n')
	writeLines(txt, fn)
}

for (i in which(pages$status == 'not_found')) new_file(i)

for (fn in list.files('kaalam', '*.md', full.names = T, recursive = T)) {
	body <- readLines(fn)
	check_md_links(body, fn)
	check_href_links(body, fn)
}

check_links_in_yml <- function (body, fn) {
	rex <- '^[ ]*url:(.*)$'

	for (s in body) {
		if (grepl(rex, s)) {
			lnk <- gsub(rex, '\\1', s)
			lnk <- gsub('^[ ]*([^ ].*[^ ])[ ]*$', '\\1', lnk)
			if (lnk == '/index.html')
				next
			if (length(which(paste0('/', valid_link) == lnk)) == 1)
				next
			if (grepl('https://kaalam.ai', lnk))
				next
			if (grepl('https://kaalam.github.io', lnk))
				next
			cat('Wrong link in', fn, ':', lnk, '\n')
		}
	}
}

for (fn in list.files('.', '*.yml', full.names = T, recursive = T)) {
	body <- readLines(fn)
	check_links_in_yml(body, fn)
}

