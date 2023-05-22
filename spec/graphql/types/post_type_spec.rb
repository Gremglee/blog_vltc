module Types
  describe PostType do
    subject { described_class }

    it { is_expected.to have_field(:id).of_type("ID!") }
    it { is_expected.to have_field(:title).of_type("String!") }
    it { is_expected.to have_field(:content).of_type("String!") }
    it { is_expected.to have_field(:author).of_type("Author!") }
    it { is_expected.to have_field(:comments).of_type("[Comment!]") }
  end
end
