# library(hexSticker)
# library(DiagrammeR)
#
# ## base sticker (not working correctly atm)
# hexplot <- plot(cars, cex=.5, cex.axis=.5, mgp=c(0,.3,0), xlab="", ylab="")
#
# sticker(expression(hexplot),
#         package="hexSticker",
#         p_size=8, s_x=1, s_y=.8, s_width=1.2, s_height=1,
#         # url = "www.test.de",
#         filename="sticker_base.png")
#
# ## ggplot-sticker
# library(ggplot2)
#
# p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
# p <- p + theme_void() + theme_transparent()
#
# sticker(p, package="hexSticker", p_size=8, s_x=1, s_y=.75, s_width=1.3, s_height=1,
#         filename="sticker__ggplot.png")
#
#
# ## r2anki-sticker
# p1 <- "http://www.app-trailer.com/appicons/android/100x100/com.brainyoo.brainyoo2.png"
# sticker(p1, package="r2anki",
#         p_color = "#CCC591", p_size=18, p_family = "merienda",
#         s_x=1, s_y=.85, s_width=0.3, s_height=.3,
#         h_fill = "#273046", h_color = "#CCC591", h_size = 2,
#         url = "https://github.com/henningsway/r2anki",
#         u_color = "#CCC591", u_size = 4,
#         filename="sticker_r2anki.png")
#
# p2 <- "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Leitner_system_alternative_no_text.svg/2000px-Leitner_system_alternative_no_text.svg.png"
# sticker(p2, package="r2anki",
#         p_color = "#273046", p_size=22, p_family = "bauhaus2",
#         s_x=1, s_y=.95, s_width=.8, s_height=.8,
#         h_fill = "#CCC591", h_color = "#273046", h_size = 2,
#         url = "https://github.com/henningsway/r2anki",
#         u_color = "#273046", u_size = 4,
#         filename="sticker_r2anki3.png")
#
#
# ## trying the DiagrammeR-package
# m1 <- mermaid("
# graph LR
#   A[r]-->B
#   B[2]-.->A
#   B-->C
#   C[anki]-.->B
# ")
#
# sticker(m1, package="r2anki",
#         p_color = "#273046", p_size=24, p_family = "bauhaus2",
#         s_x=1, s_y=.85, s_width=.8, s_height=.8,
#         h_fill = "#CCC591", h_color = "#273046", h_size = 2,
#         url = "https://github.com/henningsway/r2anki",
#         u_color = "#273046", u_size = 4,
#         filename="sticker_r2anki4.png")
#
#
# ### testing out plots
# extrafont::loadfonts(device="win")
#
# ### merienda-font
# # from http://statr.me/2014/01/using-system-fonts-in-r-graphs/
# library(showtext)
# wd = setwd(tempdir())
# download.file("http://fontpro.com/download-family.php?file=35701",
#               "merienda-r.ttf", mode="wb")
# download.file("http://fontpro.com/download-family.php?file=35700",
#               "merienda-b.ttf", mode="wb")
# font.add("merienda",
#          regular = "merienda-r.ttf",
#          bold = "merienda-b.ttf")
# setwd(wd)
#
#
# ### Bauhaus Font-1
# library(showtext)
# wd = setwd(tempdir())
# setwd("C:/Users/Bumann/Desktop/Bauhaus/")
# font.add("bauhaus",
#          regular = "Bauhaus_.ttf")
# setwd(wd)
#
#
# ### Bauhaus Font-1
# library(showtext)
# wd = setwd(tempdir())
# setwd("C:/WINDOWS/Fonts")
# font.add("bauhaus2",
#          regular = "BAUHS93.TTF")
# setwd(wd)
#
#
#
