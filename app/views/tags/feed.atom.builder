atom_feed({:root_url => tag_works_url(:tag_id => @tag.name)}) do |feed|
  feed.title "AO3 works tagged '#{@tag.name}'"
  feed.updated @works.first.created_at if @works.respond_to?(:first) && @works.first.present?

  @works.each do |work|
    unless work.unrevealed?
      feed.entry work do |entry|
        entry.title work.title 
        entry.summary feed_summary(work), :type => 'html'
        entry.summary work.summary, :type => 'text'
        entry.author do |author|
          author.name text_byline(work, :visibility => 'public')
        end
      end
    end
  end
end
