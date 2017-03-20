# frozen_string_literal: true
namespace :solr_betapub do
  desc "TODO"
  task :start => :environment do
    sh("cd #{Rails.root.join('vendor', 'solr')}")
    sh("./bin/solr stop -all")
    sh("./bin/solr start -f")
  end

  desc "TODO"
  task :stop => :environment do
    sh("cd #{Rails.root.join('vendor', 'solr')}")
    sh("./bin/solr stop -all")
  end
end
