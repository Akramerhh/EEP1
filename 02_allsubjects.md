---
title: "Automatisierung der Analyse für mehrere VPs"
header-includes:
- \usepackage{fancyhdr}
- \pagestyle{fancyplain}
- \fancyhf{}
- \fancyhead[L]{Dr. Cordula Hölig}
- \fancyhead[C]{Universität Hamburg}
- \fancyhead[R]{EEP I}
- \fancyfoot[C]{Dieses Dokument ist urheberrechtlich geschützt.}
- \fancyfoot[R]{\thepage}
- \setlength{\headheight}{15pt}
knit: (function(inputFile, encoding) {
    rmarkdown::render(inputFile, encoding = encoding, output_dir = "./")
  })
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
    code_download: true
fontsize: 14pt
editor_options: 
  chunk_output_type: inline
css: style.css
---



# 1. Skript: 
siehe singlesubject.pdf

# 2. Daten importieren


```r
# welche files (Dateien) sollen eingelesen werden?
data.files <- list.files("Alle Daten/", pattern = "XXXX")

# eine leere Datentabelle anlegen
data.df <- data.frame()

# Daten aller VPs einlesen
for (file in data.files){
  data = read.csv(paste0("./Alle Daten/", file ), header=TRUE, fileEncoding = "UTF-8-BOM")
  data.df = rbind(data.df, data)
}
```
# 3. Übungstrials entfernen
siehe singlesubject.pdf 

# 4. Datenstruktur prüfen und Faktoren definieren
siehe singlesubject.pdf

\newpage

# 5. bis 8.: bisheriges Skript an veränderten Datensatz anpassen

* Die Variable "id" muss bei vielen Befehlen als weiterer Gruppierungsfaktor eingegeben werden
  + in %>% pipes: "group_by(.., id)" 
  + in Grafiken: "facet_grid(~id)", "facet_grid(UV2~id)" oder "facet_grid(id~UV2)";  facet_grid(Spalte~Zeile)
* weiterer Schritt der Datenbereinigung: VPs mit auffälligen Antwortmuster identifizieren und ausschließen (Ausschlusskritierien müssen gut begründet sein:
  + VPs mit auffällig vielen Fehlern 
  + VPs mit auffällig langsamen Reaktionszeiten
  + VPs mit geringen Anzahl an gültigen Trials
* Aggregation (=Zusammenfassen) der Antwortgenauigkeit und Reaktionszeit in zwei Schritten:
  + 1. Mittelwerte pro Bedingung UND Versuchsperson: für jede VP werden die Trials pro Bedingung in einer neuen Tabelle zusammengefasst (Mittelwert aller Trials pro Bedingung innerhalb der VP)
  + 2. Mittelwerte pro Bedingung (gemittelt ueber alle VPs). Input für diese Berechnung ist die Tabelle, die vorigen Schritt (Schritt 1 der Aggregation) erstellt wurde.
