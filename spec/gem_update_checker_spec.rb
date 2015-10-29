describe GemUpdateChecker do
  context "#update_available?" do
    let(:name) {'gem_name'}
    let(:latest_version) {'1.0.0'}
    let(:response) {{:version => latest_version}}

    before do
      stub_request(:get, "#{GemUpdateChecker::RUBYGEMS_API}/#{name}/latest.json").
          to_return(:body => response.to_json)
    end

    it "current version is latest" do
      expect(GemUpdateChecker.update_available?(name, latest_version)).to be_falsey
    end

    it "update available" do
      expect(GemUpdateChecker.update_available?(name, '0.0.1')).to be_truthy
    end

    it "invalid version" do
      expect{
        GemUpdateChecker.update_available?(name, 'invalid version')
      }.to raise_error ArgumentError
    end
  end
end
