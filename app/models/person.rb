class Person < Struct.new(:name, :bio, :image_filename, :linkedin, :role)
  def self.directors
    all.select { |p| p.director? }
  end

  def self.staff
    all.select { |p| p.staff? }
  end

  def director?
    role == :director
  end

  def staff?
    role == :staff
  end

  private

  def self.all
    [
      [
        "Leni Mayo",
        "Leni is a software engineer, angel investor and chairman of Startup Victoria.",
        "Leni-Mayo.png",
        "http://moniker.net/leni/bio/",
        :director
      ],
      [
        "Michelle Bourke",
        "Michelle is the director of Artlivemedia and co-director of The Talent Door.",
        "Michelle-Bourke.png",
        "http://au.linkedin.com/in/michellebourke/",
        :director
      ],
      [
        "Scott Handsaker",
        "Scott is the CEO of Attendly and Eventarc and a mentor at AngelCube.",
        "Scott-Handsaker.png",
        "http://au.linkedin.com/in/scotthandsaker/",
        :director
      ],
      [
        "Brendan Lewis",
        "Brendan is the founder of Churchill Club and the Australian representative of London & Partners.",
        "Brendan-Lewis.png",
        "http://au.linkedin.com/in/brendanlewis/",
        :director
      ],
      [
        "Lars Lindstrom",
        "Chief Executive Officer",
        "larsprofile.jpg",
        "http://au.linkedin.com/in/larslindstromoz/",
        :staff
      ],
      [
        "Thomas Anbeek",
        "Events Manager",
        "thomas.png",
        "http://au.linkedin.com/pub/thomas-anbeek/66/799/263/",
        :staff
      ],
    ].map do |a|
      new *a
    end
  end
end
