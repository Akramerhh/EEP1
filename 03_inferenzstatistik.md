---
title: "Inferenzstatistik"
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



# Vorbereitung

1. Schauen Sie sich die empirischen Hypothesen für Ihr Experiment an. 
2. Beschreiben Sie den Versuchsplan Ihres Experiments: 
    *    Welche Faktoren gibt es? Beschreiben Sie die Faktoren (Faktorstufen, between-subject/within-subject) und das Design.
    *    Stellen Sie den Versuchsplan in einer Matrix dar.

3. Formulieren Sie die statistischen Hypothesen.


# ezANOVA()

Man kann die ezANOVA entweder mit der gesamten (bereinigten) Datentabelle (enthält einzelne Trials)
oder für die aggregierte Datentabelle (enthält für jede VP Mittelwerte der AV pro Bedingung) rechnen. Die Ergebnisse beider Verfahren unterscheiden sich nicht. Wenn Sie mit der gesamten (bereinigten) Datentabelle rechnen, werden innerhalb des Befehls ezANOVA() die Daten über die Trials zusammengefasst.

Folgende Schritte sind notwendig:

1. package ez laden
2. Datensatz festlegen
    + aggregierter Datensatz (enthält keine Trials) oder
    + bereinigter Datensatz (enthält Trials)
3. Datenstruktur prüfen: 
    + sind alle Faktoren als Faktor definiert? str(daten); ggf. factor() 
    + sind die Daten vollständig? mit ezDesign() prüfen
4. ezANOVA() : Die ezANOVA() erzeugt häufig eine Reihe von Warnmeldungen. Viele davon können ignoriert werden. Prüfen Sie zunächst, ob sich das Ergebnis anzeigen lässt.
5. Ergebnistabelle anzeigen  




```r
## Pakete laden
library(ez)

## prüfen, ob Faktoren als Faktoren definiert sind
str(anovadaten)
# ggf. Faktoren als Faktoren definieren
# daten$id <- factor(daten$id)

## Design prüfen: hat jede VP in jeder Bedingung Daten?
ezDesign(data= anovadaten, x = UV1 , y = vp, col= UV2)

## ANOVA rechnen
myanova <- ezANOVA(data = anovadaten  
                    , dv = AV   # dv = dependent Variabel (AV)
                    , wid = id  # Variable, die VP-Nummer enthaelt
                    , within = .(UV1, UV2)  # within-subject Faktoren
                    )
## Ergebnistabelle anzeigen
myanova

## Ergebnisse anhand der deskriptiven Statistik interpretieren
ezPlot(
  data = anovadaten
  , dv = .(av)
  , wid = .(id)
  , within = .(UV1,UV2)
  , x = .(UV1)
  , split = .(UV2)
)
```

## Fehlersuche

### 1. droplevels()
***Problem:*** wenn man einen neuen Teildatensatz gebildet hat, z.B. 

*   durch Aufteilung der Daten in die Faktorstufen eines Faktors oder 
*   durch Ausschluss von VPs oder Faktorstufen, 

dann enthält der Faktor im neuen Teildatensatz noch die "alten" Faktorstufen aber keine Daten mehr für diese Faktorstufen.  

\newpage
***Lösung:*** Den neuen Teildatensatz erneut faktorisieren oder mit droplevels(daten) die überflüssigen Faktorstufen entfernen.


```r
anovadaten <- droplevels(anovadaten)
```
### 2. ezDesign()
Die ezANOVA gibt folgende Fehlermeldung aus: "One or more cells is missing data". 
Nach der Datenbereinigung haben manche Probanden in einzelnen Bedingungen keine Reaktionszeitdaten mehr. Diese Probanden müssen aus dem Datensatz entfernt werden.


```r
ezDesign(data= anovadaten, x = UV1 , y = vp, col= UV2)
```

# post-hoc Tests
Die ANOVA ist ein Globaltest und testet ob sich mindestens zwei Bedingungen (zwei Zellen)
signifikant voneinander unterscheiden. In einem Datensatz, in denen Anzahl der Bedingungen > 2 ist,
muss man mit paarweisen Vergleichen (pairwise.t.test) anschließend testen, welche der Bedingungen 
sich voneinander unterscheiden. 

Dabei muss man das Problem der alpha-Fehler Kumulierung beachten, welches 
durch multiples Testen entsteht, beachten (wenn sie 100 Tests rechnen, werden 5 durch Zufall 
signifikant). Deshalb muss man die Anzahl der durchgeführten Tests bei der Bestimmung des p-Werts 
berücksichtigen. Dafür gibt es verschiedene Korrekturverfahren (z.B. Bonferroni, FDR, Holm).


**WICHTIG: pairwise.t.test() muss mit dem aggregierten (= innerhalb der VP zusammengefassten) Datensatz gerechnet werden. Der Datensatz enthält keine Trials, sondern für jede VP die Mittelwerte pro Bedingung.** 


```r
# für einfaktorielle within-subject designs
pairwise.t.test(RT.vp$AV, RT.vp$UV, paired = T)

# für mehrfaktorielle within-subjectDesigns
pairwise.t.test(RT.vp$AV, interaction(RT.vp$UV1, RT.vp$UV2), paired = T)
```

Mit der Option p.adjust = ... kann man die Korrekturmethode auswählen, z.B. "bonferroni", "FDR", holm", 

Der pairwise.t.test gibt nur die p-Werte aber keine t-Werte aus! Die Ergebnisse werden nach APA aber so berichtet: *t*(23) = 12.32, *p* < 0.05

\newpage
So kann man an die t-Werte,  Freiheitsgrade und korrigierte p-Werte bestimmen:

* Freiheitsgrade (df): df = n-1 (Anzahl VPs minus 1)
* t-Wert: 
  
  ```r
  pairwise.t.test(RT.vp$AV, interaction(RT.vp$UV1, RT.vp$UV2),
  paired = T, adjust = "none")
  # p-Wert ablesen und in folgendem Befehl einsetzen:
  qt(1- 0.5*pWert, df)
  ```
* korrigierter p-Wert: 
  
  ```r
  pairwise.t.test(RT.vp$AV, interaction(RT.vp$UV1, RT.vp$UV2), paired = T)
  ```
