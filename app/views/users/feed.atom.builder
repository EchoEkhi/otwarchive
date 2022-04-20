atom_feed({:root_url => user_url(:id => @user.login)}) do |feed|
  feed.title "#{@user.login}'s AO3 works"
  feed.updated @works.first.revised_at if @works.respond_to?(:first) && @works.first.present?

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
