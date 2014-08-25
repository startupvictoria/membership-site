module JobAdJbarHelper
  def job_ad_jbar_text
    {
      message: "We're recruiting for a volunteer CTO!",
      button:  "Learn More",
      url:     "/jobs",
      state:   "open"
    }.to_json
  end
end
