class AboutController < ApplicationController

  private

  def director_attributes
    [
      [
        "Leni Mayo",
        "Leni is a software engineer and founding investor of 99designs, Flippa, Learnable, SitePoint, Tweaky, MMGN and Influx.",
        "Leni-Mayo.png",
        "lenimayo"
      ],
      [
        "Michelle Bourke",
        "Michelle is the director of Artlivemedia and co-director of The Talent Door.",
        "Michelle-Bourke.png",
        "michellebourke"
      ],
      [
        "Scott Handsaker",
        "Scott is the CEO of Attendly and Eventarc, founder of Startup Victoria and an Angel Cube mentor.",
        "Scott-Handsaker.png",
        "scotthandsaker"
      ],
      [
        "Brendan Lewis",
        "Brendan is the founder of Churchill Club, partner at Flinders Ventures and Australian Representative for London & Partners.",
        "Brendan-Lewis.png",
        "brendanlewis"
      ],
    ].map do |a|
        { name: a[0], bio: a[1], image_filename: a[2], linkedin: a[3] }
    end
  end
  helper_method :director_attributes
end
