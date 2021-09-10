---
title: "Datenauswertung EEP"
author: "Alexander Kramer"
date: "02.01.2021"
output:
  rmdformats::readthedown:
    highlight: kate
    self_contained: true
    thumbnails: false
    code_folding: show
    toc_depth: 5
    fig_width: 12 
    fig_height: 12
    source_code: embed
    df_print: paged
    keep_md: true
fontsize: 14pt
editor_options: 
  chunk_output_type: inline
css: style.css
#runtime: shiny
---






\
\

# 1. Vorbereitung Datenanalyse
## 1. RStudio Projekte

Ausführliche Infos zu R-Projekten findet ihr hier:
<https://r4ds.had.co.nz/workflow-projects.html>


Damit ihr die Beispiele einfach auf eure Experimente übertragen könnt, empfehle ich folgende Ordnerstruktur zu erstellen, wobei ihr *Experiment Name* durch euer Experiment ersetzt:

![](Grafiken/Ordner.png){width="65%"}

Danach könnt ihr im Menü über **File -> New Project** ein Project erstellen. Wählt die Option **Existing Directory**:


![](Grafiken/projekt.png)

Und navigiert danach zu eurem **Experiment Ordner**.

Folgende Einstellungen solltet ihr vornehmen:

1. **Unter Tools -> Project Options**

![](Grafiken/projektoptionen.png)

2. **Unter Tools -> Global Options**

![](Grafiken/globaloptions.png)


In der Regel sollte Rstudio nun direkt zu Beginn euer Projekt laden und der Workspace von **R** sollte leer sein.

### Austausch von Projekten

Der riesige Vorteil von Projekten liegt darin, dass ihr nun einfach euren Ordner *Experiment Name* zippen und z.B. über OpenOlat euren Komiliton_innen zur Verfügung stellen könnt, z.B. in euren Ordner **Gruppenarbeit** über :

![](Grafiken/dateihochladen.png)

Egal wo eure Komiliton_innen den Ordner speichern, das Projekt sollte genauso laufen. Das ist ideal im Sinne der **Replizierbarkeit**!

\

#### Zippen

Hier findet ihr ein Tutorial zur Verwendung von 7-Zip. 

<https://www.top-windows-tutorials.com/free-zip/>

Gezippte Ordner könnt Ihr, wie oben beschrieben, auf Olat hochladen für eure Komiliton_innen und ggfs. wieder entzippen. Dann wird aus dem Zip-Ordner ein Olat-Ordner erstellt:

![](Grafiken/entzippen.png)

\

#### Screencast

<iframe src="https://player.vimeo.com/video/499989775" width="640" height="564" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

\

## 2. R Markdown
\

Mit Hilfe von R Markdown können wir unseren `R-Code` in einen Text eingliedern.

Damit wird es einfacher eure Auswertung zu kommentieren und Grafiken und Tabellen können z.B. direkt aus dem Dokument in euren Bericht übernommen werden.

Darüberhinaus könnt ihr euren Code in Chunks gliedern und den Output direkt unter dem jeweiligen Code-Chunk ausgeben lassen. 

Das macht es sehr einfach Zwischenergebnisse zu kontrollieren und ihr habt den Output immer dort, wo er erzeugt wird.

Zuerst müsst ihr ein R Notebook erstellen. 

![](Grafiken/createNB.png)

Und dieses unter einem aussagekräftigem Namen speicher **File -> save as ...** in **Experiment Name/Skripte**

Zusätzlich muss eine Option angepasst werden. Mit der folgenden Einstellung sorgt ihr dafür das R-Markdown euren Projekt-Ordner als Working-Directory verwendet:

![RMarkdown Working Directory](MarkdownWD.PNG)

Nun können alle Pfade relativ zu eurem Projektordner angegeben werden.

\

### Text Formatierung

R Markdown bietet eine Reihe von Möglichkeiten eure Dokumente zu formatieren. So könnt ihr Text *kursiv* schreiben indem ihr ihn mit Sternen (\*kursiv\*) oder Unterstrichen umschließt (\_kursiv\_). 

Zwei Sterne (\*\*fett\*\*) oder Unterstriche (\_\_fett\_\_) erzeugen **fetten** Text. 

Einzelne Zeilenumbrüche im Notebook werden nicht in den Output übernommen. Dafür muss am Ende der Zeile ein \\ hinzugefügt werden. 

Hier \
sollte ein Zeilenumbruch sein. Hier 
nicht.

Diverse Zeichen haben in R-Markdown eine besondere Bedeutung wie z.B. __\*__ und **\_**. 

Wenn ihr diese im Output-Dokument darstellen wollt müsst ihr ein **\\** davor setzen (das gilt auch für den Backslash selbst, also muss **\\\\** verwendet werden). 

Ganze Abschnitte in denen ihr mehrere Sonderzeichen verwendet, könnt ihr mit ```` `...` ```` umschließen und damit gleichzeitig hervorheben.

\

### Überschriften

Durch ein bzw. mehrere **\#** könnt Überschriften erzeugen. Die Anzahl der **\#** bestimmt das Level in der Überschriftenhierarchie:

\#\#\#  Level 4

\#\#\#\#  Level 5

\#\#\#\#\#  Level 6

#### Level 4 {.unlisted .unnumbered}
##### Level 5 {.unlisted .unnumbered}
###### Level 6 {.unlisted .unnumbered}


Anhand der Überschriften wird sowohl im Editor, als auch im späteren Dokument (dafür müsst ihr im Header die Option `toc: yes` hinzufügen unter `output:  html_notebook:`) ein Inhaltsverzeichnis angelegt.  



### Verlinkung

<style>
div.red { background-color:#ffb8b8; border-radius: 5px; padding: 20px;}
</style>
<div class = "red">

**FANCY**

Ihr könnt im Output-Dokument auf Websites verlinken mit der folgenden Syntax `[verlinkter Text](http://example.com)` 

Lokale Links z.B. zu Ordnern sind nicht möglich. 

Wenn das Output-Format **html** ist, ist es benutzerfreundlicher, wenn ihr die Webseite in einem neuen Fenster öffnet. 

Dazu nutzen wir den html Tag `<a href="http://example.com" target="_blank">verlinkter Text</a>`.

Hier ist ein Link zu <a href="https://www.openolat.uni-hamburg.de/auth/RepositoryEntry/121701530/CourseNode/102475010134417" target="_blank">OpenOlat</a> 

In html haben wir zusätzlich die Möglichkeit, *innerhalb eines Dokuments* zu verlinken. Am einfachsten ist es, auf eine Überschrift zu verlinken. Dazu nutzen wir einfach eckige Klammern, in die wir den Namen einer Überschrift schreiben: [R Markdown] `([R Markdown])`.

Ähnlich zu Links könnt ihr Bilder einfügen:
`![Name des Bildes](/Pfad/zum/Bild)`, z.B. einen Screenshot aus den Kurs-Folien: \

![Projekt erstellen](ProjektErstellen.PNG){width="100%"}

**Packt dazu unbedingt die Bilder in den Skript-Ordner.**
\
</div>

\

### Output Dokument erzeugen

Im Header könnt ihr Output-Formate angeben. Ich empfehle euch für den Start bei HTML zu bleiben. Dafür könnt ihr folgenden Header verwenden:

````
---
title: "Untitled"
author: ""
date: ""
output: 
  html_document:
    numbered: yes
    df_print: paged
    toc: yes
    toc_float: true
    self_contained: false
editor_options: 
  chunk_output_type: inline
---

````



Um nun ein Output-Dokument zu erzeugen gibt es zwei Möglichkeiten:

* über die Tastenkombination `Strg + Shift + K` bzw. :

![](Grafiken/Knit.PNG)

* über das Menü:

![](Grafiken/Knit2.PNG)

\


### R Code

#### Chunks

In R-Markdown wird der Code durch Chunks gegliedert, in diesen könnt ihr *R* ganz normal verwenden, wie ihr es von Skripten gewohnt seid. Es gibt drei Möglichkeiten Chunks einzufügen:

* Das Tastenkürzel `Strg + Alt + I` fügt einen Chunk ein

* Alles was ihr mit ```` ```{r}...``` ```` einschließt wird als R-Code interpretiert

* Im Menü fügt  **Insert** -> **R** einen Chunk ein \

![Chunk einfügen](Chunk.png)


Um einen Chunk auszuführen gibt es zwei Möglichkeiten
* Das Tastenkürzel `Strg + Shift + Enter` führt den Chunk aus
* Ihr klickt auf den grünen Pfeil rechts oben

![Chunk einfügen](Run.png)

\

<div class = "red">

**FANCY**

Für jeden Chunk lassen sich diverse Optionen im Header (`{r}`)ändern, hier eine Liste wichtiger Optionen:

* `{r, results = 'hide'}` Ergebnisse des Chunks werden nicht im Output-Dokument eingefügt
* `{r, message=FALSE}` Nachrichte beim Ausführen des Chunks werden nicht im Output-Dokument eingefügt
* `{r, warning=FALSE}` Warnungen beim Ausführen des Chunks werden nicht im Output-Dokument eingefügt
* `{r, error=FALSE}` Fehler beim Ausführen des Chunks werden nicht im Output-Dokument eingefügt
* `{r, eval=FALSE}` Chunk wird nicht ausgeführt beim kompilieren
* `{r, echo=FALSE}` Chunk wird nicht eingefügt im Output-Dokument
* `{r, include=FALSE}` Chunk wird ausgeführt beim kompilieren aber nicht eingefügt ins Output-Dokument

</div>

\

#### Inline Code

Um R-Code im Text zu verwenden könnt ihr ```` `r...` ```` verwenden . Und so z.B.\
einen Vector definieren  (````  ````) und den Mittelwert ausgeben 2.3333333 (````  ````). Im Text ist dann nur das Ergebnis von ````  ```` zu sehen, im gleichen Format wie der umgebende Text.

Zudem könnt ihr Text hervorheben, wenn ihr ihn mit ```` `...` ```` umschließt.


\
\

## 3 R Setup
\


Zu Beginn des Skripts müssen Pakete einmalig installiert werden über eine der folgenden Möglichkeiten:

* `install.packages("Name  des  Pakets")`
* Menü -> Tools -> Install Packages...

In jeder Session müssen Pakete über `library(Name  des  Pakets)` geladen werden. Der folgende Chunk installiert und lädt ggplot2 


```r
install.packages("ggplot2")
library(ggplot2)
```

Wenn das Paket bereits installiert ist, kann es dabei zu Fehlermeldungen kommen.In folgendem Chunk: \

* schreiben wir alle Pakete, die wir benötigen in einen Vector
* kontrollieren ob alle Pakete installiert sind
  * `if (length(setdiff(packages, rownames(installed.packages()))) > 0) {...}`
* wenn Pakete fehlen, identifizieren wir sie
  * `rownames(installed.packages())` liefert alle installierten Pakete
  * `setdiff(packages, rownames(installed.packages()))` gibt uns alle Elemente aus **packages** die nicht installiert sind

* und installieren  nur Pakete die fehlen
  *install.packages(setdiff(packages, rownames(installed.packages())))
* schließlich werden alle Pakete geladen
  * dies ginge auch über `lapply(packages, require, character.only = TRUE)` 
* kommen neue Pakete hinzu \
  müssen diese dann lediglich in packages eingetragen werden



```r
#lapply(paste('package:',names(sessionInfo()$otherPkgs),sep = ""),detach,character.only = TRUE, unload = TRUE)

packages <- c(
              "Rmisc",
              "tidyverse",
              "ez",
              "rmdformats",
              "rmarkdown",
              "ggsci",
              "viridis",
              "lemon"
              )
           

if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}



# Die Reihenfolge ist hier wichtig, Rmisc muss vor dplyr/tidiverse geladen werden
library("Rmisc")
library("tidyverse")
library("ez")
```

**Wichtig**: Damit euer Projekt ohne Probleme auf anderen Computern läuft, solltet ihr diesen Code-Chunk verwenden, denn wenn auf dem Computer Pakete fehlen, werden sie direkt installiert. Andernfalls würde es zu Fehlermeldungen kommen.


<div class = "red">

**FANCY**


```r
# Alternativ könnt ihr statt:

# library("Rmisc")
# library("tidyverse")
# library("ez")
# ...

# folgenden Befehl verwenden, der alle Pakete in packages mit einem Mal liest:

lapply(packages, require, character.only = TRUE)
```
</div>


Nützliche Infos zum Management von Paketen findet ihr unter dem folgenden <a href="http://methods-berlin.com/wp-content/uploads/Pakete.html" target="_blank">Link</a>

Packages werden ständig aktualisiert. Um die Replizierbarkeit einer Auswertung zu gewährleisten muss daher festgehalten werden, welche Paketversionen verwendet werden. 

Die Funktion `sessionInfo()` liefert genau diese Informationen.Idealerweise speichert ihr den Output in einer Textdatei z.B. mit der Funktion `writeLines()`. 

Die Funktion `capture.output()` wandelt den Output von `sessionInfo()` in einen exportierbaren String um. 
Wir nutzen `paste0(format(Sys.time(), "%Y%b%d"),"sessionInfo.txt")` um das Datum (`Sys.time()`) zu formatieren (`format()`) und zum Namen der Textdatei hinzuzufügen (`paste0()`). 

Damit vermeidet ihr, das die Datei versehentlich überschrieben wird, wenn ihr das Skript zu einen späteren Zeitpunkt nochmal laufen lasst. 

Es gibt diverse Möglichkeiten das Datum zu formatieren: (siehe z.B. <a href="http://applied-r.com/r-dates-and-times/" target="_blank">hier</a>)



```r
sessionInfo()
```

```
R version 4.1.1 (2021-08-10)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19043)

Matrix products: default

locale:
[1] LC_COLLATE=German_Germany.1252  LC_CTYPE=German_Germany.1252   
[3] LC_MONETARY=German_Germany.1252 LC_NUMERIC=C                   
[5] LC_TIME=German_Germany.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] ez_4.4-0         forcats_0.5.1    stringr_1.4.0    dplyr_1.0.7     
 [5] purrr_0.3.4      readr_2.0.1      tidyr_1.1.3      tibble_3.1.4    
 [9] ggplot2_3.3.5    tidyverse_1.3.1  Rmisc_1.5        plyr_1.8.6      
[13] lattice_0.20-44  rmarkdown_2.10   rmdformats_1.0.2 knitr_1.33      

loaded via a namespace (and not attached):
 [1] nlme_3.1-152      fs_1.5.0          lubridate_1.7.10  httr_1.4.2       
 [5] rprojroot_2.0.2   tools_4.1.1       backports_1.2.1   bslib_0.3.0      
 [9] utf8_1.2.2        R6_2.5.1          DBI_1.1.1         mgcv_1.8-36      
[13] colorspace_2.0-2  withr_2.2.0       tidyselect_1.1.1  curl_4.3.2       
[17] compiler_4.1.1    cli_3.0.1         rvest_1.0.1       xml2_1.3.2       
[21] bookdown_0.24     sass_0.4.0        scales_1.1.1      digest_0.6.27    
[25] foreign_0.8-81    minqa_1.2.4       rio_0.5.27        pkgconfig_2.0.3  
[29] htmltools_0.5.2   lme4_1.1-27.1     dbplyr_2.1.1      fastmap_1.1.0    
[33] rlang_0.4.11      readxl_1.3.1      rstudioapi_0.13   jquerylib_0.1.4  
[37] generics_0.1.0    jsonlite_1.7.2    zip_2.2.0         car_3.0-11       
[41] magrittr_2.0.1    Matrix_1.3-4      Rcpp_1.0.7        munsell_0.5.0    
[45] fansi_0.5.0       abind_1.4-5       lifecycle_1.0.0   stringi_1.7.4    
[49] yaml_2.2.1        carData_3.0-4     MASS_7.3-54       grid_4.1.1       
[53] crayon_1.4.1      haven_2.4.3       splines_4.1.1     hms_1.1.0        
[57] pillar_1.6.2      boot_1.3-28       reshape2_1.4.4    reprex_2.0.1     
[61] glue_1.4.2        evaluate_0.14     data.table_1.14.0 modelr_0.1.8     
[65] vctrs_0.3.8       nloptr_1.2.2.2    tzdb_0.1.2        cellranger_1.1.0 
[69] gtable_0.3.0      assertthat_0.2.1  xfun_0.25         openxlsx_4.2.4   
[73] broom_0.7.9       ellipsis_0.3.2   
```

```r
writeLines(capture.output(sessionInfo()), paste0(format(Sys.time(), "%Y%b%d"),"sessionInfo.txt"))
```
\

### Verkettete Befehle verstehen

<iframe src="https://player.vimeo.com/video/499994961" width="640" height="564" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

\

### Projekt-Settings checken

Wenn ihr euer RStudio-Projekt wie oben beschrieben konfiguriert habt, solltet ihr jedes Mal wenn das Projekt geöffnet wird im richtigen Working-Directory sein. 

Ihr könnt dies kontrollieren mit `getwd()`\
und ggf. korrigieren mit `setwd("C:/richtiger/Pfad/")`. 

Hierbei müsst ihr den absoluten Pfad angeben. \

**Korrigiert lieber die Einstellungen des Projekts und von R-Markdown**


```r
wd = getwd()
print(wd)
```

```
[1] "C:/Users/Alexander Kramer/Documents/PHD/Lehre/WS2020/EEP1_Datenauswertung/EEP1"
```

```r
setwd(wd)
```
Der Workspace sollte ebenfalls leer sein. Ihr könnt dies kontrollieren mit `ls()`. \
Wenn der Output von `ls()` leer ist, ist es auch der Workspace. 

Andernfalls könnt ihr mit `rm(list=ls())` den Workspace leeren.


```r
ls()
```

```
[1] "packages" "vec"      "wd"      
```

```r
rm(list=ls())
ls()
```

```
character(0)
```
\

# 2. Analyse einer VP
\

![](Grafiken/workflow1.png)
\

**Bereinigung:**

* Vollständigkeit der Daten
* Fehler 
* Extreme Reaktionszeiten
* Auffällige Versuchspersonen


### Skript/Notebook schreiben

In ein R-Skript/Notebook gehören alle Befehle, die die Analyse reproduzierbar machen. Das Skript sollte so geschrieben sein, dass es für jeden beliebigen Datensatz anwendbar ist. Wenn es z.B. im aktuellen Datensatz keine Reaktionszeiten schneller als 200 ms gibt, dann sollten die Befehle zum Ausschließen von Trials mit kürzeren Reaktionszeiten trotzdem im Skript enthalten sein.


<a name="Import"></a>

### Daten Import

Das Cheat-Sheet zum Daten Import findet ihr hier:
<https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-import.pdf>


1. Wir legen zunächst eine Liste aller logfiles an `list.files(pattern = ".csv")`
    * **pattern** definiert eine Zeichenkette die im Namen enthalten sein muss
    * Wir wollen also nur CSV-Files
2. Dann importieren wir einen Datensatz aus dieser Liste
    * `data.example <- data.files[1]`



```r
data.files <- list.files("Alle Daten/")
data.example <- data.files[1]
daten <- read.csv(paste0("./Alle Daten/", data.example ), header=TRUE, fileEncoding = "UTF-8-BOM")
```

\

### Datenbearbeitung mit dplyr

Dplyr bietet umfangreiche Funktionen zur Bearbeitung von Datensätzen, eine Übersicht über die wichtigsten Features findet ihr im <a href="https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-transformation.pdf" target="_blank">dplyr Cheatsheet</a>.

Meiner Meinung nach ist es das derzeit beste Tool zur Datenbereinigung und Aggregation in R.

Einer der Gründe dafür ist die Verwendung von <a href="https://seananderson.ca/2014/09/13/dplyr-intro/" target="_blank">Pipes</a>

<a name="tidy"></a>
\

#### Tidy-Data 

Dplyr, ggplot und ez funktionieren ideal mit Tidy Data. Drei Kriterien definieren Tidy Data:

1. Jede Variable steht in einer Spalte

2. Jede Beobachtung steht in einer Zeile

3. Jeder Wert steht in einer Zelle der Datentabelle 


Was sind die Vorteile?

1. Wenn die Daten immer nach dem gleichen Schema strukturiert werden, ist es deutlich einfacher, neue Funktionen und Tools zu erlernen die auf diesem Schema basieren. Die Syntax und Logik ist dann häufig sehr ähnlich bis gleich.

2. `R` ist im Kern vektorbasiert, das heißt grob `R` ist am schnellsten wenn Operationen nicht auf einzelne Werte angewendet werden sondern Vektoren.

Eine ausführliche Erläuterung findet ihr <a href="https://r4ds.had.co.nz/tidy-data.html" target="_blank">hier</a>.

#### Ebenen der Datenanalyse

![](Grafiken/EbenenDatenanalyse.png)

\

#### wichtige Funktionen

* `filter(A==B)` wählt Zeilen anhand logischer Bedingungen aus (es werden Werte aus Spalte A mit Spalte B verglichen)
  *`!=` ungleich
  *`< ` kleiner
  *`<=` kleiner gleich
  *`> ` gößer
  *`=>` gröer gleich
* `select(A, B, C)` wählt Spalten A,B,C aus
* `rename(A=B)` Benennt Spalte A in B um
* `recode(sex, w = "weiblich", m = "männlich")` rekodiert Faktoren
* `mutate(C = A + B)` berechnet neue Spalten (C) aus bestehenden (A + B)
* `group_by(A,B)` gruppiert Datensatz nach Spalten (A,B), Summary-Funktionen werden für alle Gruppen die sich aus den Ausprägungen der Spalten ergeben separat angewendet
* `summarise(rt.mean = mean(rt))` aggregiert Spalten mit unterschiedlichen Funktionen  


```r
daten1 = filter(daten, rt>200)
daten2 = filter(daten, Condition1 == "A")
daten3 = select(daten, Condition1, Condition2 ,  corr)
```


<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">

**WICHTIG**: Im Allgemeinen muss bei allen Funktionen als erstes Argument der Datensatz angegeben werden. Später verwenden wir [Pipes](#Pipes), dann ist dies nicht mehr nötig. Alle obigen Funktionen folgen der gleichen Struktur:

* Das erste Argument ist ein Datensatz
* die folgenden Argumente beschreiben, was mit dem Datensatz passieren soll
* Das Ergebnis ist wieder ein Datensatz

</div>


#### Pipes {#Pipes}

Pipes **`%>%`** nehmen den Output eines Ausdrucks (meist eine Funktion) und verwenden ihn als Argument für die nächste Funktion. 

Damit lassen sich mehrere Funktionen miteinander verknüpfen. 

In unserem Fall ist der Output jeder Funktion der veränderte Datensatz, der weitergereicht wird an die nächste Funktion.

Die Logik ist immer gleich. Als erstes übergeben wir einen Datensatz `daten` und dann führen wir mit dem Datensatz einen Befehl nach dem anderen aus. 


```r
daten %>% 
  filter(rt>200) %>% 
  group_by(Condition1) %>% 	
  dplyr::summarise(sum.err = sum(corr),
            mean.rt	= mean(rt),
            sd.rt 	= sd(rt),
            n 	= dplyr::n())
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["Condition1"],"name":[1],"type":["chr"],"align":["left"]},{"label":["sum.err"],"name":[2],"type":["int"],"align":["right"]},{"label":["mean.rt"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["sd.rt"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["n"],"name":[5],"type":["int"],"align":["right"]}],"data":[{"1":"A","2":"135","3":"649.4554","4":"343.6409","5":"173"},{"1":"B","2":"146","3":"748.7316","4":"367.4232","5":"180"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

<a name="aggregieren"></a>

#### Spalten erstellen und aggregieren

![](Grafiken/mutate.PNG)

Mit `mutate()` könnt ihr neue Spalten erzeugen. Dies ist z.B. hilfreich wenn ihr aus mehreren Spalten eine neue Spalte berechnen oder einzelne Trials mit dem Mittelwert vergleichen wollt. In folgendem Beispiel erstellen wir zwei Spalten:
* eine die die Reaktionszeit in Sekunden enthält
* eine die den Mittelwert der VPs enthält für die Reaktionszeit.



```r
daten %>% mutate(rt.sekunden = rt/1000,
                 rt.mean = mean(rt))
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["X"],"name":[1],"type":["int"],"align":["right"]},{"label":["Condition1"],"name":[2],"type":["chr"],"align":["left"]},{"label":["Condition2"],"name":[3],"type":["chr"],"align":["left"]},{"label":["rt"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["corr"],"name":[5],"type":["int"],"align":["right"]},{"label":["id"],"name":[6],"type":["int"],"align":["right"]},{"label":["phase"],"name":[7],"type":["chr"],"align":["left"]},{"label":["trial"],"name":[8],"type":["int"],"align":["right"]},{"label":["age"],"name":[9],"type":["int"],"align":["right"]},{"label":["gender"],"name":[10],"type":["chr"],"align":["left"]},{"label":["hand"],"name":[11],"type":["chr"],"align":["left"]},{"label":["rt.sekunden"],"name":[12],"type":["dbl"],"align":["right"]},{"label":["rt.mean"],"name":[13],"type":["dbl"],"align":["right"]}],"data":[{"1":"1","2":"A","3":"D","4":"584.3662","5":"1","6":"1","7":"uebung","8":"1","9":"22","10":"w","11":"l","12":"0.5843662","13":"688.9857"},{"1":"2","2":"A","3":"E","4":"400.6486","5":"0","6":"1","7":"uebung","8":"2","9":"22","10":"w","11":"l","12":"0.4006486","13":"688.9857"},{"1":"3","2":"A","3":"E","4":"359.5720","5":"1","6":"1","7":"uebung","8":"3","9":"22","10":"w","11":"l","12":"0.3595720","13":"688.9857"},{"1":"4","2":"A","3":"E","4":"402.9639","5":"1","6":"1","7":"uebung","8":"4","9":"22","10":"w","11":"l","12":"0.4029639","13":"688.9857"},{"1":"5","2":"A","3":"E","4":"1849.9017","5":"1","6":"1","7":"uebung","8":"5","9":"22","10":"w","11":"l","12":"1.8499017","13":"688.9857"},{"1":"6","2":"B","3":"E","4":"935.4913","5":"1","6":"1","7":"uebung","8":"6","9":"22","10":"w","11":"l","12":"0.9354913","13":"688.9857"},{"1":"7","2":"B","3":"E","4":"600.7000","5":"1","6":"1","7":"uebung","8":"7","9":"22","10":"w","11":"l","12":"0.6007000","13":"688.9857"},{"1":"8","2":"A","3":"E","4":"1361.8040","5":"1","6":"1","7":"uebung","8":"8","9":"22","10":"w","11":"l","12":"1.3618040","13":"688.9857"},{"1":"9","2":"B","3":"E","4":"841.6802","5":"1","6":"1","7":"uebung","8":"9","9":"22","10":"w","11":"l","12":"0.8416802","13":"688.9857"},{"1":"10","2":"B","3":"E","4":"1250.7875","5":"1","6":"1","7":"uebung","8":"10","9":"22","10":"w","11":"l","12":"1.2507875","13":"688.9857"},{"1":"11","2":"A","3":"D","4":"690.6194","5":"0","6":"1","7":"uebung","8":"11","9":"22","10":"w","11":"l","12":"0.6906194","13":"688.9857"},{"1":"12","2":"B","3":"D","4":"621.0302","5":"1","6":"1","7":"uebung","8":"12","9":"22","10":"w","11":"l","12":"0.6210302","13":"688.9857"},{"1":"13","2":"A","3":"D","4":"610.8608","5":"1","6":"1","7":"uebung","8":"13","9":"22","10":"w","11":"l","12":"0.6108608","13":"688.9857"},{"1":"14","2":"A","3":"D","4":"704.7730","5":"1","6":"1","7":"uebung","8":"14","9":"22","10":"w","11":"l","12":"0.7047730","13":"688.9857"},{"1":"15","2":"A","3":"C","4":"410.0674","5":"1","6":"1","7":"uebung","8":"15","9":"22","10":"w","11":"l","12":"0.4100674","13":"688.9857"},{"1":"16","2":"B","3":"C","4":"394.2318","5":"1","6":"1","7":"uebung","8":"16","9":"22","10":"w","11":"l","12":"0.3942318","13":"688.9857"},{"1":"17","2":"B","3":"E","4":"668.5651","5":"1","6":"1","7":"uebung","8":"17","9":"22","10":"w","11":"l","12":"0.6685651","13":"688.9857"},{"1":"18","2":"B","3":"C","4":"667.3068","5":"1","6":"1","7":"uebung","8":"18","9":"22","10":"w","11":"l","12":"0.6673068","13":"688.9857"},{"1":"19","2":"B","3":"E","4":"790.5925","5":"1","6":"1","7":"uebung","8":"19","9":"22","10":"w","11":"l","12":"0.7905925","13":"688.9857"},{"1":"20","2":"B","3":"E","4":"581.9369","5":"1","6":"1","7":"uebung","8":"20","9":"22","10":"w","11":"l","12":"0.5819369","13":"688.9857"},{"1":"21","2":"A","3":"D","4":"707.5118","5":"1","6":"1","7":"uebung","8":"21","9":"22","10":"w","11":"l","12":"0.7075118","13":"688.9857"},{"1":"22","2":"A","3":"D","4":"865.8304","5":"0","6":"1","7":"uebung","8":"22","9":"22","10":"w","11":"l","12":"0.8658304","13":"688.9857"},{"1":"23","2":"B","3":"C","4":"471.5481","5":"0","6":"1","7":"uebung","8":"23","9":"22","10":"w","11":"l","12":"0.4715481","13":"688.9857"},{"1":"24","2":"A","3":"E","4":"930.3396","5":"1","6":"1","7":"uebung","8":"24","9":"22","10":"w","11":"l","12":"0.9303396","13":"688.9857"},{"1":"25","2":"A","3":"D","4":"1871.8053","5":"0","6":"1","7":"uebung","8":"25","9":"22","10":"w","11":"l","12":"1.8718053","13":"688.9857"},{"1":"26","2":"B","3":"D","4":"611.6895","5":"1","6":"1","7":"uebung","8":"26","9":"22","10":"w","11":"l","12":"0.6116895","13":"688.9857"},{"1":"27","2":"A","3":"D","4":"793.4090","5":"0","6":"1","7":"uebung","8":"27","9":"22","10":"w","11":"l","12":"0.7934090","13":"688.9857"},{"1":"28","2":"B","3":"E","4":"477.2519","5":"1","6":"1","7":"uebung","8":"28","9":"22","10":"w","11":"l","12":"0.4772519","13":"688.9857"},{"1":"29","2":"A","3":"E","4":"395.0063","5":"1","6":"1","7":"uebung","8":"29","9":"22","10":"w","11":"l","12":"0.3950063","13":"688.9857"},{"1":"30","2":"A","3":"D","4":"603.2789","5":"1","6":"1","7":"uebung","8":"30","9":"22","10":"w","11":"l","12":"0.6032789","13":"688.9857"},{"1":"31","2":"A","3":"D","4":"995.6080","5":"0","6":"1","7":"uebung","8":"31","9":"22","10":"w","11":"l","12":"0.9956080","13":"688.9857"},{"1":"32","2":"A","3":"D","4":"655.0301","5":"0","6":"1","7":"uebung","8":"32","9":"22","10":"w","11":"l","12":"0.6550301","13":"688.9857"},{"1":"33","2":"B","3":"C","4":"499.3919","5":"0","6":"1","7":"uebung","8":"33","9":"22","10":"w","11":"l","12":"0.4993919","13":"688.9857"},{"1":"34","2":"A","3":"D","4":"1437.0015","5":"1","6":"1","7":"uebung","8":"34","9":"22","10":"w","11":"l","12":"1.4370015","13":"688.9857"},{"1":"35","2":"B","3":"D","4":"1039.4580","5":"1","6":"1","7":"uebung","8":"35","9":"22","10":"w","11":"l","12":"1.0394580","13":"688.9857"},{"1":"36","2":"A","3":"D","4":"615.6031","5":"1","6":"1","7":"uebung","8":"36","9":"22","10":"w","11":"l","12":"0.6156031","13":"688.9857"},{"1":"37","2":"A","3":"E","4":"533.1092","5":"1","6":"1","7":"experiment","8":"37","9":"22","10":"w","11":"l","12":"0.5331092","13":"688.9857"},{"1":"38","2":"B","3":"D","4":"563.6794","5":"1","6":"1","7":"experiment","8":"38","9":"22","10":"w","11":"l","12":"0.5636794","13":"688.9857"},{"1":"39","2":"A","3":"E","4":"1508.8575","5":"1","6":"1","7":"experiment","8":"39","9":"22","10":"w","11":"l","12":"1.5088575","13":"688.9857"},{"1":"40","2":"B","3":"E","4":"472.9195","5":"0","6":"1","7":"experiment","8":"40","9":"22","10":"w","11":"l","12":"0.4729195","13":"688.9857"},{"1":"41","2":"B","3":"E","4":"609.5427","5":"0","6":"1","7":"experiment","8":"41","9":"22","10":"w","11":"l","12":"0.6095427","13":"688.9857"},{"1":"42","2":"A","3":"C","4":"207.1511","5":"1","6":"1","7":"experiment","8":"42","9":"22","10":"w","11":"l","12":"0.2071511","13":"688.9857"},{"1":"43","2":"B","3":"D","4":"765.6613","5":"0","6":"1","7":"experiment","8":"43","9":"22","10":"w","11":"l","12":"0.7656613","13":"688.9857"},{"1":"44","2":"A","3":"E","4":"495.3241","5":"1","6":"1","7":"experiment","8":"44","9":"22","10":"w","11":"l","12":"0.4953241","13":"688.9857"},{"1":"45","2":"A","3":"D","4":"740.4075","5":"1","6":"1","7":"experiment","8":"45","9":"22","10":"w","11":"l","12":"0.7404075","13":"688.9857"},{"1":"46","2":"B","3":"D","4":"809.8310","5":"0","6":"1","7":"experiment","8":"46","9":"22","10":"w","11":"l","12":"0.8098310","13":"688.9857"},{"1":"47","2":"A","3":"C","4":"775.6984","5":"1","6":"1","7":"experiment","8":"47","9":"22","10":"w","11":"l","12":"0.7756984","13":"688.9857"},{"1":"48","2":"B","3":"D","4":"1081.3329","5":"1","6":"1","7":"experiment","8":"48","9":"22","10":"w","11":"l","12":"1.0813329","13":"688.9857"},{"1":"49","2":"A","3":"C","4":"546.9216","5":"1","6":"1","7":"experiment","8":"49","9":"22","10":"w","11":"l","12":"0.5469216","13":"688.9857"},{"1":"50","2":"B","3":"C","4":"595.8706","5":"1","6":"1","7":"experiment","8":"50","9":"22","10":"w","11":"l","12":"0.5958706","13":"688.9857"},{"1":"51","2":"A","3":"C","4":"755.7846","5":"1","6":"1","7":"experiment","8":"51","9":"22","10":"w","11":"l","12":"0.7557846","13":"688.9857"},{"1":"52","2":"B","3":"C","4":"317.0138","5":"1","6":"1","7":"experiment","8":"52","9":"22","10":"w","11":"l","12":"0.3170138","13":"688.9857"},{"1":"53","2":"B","3":"E","4":"707.9153","5":"1","6":"1","7":"experiment","8":"53","9":"22","10":"w","11":"l","12":"0.7079153","13":"688.9857"},{"1":"54","2":"A","3":"D","4":"856.8780","5":"0","6":"1","7":"experiment","8":"54","9":"22","10":"w","11":"l","12":"0.8568780","13":"688.9857"},{"1":"55","2":"B","3":"E","4":"773.1652","5":"0","6":"1","7":"experiment","8":"55","9":"22","10":"w","11":"l","12":"0.7731652","13":"688.9857"},{"1":"56","2":"B","3":"D","4":"624.0918","5":"1","6":"1","7":"experiment","8":"56","9":"22","10":"w","11":"l","12":"0.6240918","13":"688.9857"},{"1":"57","2":"B","3":"C","4":"802.8967","5":"1","6":"1","7":"experiment","8":"57","9":"22","10":"w","11":"l","12":"0.8028967","13":"688.9857"},{"1":"58","2":"B","3":"C","4":"585.8499","5":"1","6":"1","7":"experiment","8":"58","9":"22","10":"w","11":"l","12":"0.5858499","13":"688.9857"},{"1":"59","2":"A","3":"E","4":"546.8281","5":"1","6":"1","7":"experiment","8":"59","9":"22","10":"w","11":"l","12":"0.5468281","13":"688.9857"},{"1":"60","2":"A","3":"E","4":"561.1510","5":"1","6":"1","7":"experiment","8":"60","9":"22","10":"w","11":"l","12":"0.5611510","13":"688.9857"},{"1":"61","2":"B","3":"D","4":"1170.0842","5":"1","6":"1","7":"experiment","8":"61","9":"22","10":"w","11":"l","12":"1.1700842","13":"688.9857"},{"1":"62","2":"B","3":"C","4":"590.8693","5":"1","6":"1","7":"experiment","8":"62","9":"22","10":"w","11":"l","12":"0.5908693","13":"688.9857"},{"1":"63","2":"B","3":"D","4":"1072.3658","5":"1","6":"1","7":"experiment","8":"63","9":"22","10":"w","11":"l","12":"1.0723658","13":"688.9857"},{"1":"64","2":"B","3":"D","4":"585.3855","5":"1","6":"1","7":"experiment","8":"64","9":"22","10":"w","11":"l","12":"0.5853855","13":"688.9857"},{"1":"65","2":"B","3":"E","4":"722.7745","5":"1","6":"1","7":"experiment","8":"65","9":"22","10":"w","11":"l","12":"0.7227745","13":"688.9857"},{"1":"66","2":"B","3":"E","4":"535.2067","5":"1","6":"1","7":"experiment","8":"66","9":"22","10":"w","11":"l","12":"0.5352067","13":"688.9857"},{"1":"67","2":"A","3":"D","4":"636.1415","5":"1","6":"1","7":"experiment","8":"67","9":"22","10":"w","11":"l","12":"0.6361415","13":"688.9857"},{"1":"68","2":"A","3":"C","4":"455.4847","5":"1","6":"1","7":"experiment","8":"68","9":"22","10":"w","11":"l","12":"0.4554847","13":"688.9857"},{"1":"69","2":"B","3":"D","4":"567.3875","5":"1","6":"1","7":"experiment","8":"69","9":"22","10":"w","11":"l","12":"0.5673875","13":"688.9857"},{"1":"70","2":"A","3":"C","4":"332.6961","5":"1","6":"1","7":"experiment","8":"70","9":"22","10":"w","11":"l","12":"0.3326961","13":"688.9857"},{"1":"71","2":"A","3":"D","4":"774.6569","5":"0","6":"1","7":"experiment","8":"71","9":"22","10":"w","11":"l","12":"0.7746569","13":"688.9857"},{"1":"72","2":"B","3":"E","4":"710.2989","5":"1","6":"1","7":"experiment","8":"72","9":"22","10":"w","11":"l","12":"0.7102989","13":"688.9857"},{"1":"73","2":"B","3":"D","4":"587.5576","5":"1","6":"1","7":"experiment","8":"73","9":"22","10":"w","11":"l","12":"0.5875576","13":"688.9857"},{"1":"74","2":"A","3":"D","4":"587.3716","5":"1","6":"1","7":"experiment","8":"74","9":"22","10":"w","11":"l","12":"0.5873716","13":"688.9857"},{"1":"75","2":"B","3":"D","4":"590.4374","5":"1","6":"1","7":"experiment","8":"75","9":"22","10":"w","11":"l","12":"0.5904374","13":"688.9857"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

`mean(rt)` nimmt alle Werte in `rt` und berechnet den Mittelwert. `mutate()` erkennt, dass nur ein Wert zurückgegeben wird und fügt diesen automatisch für jede Zeile zu. `rt/1000` gibt hingegen genauso viele Werte wie in `rt`stehen zurück. Also wird für jede Zeile ein unterschiedlicher Wert zugefügt. `mutate()` akzeptiert alle Funktionen die einen **Vektor** als Argument nehmen und entweder einen Wert oder genauso viele Werte wie in dem **Vektor** stehen zurückgeben. 

\

![](Grafiken/grouping.PNG)

Mit `group_by(Condition1)` könnt ihr den Datensatz gruppieren. Eine Gruppe umfasst dabei alle Zeilen, die den gleichen Wert in Spalte `Condition1` haben. `Condition1` kann natürlich eine beliebige Spalte in eurem Datensatz sein, in der Regel jedoch ein Faktor. Verwendet ihr mehrere Spalten z.B. `group_by(Condition1, Condition2)` wird eine Gruppe für jede Kombination aus Werten in `Condition1` und `Condition2` erstellt. Alle Funktionen in `mutate()` und `summarise()` werden dann separat pro Gruppe durchgeführt. Hier fürgen analog zu oben eine Spalte mit dem Mittelwert der Reaktionszeit an, diesmal jedoch separat für jede Bedingung in `Condition`.



```r
daten %>% group_by(Condition1) %>% 
          mutate(rt.mean = mean(rt))
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["X"],"name":[1],"type":["int"],"align":["right"]},{"label":["Condition1"],"name":[2],"type":["chr"],"align":["left"]},{"label":["Condition2"],"name":[3],"type":["chr"],"align":["left"]},{"label":["rt"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["corr"],"name":[5],"type":["int"],"align":["right"]},{"label":["id"],"name":[6],"type":["int"],"align":["right"]},{"label":["phase"],"name":[7],"type":["chr"],"align":["left"]},{"label":["trial"],"name":[8],"type":["int"],"align":["right"]},{"label":["age"],"name":[9],"type":["int"],"align":["right"]},{"label":["gender"],"name":[10],"type":["chr"],"align":["left"]},{"label":["hand"],"name":[11],"type":["chr"],"align":["left"]},{"label":["rt.mean"],"name":[12],"type":["dbl"],"align":["right"]}],"data":[{"1":"1","2":"A","3":"D","4":"584.3662","5":"1","6":"1","7":"uebung","8":"1","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"2","2":"A","3":"E","4":"400.6486","5":"0","6":"1","7":"uebung","8":"2","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"3","2":"A","3":"E","4":"359.5720","5":"1","6":"1","7":"uebung","8":"3","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"4","2":"A","3":"E","4":"402.9639","5":"1","6":"1","7":"uebung","8":"4","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"5","2":"A","3":"E","4":"1849.9017","5":"1","6":"1","7":"uebung","8":"5","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"6","2":"B","3":"E","4":"935.4913","5":"1","6":"1","7":"uebung","8":"6","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"7","2":"B","3":"E","4":"600.7000","5":"1","6":"1","7":"uebung","8":"7","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"8","2":"A","3":"E","4":"1361.8040","5":"1","6":"1","7":"uebung","8":"8","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"9","2":"B","3":"E","4":"841.6802","5":"1","6":"1","7":"uebung","8":"9","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"10","2":"B","3":"E","4":"1250.7875","5":"1","6":"1","7":"uebung","8":"10","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"11","2":"A","3":"D","4":"690.6194","5":"0","6":"1","7":"uebung","8":"11","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"12","2":"B","3":"D","4":"621.0302","5":"1","6":"1","7":"uebung","8":"12","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"13","2":"A","3":"D","4":"610.8608","5":"1","6":"1","7":"uebung","8":"13","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"14","2":"A","3":"D","4":"704.7730","5":"1","6":"1","7":"uebung","8":"14","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"15","2":"A","3":"C","4":"410.0674","5":"1","6":"1","7":"uebung","8":"15","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"16","2":"B","3":"C","4":"394.2318","5":"1","6":"1","7":"uebung","8":"16","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"17","2":"B","3":"E","4":"668.5651","5":"1","6":"1","7":"uebung","8":"17","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"18","2":"B","3":"C","4":"667.3068","5":"1","6":"1","7":"uebung","8":"18","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"19","2":"B","3":"E","4":"790.5925","5":"1","6":"1","7":"uebung","8":"19","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"20","2":"B","3":"E","4":"581.9369","5":"1","6":"1","7":"uebung","8":"20","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"21","2":"A","3":"D","4":"707.5118","5":"1","6":"1","7":"uebung","8":"21","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"22","2":"A","3":"D","4":"865.8304","5":"0","6":"1","7":"uebung","8":"22","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"23","2":"B","3":"C","4":"471.5481","5":"0","6":"1","7":"uebung","8":"23","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"24","2":"A","3":"E","4":"930.3396","5":"1","6":"1","7":"uebung","8":"24","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"25","2":"A","3":"D","4":"1871.8053","5":"0","6":"1","7":"uebung","8":"25","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"26","2":"B","3":"D","4":"611.6895","5":"1","6":"1","7":"uebung","8":"26","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"27","2":"A","3":"D","4":"793.4090","5":"0","6":"1","7":"uebung","8":"27","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"28","2":"B","3":"E","4":"477.2519","5":"1","6":"1","7":"uebung","8":"28","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"29","2":"A","3":"E","4":"395.0063","5":"1","6":"1","7":"uebung","8":"29","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"30","2":"A","3":"D","4":"603.2789","5":"1","6":"1","7":"uebung","8":"30","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"31","2":"A","3":"D","4":"995.6080","5":"0","6":"1","7":"uebung","8":"31","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"32","2":"A","3":"D","4":"655.0301","5":"0","6":"1","7":"uebung","8":"32","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"33","2":"B","3":"C","4":"499.3919","5":"0","6":"1","7":"uebung","8":"33","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"34","2":"A","3":"D","4":"1437.0015","5":"1","6":"1","7":"uebung","8":"34","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"35","2":"B","3":"D","4":"1039.4580","5":"1","6":"1","7":"uebung","8":"35","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"36","2":"A","3":"D","4":"615.6031","5":"1","6":"1","7":"uebung","8":"36","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"37","2":"A","3":"E","4":"533.1092","5":"1","6":"1","7":"experiment","8":"37","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"38","2":"B","3":"D","4":"563.6794","5":"1","6":"1","7":"experiment","8":"38","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"39","2":"A","3":"E","4":"1508.8575","5":"1","6":"1","7":"experiment","8":"39","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"40","2":"B","3":"E","4":"472.9195","5":"0","6":"1","7":"experiment","8":"40","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"41","2":"B","3":"E","4":"609.5427","5":"0","6":"1","7":"experiment","8":"41","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"42","2":"A","3":"C","4":"207.1511","5":"1","6":"1","7":"experiment","8":"42","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"43","2":"B","3":"D","4":"765.6613","5":"0","6":"1","7":"experiment","8":"43","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"44","2":"A","3":"E","4":"495.3241","5":"1","6":"1","7":"experiment","8":"44","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"45","2":"A","3":"D","4":"740.4075","5":"1","6":"1","7":"experiment","8":"45","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"46","2":"B","3":"D","4":"809.8310","5":"0","6":"1","7":"experiment","8":"46","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"47","2":"A","3":"C","4":"775.6984","5":"1","6":"1","7":"experiment","8":"47","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"48","2":"B","3":"D","4":"1081.3329","5":"1","6":"1","7":"experiment","8":"48","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"49","2":"A","3":"C","4":"546.9216","5":"1","6":"1","7":"experiment","8":"49","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"50","2":"B","3":"C","4":"595.8706","5":"1","6":"1","7":"experiment","8":"50","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"51","2":"A","3":"C","4":"755.7846","5":"1","6":"1","7":"experiment","8":"51","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"52","2":"B","3":"C","4":"317.0138","5":"1","6":"1","7":"experiment","8":"52","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"53","2":"B","3":"E","4":"707.9153","5":"1","6":"1","7":"experiment","8":"53","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"54","2":"A","3":"D","4":"856.8780","5":"0","6":"1","7":"experiment","8":"54","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"55","2":"B","3":"E","4":"773.1652","5":"0","6":"1","7":"experiment","8":"55","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"56","2":"B","3":"D","4":"624.0918","5":"1","6":"1","7":"experiment","8":"56","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"57","2":"B","3":"C","4":"802.8967","5":"1","6":"1","7":"experiment","8":"57","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"58","2":"B","3":"C","4":"585.8499","5":"1","6":"1","7":"experiment","8":"58","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"59","2":"A","3":"E","4":"546.8281","5":"1","6":"1","7":"experiment","8":"59","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"60","2":"A","3":"E","4":"561.1510","5":"1","6":"1","7":"experiment","8":"60","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"61","2":"B","3":"D","4":"1170.0842","5":"1","6":"1","7":"experiment","8":"61","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"62","2":"B","3":"C","4":"590.8693","5":"1","6":"1","7":"experiment","8":"62","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"63","2":"B","3":"D","4":"1072.3658","5":"1","6":"1","7":"experiment","8":"63","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"64","2":"B","3":"D","4":"585.3855","5":"1","6":"1","7":"experiment","8":"64","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"65","2":"B","3":"E","4":"722.7745","5":"1","6":"1","7":"experiment","8":"65","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"66","2":"B","3":"E","4":"535.2067","5":"1","6":"1","7":"experiment","8":"66","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"67","2":"A","3":"D","4":"636.1415","5":"1","6":"1","7":"experiment","8":"67","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"68","2":"A","3":"C","4":"455.4847","5":"1","6":"1","7":"experiment","8":"68","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"69","2":"B","3":"D","4":"567.3875","5":"1","6":"1","7":"experiment","8":"69","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"70","2":"A","3":"C","4":"332.6961","5":"1","6":"1","7":"experiment","8":"70","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"71","2":"A","3":"D","4":"774.6569","5":"0","6":"1","7":"experiment","8":"71","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"72","2":"B","3":"E","4":"710.2989","5":"1","6":"1","7":"experiment","8":"72","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"73","2":"B","3":"D","4":"587.5576","5":"1","6":"1","7":"experiment","8":"73","9":"22","10":"w","11":"l","12":"748.7316"},{"1":"74","2":"A","3":"D","4":"587.3716","5":"1","6":"1","7":"experiment","8":"74","9":"22","10":"w","11":"l","12":"629.2397"},{"1":"75","2":"B","3":"D","4":"590.4374","5":"1","6":"1","7":"experiment","8":"75","9":"22","10":"w","11":"l","12":"748.7316"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
Wie ihr seht unterscheiden sich nun die Werte in `rt.mean` je nachdem, was in `Condition1` steht.

\

Mit `summary()` können wir die Daten nun zusammenfassen. `summary()` akzeptiert alle Funktionen die einen **Vektor** als Argument nehmen und nur einen einzigen Wert zurückgeben. Beispiele sind `mean()`, `n()` und `sd()`. Auch `summary()` wird in einem gruppierten Datensatz für jede Gruppe separat ausgeführt. Im Gegensatz zu `mutate()` fügt `summary()` aber nicht einen Wert an jede Zeile an, sondern liefert einen Datensatz mit nur eine Zeile pro Gruppe. Alle Spalten die nicht zur Gruppierung verwendet werden oder berechnet wurden in `summary()` werden verworfen. Im folgenden Beispiel werden Mittelwert, Standardabweichung und Anzahl der Trials berechnet.




```r
daten %>% 
  group_by(Condition1, Condition2) %>% 	
  dplyr::summarise(
            mean.rt	= mean(rt),
            sd.rt 	= sd(rt),
            n 	= dplyr::n())
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["Condition1"],"name":[1],"type":["chr"],"align":["left"]},{"label":["Condition2"],"name":[2],"type":["chr"],"align":["left"]},{"label":["mean.rt"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["sd.rt"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["n"],"name":[5],"type":["int"],"align":["right"]}],"data":[{"1":"A","2":"C","3":"457.1082","4":"317.2331","5":"60"},{"1":"A","2":"D","3":"834.6224","4":"322.2030","5":"60"},{"1":"A","2":"E","3":"595.9885","4":"311.2741","5":"60"},{"1":"B","2":"C","3":"652.4395","4":"441.0174","5":"60"},{"1":"B","2":"D","3":"794.4246","4":"342.7254","5":"60"},{"1":"B","2":"E","3":"799.3307","4":"288.8987","5":"60"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
Wie erwartet enthält der Output eine Zeile pro Kombinaiton aus Bedingungen in `Condition1` und `Condition2`. Spalten wie `id`, `phase` usw. wurden entfernt.

\

Später wenn mehrere VPs im Datensatz enthalten sind, wird häufig erst pro VP aggregiert und dann pro Bedingung. Die Logik bleibt die gleiche. 


```r
# aggregieren pro VP und Bedingungen

daten.vp <- daten %>%
  group_by(id, Condition1, Condition2) %>%
  dplyr::summarise(
    vp.mean.rt	= mean(rt),
    vp.sd.rt 	= sd(rt),
    vp.n 	= dplyr::n()
  )


# aggregieren pro Bedingungen
# wichtig: wir nehmen den pro VP aggregierten Datensatz daten.vp als Input und lassen id als Gruppierungsvariable weg.

daten.agg <- daten.vp %>%
  group_by(Condition1, Condition2) %>%
  dplyr::summarise(
    vp.mean.rt	= mean(rt),
    vp.sd.rt 	= sd(rt),
    vp.n 	= dplyr::n()
  )
```




<a name="Struktur"></a>

### Struktur prüfen und Rekodieren



```r
str(daten)
```

```
'data.frame':	360 obs. of  11 variables:
 $ X         : int  1 2 3 4 5 6 7 8 9 10 ...
 $ Condition1: chr  "A" "A" "A" "A" ...
 $ Condition2: chr  "D" "E" "E" "E" ...
 $ rt        : num  584 401 360 403 1850 ...
 $ corr      : int  1 0 1 1 1 1 1 1 1 1 ...
 $ id        : int  1 1 1 1 1 1 1 1 1 1 ...
 $ phase     : chr  "uebung" "uebung" "uebung" "uebung" ...
 $ trial     : int  1 2 3 4 5 6 7 8 9 10 ...
 $ age       : int  22 22 22 22 22 22 22 22 22 22 ...
 $ gender    : chr  "w" "w" "w" "w" ...
 $ hand      : chr  "l" "l" "l" "l" ...
```

```r
daten <- daten %>% mutate(id = factor(id),
                          gender = recode_factor(gender, w = "weiblich", m = "männlich", d= "divers")) 

str(daten)
```

```
'data.frame':	360 obs. of  11 variables:
 $ X         : int  1 2 3 4 5 6 7 8 9 10 ...
 $ Condition1: chr  "A" "A" "A" "A" ...
 $ Condition2: chr  "D" "E" "E" "E" ...
 $ rt        : num  584 401 360 403 1850 ...
 $ corr      : int  1 0 1 1 1 1 1 1 1 1 ...
 $ id        : Factor w/ 1 level "1": 1 1 1 1 1 1 1 1 1 1 ...
 $ phase     : chr  "uebung" "uebung" "uebung" "uebung" ...
 $ trial     : int  1 2 3 4 5 6 7 8 9 10 ...
 $ age       : int  22 22 22 22 22 22 22 22 22 22 ...
 $ gender    : Factor w/ 1 level "weiblich": 1 1 1 1 1 1 1 1 1 1 ...
 $ hand      : chr  "l" "l" "l" "l" ...
```

Als Faktoren sollten definiert sein:

* alle kategorialen unabhängigen Variablen

* weitere kategoriale Variablen, die bei der Analyse berücksichtigt werden sollen (z.B. Geschlecht)

* Subject: ID / VP-Nummer

Die Reihenfolge in `recode_factor` bestimmt Reihenfolge der Faktorstufen in Abbildungen und Tabellen.


<a name="Uebungstrials"></a>

### Übungstrials entfernen


```r
## Übungstrials entfernen
daten <- daten %>%
  filter(phase != "uebung")
```

<a name="Vollstaendigkeit"></a>

### Vollständigkeit der Daten prüfen

Prüfen Sie, ob die Versuchsperson das Experiment bis zum Ende bearbeitet hat, z.B. durch Zählen der Zeilen im Datensatz oder durch Zählen der Anzahl der Trials pro Bedingung.


```r
# Anzahl der Zeilen im Datensatz
daten %>% count()
# Anzahl der Trials pro Bedingung
daten %>% 
  group_by(Condition1, Condition2) %>%  # UV: muss durch Spaltenname ersetzt werden
  mutate(mean=mean(rt))

daten %>% 
  group_by(Condition1, Condition2) %>%  # UV: muss durch Spaltenname ersetzt werden
  summarise(mean=mean(rt))
```

`group_by()` mit dieser Funktion wird der Datensatz nach Faktorstufen des angegebenen Faktors gruppiert und alle nachfolgende Schritte werden getrennt nach den Faktorstufen durchgeführt. In diesem Fall: Anzahl der Trials für alle Stufenkombinationen von Condition1 und Condition2 werden mit count() gezählt. 

<a name="Antwortgenauigkeit"></a>

### Analyse der Antwortgenauigkeit



**Eine VP hat 10 Fehler gemacht. Ist das viel oder wenig?**


<div id="spoiler2" style="display:none">
<ul>
  <li>Das hängt von der Bezugsgröße ab:
    <ul>
      <li>bei 1000 präsentierten Trials: 1 %</li>
      <li>bei 20 präsentierten Trials: 50%</li>
    </ul>
  </li>
  
  <li>Der Vergleich der absoluten Fehleranzahl zwischen Bedingungen ist nur aussagekräftig, wenn in allen Bedingungen die gleiche Anzahl Trials präsentiert wurde.
    <ul>
      <li>sonst relative Fehlerzahl berechnen</li>
    </ul>
  </li>
</ul>
</div>

<button title="Click to show answer" type="button"
   onclick="if(document.getElementById('spoiler2') .style.display=='none')
              {document.getElementById('spoiler2') .style.display=''}
            else{document.getElementById('spoiler2') .style.display='none'}">
  Show/hide
</button>

\

**Zusammenfassend:**

Die Analyse der Antwortgenauigkeit (RA - Response Accuracy) soll pro Bedingung erfolgen. Die Antwortgenauigkeit kann berechnet werden als...

* Summe richtiger Antworten
* Anteil richtiger Antworten an allen Trials einer Bedingung

Wenn die Anzahl der praesentierten Trials sich zwischen den Bedingungen unterscheidet, sollte man ausschliesslich den "Anteil" betrachten, wenn man die Antwortgenauigkeit zwischen den Bedingungen vergleichen möchte. 


```r
daten %>% 
  group_by(Condition1) %>% 
  summarise(RA.Summe = sum(corr),  
            RA.Anteil = mean(corr)) 
```

Erläuterung:

* `summarise()` = Zusammenfassung von Daten. notwendig um Funktionen wie mean(), sd(), sum() etc. auszuführen
* `RA.Summe` und `RA.Anteil` = selbstgewählte Name, erscheinen als Spaltennamen im Ergebnisoutput
* `mean()`, `sum()` = Funktionen
* `corr` = Spalte in Dataframe "daten"
\

<a name="Auschluss Extreme"></a>

### Ausschluss von Fehlertrials und extremen Reaktionszeiten

**Gibt es Trials, die nicht in die Auswertung der Reaktionszeiten eingehen sollen?**

\

<div id="spoiler" style="display:none">
  <ul>
    <li>abhängig vom jeweiligen Experiment und inhaltlichen Überlegungen
      <ul>
        <li>Keine allgemeinen Regeln</li>
        <li>nachschlagen, was in der Literatur üblich ist</li>
      </ul>
    <li>üblich für Reaktionszeitexperimente:
        <ul>
          <li>Reaktionszeiten nur für richtige Antworten analysieren (oder getrennt für richtige und falsche Antworten)</li>
          <li>zu schnelle und zu langsame Reaktionszeiten werden von der Analyse ausgeschlossen</li>
        </ul>
    </li>
  </ul>
</div>

<button title="Click to show answer" type="button"
   onclick="if(document.getElementById('spoiler') .style.display=='none')
              {document.getElementById('spoiler') .style.display=''}
            else{document.getElementById('spoiler') .style.display='none'}">
  Show/hide
</button>

\
\

### Strategien zur Identifizierung extremer Werte

* visuelle Inspektion der Verteilung der Daten (Histogramm, Boxplot) 
* absolute Cut-offs\
    * z.B. RTs < 200 ms; RTs > 2000 ms
* relative Cut-offs\
    * z. B. RTs > M + 3 SD pro Bedingung und VP (auch üblich: 2.5 SD, 2 SD)
    
**nicht zu viele Daten ausschließen** (< 5 bis 15%, abhängig von der Datenverteilung; Ratcliff, 1993)



\

<a name="visuelle Inspektion"></a>

### visuelle Inspektion

Daten filtern: Ausschluss von Trials, in denen die VP falsch reagiert hat

```r
# Daten filtern: Ausschluss von Trials, in denen die VP falsch reagiert hat
data.ohneFehler.df <- daten %>%
  filter(corr == 1)
```




**Histogram**
Verteilung der Reaktionszeiten - insgesamt (ohne Berücksichtigung der Bedingungen)

```r
ggplot( data=data.ohneFehler.df, aes(x= rt)) + geom_histogram(binwidth=100) + facet_grid(~Condition1)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-15-1.png" style="display: block; margin: auto;" />

\

Verteilung der Reaktionszeiten pro Bedingung

```r
ggplot( data=data.ohneFehler.df, aes(x= rt)) + geom_histogram(binwidth=100) + facet_grid(Condition1~Condition2)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-16-1.png" style="display: block; margin: auto;" />

\

**Boxplot**
Boxplot der Reaktionszeiten pro Bedingung

```r
ggplot( data=data.ohneFehler.df, aes(x= Condition2 , y=rt)) + geom_boxplot() + geom_jitter()+ facet_grid(~Condition1)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-17-1.png" style="display: block; margin: auto;" />

\

<a name="Ausreisseranalyse"></a>

### Ausreißeranalyse

Als untere Grenze für Reaktionszeiten wird üblicherweise ein absoluter cut-off Wert verwendet. Für die EEP-Experimente würde ich 200 ms empfehlen (Ausnahme Cueing: 100 ms).


```r
# zu schnelle Reaktionszeiten ausschliessen 
# wie viele RTs sind zu schnell?
data.ohneFehler.df %>% 
  filter(...) %>% 
  count()
# alle Trials mit zu schnellen Reaktionszeiten aus dem Datensatz entfernen
data.RT.df <- data.ohneFehler.df %>% 
  filter(...) 
```

Als oberer Grenze für Reaktionszeiten wird meist ein relativer Cut-off verwendet. Für EEP-Experimente empfehle ich M + 3 SD **pro Bedingung und VP**. Der Ausschluss zu langsamer Reaktionszeiten sollte pro Bedingung erfolgen, da sich die Reaktionszeiten zwischen den Bedingungen z.T. erheblich unterscheiden.

Überlegen Sie, mit welcher Formel sich "M + 3 SD" in R darstellen lässt.

<a name="TrialsNachFilter"></a>


In folgendem Chunk werden zu langsame und zu schnelle Trials gemeinsam ausgeschlossen und es werden die verbleibenden Trials pro Bedingung gezählt.


```r
# Auszählen
data.RT.df %>% 
  group_by(...) %>% 
  filter(rt < "Formel obere Grenze",
         rt > "Cutoff zu schnelle Reaktionszeiten") %>% 
  count()

# Filtern und neuen Datensatz erstellen
data.RT.df <- data.RT.df %>% 
  group_by(...) %>% 
  filter(rt < "Formel obere Grenze",
         rt > "Cutoff zu schnelle Reaktionszeiten")
```




\

<a name="Aufgaben2"></a>
  
## Aufgaben 

1. Daten [importieren](#Import)
2. [Datenstruktur](#Struktur) prüfen
3. [Übungstrials](#Uebungstrials) entfernen
    * ggf. auch andere Trials entfernen, die nicht in der Auswertung berücksichtigt werden sollen
4. [Vollständigkeit](#Vollstaendigkeit) der Daten prüfen
5. Analyse der [Antwortgenauigkeit](#Antwortgenauigkeit) (pro Bedingung): 
    * Summe richtiger Antworten
    * Anteil richtiger Antworten an allen Trials einer Bedingung
6. Reaktionszeitanalyse:
    1. Ausschluss von Trials, in denen die VP falsch reagiert hat
    2. [Verteilung der Reaktionszeiten](#visuelle Inspektion) anschauen 
    3. [Ausreißeranalyse](#Auschluss Extreme): Ausschlusskriterien definieren; Empfehlung: 
        - absoluter Cut-off für zu schnelle RTs (**200 ms**)
        - relativer Cut-off für zu langsame RTs (__mean + 3*sd__ pro Bedingung und VP)
        - Filtern des Datensatz: Ausschluss extremer RTs
    5. Wieviele Trials pro Bedingung hat die VP nach dem Filtern noch?
    6. Berechnen der mittleren Reaktionszeit und Streuungsmaß pro Bedingung
        - ähnliche Vorgehensweise wie Analyse der [Antwortgenauigkeit](#Antwortgenauigkeit)


<a href="https://ep.mafiasi.de/p/EEP_H_Session_Feedback" target="_blank">Feeback zur Session</a> Seminar H

<a href="https://ep.mafiasi.de/p/EEP_J_Session_Feedback" target="_blank">Feeback zur Session</a> Seminar J


\

# 3. Automatisierte Auswertung für viele Versuchspersonen

\

![](Grafiken/workflow2.png)
\
**Import**
Daten aller VPs in einen Datensatz

**Zusammenfassen:**
**pro VP**: mittlere Reaktionszeiten (Fehler, Antwortgenauigkeiten) getrennt nach Bedingungen

**Deskreptive Statistik:**
Statistische Kennzahlen (z.B. M, SD, Median, .. ) für alle AVs (Reaktionszeiten, Fehler, Antwortgenauigkeiten) getrennt nach Bedingungen


\

## Datenebene
\

![](Grafiken/datenebeneAlleVP.png)
\


1.Einlesen aller logfiles in eine Datentabelle (für jede neue VP kommen neue Zeilen dazu)

    * rbind()

    * for-Schleife
  
2. VP als zusätzlichen Faktor bei der Analyse betrachten

    * z.B. group_by(vp)

\

## For Loops

Warum: 
* für alle Versuchspersonen muss die gleiche Befehlsabfolge durchgeführt werden
Wie: 
* Befehlsabfolge in eine for-Schleife schreiben

**For loop**, formaler Aufbau:

```r
for (i in 1:3) {
  < befehl 1 >
    < befehl 2 >
    < … >
}
```

\

<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">

(i in 1:3) 

i: Laufvariable (wird in jedem Durchlauf durch den aktuellen logfile ersetzt)
1:3: Anzahl der Durchläufe (= Anzahl der logfiles)

Innerhalb der geschweiften Klammern stehen die Befehle, die in jedem Durchlauf (d.h. für jeden logfile) durchgeführt werden sollen


</div>


\

<a name="Import Alle"></a>

## Alle Daten importieren




```r
data.files <- list.files("Alle Daten/")
```
\


<a name="Rohdatensatz"></a>

### Gemeinsamen Rohdatensatz erstellen

In dem folgendem Chunk lesen wir alle logfiles über eine For-Schleife ein



```r
data.df <- data.frame()

for (file in data.files){
  data = read.csv(paste0("./Alle Daten/", file ), header=TRUE, fileEncoding = "UTF-8-BOM")
  data.df = rbind(data.df, data)
}
```
\
\

<div class = "red">
**FANCY**

Alternativ kann dies auch mit `lapply()` und `do.call`geschehen. `lapply()` wendet eine Funktion auf jedes Element einer Liste an.


```
lapply(X, FUN)
Arguments:
-X: Vector oder Liste von Objecten
-FUN: Funktion die auf alle Elemente von X angewendet wird
```` 
FUN kann dabei der name einer Standard-Funktion sein (z.B. mean) aber auch eine selbstdefinierte Funktion
wie im Beispiel unten:


```
function(x){
  read.csv(paste0("./Alle Daten/", x ), header=TRUE, fileEncoding = "UTF-8-BOM")
}
```` 
Diese Funktion gibt eine Liste mit Datensätzen für jede VP aus. 

`do.call` wandelt eine Liste in Argumente für eine Funktion um:


```
do.call(Funktion, Liste)
Arguments:
-Liste: Liste mit Argumente für Funktion
-Funktion: Funktion die mit den Argumente aus Liste ausgeführt werden soll
````
Der Ausdruck `do.call(rbind, data.list)` wendet also `rbind` auf alle Datensätze in `data.list` an.

\



```r
data.list <- lapply(data.files, function(x){
  read.csv(paste0("./Alle Daten/", x ), header=TRUE, fileEncoding = "UTF-8-BOM")
})

data.df = do.call(rbind, data.list)
```

</div>

\
\

<a name="Skripte Anpassen"></a>

## Datenanalyse pro VP

Eure Skripte müssen nun an den veränderten Datensatz angepasst werden

* Spalte __id__ als Gruppierungsfaktor in `group_by(..., id)` einfügen
* in Grafiken: `facets=id~`, `facets=id~Condition1`,`facets=Condition1~id`

\

```r
data.df %>% 
  filter(rt>200) %>% 
  mutate(id = factor(id),
         gender = recode_factor(gender, m = "männlich", w = "weiblich", d= "divers")) %>% 
  group_by(id, Condition1) %>% 	
  dplyr::summarise(sum.err = sum(corr),
            mean.rt	= mean(rt),
            sd.rt 	= sd(rt),
            n 	= dplyr::n())
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id"],"name":[1],"type":["fct"],"align":["left"]},{"label":["Condition1"],"name":[2],"type":["chr"],"align":["left"]},{"label":["sum.err"],"name":[3],"type":["int"],"align":["right"]},{"label":["mean.rt"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["sd.rt"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["n"],"name":[6],"type":["int"],"align":["right"]}],"data":[{"1":"1","2":"A","3":"135","4":"649.4554","5":"343.6409","6":"173"},{"1":"1","2":"B","3":"146","4":"748.7316","5":"367.4232","6":"180"},{"1":"2","2":"A","3":"141","4":"666.0236","5":"294.6300","6":"179"},{"1":"2","2":"B","3":"146","4":"657.3305","5":"343.5019","6":"180"},{"1":"3","2":"A","3":"141","4":"638.9420","5":"288.6782","6":"180"},{"1":"3","2":"B","3":"143","4":"718.9930","5":"292.5165","6":"179"},{"1":"4","2":"A","3":"131","4":"685.3809","5":"380.8665","6":"169"},{"1":"4","2":"B","3":"138","4":"732.1616","5":"287.4185","6":"178"},{"1":"5","2":"A","3":"143","4":"678.9666","5":"346.9748","6":"178"},{"1":"5","2":"B","3":"143","4":"721.7352","5":"277.7842","6":"178"},{"1":"6","2":"A","3":"139","4":"621.7211","5":"307.9730","6":"177"},{"1":"6","2":"B","3":"141","4":"760.8070","5":"307.4044","6":"180"},{"1":"7","2":"A","3":"143","4":"686.5217","5":"358.5238","6":"177"},{"1":"7","2":"B","3":"147","4":"804.4129","5":"377.7118","6":"178"},{"1":"8","2":"A","3":"139","4":"613.8849","5":"327.4795","6":"171"},{"1":"8","2":"B","3":"135","4":"796.8991","5":"309.3466","6":"180"},{"1":"9","2":"A","3":"149","4":"717.0293","5":"253.5455","6":"179"},{"1":"9","2":"B","3":"132","4":"778.6342","5":"385.5831","6":"170"},{"1":"10","2":"A","3":"138","4":"672.4782","5":"351.5231","6":"179"},{"1":"10","2":"B","3":"133","4":"719.1958","5":"435.4963","6":"180"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
\
Histogramme pro VP:



```r
qplot(x=Condition2, y=rt, data=data.df, geom=c("boxplot", "jitter"), binwidth=100, facets=id~Condition1) 
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-24-1.png" style="display: block; margin: auto;" />

```r
ggplot( data=data.df, aes(x= Condition2 , y=rt)) + geom_boxplot() + geom_jitter()+ facet_grid(id~Condition1)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-24-2.png" style="display: block; margin: auto;" />
\

Wie ihr seht werden Plots pro VP sehr schnell unübersichtlich wenn ihr facets verwendet. Ihr könnt euch in dem Chunk einen Filter setzen mit dem ihr euch flexibel einzelne VPs ansehen könnt. 
\



```r
VP = "10"
data.id = data.df %>% filter(id == VP)

ggplot( data=data.id, aes(x= Condition2 , y=rt)) + geom_boxplot() + geom_jitter()+ facet_grid(id~Condition1)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-25-1.png" style="display: block; margin: auto;" />

\


<div class = "red">

**FANCY** 

Alternativ könnt ihr auch eine Grafik pro VP mit dplyr und `%>%` erstellen. 


```r
plots <- data.df %>% 
         group_by(id) %>% 
         do( plots= ggplot( data=., aes(x= Condition2 , y=rt)) + geom_boxplot() + geom_jitter()+ facet_grid(~Condition1) + ggtitle(paste0("VP:", .$id))
)

print(plots$plots)
```





Wir erstellen hier einen Datensatz `Plots` mit zwei Spalten:

  * `id` enthält die VP-ID
  * `plots`enthält einen Plot pro id

\



Anschließend packen wir die Plots in Tabs. \
 
\#\#\#\# Plotten in Tabs \{.tabset\}\

Erzeugt eine Überschrift, wobei `{.tabset}` bedeutet, dass der folgende Abschnitt in Tabs organisiert ist.

`{r, echo=T,  results='asis'}

for(i in seq_along(plots[[1]])){ \

  cat("##### VP: ",plots[[1]][[i]] , "\n") \
  
  print(plots[[2]][[i]]) \
  
  cat("\n\n") \ 
  
}` \

`results = 'asis'` legt fest, dass der Output von diesem Chunk als R-Markdown-Text interpretiert werden soll. 

Anschließend erzeugen wir mit:

* `cat("##### VP: ",plots[[1]][[i]] , "\n") ` neue Überschriften für die Tabs
* `print(plots[[2]][[i]])` und geben den Plot aus

**Bemerkung:** An dem Beispiel wird deutlich, dass `tibbles` (tidiverse Version von `Data.frames()`) sehr unterschiedliche Objekte in einer Zelle speichern können, theoretisch sogar andere tibbles (das würde allerdings der Idee von [Tidy-Data](#tidy) widersprechen). 

Diese Variante funktioniert nur für HTML-Output und erfordert ein fortgeschrittenes Verständnis von Tabs in R-Markdown. Hier findet ihr weitere Informationen:
<https://bookdown.org/yihui/rmarkdown-cookbook/html-tabs.html>

</div>

#### Plotten in Tabs {.tabset}

##### VP:  1 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-1.png" style="display: block; margin: auto;" />

##### VP:  2 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-2.png" style="display: block; margin: auto;" />

##### VP:  3 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-3.png" style="display: block; margin: auto;" />

##### VP:  4 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-4.png" style="display: block; margin: auto;" />

##### VP:  5 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-5.png" style="display: block; margin: auto;" />

##### VP:  6 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-6.png" style="display: block; margin: auto;" />

##### VP:  7 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-7.png" style="display: block; margin: auto;" />

##### VP:  8 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-8.png" style="display: block; margin: auto;" />

##### VP:  9 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-9.png" style="display: block; margin: auto;" />

##### VP:  10 
<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-28-10.png" style="display: block; margin: auto;" />

\

#### {.unlisted}

\

<a name="BoxplotAlleVPs"></a>

## Boxplot alle VPs

Zuerst Daten bereinigen und aggregieren. **Dies ist nur ein Beispiel, es sind nicht alle Schritte zur Datenbereinigung realisiert**


```r
data.alle.vps <- data.df %>% 
  filter(rt>200) %>% 
  mutate(id = factor(id),
         gender = recode_factor(gender, m = "männlich", w = "weiblich", d= "divers")) %>% 
  group_by(id, Condition1, Condition2) %>% 	
  dplyr::summarise(mean.err = mean(corr),
            mean.rt	= mean(rt),
            sd.rt 	= sd(rt),
            n 	= dplyr::n())
```
\

**Boxplot Reaktionszeiten**


```r
ggplot( data=data.alle.vps, aes(x= Condition2 , y=mean.rt)) + geom_boxplot() + geom_jitter()+ facet_grid(~Condition1)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-30-1.png" style="display: block; margin: auto;" />

\

**Boxplot Antwortgenauigkeiten**


```r
ggplot( data=data.alle.vps, aes(x= Condition2 , y=mean.err)) + geom_boxplot() + geom_jitter()+ facet_grid(~Condition1)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-31-1.png" style="display: block; margin: auto;" />

**Boxplot Label**


```r
pd = position_jitter(0.25)

ggplot( data=data.alle.vps, aes(x= Condition2 , y=mean.rt, label= id)) + geom_boxplot() + geom_point(position=pd)+ facet_grid(~Condition1) + geom_text(position = pd, hjust =1.5)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-32-1.png" style="display: block; margin: auto;" />



<a name="VPsausschließen"></a>

## VPs ausschließen

VPs ausschließen die manuell selektiert wurden (**Kriterien dokumentieren**).


```r
data.alle.vps %>% filter(id != "VPID")
```


VPs ausschließen nach Reaktionszeiten, Fehlerhäufigkeiten... (**Kriterien dokumentieren**)




```r
vp.err<- data.alle.vps %>% 
  group_by(id) %>% 
  filter(rt > "Formel obere Grenze" |                     # wichtig: größer als obere Grenze 
         rt < "Cutoff zu schnelle Reaktionszeiten") %>%  # wichtig: kleiner als untere Grenze 
  select(id) %>%
  distinct() %>% 
  pull(id)

vp.err

data.alle.vps %>% filter(!(id %in% vp.err))
```




```
[1] 6  8  10
Levels: 1 2 3 4 5 6 7 8 9 10
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id"],"name":[1],"type":["fct"],"align":["left"]},{"label":["Condition1"],"name":[2],"type":["chr"],"align":["left"]},{"label":["Condition2"],"name":[3],"type":["chr"],"align":["left"]},{"label":["mean.err"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["mean.rt"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["sd.rt"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["n"],"name":[7],"type":["int"],"align":["right"]}],"data":[{"1":"1","2":"A","3":"C","4":"0.7547170","5":"500.3608","6":"312.0268","7":"53"},{"1":"1","2":"A","3":"D","4":"0.7666667","5":"834.6224","6":"322.2030","7":"60"},{"1":"1","2":"A","3":"E","4":"0.8166667","5":"595.9885","6":"311.2741","7":"60"},{"1":"1","2":"B","3":"C","4":"0.8166667","5":"652.4395","6":"441.0174","7":"60"},{"1":"1","2":"B","3":"D","4":"0.7666667","5":"794.4246","6":"342.7254","7":"60"},{"1":"1","2":"B","3":"E","4":"0.8500000","5":"799.3307","6":"288.8987","7":"60"},{"1":"2","2":"A","3":"C","4":"0.7288136","5":"575.3574","6":"250.2051","7":"59"},{"1":"2","2":"A","3":"D","4":"0.8666667","5":"710.4263","6":"304.7268","7":"60"},{"1":"2","2":"A","3":"E","4":"0.7666667","5":"710.7760","6":"308.5933","7":"60"},{"1":"2","2":"B","3":"C","4":"0.8333333","5":"568.0818","6":"411.4947","7":"60"},{"1":"2","2":"B","3":"D","4":"0.7666667","5":"608.7642","6":"217.7610","7":"60"},{"1":"2","2":"B","3":"E","4":"0.8333333","5":"795.1454","6":"333.7946","7":"60"},{"1":"3","2":"A","3":"C","4":"0.7666667","5":"670.8796","6":"241.2230","7":"60"},{"1":"3","2":"A","3":"D","4":"0.8000000","5":"613.6969","6":"286.3986","7":"60"},{"1":"3","2":"A","3":"E","4":"0.7833333","5":"632.2497","6":"332.9963","7":"60"},{"1":"3","2":"B","3":"C","4":"0.7833333","5":"662.7631","6":"377.0951","7":"60"},{"1":"3","2":"B","3":"D","4":"0.7666667","5":"742.1426","6":"188.3737","7":"60"},{"1":"3","2":"B","3":"E","4":"0.8474576","5":"752.6338","6":"277.2608","7":"59"},{"1":"4","2":"A","3":"C","4":"0.7346939","5":"577.8652","6":"499.8262","7":"49"},{"1":"4","2":"A","3":"D","4":"0.7666667","5":"662.2453","6":"292.4901","7":"60"},{"1":"4","2":"A","3":"E","4":"0.8166667","5":"796.3209","6":"318.7321","7":"60"},{"1":"4","2":"B","3":"C","4":"0.8103448","5":"540.0484","6":"248.6678","7":"58"},{"1":"4","2":"B","3":"D","4":"0.7500000","5":"814.0580","6":"262.9565","7":"60"},{"1":"4","2":"B","3":"E","4":"0.7666667","5":"835.9745","6":"254.7157","7":"60"},{"1":"5","2":"A","3":"C","4":"0.8103448","5":"572.6127","6":"430.2323","7":"58"},{"1":"5","2":"A","3":"D","4":"0.8000000","5":"701.1330","6":"300.3084","7":"60"},{"1":"5","2":"A","3":"E","4":"0.8000000","5":"759.6091","6":"271.9037","7":"60"},{"1":"5","2":"B","3":"C","4":"0.7241379","5":"614.1840","6":"310.2923","7":"58"},{"1":"5","2":"B","3":"D","4":"0.8666667","5":"767.0994","6":"206.1368","7":"60"},{"1":"5","2":"B","3":"E","4":"0.8166667","5":"780.3370","6":"281.1154","7":"60"},{"1":"7","2":"A","3":"C","4":"0.7894737","5":"574.2439","6":"361.4164","7":"57"},{"1":"7","2":"A","3":"D","4":"0.8000000","5":"715.8120","6":"454.5328","7":"60"},{"1":"7","2":"A","3":"E","4":"0.8333333","5":"763.8951","6":"183.6291","7":"60"},{"1":"7","2":"B","3":"C","4":"0.8103448","5":"635.6643","6":"469.9523","7":"58"},{"1":"7","2":"B","3":"D","4":"0.8000000","5":"858.8974","6":"250.1664","7":"60"},{"1":"7","2":"B","3":"E","4":"0.8666667","5":"913.0520","6":"330.2001","7":"60"},{"1":"9","2":"A","3":"C","4":"0.8135593","5":"611.7594","6":"215.5670","7":"59"},{"1":"9","2":"A","3":"D","4":"0.8666667","5":"737.3502","6":"287.3699","7":"60"},{"1":"9","2":"A","3":"E","4":"0.8166667","5":"800.2239","6":"217.1225","7":"60"},{"1":"9","2":"B","3":"C","4":"0.8400000","5":"553.9869","6":"406.2912","7":"50"},{"1":"9","2":"B","3":"D","4":"0.8500000","5":"822.6951","6":"350.2326","7":"60"},{"1":"9","2":"B","3":"E","4":"0.6500000","5":"921.7793","6":"317.0591","7":"60"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>



## Aufgaben

1. Rohdatensatz erstellen 
    * enthält logfiles aller VPs
2. Skripte anpassen aus 2
    * [Schritte wie in 2](#Aufgaben2) für alle VPs in Rohdatensatz
3. VPs mit auffälligen Antwortmuster finden
    * VPs mit auffällig vielen Fehlern [(siehe Antwortgenauigkeit)](#Antwortgenauigkeit)
    * VPs mit auffällig [langsamen (oder schnellen) Reaktionszeiten](#BoxplotAlleVPs)
    * VP mit geringen [Anzahl an gültigen Trials](#TrialsNachFilter)
    *…
4. Ausschlusskriterien definieren (gut begründen)
5. [VPs ausschließen](#VPsausschließen)
6. aggregierten Datensatz erstellen  [(Infos zu group_by und summarise)](#aggregieren)
    * enthält zusammengefasste Daten pro VP und UV-Stufe
        * z.B. Mittelwert, SD der AV  
    * zur Berechnung der deskriptiven Gruppenstatistik verwenden

\

<a href="https://ep.mafiasi.de/p/EEP_H_Session_Feedback" target="_blank">Feeback zur Session</a> Seminar H

<a href="https://ep.mafiasi.de/p/EEP_J_Session_Feedback" target="_blank">Feeback zur Session</a> Seminar J

# 4. Inferenzstatistik

\

![](Grafiken/workflow3.png)

\


## Prinzip der Anova

![](Grafiken/ANOVA.png)

\

## Anova mit Messwiederholung 

![](Grafiken/rmANOVA.png)

\

## Mehrfaktorielle Anova

![](Grafiken/ANOVA2F.png)


\

<a name="HypothesenAnova"></a>

## Hypothesen der Anova

![](Grafiken/Hypothesen.png)

\

## Annahmen der Anova

* AV: mindestens intervallskaliert

* UV: kategorial (nominalskaliert)

* Normalverteilung der Fehler (Residuen) innerhalb jeder Faktorstufe
\

**within-subject ANOVA:**

* Abhängigkeit der Messungen

* Sphärizität bei mehr als zwei Stufen des within-subject Faktors (= Gleichheit der Varianzen der paarweisen Differenzen zwischen den Messwiederholungen)
\

**between-subject ANOVA:**

* Unabhängigkeit der Messungen

* Varianzhomogenität
\ 

## Datenebene

![](Grafiken/datenebeneInferenz.png)
\

<a name="ezAnova"></a>


## ezAnova

Mit ezAnova lassen sich die gängigsten ANOVA-Designs komfortabel auswerten.

Die Syntax des Befehls sieht folgendermaßen aus:

\

```
myanova <- ezANOVA(daten
, dv = AV  **Abhängige Variable**
, wid = vp **Variable die VP-Nummer enthält**
, within = .(A,B) **Within-subject Faktoren**
, between = .(C,D) **Between-subject Faktoren**
)
```

\

Eine einfache Auswertung würde für das Beispiel Experiment mit 2 faktoriellem  Within-Design also so aussehen:

\



```r
library(ez)

data.anova <- data.df  %>% filter(corr ==1) %>% group_by(id, Condition1 , Condition2) %>% dplyr::summarise(rt.mean = mean(rt, na.rm = T))

ezDesign(data= data.anova, x = Condition1, y = Condition2)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-36-1.png" style="display: block; margin: auto;" />

```r
myanova <- ezANOVA(data.anova
, dv = rt.mean 
, wid = id 
, within = .(Condition1,Condition2) 
)

myanova
```

```
$ANOVA
                 Effect DFn DFd         F            p p<.05        ges
2            Condition1   1   9 16.190287 0.0030012247     * 0.24754152
3            Condition2   2  18 15.464552 0.0001234091     * 0.49386981
4 Condition1:Condition2   2  18  3.940194 0.0380816259     * 0.06925073

$`Mauchly's Test for Sphericity`
                 Effect         W         p p<.05
3            Condition2 0.6801939 0.2140577      
4 Condition1:Condition2 0.7279830 0.2808568      

$`Sphericity Corrections`
                 Effect       GGe        p[GG] p[GG]<.05       HFe        p[HF]
3            Condition2 0.7576871 0.0006122429         * 0.8787173 0.0002744808
4 Condition1:Condition2 0.7861530 0.0518397618           0.9237767 0.0424924293
  p[HF]<.05
3         *
4         *
```

\


### Interaction mit ezPlot

Dies ist die einfachste Version einen Interaktionsplot zu erstellen. Leider sind hier die Fehlerbalken in within-Designs nicht korrekt

\

```r
#?ezPlot

ezPlot(data.anova
, dv = rt.mean 
, wid = id 
, x= .(Condition1)
, within = .(Condition1,Condition2) 
, split =.(Condition2)
, x_lab = "Condition1"
  	, y_lab = "Reaktionszeiten (ms)"

)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-37-1.png" style="display: block; margin: auto;" />

\
Der Output beinhaltet drei Tabellen:

1. Die Zusammenfassung der Ergebnisse der Anova

2. Mauchly's Test auf Spherizität

3. Spherizität-Korrekturen nach Greenhouse-Geisser und Huynh-Feldt 

Schaut euch die Bedeutung der Spalten mit `?ezANOVA` einmal an.

\



```
$ANOVA
                 Effect DFn DFd         F            p p<.05        ges
2            Condition1   1   9 16.190287 0.0030012247     * 0.24754152
3            Condition2   2  18 15.464552 0.0001234091     * 0.49386981
4 Condition1:Condition2   2  18  3.940194 0.0380816259     * 0.06925073

$`Mauchly's Test for Sphericity`
                 Effect         W         p p<.05
3            Condition2 0.6801939 0.2140577      
4 Condition1:Condition2 0.7279830 0.2808568      

$`Sphericity Corrections`
                 Effect       GGe        p[GG] p[GG]<.05       HFe        p[HF]
3            Condition2 0.7576871 0.0006122429         * 0.8787173 0.0002744808
4 Condition1:Condition2 0.7861530 0.0518397618           0.9237767 0.0424924293
  p[HF]<.05
3         *
4         *
```
\

Zuerst müssen wir kontrollieren, ob die Voraussetzungen für die Anova erfüllt sind mit dem `Mauchly's Test for Sphericity`.

![](Grafiken/Mauchly.png)

\

In diesem Beispiel wird der Test auf Spherizität signifikant für die Effekte **B** und **A:B**, für **A** gibt es keine Werte, da **A** nur zwei Faktorstufen hat.

\
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["Effect"],"name":[1],"type":["chr"],"align":["left"]},{"label":["W"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["p"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["p<.05"],"name":[4],"type":["chr"],"align":["left"]}],"data":[{"1":"Condition2","2":"0.6801939","3":"0.2140577","4":"","_rn_":"3"},{"1":"Condition1:Condition2","2":"0.7279830","3":"0.2808568","4":"","_rn_":"4"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

\

Das heißt es müssen die korrigierten Werte betrachtet werden für **B** und **A:B** ( `p[GG]` für Greenhouse-Geisser oder `p[HF]` für Huynh-Feldt . 

\
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["Effect"],"name":[1],"type":["chr"],"align":["left"]},{"label":["GGe"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["p[GG]"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["p[GG]<.05"],"name":[4],"type":["chr"],"align":["left"]},{"label":["HFe"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["p[HF]"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["p[HF]<.05"],"name":[7],"type":["chr"],"align":["left"]}],"data":[{"1":"Condition2","2":"0.7576871","3":"0.0006122429","4":"*","5":"0.8787173","6":"0.0002744808","7":"*","_rn_":"3"},{"1":"Condition1:Condition2","2":"0.7861530","3":"0.0518397618","4":"","5":"0.9237767","6":"0.0424924293","7":"*","_rn_":"4"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

\

An den **p-Werten** (Spalten `p <.05`,  `p[GG] <.05`) erkennen wir, dass **A** und **B** signifikant sind.

Sehr kleine Werte werden in **scientific notation** wiedergegebn: Xe-05 = X * 0.00001 (Komma 5 Stellen nach links verschieben)


**Effektstärke** `ges`: generalized eta squared ($\eta ^2 _G$)

* Maß für die Effektstärke 

* wie viel Varianz an der Gesamtvarianz wird durch diesen Effekt aufgeklärt?

* $\eta ^2 _G$ ist maximal 1 

\
**Ergebnisnotation**: $F$(6, 264) = 19.71, $p$ < .001, $\eta ^2$  = .05
  
\

<a name="Post-Hoc-Tests"></a>

## Post-Hoc Tests 

* ANOVA: testet bei Haupteffekten und Interaktionen ob sich mindestens zwei Faktorstufen oder Bedingungen signifikant voneinander unterscheiden

* Ist die Anzahl der Faktorstufen > 2, vergleicht man anschließend mit paarweisen t-Tests, welche der Bedingungen sich voneinander unterscheiden

* Problem der Alpha-Fehler Kumulierung

\

`pairwise.t.test()`
* paarweise Vergleiche aller Faktorstufen

* Korrektur für multiples Testen (z.B. Bonferroni, FDR, Holm etc.)

* Datensatz muss aggregiert sein (keine einzelnen Trials, enthält für jede VP den Mittelwert jeder Bedingung)

\



### pairwise.t.test()

pairwise.t.test(daten$rt, daten$Faktor1, paired=T)

`paired = T` : within-subject factors

Zwei Faktoren:

`pairwise.t.test(daten$rt, interaction(daten$Faktor1,daten$Faktor2), paired=T)`

p.adjust: Auswahl der Korrekturmethode (z.B. “none”, “holm”, “bonferroni”)

`pairwise.t.test(daten$rt, daten$Faktor1, paired=T, p.adj = „bonf“)`

\


```r
pttest <- pairwise.t.test(data.anova$rt.mean, interaction(data.anova$Condition1, data.anova$Condition2), paired= T , p.adj = "bonf")

pttest
```

```

	Pairwise comparisons using paired t tests 

data:  data.anova$rt.mean and interaction(data.anova$Condition1, data.anova$Condition2) 

    A.C     B.C     A.D     B.D     A.E    
B.C 1.00000 -       -       -       -      
A.D 0.90581 1.00000 -       -       -      
B.D 0.01825 0.14187 0.49242 -       -      
A.E 0.10966 1.00000 1.00000 1.00000 -      
B.E 0.00048 0.00121 0.02796 0.24529 0.01492

P value adjustment method: bonferroni 
```

\
**Wichtig**: Einige P-Werte sind in diesem Beispiel 1. Das liegt an der Bonferroni-Methode. Wenn wir $n$ Tests durchführen liefert diese $p*n$ als neuen P-Wert. Dieser Wert kann dann größer als 1 werden (und wird von **R** dann als 1 gelistet). 


\
pairwise.t.test() gibt nur die p-Werte, aber keine t-Werte aus

1. p-Wert: pairwise.t.test() mit Korrektur für multiple Vergleiche ausführen

2. `Freiheitsgrade df` (degrees of freedom): Anzahl VPs minus 1

3. t-Wert: 
  
    1. pairwise.t.test() mit p.adjust=„none“ ausführen, pWert ablesen

    2. t-Wert: aus t-Verteilung ablesen mit:
    
		   * `qt(0.5*pWert, df)` negativer t-Wert
		   
		   * oder `qt(1-0.5*pWert, df)`   positiver t-Wert


**Bemerkung:** Ihr könnt obiges Vorgehen manuell für die P-Werte von Interesse durchführen. In der Regel sind es nur einige Vergleiche, die wirklich interessieren.

\

<div class = "red">

**FANCY**

Wir können es aber auch für alle P-Werte automatisch machen.

`pairwise.t.test()` speichert die p-Werte in einer Matrix. 

Wir können eine Funktion definieren `lookupT`, der wir den P-Wert(`p`), die Freiheitsgrade (`df`) und eine Zahl übergeben (`sign`), die angibt, ob wir den positiven oder negative t-Wert berechnen wollen.

Mit `apply` können wir `lookupT`auf jeden p-Wert in der Output-Matrix von `pairwise.t.test()` anwenden.


```r
pttest <- pairwise.t.test(data.anova$rt.mean, interaction(data.anova$Condition1, data.anova$Condition2), paired= T , p.adj = "none")

lookupT <- function(p, df, sign=1){
  if (sign < 0){
    return(qt(0.5*p, df))
  } else {
    return(qt(1 - 0.5*p, df))
  }
}

apply(pttest$p.value, c(1,2), function(x){lookupT(x, 10 -1)})
```

```
         A.C      B.C       A.D      B.D      A.E
B.C 1.388331       NA        NA       NA       NA
A.D 2.146417 1.189604        NA       NA       NA
B.D 4.641562 3.284718 2.5188916       NA       NA
A.E 3.446875 1.866459 0.9314681 1.981265       NA
B.E 7.642385 6.783083 4.3448493 2.945029 4.784982
```


</div>


\

## Aufgaben


* Wie lassen sich eure Hypothesen in statistische Hypothesen im Anova Design umsetzen?
    * Welche Haupt- und Interaktionseffekte erwartet ihr? [link](#HypothesenAnova)
    * Welche Post-hoc Tests sind sinnvoll? [link](#Post-Hoc-Tests)            
* Wertet eure Daten mit `ezAnova()` und `pairwise.t.test()` aus.

\

<a href="https://ep.mafiasi.de/p/EEP_H_Session_Feedback" target="_blank">Feeback zur Session</a> Seminar H

<a href="https://ep.mafiasi.de/p/EEP_J_Session_Feedback" target="_blank">Feeback zur Session</a> Seminar J


# 5. Grafiken
\

## Allgemeine Hinweise

### Beispiele

**Negativbeispiel 1**

![](Grafiken/Negativbeispiel1.png)
\
\
\
\
\
\

**Negativbeispiel 2**

![](Grafiken/Negativbeispiel2.png)
\
\
\
\
\
\

**Besseres Beispiel**

![](Grafiken/Positivbeispiel1.png)
\
\

### Häufige Schwächen von Grafiken

* Mangelnde / unverständliche Beschriftung
    * Keine Achsenbeschriftungen
    * Einheiten fehlen (z.B. ms bei Reaktionszeiten)
    * Was zeigen Fehlerbalken?
* wenig informativ
* Unübersichtlich
* unnötiger Einsatz von Farbe, 3D Effekten, etc.
* zu geringe Auflösung („pixelig“)

\
\

### APA Richtlinien

The standards for good figures are simplicity, clarity, continuity and (of course ) information value. 

*A good figure:

* augments rather than duplicates the text ,
* conveys only essential facts, 
* omits visually distracting details,
* is easy to read -  its elements (type, lines, labels, symbols, etc.) are large enough to be read with   ease,
* is easy  to understand [...], 
* [...] is carefully planned and prepared .

*APA Manual 6th Edition, pp. 152*

\
\

**Auf folgendes achten:**

* scharfe und gleichmäßige Linien
* leicht zu unterscheidende Symbole
* lesbare Schrift: einfache Schriftart (ohne Serifen), Schriftgröße
* Messeinheiten angeben
* klare Beschriftung der Achsen
* alle Bestandteile der Abbildung sind beschriftet und erklärt, so dass die Abbildung selbsterklärend     ist
* Größe sollte Verwendungszweck angepasst sein

\
\

## Welche Grafik?

![](Grafiken/Beispiele.png)
\
\
\
\
\
\

**Minimaler Informationsgehalt**

Mittelwert + Streuungsmaß:
* Standardabweichung
* Standard Error of the Mean   (s /     )
* 95% Confidence Intervals

Alternative: Datenverteilung	
* Boxplot
* Violinplot
... 

<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">

**Bemerkung:** Es wird mittlerweile häufig verlangt, dass Grafiken nicht nur mittere Trends darstellen, sondern auch ersichtlich machen, ob die individuellen Daten durch den mittleren Trend gut repräsentiert sind. Dazu eignen sich z.B. Violinplots oder Boxplots mit individuellen Datenpunkten. 

</div>

\

## Confidence Intervalle Within-Designs



```r
SEwithinRT <- Rmisc::summarySEwithin(data.anova, measure = "rt.mean", withinvars = c("Condition1", "Condition2"), idvar="id", conf.interval = .95)

SEwithinRT
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["Condition1"],"name":[1],"type":["fct"],"align":["left"]},{"label":["Condition2"],"name":[2],"type":["fct"],"align":["left"]},{"label":["N"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["rt.mean"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["sd"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["ci"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"A","2":"C","3":"10","4":"577.0334","5":"82.11160","6":"25.96597","7":"58.73910"},{"1":"A","2":"D","3":"10","4":"673.6017","5":"94.66897","6":"29.93696","7":"67.72210"},{"1":"A","2":"E","3":"10","4":"701.4901","5":"71.33541","6":"22.55824","7":"51.03028"},{"1":"B","2":"C","3":"10","4":"614.6981","5":"99.02344","6":"31.31396","7":"70.83710"},{"1":"B","2":"D","3":"10","4":"752.2943","5":"68.67634","6":"21.71737","7":"49.12810"},{"1":"B","2":"E","3":"10","4":"836.2896","5":"62.57593","6":"19.78825","7":"44.76412"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

\

<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">

**Achtung:** 
* Rmisc-Funktionen stehen in Konflikt mit dplyr-Funktionen (z.B. rename(), summarise()) 
* deswegen Rmisc nicht über library(Rmisc) in den Workspace laden, sondern nur für die genutzte Funktion (siehe oben im Beispiel)


</div>
\
\

## ggplot

\

Die Idee hinter `ggplot` ist auf den ersten Blick schwer zu greifen. Im Gegensatz zu Standard Plot-Bibliotheken arbeitet ggplot mit Dataframes anstatt Vektoren oder Matrizen. In der Regel arbeitet ggplot sehr gut mit [Tidy-Data](#tidy) zusammen. 

Die wichtigsten Befehle und Grundlegende Konzepte findet ihr im <a href="https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf" target="_blank">Cheat Sheet</a>. Eine gute Dokumentation findet ihr auch <a href="http://www.cookbook-r.com/Graphs/" target="_blank">hier</a>

Grundsätzlich ist die Idee hinter ggplot ähnlich der von dplyr. Ihr legt eine Grundstruktur fest und könnt dann Schrittweise Komponenten hinzufügen. Der Aufbau von Grafiken folgt einer bestimmten Grammati. Mit Hilfe eines Datensatzes, einer Reihe von `geoms` und einer Datenstruktur (`aesthetics`)  lassen sich nahezu alle Grafiken realisieren. Datensatz und Koordinatensystem legen die Grundstruktur fest und mit `geoms` legt ihr fest, wie die Daten visualiert werden (Punkte, Linien, Boxplot ...).

`geoms` arbeiten layerbasiert. Das heißt ihr könnt `geoms` in mehreren Lagen übereinander zeichnen z.B.: 1. individuelle Datenpunkte
2. Mittelwerte und Streuungsmaße
3. Labels, kommentare usw.
\

### Datensatz und Struktur festlegen

**Wichtig:** wir verwenden tidy data, also jede VP*Bedingung in einer Zeile. Zu den wichtigsten aesthetics:

```
x=Condition1       **Variable für X-Koordinaten im Plot**
y=rt.mean          **Variable für Y-Koordinaten**
color = Condition2 **Unterschiedliche Farben (der Ränder von `geoms`) für Unterschiedliche Ausprägungen von Condition2**
group= Condition2  **Nach welchen Variablen sollen die Daten gruppiert werden (ähnlich dplyr)**
fill = Condition2  **wie color nur bezogen auf die Füllfarbe der `geoms`
```


```r
plot <- ggplot2::ggplot(data = data.anova, ##Datensatz festlegen
                        aes(x = Condition1,           ##Datenstruktur (“aesthetics”) definieren
                            y = rt.mean,))

print(plot)                               ##Plotten
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-44-1.png" style="display: block; margin: auto;" />

\

### Geom-Layers hinzufügen

Damit ist die Grunddatenstruktur festgelegt, aber der Plot ist erstmal leer, denn wir haben keine `geoms` zur Visualisierung festgelegt. Da wir den Plot in `plot` gespeichert haben, können wir ihn und weiter modifizieren und ein Layer hinzufügen.



```r
plot <- plot + geom_point()
print(plot)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-45-1.png" style="display: block; margin: auto;" />


Wenn wir kontrollieren wollen, ob alle VPs dem globalen Trend folgen (B>A) können wir Linien hinzufügen pro VP. Dafür müssen wir die Daten aber gruppieren. Das können wir in den globalen aesthetics machen (`ggplot(data= , aes())`) oder für einzelne Layers festlegen, wie im Beispiel unten:


```r
plot + geom_line(aes(group=id))
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-46-1.png" style="display: block; margin: auto;" />

#### Liste von `geoms`

geom_boxplot()
geom_violin()
geom_bar()
geom_histogram()
geom_point()
geom_line()
geom_errorbar()
geom_abline()
geom_hline()
geom_vline()

Eine erschöpfende Liste findet ihr <a href="https://ggplot2.tidyverse.org/reference/index.html" target="_blank">hier</a>


### Summary Statistics hinzufügen

Das sieht unerwartet aus. Der Grund ist, dass mehrere Werte pro VP und Condition1 gibt, nämlich einen für jede Ausprägung von Condition2. Das heißt wir hatten auch zu viele Punkte im Plot oben. Wir können die Daten direkt in ggplot zusammenfassen mit `stat_summary()`. Diese Funktion kann Daten ähnlich zu `dplyr::summarise()` aggregieren. Wir übergeben eine Funktion zum aggregieren durch `fun=mean` wenn wir z.B. den Mittelwert verwenden wollen.


```r
plot <- ggplot2::ggplot(data = data.anova, ##Datensatz festlegen
                        aes(x = Condition1,           ##Datenstruktur (“aesthetics”) definieren
                            y = rt.mean, ))


plot <-
  plot + stat_summary(fun = mean,
                      mapping = aes(group = id),
                      geom = c("point")) +
  stat_summary(fun = mean,
               mapping = aes(group = id),
               geom = c("line"))
plot
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-47-1.png" style="display: block; margin: auto;" />

Analog können wir den Mittelwert hinzufügen. Wir können die Farbe über `color="farbe"` oder die Größe über `size=xx` verändern und den Mittelwert so abheben.


```r
plot <-
  plot + stat_summary(
    fun = mean,
    mapping = aes(x = Condition1, y = rt.mean),
    geom = c("point"),
    color = "red",
    size = 2
  ) + stat_summary(
    fun = mean,
    mapping = aes(x = Condition1, y = rt.mean, group = 1),
    geom = c("line"),
    color = "red",
    size = 1
  )

plot
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-48-1.png" style="display: block; margin: auto;" />


**Wichtig:** `geoms` lassen sich anpassen über Argumente wie:
*size          Größe von Punkte, Dicke von Linien
*color         Farbe der Konture
*fill          Füllfarbe
*alpha         Transparenz
*linetype     Linienart
*shape         Punktart

Wenn ihr das Argument an ein Layer übergebt, gilt es für das gesamte Layer wie im obigen Beispiel.
Übergebt ihr es jedoch als aesthic (z.B. `color = id`) weißt ggplot für jede Ausprägung der Variable eine andere Farbe, Linienart usw. usf. zu. In folgendem Beispiel weisen wir jeder VP eine Farbe zu.


```r
plot <-
  plot + stat_summary(
    fun = mean,
    mapping = aes(
      x = Condition1,
      y = rt.mean,
      group = id,
      color = id
    ),
    geom = c("point"),
    size = 2
  ) +
  stat_summary(
    fun = mean,
    mapping = aes(
      x = Condition1,
      y = rt.mean,
      group = id,
      color = id
    ),
    geom = c("line"),
    size = 1
  )

plot
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-49-1.png" style="display: block; margin: auto;" />



### Interaction-Plot


Das solltet ihr später natürlich nicht machen, ein sinnvolleres Beispiel ist, dass wir zusätzlich Condition2 plotten wollen, also einen Interaction-Plot. Dafür gruppieren wir nach **inteaction(id,Condition2)**, denn wir wollen auch die individuellen Daten sehen


```r
Baseplot <- ggplot2::ggplot(data= data.anova, ##Datensatz festlegen
                aes(
                  x=Condition1,           ##Datenstruktur (“aesthetics”) definieren
                  y=rt.mean,
                  group = Condition2,
                  color = Condition2,
                  shape = Condition2,
                  linetype = Condition2
                )) 

Interaction <- Baseplot + geom_point(alpha= 0.5) +
             geom_line(mapping = aes(group = interaction(id, Condition2) ), alpha= 0.5)
```

Wir fügen wieder Mittelwerte hinzu.
 

```r
Interaction <- Interaction + stat_summary(fun=mean, 
                                          mapping= aes(x=Condition1,
                                                       y=rt.mean,
                                                       group =Condition2), 
                                          geom=c("point") 
                                          ) + 
               stat_summary(fun=mean, 
                            mapping= aes(x=Condition1,
                                         y=rt.mean, 
                                         group=Condition2), 
                            geom=c("line"),  
                            size=1.2)

Interaction
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-51-1.png" style="display: block; margin: auto;" />


### Interaction mit ezPlot

Dies ist die einfachste Version einen Interaktionsplot zu erstellen. Leider sind hier die Fehlerbalken in within-Designs nicht korrekt

\

```r
#?ezPlot

ezPlot(data.anova
, dv = rt.mean 
, wid = id 
, x= .(Condition1)
, within = .(Condition1,Condition2) 
, split =.(Condition2)
, x_lab = "Condition1"
  	, y_lab = "Reaktionszeiten (ms)"

)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-52-1.png" style="display: block; margin: auto;" />



<div class = "red">

**FANCY**



```r
library(lemon)

pd <- position_jitter(0.2, seed=1)

Baseplot <- ggplot2::ggplot(data= data.anova, ##Datensatz festlegen
                aes(
                  x=Condition1,           ##Datenstruktur (“aesthetics”) definieren
                  y=rt.mean,
                  group = Condition2,
                  color = Condition2,
                  shape = Condition2,
                  linetype = Condition2
                )) 

Interaction <- Baseplot + 
             geom_pointpath(mapping = aes(group = interaction(id, Condition2) ), position = pd, alpha= 0.5) + stat_summary(fun=mean, 
                                          mapping= aes(x=Condition1,
                                                       y=rt.mean,
                                                       group =Condition2), 
                                          geom=c("point") 
                                          ) + 
               stat_summary(fun=mean, 
                            mapping= aes(x=Condition1,
                                         y=rt.mean, 
                                         group=Condition2), 
                            geom=c("line"),  
                            size=1.2)

Interaction
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-53-1.png" style="display: block; margin: auto;" />

</div>


### Facets

Wenn individuelle Daten in einem Interaction-Plot dargestellt werden, kann es schnell unübersichtlich werden. Eine Alternative ist die Bedingungen einer Variable in unterschiedlichen Plots darzustellen. Dazu eignet sich die Funktion `facet_grid`, die wir oben schon verwendet haben. Die Funktion erlaubt mehrere Grafiken in Spalten und Reihen zu organisiern. Dafür müsst ihr angeben, welche Variablen auf die Reihen bzw. Spalten aufgeteilt werden soll. Die Variablen müssen mit `vars()` umschlossen sein.


```r
Interaction + facet_grid(cols= vars(Condition2))
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-54-1.png" style="display: block; margin: auto;" />


### Fehlerbalken
Im Within-Design müssen wir die Daten erst zusammenfassen mit `Rmisc::summarySEwithin`. Den neuen Datensatz können wir an `geom_errorbar()` übergeben. Wir müssen dann die aesthetics `ymin` und `ymax` angeben, welche den Start- und Endpunkt der Balken definieren. 



```r
ErrorData <- Rmisc::summarySEwithin(data.anova, measure = "rt.mean", withinvars = c("Condition1", "Condition2"), idvar="id", conf.interval = .95)


Interaction  + geom_errorbar(data=ErrorData,
                              mapping = aes(x= Condition1, 
                                            ymin = rt.mean - se, 
                                            ymax=rt.mean + se ,
                                            color = Condition2,
                                            group= Condition2 ),
                              size = 1.2, 
                              width=.2, 
                              position=position_dodge(0.1), 
                              show.legend = F,
                              )
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-55-1.png" style="display: block; margin: auto;" />

Das ist zugegeben nicht ganz `tidy`, da wir einen neuen Datensatz erstellen müssen. Das liegt daran, dass wir im Within-Design nicht auf gruppenbasis die *Standard Error of the Mean* berechnen können, sondern immer den kompletten Datensatz brauchen.

Im Between-Design ist das nicht so und wir können `tidy`arbeiten. Wir definieren eine Hilfsfunktion, die den *Standard Error of the Mean* berechnet `sem <- function(x) sd(x)/sqrt(length(x))` und verwenden diese in `stat_summary`. Im Unterschied zu `geom_errorbar`, wo wir die Werte übergeben haben, müssen wir hier eine Funktion übergeben, die die Werte berechnet `function(i) mean(i) + sem(i)` für die obere Grenze und `function(i) mean(i) - sem(i)` für die untere Grenze.


```r
sem <- function(x) sd(x)/sqrt(length(x))


Interaction  + 
               stat_summary(fun.max=function(i) mean(i) + sem(i) ,
                            fun.min=function(i) mean(i) - sem(i), 
                            , mapping= aes(x=Condition1,y=rt.mean, group=Condition2)
                            , geom=c("errorbar"),  size=1.2, width = 0.15)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-56-1.png" style="display: block; margin: auto;" />


### Boxplots

Wenn wir die Darstellungsart unseres Plots ändern wollen, wird der Vorteil davon `tidy` zu arbeiten deutlich. Denn im Grunde müssen wir kaum etwas am Code ändern  als die `geoms` und gruppieren nach `interaction(Condition1, Condition2)` um eine Box pro Bedingung zu bekommen.



```r
Boxplot <-
  Baseplot + geom_boxplot(aes(group = interaction(Condition1, Condition2)) ,
                          position = position_dodge(0.7),         ## Boxplots Condition1 sollen nebeneinander stehen für ein Level von Condition1
                          width = 0.5) 
```


Auch den Mittelwert können wir wieder analog hinzufügen.


```r
Boxplot + stat_summary(fun=mean, mapping= aes(x=Condition1,y=rt.mean, 
                                          group =Condition2), geom=c("point") ,
                       position=position_dodge(0.7) ## Stellt sicher, dass die Mittelwerte in den Boxen zentriert sind
                                          )
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-58-1.png" style="display: block; margin: auto;" />



### Balkendiagramme

Für Barplots sind die Anpassung noch einfacher, wir können direkt die Mittelwerte hinzufügen, und ändern nur die Füllungsfarbe.


```r
Balken <-
  Baseplot + stat_summary(fun=mean, mapping= aes(x=Condition1,y=rt.mean, 
                                          group =Condition2,  fill= Condition2), linetype=1, geom=c("bar") ,
                       position=position_dodge(0.7) ## Stellt sicher, dass die Mittelwerte in den Boxen zentriert sind
                                          )
```

Fehlerbalken werden wieder analog eingefügt. Wir ändern nur color und linetype.


```r
Balken <- Balken + geom_errorbar(data=ErrorData,
                              mapping = aes(x= Condition1, 
                                            ymin = rt.mean - se, 
                                            ymax=rt.mean + se ,
                                            group= Condition2 ),
                              color = "black",
                              linetype = 1,
                              size = 1.2, 
                              width=.2, 
                              position=position_dodge(0.7), 
                              show.legend = F,
                              )

Balken
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-60-1.png" style="display: block; margin: auto;" />

### Grafiken Formatiern
#### Achsen Beschriften


```r
Balken <- Balken + labs(x = "Unabhängige Variable", y= "Mittelwert abhängige Variable (Einheit)")
Balken
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-61-1.png" style="display: block; margin: auto;" />

#### Farben ändern/ Bezeichnung in der Legende ändern



```r
Balken <-
  Balken + scale_fill_brewer(
    name = "Unabhängige\nVariable 2",
    palette = "Set1",
    labels = c("Stufe1", "Stufe2", "Stufe3")
  ) +
  scale_color_brewer(
    name = "Unabhängige\nVariable 2",
    palette = "Set1",
    labels = c("Stufe1", "Stufe2", "Stufe3")
  )
Balken
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-62-1.png" style="display: block; margin: auto;" />
**Verwendet mehrere Aesthetics (Color und Fill im Beispiel) in der Grafik, muss die Legende für alle  codiert werden, sonst entstehen mehrere Legenden**

Allgemeine Hinweise zur Bearbeitung der Legende findet ihr<a href="http://www.cookbook-r.com/Graphs/Legends_%28ggplot2%29/" target="_blank">hier</a>


#### Welche Farben??
##### Druckerfreundlich

Papers werden resourcenschonend häufig in Grau gedruckt. Dabei bestimmt oft nur die Helligkeit (Luminanz) der Farbe den Grauton. Wenn gleichhelle (isoluminante) Farben verwendet werden, sind eure Graphen nicht mehr unterscheidbar. Es müssen also Farben gefunden werden, die sich in ihrer Luminanz unterscheiden. 

Das Paket `ggsci` bietet eine Ganze Reihe an Farbpalleten, mitunter auch eine Palette (`pal_npg`) die sich an Publikationen in **Nature** orientiert. Wir suchen manuell Farben aus `pal_npg` die sich in ihrer Luminanz unterscheiden. Dies können wir mit  `specplot` aus dem Paket `colorspaces` machen. 


```r
library(colorspace)
library(ggsci)


npg <- pal_npg("nrc")(10)        # gibt die RGB-Werte der kompletten Palette
specplot(npg)                    # Zeichnet Luminanz, Chroma und HUE Verlauf
specplot(npg)[c(1,4,7)]
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-63-1.png" style="display: block; margin: auto;" />

```
$HCL
              H         C        L
 [1,]  15.69080 127.41065 54.15136
 [2,] 216.35958  53.48331 70.81504
 [3,] 167.59379  49.23039 58.87119
 [4,] 255.37721  46.46563 36.13420
 [5,]  25.93758  70.93779 72.25127
 [6,] 254.44871  31.61807 60.29376
 [7,] 170.28967  31.63907 79.33613
 [8,]  12.17395 154.47322 45.93504
 [9,]  45.06235  29.17539 43.43904
[10,]  54.64014  23.87747 65.51562

$<NA>
NULL

$<NA>
NULL
```

In unserem Fall benötigen wir drei Farben (1,4 und 7 unterscheiden sich deutlich), die wir manuell auswählen und dann in `scale_color_manual` und  `scale_fill_manual` verwenden


```r
colors <- pal_npg("nrc")(10)[c(1,4,7)]

Balken <-
  Balken + scale_fill_manual(
    name = "Unabhängige\nVariable 2",
    values= colors,
    labels = c("Stufe1", "Stufe2", "Stufe3")
  ) +
  scale_color_manual(
    name = "Unabhängige\nVariable 2",
    values= colors,
    labels = c("Stufe1", "Stufe2", "Stufe3")
  )
Balken
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-64-1.png" style="display: block; margin: auto;" />

##### Perzeptuell gleichförmig

Will man einen numerischen Verlauf durch Farben darstellen sollte man darauf achten, dass die Farbpalette perzeptuell gleichförmig ist, das heißt grob, dass ähnliche Unterschiede in den Daten zu ähnlichen Unterschieden in der Farbwahrnehmung führen sollten.

Die <a href="https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html" target="_blank">Viridis-Farbpaletten</a> erfüllen genau diesen Zweck. Darüberhinaus sind hier Farbpaletten enthalten die für Personen mit Farbfehlsichtigkeit ebenfalls perzeptuell gleichförmig sind.

Die Paletten können in `ggplot` über `scale_fill_viridis()` und `scale_color_viridis()` eingebunden werden.


```r
#install.packages("viridis")
library(viridis)

ggplot(data.frame(x = rnorm(10000), y = rnorm(10000)), aes(x = x, y = y)) +
  geom_hex() + 
  coord_fixed() +
  scale_fill_viridis() + 
  theme_bw()
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-65-1.png" style="display: block; margin: auto;" />



#### Symbole und Linientyp ändern


```r
Interaction + scale_shape_manual(values = c(16, 15, 17), 
                                 name = "Condition2") +
              scale_linetype_manual(values = c("dotted", "dotted", "dotted"),
                        name = "Condition2")
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-66-1.png" style="display: block; margin: auto;" />

Allgemeine Hinweise zur Bearbeitung der Symbole und Linientypen findet ihr <a href="http://www.cookbook-r.com/Graphs/Shapes_and_line_types/" target="_blank">hier</a>.

#### Stufen der Variable X auf der X-Achse benennen


```r
Balken <-
  Balken + scale_x_discrete(breaks=c("A", "B"),labels=c("Stufe1", "Stufe2"))
Balken
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-67-1.png" style="display: block; margin: auto;" />


#### Y-Limits setzen

Es gibt mehrere Möglichkeiten X und Y Limits zu setzen, z.B. `ylim()` oder `scale_y_continuous(limits = c(min, max))`, bei diesen werden aber Datenpunkte außerhalb der Limits entfernt und `stat_summary` funktioniert nicht mehr. Deshalb ist es ratsam `coord_cartesian(ylim=c(min, max))` zu verwenden.


```r
Balken +  ylim(250, 1250)
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-68-1.png" style="display: block; margin: auto;" />

```r
Balken <-
  Balken +  coord_cartesian(ylim=c(250, 1250))
Balken
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-68-2.png" style="display: block; margin: auto;" />


#### Themes

Mit `theme()` könnte ihr Komponenten des Layouts verändern, die sich nicht direkt auf die Daten beziehen, d.h. Titel, Achsen, Legende usw.. Mit `theme_get()`könnt ihr alle Optionen betrachten.

Es gibt eine Reihe vordefinierter Themes die ihr z.B. <a href="https://ggplot2.tidyverse.org/reference/ggtheme.html" target="_blank">hier</a> findet. Diese könnt ihr sehr einfach verwenden


```r
Balken
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-69-1.png" style="display: block; margin: auto;" />

```r
Balken + theme_bw()
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-69-2.png" style="display: block; margin: auto;" />

```r
Balken + theme_classic()
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-69-3.png" style="display: block; margin: auto;" />

```r
Balken + theme_linedraw()
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-69-4.png" style="display: block; margin: auto;" />

Es lohnt sich in der Regel sich ein Standard-Theme zu definieren, dass man dann für alle Plots verwendet, sodass die Grafiken ein einheitliches Layout haben und aufgeräumt aussehen.
Wenn ein bestimmtes Element entfernt werden soll, kann dafür `element_blank()` verwendet werden.

Unter `?element_blank` findet ihr alle gängigen Element-Typen die verwendet werden können und welche Argumente übergeben werden können.


```r
StandardTheme <- theme(
            axis.line = element_line(colour = "black"), # Hauptachsenfarbe schwarz
            panel.grid.major = element_blank(),  # Hauptgitterlinien entfernen
            panel.grid.minor = element_blank(),  # Untergitterlinien entfernen
            panel.border = element_blank(),      # Rahmen entfernen
            panel.background = element_blank(),  # Hintergrund leer, d.h. weiß
            text=element_text(size=14),          # allgemeine Schriftgröße auf 14 setzen
            axis.title.x = element_text( size=14, face="bold", colour = "black"), # Farbe schwarz und Fett
            axis.title.y = element_text( size=14, face="bold", colour = "black"),
            strip.text =  element_text( size=12),
            axis.text = element_text( size=12),
            legend.background = element_rect(colour = "black"), # Rahmen um Legende
            legend.key = element_blank(),
            legend.key.size = unit(3, "lines"))


Interaction
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-70-1.png" style="display: block; margin: auto;" />

```r
Interaction +  StandardTheme
```

<img src="DatenauswertungExampleFormat_files/figure-html/unnamed-chunk-70-2.png" style="display: block; margin: auto;" />


### Speichern/ exportieren

`ggsave` speichert automatisch euren letzten `ggplot`, ihr könnt aber auch explizit den Plot als Argument übergeben. 




```r
ggsave("Grafiken/experiment_grafik.pdf", width = 18, height = 12, units = "cm", dpi = 300)
ggsave("Grafiken/experiment_grafik2.pdf", plot= Interaction, width = 18, height = 12, units = "cm", dpi = 300)
```

In diesem Beispiel wurden die Grafiken als PDFs gespeichert. Das hat den Vorteil, dass die Dateien als <a href="https://de.wikipedia.org/wiki/Vektorgrafik" target="_blank">Vektorgrafiken</a> vorliegen. Im wesentlichen heißt das, dass ihr die Größe der Grafik im nachhinein beliebig verändern könnt, ohne das die Grafik unscharf wird.

In der Form können die Grafiken allerdings nicht in Word oder Powerpoint eingebunden werden (**Ausnahme Mac**). Dafür solltet ihr direkt das PNG-Format wählen mit einer hohen Auflösung (Journals verlangen **300 dpi** Minimum).

Das Format wird über die Endung des Dateinamen festgelegt.


```r
ggsave("Grafiken/experiment_grafik.png", width = 18, height = 12, units = "cm", dpi = 300)
ggsave("Grafiken/experiment_grafik2.png", plot= Interaction, width = 18, height = 12, units = "cm", dpi = 300)
```


\

## Aufgaben

1. Erstellt für jede Kern-Hypothese eine aussagekräftige Grafik!
    *

<a href="https://ep.mafiasi.de/p/EEP_H_Session_Feedback" target="_blank">Feeback zur Session</a> Seminar H

<a href="https://ep.mafiasi.de/p/EEP_J_Session_Feedback" target="_blank">Feeback zur Session</a> Seminar J



# 6. Klausur Übungen
\


<iframe src="https://alexanderkramer.shinyapps.io/trainingsapp/?showcase=0" width="100%" height="700px"></iframe>

