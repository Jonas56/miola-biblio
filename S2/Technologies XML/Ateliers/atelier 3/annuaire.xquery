(:
for $x in doc("annuaire.xml")/annuaire/personne
where $x/adresse/ville = 'Rabat'
return $x
:)

for $x in doc("annuaire.xml")/annuaire/personne
where $x/sexe = 'M' and fn:year-from-date($x/DateNaissance) = 1980
return $x
