#!/usr/bin/Rscript


pages <- data.frame(stringsAsFactors = FALSE)


parse_yml <- function (fn = 'jazz_reference/_data/sidebars/mydoc_sidebar.yml')
{
	txt <- readLines(fn)

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


search_files <- function(pat = 'jazz_reference/pages', index_pat = 'jazz_reference')
{
	ist_fn  <- list.files(path = index_pat, pattern = '*.md', full.names = TRUE, recursive = TRUE)

	soll_fn    <- paste0(pat, '/', pages$name, '.md')
	soll_fn[1] <- paste0(index_pat, '/index.md')

	status <- rep('not_found', nrow(pages))
	status[soll_fn %in% ist_fn] <- 'found'

	ist_fn <- ist_fn[!(ist_fn %in% soll_fn)]

	if (length(ist_fn) > 0) {
		cmds <- paste0('mv ', ist_fn, ' recycle/', gsub('^.*/([^/]+)$', '\\1', ist_fn))

		for (cmd in cmds) {
			cat('Moving unused file: >', cmd, '\n')
			system(cmd, intern = TRUE)
		}
	}

	pages <<- data.frame(pages, fname = soll_fn, status = status, stringsAsFactors = FALSE)
}

search_files()


audit_file <- function(i)
{
	fn  <- pages$fname[i]
	txt <- readLines(fn)

	ix <- which(txt == '---')

	if (length(ix) != 2 | ix[1] != 1) stop(paste('Header not delimited as expected in', fn))

	ix <- ix[1]:ix[2]

	head <- txt[ix]
	body <- txt[-ix]

	get <- function(key) {
		rex <- paste0('^', key, ': *"?([^ ].*[^ "])"? *$')
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

	if (any(body == '## This is a template!')) cat('Template detected in', fn, '\n')
	if (any(body == '## Remove this!'))		   cat('Old markdown has to be removed in', fn, '\n')

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


for (i in which(pages$status == 'not_found')) new_file(i)
