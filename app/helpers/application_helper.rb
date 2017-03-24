require 'json'

module ApplicationHelper
  def pubdate_formatter(date, format)
    Time.parse(date).strftime(format)
  end

  # Returns a hash of internetIDs indexed by author position
  def affiliate_authors_parse_json(affiliateAuthors)
    affiliates_internet_ids = {}
    affiliateAuthors.each do |a|
      hash = JSON.parse a
      affiliates_internet_ids[hash['authorPosition']-1] = hash['internetID']
    end
    affiliates_internet_ids
  end

  # Return a formatted string of authors where UMN affiliate authors
  # are linked to author pages
  def authors_highlight_affiliates(authors, affiliateAuthors)
    affiliates = affiliate_authors_parse_json(affiliateAuthors)
    authors_linked = []
    authors.each_with_index do |a, idx|
      # Match author position from affiliateAuthors to full authors array by index
      # and create links for matches
      if affiliates[idx]
        authors_linked << link_to(a, controller: 'authors', action: 'show', internet_id: affiliates[idx]).html_safe
      else
        authors_linked << a
      end
    end
    authors_linked.to_sentence
  end
end
