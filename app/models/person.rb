class Person < Struct.new(:name, :email, :bio, :image_filename, :url, :role)
  include Draper::Decoratable

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
        "",
        "Leni is a software engineer, angel investor and chairman of Startup Victoria.",
        "Leni-Mayo.png",
        "http://moniker.net/leni/bio/",
        :director
      ],
      [
        "Michelle Bourke",
        "",
        "Michelle is the director of Artlivemedia and co-director of The Talent Door.",
        "Michelle-Bourke.png",
        "https://au.linkedin.com/in/michellebourke/",
        :director
      ],
      [
        "Scott Handsaker",
        "",
        "Scott is the CEO of Attendly and Eventarc and a mentor at AngelCube.",
        "Scott-Handsaker.png",
        "https://au.linkedin.com/in/scotthandsaker/",
        :director
      ],
      [
        "Miguel Wood",
        "",
        "Miguel is Co-founder and CEO of Euler's Bridge and Co-founder of Tin Alley beta.",
        "Miguel-Wood.png",
        "https://au.linkedin.com/in/migster/",
        :director
      ],
      [
        "Sarah Hamilton",
        "",
        "Sarah is co-founder and CEO of bellabox.",
        "Sarah-Hamilton.jpg",
        "https://au.linkedin.com/in/sarahhamilton4",
        :director
      ],
      [
        "Georgia Beattie",
        "georgia.beattie@startupvictoria.com.au",
        "Chief Executive Officer",
        "georgia_beattie.png",
        "https://au.linkedin.com/in/gbeattie/",
        :staff
      ],
      [
        "Jay Lynch",
        "jay@startupvictoria.com.au",
        "Chief Technology Officer",
        "Jay-Lynch.png",
        "https://www.linkedin.com/in/lynchjay/",
        :staff
      ],
      [
        "Mei Chan",
        "mei.chan@startupvictoria.com.au",
        "Community and Events Manager",
        "mei_chan.png",
        "https://www.linkedin.com/in/meiyuanchan/",
        :staff
      ],
    ].map do |a|
      new *a
    end
  end
end
