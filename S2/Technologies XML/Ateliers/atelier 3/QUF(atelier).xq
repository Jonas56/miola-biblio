(:question1:)
for $x in /catalogue
return insert node 
<cd lang="an">
<titre>Davinchi</titre>
<artiste>Bob Swirt</artiste>
<pays>USA</pays>
<compagnie>Columbia</compagnie>
<prix>13</prix>
<annee>2001</annee>
</cd> 
into $x 
(:question2:)
(:for $x in /catalogue/cd
where contains($x/compagnie,"Columbia") or contains($x/compagnie,"Polydor")
return insert node
<reduction>10%</reduction>
into $x:)
(:question3:)
(:for $x in /catalogue/cd
where contains($x/pays,"FRA")
return rename node $x/compagnie
as "editeur":)
(:question4:)
(:for $x in /catalogue/cd
where contains($x/titre,"Still got the blues")
return replace value of node $x/prix
with 30:)
(:question5:)
(:for $x in /catalogue/cd
where contains($x/pays,"FRA")
return rename node $x/prix
as "promotion":)
(:question6:)
(:for $x in /catalogue/cd
where contains($x/titre,"Maggie May")
return delete node $x:)



