# Name: SeptembreDeLaForge
# Source: https://etickets.infomaniak.com/shop/UYNV59XYQU/home/dates
[ 
    .events[] |
    {
        title:      .name,
        type:       .genre,
        location:   .place.designation,
        comment:    .description,
        imageUrl:   .img,
        date:       (.date + "+02:00") | sub(" "; "T"),
        city:       .place.city,
        country:    .place.country,
        url:        .social_url,
        sourceUrl:  ("https://septembredelaforge.ch/"),
    }
]
