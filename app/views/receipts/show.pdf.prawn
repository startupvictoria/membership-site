require "prawn"
require 'prawn/table'

prawn_document(filename: "startup-victoria-receipt-{receipt.invoice_id}.pdf", force_download: false) do |pdf|
  pdf.font "Helvetica" do

    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], width: 280 do
      pdf.text "startupvictoria.com.au", size: 24
    end

    # Invoice number / date
    pdf.bounding_box [pdf.bounds.right - 220, pdf.bounds.top], width: 280 do
      pdf.text "Tax Invoice ##{@receipt.invoice_id}", size: 16
      pdf.move_down 5
      pdf.text "#{@receipt.created_at_ymd}", size: 11
      pdf.move_down 5
      pdf.text "ABN: 26 167 737 582", size: 9
    end

    # Our details
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 80], width: 200 do
      pdf.text "<b>startupvictoria.com.au</b>", inline_format: true
      pdf.move_down 10
      pdf.text "StartupVic Limited
      Level 1, 48 Cambridge st
      Richmond
      Victoria 3121
      Australia"
    end

    # Customer details
    pdf.bounding_box [pdf.bounds.left + 180, pdf.bounds.top - 80], width: 250 do
      pdf.text "<b>#{@user.full_name}</b>", inline_format: true
      pdf.move_down 10

      pdf.text "Payment by credit card"

      # TODO ending in subscription.truncated_pan

      # TODO refund line
    end

    # Table
    headers = %w{ Quantity Plan Description Price Total }

    row = [ "1 year",
      "Membership Plan: #{@user.membership.plan_id}",
      "Membership from #{@receipt.period_start} to #{@receipt.period_end}",
      @receipt.amount,
      @receipt.amount
    ]

    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 200], width: 800 do
      pdf.table [headers, row], header: true
    end

    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 270], width: 500 do
      pdf.text "GST included."
      pdf.move_down 10

      pdf.text "Please keep a copy of this invoice for your records and future reference."

      pdf.move_down 10
      pdf.text "Feel free to contact <color c='99.6' m='32.5' y='12.2' k='0'><u><link href='mailto:hello@startupvictoria.com.au'>hello@startupvictoria.com.au</link></u></color> if you have any questions.", inline_format: true

      pdf.move_down 10
      pdf.text "Thanks for being a member!"
    end

  end # end Helvetica font
end
