# frozen_string_literal: true

RSpec.describe PageViews do
  it 'has a version number' do
    expect(PageViews::VERSION).not_to be nil
  end

  describe '.perform' do
    context 'with a not found file' do
      let(:file_path) { 'path/to/a/not/existent/file.log' }

      it 'fails' do
        expect { described_class.perform(file_path) }.to raise_error(
          PageViews::Error, 'File not found. Please provide a valid file path.'
        )
      end
    end

    context 'with a non supported file' do
      let(:file_path) { 'spec/fixtures/files/invalid_file.txt' }

      it 'fails' do
        expect { described_class.perform(file_path) }.to raise_error(
          PageViews::Error, 'File format not supported. Supported formats are: [".log"].'
        )
      end
    end

    context 'with a valid file' do
      let(:file_path) { 'spec/fixtures/files/sample.log' }

      it 'presents the correct data' do
        expect { described_class.perform(file_path) }.to output(
          "[{:type=>:most_viewed,\n" \
          "  :collection=>\n" \
          "   [{:page=>\"/about/2\", :count=>90},\n" \
          "    {:page=>\"/contact\", :count=>89},\n" \
          "    {:page=>\"/index\", :count=>82},\n" \
          "    {:page=>\"/about\", :count=>81},\n" \
          "    {:page=>\"/help_page/1\", :count=>80},\n" \
          "    {:page=>\"/home\", :count=>78}]},\n" \
          " {:type=>:unique_views,\n" \
          "  :collection=>\n" \
          "   [{:page=>\"/index\", :count=>23},\n" \
          "    {:page=>\"/home\", :count=>23},\n" \
          "    {:page=>\"/contact\", :count=>23},\n" \
          "    {:page=>\"/help_page/1\", :count=>23},\n" \
          "    {:page=>\"/about/2\", :count=>22},\n" \
          "    {:page=>\"/about\", :count=>21}]}]\n"
        ).to_stdout
      end
    end
  end
end
