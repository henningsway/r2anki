# Convert RMarkdown Documents into Anki Flashcards <img src="man/figures/r2anki_sticker.png" height="200" align="right">

[![Travis-CI Build Status](https://travis-ci.org/henningsway/r2anki.svg?branch=dev)](https://travis-ci.org/henningsway/r2anki)

## Effectively Acquire R-Skills through Spaced Repetition Learning
The `r2anki`-package offers a streamlined approach to bring notes from your favourite programming language (written in RMarkdown) to [Anki](https://ankisrs.net), a software for spaced repitition learning.

When you learn and use *R* you need to memorize important commands to solve programming tasks effectively. Unfortunately some less frequently used function calls can be forgot easily as you learn more about the language.

[Spaced repetition learning](https://en.wikipedia.org/wiki/Spaced_repetition) offers a solution to this problem by exposing you only to learning content, that you are about to forget. The `r2anki`-package can be used to easily convert RMarkdown-scripts into a set of Anki-flashcards, that can be shared among the commmunity.

## Install the `r2anki`-package and Anki
```
devtools::install_github("henningsway/r2anki", rev = "dev")
```

Manual installation of Anki for now. Assisted by
```
r2anki::install_anki()
```

## Prepare Anki for use with `r2anki`-package
First add a "r2anki_pygments"-example card to anki, via import the "anki/r2anki_cardtype.apkg"-file. Assisted by

```
r2anki::initialize_anki()
```

Important: When importing *.tsv-files into Anki later, make sure you check the "Allow HTML in fields" box. Also select (Note) Type "r2anki_pygments" for a nice markup.

## Create Flashcards and use them in Anki
An rmarkdown-Template was installed with this package. Create a new Rmd-file from Template, choose r2anki-Flashcard-Template and save the file to your preferred location.

`r2anki::rmd2tsv("path/to/anki-template.Rmd")` will create a tsv-file ready for import into anki in the same folder as your source document.

If there are any pictures in the source, please also copy them to your anki-database. Pictures need to be put in the collections.media-folder for the correct user. On linux the path (with an up-to-date version of Anki) should look similar to this: "/home/usrname/.local/share/Anki2/User 1/collection.media/". More info can be found at: https://apps.ankiweb.net/docs/manual.html#file-locations
```
r2anki::images2anki("path/to/anki-template.Rmd",
                    "path/to/anki/collections.media_folder")
```

These two steps can also be wrapped by the `r2anki()` command.
```
r2anki::r2anki("path/to/anki-template.Rmd",
               "path/to/anki/collections.media_folder")
```

