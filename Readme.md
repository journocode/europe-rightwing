#Right-wing parties in Europe

This respository contains the code and data used for the *pflichtlektuere* project on right wing parteies in the EU member and applicant states.
Read the articles here:

[Pflichtlektüre - Karte: Die Rechten Europas](http://www.pflichtlektuere.com/04/02/2016/karte-die-rechten-europas/)

[Pflichtlektüre - Thesentest: Rechte Parteien im Vergleich](http://www.pflichtlektuere.com/04/02/2016/thesentest-rechte-parteien-im-vergleich/)

##chord

The folder *chord* contains code and data for the chord diagram. The code was originally written by Nadieh Bremer. She wrote a detailed tutorial, it's available [here](http://www.visualcinnamon.com/2015/08/stretched-chord.html)  on her blog, VisualCinnamon.


##jaccard

The folder *jaccard* contains code and data for the similarity analysis of the strongest right wing parties.
The file *jaccard.R* contains the static version made with the ggplot2 R package, while *jaccard_d3.R* contains the interactive version made with the new d3heatmap package for R.


##map

The folder *map* contains the data used for the interactive map. Since the map was made with the CartoDB web app, no additional code was used. You can see the final map [here](https://datendrang.cartodb.com/viz/a859905a-c0f2-11e5-b80e-0e5db1731f59/public_map).
