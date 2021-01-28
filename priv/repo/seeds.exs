# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

text =
  "Elit ex laborum quis consectetur irure anim nisi esse officia proident nulla. Et eu reprehenderit ea et ut eu officia ipsum dolore minim esse minim tempor veniam. Dolor reprehenderit esse est esse mollit velit cillum exercitation. Proident aliqua velit laborum consequat. Tempor voluptate irure exercitation consectetur. Sint sit quis enim tempor enim quis proident ipsum. Magna eu consectetur mollit proident eu."

alias Blog.{Repo, Posts.Post}

post1 = Post.changeset(%Post{}, %{title: "Phoenix Framework", description: text})
post2 = Post.changeset(%Post{}, %{title: "PostgreSQL", description: text})
post3 = Post.changeset(%Post{}, %{title: "LiveView", description: text})

Repo.insert(post1)
Repo.insert(post2)
Repo.insert(post3)
