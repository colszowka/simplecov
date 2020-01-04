# frozen_string_literal: true

Then /^I should see the groups:$/ do |table|
  expected_groups = table.hashes
  available_groups = all("#content .file_list_container")
  # Given group names should be the same number than those rendered in report
  expect(expected_groups.count).to eq(available_groups.count)

  # Verify each of the expected groups has a file list container and corresponding title and coverage number
  # as well as the correct number of links to files.
  expected_groups.each do |group|
    with_scope "#content ##{group['name'].gsub(/[^a-z]/i, '')}.file_list_container" do
      file_count_in_group = page.all("a.src_link").count
      expect(file_count_in_group).to eq(group["files"].to_i)

      with_scope "h2" do
        expect(page).to have_content(group["name"])
        expect(page).to have_content(group["coverage"])
      end
    end
  end
end

Then /^I should see the source files:$/ do |table|
  expected_files = table.hashes
  available_source_files = all(".t-file", :visible => true)

  expect(expected_files.length).to eq(available_source_files.count)
  include_branch_coverage = table.column_names.include?("branch coverage")

  # Find all filenames and their coverage present in coverage report
  files = available_source_files.map do |file_row|
    coverage_data =
      {
        "name" => file_row.find(".t-file__name").text,
        "coverage" => file_row.find(".t-file__coverage").text
      }

    coverage_data["branch coverage"] = file_row.find(".t-file__branch-coverage").text if include_branch_coverage

    coverage_data
  end

  expect(files.sort_by { |coverage_data| coverage_data["name"] }).to eq(expected_files.sort_by { |coverage_data| coverage_data["name"] })
end

Then /^there should be (\d+) skipped lines in the source files$/ do |expected_count|
  expect(all(".source_table ol li.skipped").count).to eq(expected_count.to_i)
end

Then /^I should see a (.+) coverage summary of (\d+)\/(\d+)( for the file)?$/ do |coverage_type, hit, total, for_file|
  missed = total - hit

  extra_class = for_file ? ".source_table" : ""
  summary_text = find("#{extra_class} .t-#{coverage_type}-summary", :visible => true).text

  expect(summary_text).to match /#{total} .+ #{hit} .+ #{missed} /
end

When /^I open the detailed view for "(.+)"$/ do |file_path|
  click_on(file_path)

  header_text = page.find(".header h3", :visible => true).text
  expect(header_text).to eq file_path
end
