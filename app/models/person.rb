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
        "Peter Cameron",
        "",
        "Peter is an angel investor, venture capitalist and chairman of Startup Victoria.",
        "Peter-Cameron.jpg",
        "https://www.linkedin.com/in/petecameron/",
        :director
      ],
      [
        "Leni Mayo",
        "",
        "Leni is a software engineer, angel investor and co-founder of Startup Victoria.",
        "Leni-Mayo.png",
        "http://moniker.net/leni/bio/",
        :director
      ],
      [
        "Scott Handsaker",
        "",
        "Scott is CEO of Attendly and CyRise, a mentor at Startmate and co-founder of Startup Victoria.",
        "Scott-Handsaker.jpg",
        "https://au.linkedin.com/in/scotthandsaker/",
        :director
      ],
      [
        "Jessica Kerr",
        "",
        "Jessica is Director of Sinclair + May, a female-led boutique commercial law firm.",
        "Jessica-Kerr.jpg",
        "https://www.linkedin.com/in/jessicaskerr/",
        :director
      ],
      [
        "Morgan Ranieri",
        "",
        "Morgan is a co-founder and CEO at YourGrocer.",
        "Morgan-Ranieri.jpg",
        "https://www.linkedin.com/in/morganranieri/",
        :director
      ],
      [
        "Alan Dee",
        "",
        "Alan is co-founder and CEO at Moonshot Works and a mentor at La Trobe Accelerator.",
        "Alan-Dee.jpg",
        "https://www.linkedin.com/in/alandee/",
        :director
      ],
      [
        "Judy Anderson",
        "judy.anderson@startupvictoria.com.au",
        "Chief Executive Officer",
        "Judy-Anderson.jpg",
        "https://www.linkedin.com/in/fasttrackjudy/",
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
      [
        "Siddharth Vadasseri",
        "sid@startupvictoria.com.au",
        "Community and Events Co-ordinator",
        "Siddharth-Vadasseri.jpg",
        "https://www.linkedin.com/in/siddharth-vadasseri-131b195a/",
        :staff
      ]
    ].map do |a|
      new *a
    end
  end
end
