---
title: "Single-Subject Analyse"
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




# 1. Skript schreiben
In ein R-Skript gehören alle Befehle, die die Analyse reproduzierbar machen. Das Skript sollte so geschrieben sein, dass es für jeden beliebigen Datensatz anwendbar ist. Wenn es z.B. im aktuellen Datensatz keine Reaktionszeiten schneller als 200 ms gibt, dann sollten die Befehle zum Ausschließen von Trials mit kürzeren Reaktionszeiten trotzdem im Skript enthalten sein. \newline
\newline
Das Skript enthält Kommentare (#), die die einzelnen Schritte erläutern. \newline

**Das sollte am Beginn eines jeden Skripts stehen:**


```r
# Kommentar: Inhalt/Titel des Skripts, z.B. EEP: Analyse Cueing

# Pakete laden
library(tidyverse)   

# Arbeitsspeicher leeren
rm(list=ls())

# set working directory
```

# 2. Daten importieren


```r
# Daten einlesen
daten <- read_csv("D07_Sternberg_2020_Dec_16_eep.csv") 

# optional: Spaltenamen umbenennen, z.B.: 
daten <- rename(daten, taste = key)
```

# 3. Übungstrials entfernen
**Einführung filter() und %>% pipe operator**


```r
## Übungstrials entfernen
daten <- daten %>%
  filter(phase != "uebung")
```
Die Funktion **filter()** filtert Zeilen aus einem data.frame. Die Operatoren haben folgende Bedeutung:

* != "ungleich"
* == "gleich"
* <  "kleiner"
* <= "kleiner gleich"
* usw.

**%>%** pipe operator: ermöglicht eine Verkettung von Befehlen, ähnlich einer Rohrpost: Der Datensatz (oder ein Daten-Objekt oder ein Zwischenergebnis) werden mit mittels pipe %>% an die nächste Zeile weitergegeben.

Auch Zwischenergebnisse können auf diese Weise weitergegeben werden. Der Code wird dadurch einfacher viel besser lesbar!

# 4. Datenstruktur prüfen und Faktoren definieren

```r
# Datenstruktur pruefen
str(daten) # Output betrachten: haben alle Spalten das richtig Format? 
# ggf. Spalten als Faktoren definieren, Beispiele: 
daten$id <- factor(daten$id)
daten$gender <- factor(daten$gender, 
                         levels = c("w","m", "d", "keine Angabe"), 
                         labels = c("weiblich", "männlich","divers", 
                                    "keine Angabe"))
```
Als Faktoren sollten definiert sein:

* alle kategorialen unabhängigen Variablen und weitere kategoriale Variablen, die bei der Analyse berücksichtigt werden sollen
* VP-Code: id

Die Reihenfolge bei "levels" bestimmt Reihenfolge der Faktorstufen in Abbildungen und Tabellen. Wenn man "levels" und "labels" nicht explizit definiert, nutzt R die in der Tabelle vorhandenen Einträge als "levels" und "labels" in alphabetischer Reihenfolge

# 5. Vollständigkeit der Daten prüfen

Prüfen Sie, ob die Versuchsperson das Experiment bis zum Ende bearbeitet hat, z.B. durch Zählen der Zeilen im Datensatz oder durch Zählen der Anzahl der Trials pro Bedingung.


```r
# Anzahl der Zeilen im Datensatz
daten %>% count()
# Anzahl der Trials pro Bedingung
daten %>% 
  group_by(UV) %>%  # UV: muss durch Spaltenname ersetzt werden
  count()
```
**group_by()** mit dieser Funktion wird der Datensatz nach Faktorstufen des angegebenen Faktors gruppiert und alle nachfolgende Schritte werden getrennt nach den Faktorstufen durchgeführt. In diesem Fall: Anzahl der Trials pro Stufe der UV wird mit count() gezählt. 

Es können auch mehrere Faktoren angegeben werden (durch Komma getrennt: group_by(UV1, UV2).

# 6. Analyse der Antwortgenauigkeit
Die Analyse der Antwortgenauigkeit (RA - Response Accuracy) soll pro Bedingung erfolgen. Die Antwortgenauigkeit kann berechnet werden als...

* Summe richtiger Antworten
* Anteil richtiger Antworten an allen Trials einer Bedingung

Wenn die Anzahl der praesentierten Trials sich zwischen den Bedingungen unterscheidet, sollte man ausschliesslich den "Anteil" betrachten, wenn man die Antwortgenauigkeit zwischen den Bedingungen vergleichen möchte. 

Beispiel: Eine Versuchsperson hat 10 richtige Antworten in Bedingung A gegeben und 15 richtige Antworten in Bedingung B. Diese Zahlen sind nur vergleichbar, wenn man die Gesamtzahl präsentierter Trials kennt: In Bedingung A wurden 10 Trials präsentiert und in Bedingung B wurden 30 Trials präsentiert. Also hat die VP eine Antwortgenauigkeit von 100% in Bedingung A (10 von 10 Trials richtig beantwortet), aber nur von 50% in Bedingung B (15 von 30 Trials richtig beantwortet)


```r
daten %>% 
  group_by(...) %>% 
  summarise(RA.Summe = sum(corr),  
            RA.Anteil = mean(corr)) 
```
\newpage
Erläuterung:

* summarise() = Zusammenfassung von Daten. notwendig um Funktionen wie mean(), sd(), sum() etc. auszuführen
* RA.Summe und RA.Anteil = selbstgewählte Name, erscheinen als Spaltennamen im Ergebnisoutput
* mean(), sum() = Funktionen
* corr = Spalte in Dataframe "daten"

Wenn Sie das Ergebnis von oben in einem eigenen Datenobjekt speichern (z.B. "ra.vp"), können Sie dieses grafisch darstellen:


```r
ggplot(daten = ra.vp, aes(x = UV, y = RA.Summe)) +
  geom_point() 
  #+ facet_grid(~UV2)  
```

**facet_grid()** erstellt für jede Faktorstufe des angegebenen Faktors eine separate Grafik

# 7. Ausschluss von Fehlertrials und extremen Reaktionszeiten

Gibt es Trials, die nicht in die Auswertung der Reaktionszeiten eingehen sollen? 
Das ist abhängig ...

* vom jeweiligen Experiment, inhaltlichen Überlegungen und dem was in der Literatur üblich ist
* von der Art der Antwort: z.B. Wahrnehmung? Semantische Entscheidung? 

Üblich für Reaktionszeitexperimente:

* Reaktionszeiten nur für richtige Antworten analysieren (oder getrennt für richtige und falsche Antworten)
* zu schnelle und zu langsame Reaktionszeiten werden von der Analyse ausgeschlossen 

**Strategien zur Identifizierung extremer RTs**

* visuelle Inspektion der Verteilung der Daten (Histogramm, Boxplot) 
* absolute Cut-offs: z.B. RTs < 200 ms; RTs > 2000 ms
* relative Cut-offs: z.B. RTs > M + 3 SD pro Bedingung und VP (manchmal auch: 2.5 SD, 2 SD)
* nicht zu viele Daten ausschließen (< 5 bis 15%, abhängig von der Datenverteilung; Ratcliff, 1993)


```r
# Daten filtern: Ausschluss von Trials, in denen die VP falsch reagiert hat
data.ohneFehler.df <- daten %>%
  filter(...)

# grafische Darstellung: Verteilung der Reaktionszeiten - insgesamt 
#(ohne Berücksichtigung der Bedingungen)
ggplot(data.ohneFehler.df, aes(x = rt)) +
  geom_histogram() #+
  #facet_grid(~UV)

# grafische Darstellung: Verteilung der Reaktionszeiten pro Bedingung
ggplot(data.ohneFehler.df, aes(x = UV, y = rt)) +
  geom_boxplot() #+
  #facet_grid(~UV)
```

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


```r
# wieviele Trials sind langsamer als die obere Grenze?
data.RT.df %>% 
  group_by(...) %>% 
  filter(rt > "Formel obere Grenze") %>% 
  count()
# Trials mit zu langsamen RTs ausschliessen
data.RT.df <- ... # Befehl aus vorigen Zeilen anpassen
```
\newpage
# 8. Reaktionszeitanalyse
1. Prüfen Sie  zunächst, wie viele Trials pro Bedingung die VP nach der Datenbereinigung noch hat (Befehle siehe "5. Vollständigkeit der Daten prüfen").

2. Für den bereinigten Datensatz koennen nun die Mittelwerte der Reaktionszeiten
getrennt nach Bedingungen berechnet werden. Auch hier wieder pipe (%>%), group_by(), und summarise() anwenden (Befehle ähnlich "6. Analyse der Antwortgenauigkeit").



