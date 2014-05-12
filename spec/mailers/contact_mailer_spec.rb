require 'spec_helper'

describe ContactMailer do
  let(:full_name) { "Peter Gregory" }
  let(:email) { "peter@hooli.com" }
  let(:subj) { "a question" }
  let(:message) { "blah" }
  let(:attributes) { {
    full_name: full_name,
    email: email,
    subject: subj,
    message: message
  } }

  subject { ContactMailer.contact(attributes) }

  specify { expect(subject.to).to eq(["contact@startupvictoria.com.au"]) }
  specify { expect(subject.from).to eq(["no-reply@startupvictoria.com.au"]) }

  specify { expect(subject.body).to include(full_name) }
  specify { expect(subject.body).to include(email) }
  specify { expect(subject.body).to include(subj) }
  specify { expect(subject.body).to include(message) }
end
