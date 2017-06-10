# Converting rmarkdown documents to anki flashcards (r2anki)

## Effectively Remember R-Skills through Spaced Repetition Learning
The `r2anki`-package offers an automated approach to bring notes from your favourite programming language (written in RMarkdown) to [Anki](https://ankisrs.net), a software for spaced repitition learning.

When you learn and use *R* you need to memorize important commands to solve programming tasks effectively. Unfortunately some less frequently used function calls can be forgot easily as you learn more about the language.

[Spaced repetition learning](https://en.wikipedia.org/wiki/Spaced_repetition) offers a solution to this problem by exposing you only to learning content, that you are about to forget. The `r2anki`-package can be used to easily convert RMarkdown-scripts into a set of Anki-flashcards, that can be shared among the commmunity.

<center><img src="r2anki_sticker.png" alt="r2anki-sticker" width="150"></center>

## Installing the package and Anki
Clone the package and build yourself for now. Support for `devtools::install_github` is coming soon.

Manual installation of Anki for now. Assisted by
```
r2anki::install_anki()
```

## Preparing Anki for use with r2anki-package
First add a "r2anki_pygments"-example card to anki, via impornt the "anki/r2anki_cardtype.apkg"-file. Assisted by

```
r2anki::initialize_anki()
```

Important: When importing *.tsv-files into Anki later, make sure you check the "Allow HTML in fields" box. Also select (Note) Type "r2anki_pygments" for a nice markup.

## Creating Flashcards and using them in Anki
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

