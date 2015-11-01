defmodule Elixir5280.BlogPostTest do
  use Elixir5280.ModelCase

  alias Elixir5280.BlogPost

  test "lists all blog posts with basic info" do
    assert length(BlogPost.all) > 1
    assert List.last(BlogPost.all) == %{
      author: "Matthew Bender", created_at: "2015-01-01",
      id: "2015-01-01-yet-another-blog",
      title: "Yet Another Tech Blog"}
  end

  test "returns blog post details" do
    assert BlogPost.get!("2015-01-01-yet-another-blog") == %{
      author: "Matthew Bender", created_at: "2015-01-01",
      id: "2015-01-01-yet-another-blog",
      title: "Yet Another Tech Blog",
      html: "<h3>Starting Again</h3>\n<p>I’m going to start blogging again about Tech N’ Stuff.  I used to write blogs\nvery sporadically on <a href=\"http://www.bentsolutions.com/blog\">BentSolutions.com</a> but\nnow I really want to start blogging more consistently. Perhaps as often as once\na week…(findgers crossed)</p>\n<h3>Who is the developer Matthew Bender?</h3>\n<p>I’m a true Ruby on Rails nerd! In the past, I was a C# .NET zombie but 4 years\nago I joined and have enjoyed working with the ruby open source community. More\nrecently, I’ve been working a lot with Rails RESTful APIs and AngularJS\nfront-ends. I enjoy developing with the TDD methodology. As a lead engineer, I\nam passionate in improving those around me. I attend conferences, go to\nmeet-ups, read blogs, and listen to podcasts, always trying to bring interesting\nand new ideas to my team. I am now exploring more programming languages for\ncases when certain technologies can help scale an application. I most interested\nin Node.js, Elixir, and Go. I have also dabbled in R and started learning the\nvalue of data science.</p>\n<h3>What is 5280code.com?</h3>\n<p>This website is really just a sandbox/playground for me to implement whatever I\nwant when I have a free moment and not just have the code live in a git repo\nsomewhere.</p>\n<h3>More to Come</h3>\n<p>I’ll create blog posts explaining the individual parts of this website</p>\n<ol>\n<li>Fitbit device data Integration\n</li>\n<li>Bitcoin &amp; Pusher price Integration\n</li>\n<li>Meetup.com events Integration\n</li>\n<li>Blog Engine\n</li>\n</ol>\n"
    }
  end

  test "raises an error when the blog post id is not found" do
    assert_raise JSONAPI.ResourceNotFound, fn ->
      BlogPost.get!("test-fake-blog")
    end
  end
end
