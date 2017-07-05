# Convert R Markdown Documents into Anki Flashcards <img src="man/figures/r2anki_sticker.png" height="200" align="right">

[![Travis-CI Build Status](https://travis-ci.org/henningsway/r2anki.svg?branch=dev)](https://travis-ci.org/henningsway/r2anki)

## Effectively Learn *R* through Spaced Repetition
The `r2anki`-package offers a streamlined approach to bring notes from your favourite programming language (written in R Markdown) to [Anki](https://ankisrs.net), a software for spaced repitition learning.

When you learn and use *R* you need to memorize important commands to solve programming tasks effectively. Unfortunately some less frequently used function calls can be forgot easily as you learn more about the language.

[Spaced repetition learning](https://en.wikipedia.org/wiki/Spaced_repetition) offers a solution to this problem by exposing you only to learning content, that you are about to forget. The `r2anki`-package can be used to easily convert R Markdown-scripts into a set of Anki-flashcards, that can be shared among the commmunity.

## Install the `r2anki`-package and Anki
```
devtools::install_github("henningsway/r2anki")
```

Manual installation of Anki for now. Assisted by

```
r2anki::install_anki()
```

### Prepare Anki for Use with `r2anki`-Package
First add a "r2anki"-example card to anki, via import the "anki/r2anki_cardtype.apkg"-file. This will make the "r2anki"-note-type available in Anki, which then is used to render R Markdown output correctly in Anki. Please call:

```
r2anki::r2anki(init = TRUE)
```

(When importing *.tsv-files into Anki later, make sure you check the "Allow HTML in fields" box. Also select (Note) Type "r2anki" for a nice markup.)

**Possible Workaroundd:** Should there be any problems related to the initialization (due to some recent changes), please import the `r2anki.apkg`-file manually into Anki. (Ctrl + I opens the shortcut)
[Link to r2anki.apkg](https://github.com/henningsway/r2anki/blob/master/inst/anki/r2anki.apkg)


## Create Anki Cards (and what to look out for)
You may freely use *R Markdown* while creating your Anki-cards. A few *tags* define aspects of the r2anki-cards and should be used with care (otherwise the parser will be confused). These are:

There are 
* `#### ` [*required*] precedes the title of your Anki-card (should be unique across your collection)
* `<!-- start backside -->` [*required*] defines the start of the *answer*.
* `<!-- end backside -->` [*required*] defines the start of the *answer*.

<!-- Tags are *optional* and can be defined for all cards of one notebook as well as for individual cards. -->

<!-- * `<!-- #globaltags:  -->` The (outcommented) line  `<!-- # globaltags:  -->` is the place, where you can define some tags for your Anki-cards. These will then be added to all Anki-cards, which are described in this notebook. Multiple words per tag are allowed. Seperate individual tags per `,`. -->
<!-- * `<!-- #tags: -->` allows to define tags on the card-level. Seperate by `,`. -->

Feel free to try the addin(*Tools > Addins > Insert r2anki-flashcard*), when noting down a new card.

An *r2anki-R-Markdown-template* was installed with this package. Create a new Rmd-file, choose r2anki-flashcard-template and save the file to your preferred location.


## Exporting your r2anki-cards to Anki
To transform your r2anki-notebook into Anki-cards, please save this document (ideally in your current working directory) and call 

```
r2anki::r2anki("r2anki_file.Rmd", invoke_anki = TRUE)
```

<!-- ### Other Informations-->
<!-- "/home/usrname/.local/share/Anki2/User 1/collection.media/". More info can be found at: https://apps.ankiweb.net/docs/manual.html#file-locations.-->
