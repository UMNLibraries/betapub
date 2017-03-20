# frozen_string_literal: true
namespace :solr_betapub do
  desc "Start solr"
  task :start => :environment do
    sh("#{Rails.root}/vendor/solr/bin/solr stop -all")
    sh("#{Rails.root}/vendor/solr/bin/solr start -f")
  end

  desc "Stop solr"
  task :stop => :environment do
    sh("#{Rails.root}/vendor/solr/bin/solr stop -all")
  end
end
