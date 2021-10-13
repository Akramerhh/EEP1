---
title: "Abbildungen"
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



Alle hier gezeigten Abbildungen können Sie für alle abhängigen Variablen verwenden.
Beispielhaft wird im folgenden überall die Reaktionszeit benutzt.

# library(ggplot2)
sehr gute Dokumentation: [Cookbook R](http://www.cookbook-r.com/Graphs/)

# Abbildungen in andere Programme exportieren
Mit dem folgende Befehl können Sie die Größe (in cm) und die Auflösung der Abbildung einstellen. Die Abbildung wird im aktuellen Arbeitsverzeichnis als .png Datei abgelegt. Die .png Datei können Sie in jedes Textverarbeitungsprogramm (Word, Powerpoint, ...) einbinden. 


```r
# Grafik in hoher Auflösung speichern ###
ggsave("experiment_grafik.png", width = 18, height = 12, units = "cm", 
       dpi = 300)
```

# Boxplot & Violinplot
Im folgenden Beispiel ist RT.vp ein Datensatz, der pro VP Mittelwerte für jede Bedingung enthält (aber keine einzelnen Trials mehr). Dargestellt wird pro Bedingung ein Boxplot/Violinplot und der Mittelwert. 


```r
# BOXPLOT: Grundform
ggplot(RT.vp, aes(x=UV1, y=AV, fill=UV2)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", position = position_dodge(0.7))

# BOXPLOT: etwas verändert
ggplot(RT.vp, aes(x=UV1, y=AV, fill=UV2)) +  
  geom_boxplot(width = 0.5, position=position_dodge(0.7)) +
  stat_summary(fun=mean, geom="point", position=position_dodge(0.7), 
               shape=19, size=4, show.legend = F) +
  labs(x = "Unabhaengige Variable",y = "Abhaengige Variable")

# VIOLINPLOT
ggplot(RT.vp, aes(x = UV1, y = AV, fill = UV2)) +
  geom_violin() +
  stat_summary(fun = mean, geom = "point", position = position_dodge(0.9)) +
  stat_summary(fun = median, geom = "point", shape = 23, 
               position = position_dodge(0.9)) 
```


# Mittelwerte + Streuungsmaß

## Step 1: Daten zusammenfassen


```r
group.rt <- Rmisc::summarySEwithin(RT.vp, 
                                   measure = "AV", 
                                   withinvars = c("UV1", "UV2"), 
                                   idvar = "id", 
                                   conf.interval = .95)
```

Das Zusammenfassen der Daten erfolgt in zwei Schritten:

1. RT.vp
    *   dataframe, enthält für jede VP Mittelwerte pro Bedingung. 
    *   wird aus dem (bereinigten) Datensatz, der einzelne Trials enthält, erstellt
    *   Informationen über einzelne Trials sind nicht mehr enthalten

2. group.rt
    *   dataframe, enthält Mittelwert und Streuungsmaß pro Bedingung
    *   wird aus RT.vp erzeugt. 
    *   Informationen über einzelne VPs sind nicht mehr enthalten


**Achtung**: wichtiger Hinweis zu **Rmisc::summarySEwithin**
\newline
library(RMisc) lädt auch das package plyr(). plyr-Funktionen stehen in Konflikt mit dplyr-Funktionen (und wir nutzen dplyr-Funktionen, tidyverse lädt dplyr). Wird plyr() im Skript nach tidyverse (dplyr) geladen, dann funktionieren die dplyr-Funktionen nicht mehr richtig. Laden Sie deswegen Rmisc nicht über library(Rmisc) in den Workspace, sondern nur für die genutzte Funktion (**Rmisc::summarySEwithin**)



## Step 2: Grafik erstellen: z.B. Mittelwerte + Streuungsmaß

```r
## Grundgerüst
ggplot(group.rt, aes(x = UV1, y = AV, group = UV2, colour = UV2)) +
  geom_point(aes(shape = UV2)) +
  geom_line(aes(linetype = UV2)) +
  geom_errorbar(aes(ymin = AV - se, ymax = AV + se))


## bearbeitet
ggplot(data = group.rt, aes(x = UV1, y = AV, group = UV2, colour = UV2)) + 
  geom_point(aes(shape = UV2), size = 4, 
             position=position_dodge(0.1)) +
  geom_line(aes(linetype = UV2), size = 1, 
            position=position_dodge(0.1)) +
  geom_errorbar(aes(ymin=AV-se, ymax=AV+se), 
                size = 1, width=.1,
                position=position_dodge(0.1), show.legend = F) +
  labs(x = 'Unabhaengige Variable', y = 'Abhaengige Variable') 
```

## Step 2: Grafik erstellen: z.B. Balkendiagramm

```r
ggplot(group.rt, aes(x=UV1, y=AV, fill=UV2)) +  
  geom_bar(stat="identity", colour = "black", width=0.5, 
           position = position_dodge(0.5)) + 
  geom_errorbar(aes(ymin=AV-se, ymax=AV+se, colour = "black"), size = 1, 
                width=.1, position=position_dodge(0.5), show.legend = F) #+
  # labs(x = "Unabhaengige Variable", y = "Abhaengige Variable") 
```

# Grafikbefehle
## different geoms

```r
geom_boxplot()
geom_violin()
geom_point()
geom_line()
geom_errorbar()
geom_bar()
geom_histogram()
geom_abline()
geom_hline()
geom_vline()
...
```

## Farben 
[http://www.cookbook-r.com/Graphs/Colors_%28ggplot2%29/](http://www.cookbook-r.com/Graphs/Colors_%28ggplot2%29/)

Google-Suche: R color chart 

```r
### für Punkte und Linien
scale_colour_manual(values=c("red","blue","green"))
scale_colour_brewer(palette="Set3")
### für Barplots / boxplots
scale_fill_manual(values=c("red","blue","green"))
scale_fill_brewer(palette="Set3")
scale_fill_brewer(palette = "Set1", name="UV2", breaks = c("X", "X2"), 
labels=c("einLabel", "nocheinLabel"))
```

## Achsen
http://www.cookbook-r.com/Graphs/Axes_%28ggplot2%29/


```r
# Beschriftung x-Achse
scale_x_discrete(breaks=c("X1", "X2"),labels=c("X1", "X1")) 
# Skalierung
coord_cartesian(ylim=c(1, 4)) # oder
ylim(c(1,4))
```

## Symbole und Linientyp ändern
[http://www.cookbook-r.com/Graphs/Shapes_and_line_types/](http://www.cookbook-r.com/Graphs/Shapes_and_line_types/)


```r
# Symbole ändern (in diesem Beispiel hat UV 3 Stufen):
scale_shape_manual(values=c(16, 15, 17))
# Linenart ändern (in diesem Beispiel hat UV 3 Stufen):
scale_linetype_manual(values=c("solid", "twodash", "dotted"))
```
## Schriftgröße

```r
theme(text=element_text(size=40), 
      axis.text.x=element_text(size=40, colour = "black")) 
```

\newpage
## Bearbeiten der Legende
[http://www.cookbook-r.com/Graphs/Legends_%28ggplot2%29/](http://www.cookbook-r.com/Graphs/Legends_%28ggplot2%29/)

Verwendet man Colour, Shape und Linetype in der Grafik, muss die Legende für alle 3 codiert werden, sonst entstehen mehrere Legenden


```r
scale_colour_manual(values=c("cornflowerblue","coral3"), name = "UV1", 
                    breaks=c("1","2"), labels = c("oben", "unten")) +
scale_shape_discrete(name = "UV1", 
                     breaks=c("1","2"), labels = c("oben", "unten"))+
scale_linetype_discrete(name = "UV1", 
                        breaks=c("1","2"), labels = c("oben", "unten"))
```


## Themes: Schriftgrößen, Layout des Plots, etc. 
Mit theme() kann man Komponenten des Layouts verändern, die sich nicht direkt auf die Daten beziehen, d.h. Titel, Achsen, Schriftgrößen, Legende usw.. Mit theme_get() kann man alle Optionen betrachten.

Es gibt eine Reihe vordefinierter Themes (z.B. hier: [https://ggplot2.tidyverse.org/reference/ggtheme.html](https://ggplot2.tidyverse.org/reference/ggtheme.html)

Themes werden wie alle anderen Grafikbefehle zur Grafiken hinzugefügt, z.B.:

```r
# grauen Hintergrund durch weißen ersetzen
+ theme_bw()
```

Es lohnt sich in der Regel sich ein Standard-Theme zu definieren, dass man dann für alle Plots verwendet, sodass die Grafiken ein einheitliches Layout haben. Wenn ein bestimmtes Element entfernt werden soll, kann dafür element_blank() verwendet werden.

Beispiel: 

```r
StandardTheme <- theme(
  axis.line = element_line(colour = "black"), # Hauptachsenfarbe schwarz
  panel.grid.major = element_blank(),  # Hauptgitterlinien entfernen
  panel.grid.minor = element_blank(),  # Untergitterlinien entfernen
  panel.border = element_blank(),      # Rahmen entfernen
  panel.background = element_blank(),  # Hintergrund leer, d.h. weiß
  text=element_text(size=14),          # allg. Schriftgröße definieren
  axis.title.x = element_text(size=14, face="bold", colour = "black"), 
  axis.title.y = element_text( size=14, face="bold", colour = "black"),
  strip.text =  element_text( size=12),
  axis.text = element_text( size=12),
  legend.background = element_rect(colour = "black"), # Rahmen um Legende
  legend.key = element_blank(),
  legend.key.size = unit(3, "lines"))

# Standardtheme zur Grafik hinzufügen
ggplot(...) +
  ... +
  StandardTheme
```
