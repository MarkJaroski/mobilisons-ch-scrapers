# Source: https://2026.festivalcite.ch/fr/api/prog/
#
# Usage:
#   jq -f fdlc_to_concertcloud.jq fdlc.json

[
  .[] |
  . as $entry |
  .dates[] |
  {
    title:      $entry.title,
    location:   .location,
    city:       "Lausanne",
    country:    "Switzerland",
    date:       (.begin + "Z"),
    url:        ("https://festivalcite.ch" + $entry.url),
    imageUrl:   ("https://festivalcite.ch" + $entry.thumb),
    #comment:    $entry.company,
    type: "concert",
     type:       (
                   if ($entry.category_ids | map(. == 1) | any)
                   then "MUSIC"
                   elif ($entry.category_ids | map(. == 158) | any)
                   then "PERFORMING_VISUAL_ARTS"
                   elif ($entry.category_ids | map(. == 160) | any)
                   then "ARTS"
                   else "event"
                   end
                 ),
    sourceUrl:  ("https://festivalcite.ch"),
    #genres:     $entry.sub_categories,
    genresText: $entry.genre,
  }
]
