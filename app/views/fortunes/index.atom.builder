atom_feed do |feed|
  feed.title "Moje Fortunki"
  feed.updated @fortunes.first.updated_at
  @fortunes.each do |fortune|
    feed.entry(fortune) do |entry|
      entry.content fortune.body, :type => "html"
    end
  end
end
