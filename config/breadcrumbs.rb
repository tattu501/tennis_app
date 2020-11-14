crumb :root do
  link "トップページ", root_path
end

crumb :profile do
  link "自己紹介", profile_path
  parent :root
end

crumb :users do
  link "ユーザ一覧", users_path
  parent :root
end

crumb :user_new do
  link "ユーザ登録", signup_path
  parent :root
end

crumb :user_show do |user|
  link "#{user.name}のプロフィール", user_path
  parent :root
end

crumb :user_edit do |user|
  link "#{user.name}のプロフィール編集", edit_user_path
  parent :root
end

crumb :posts do
  link "投稿一覧", posts_path
  parent :root
end

crumb :post_new do
  link "新規投稿", new_post_path
  parent :root
end

crumb :post_show do |post|
  link "#{post.user.name}さんの投稿", post_path
  parent :posts
end

crumb :post_edit do |post|
  link "編集", edit_post_path
  parent :post_show, post
end

crumb :comment_edit do |comment|
  link "#{comment.user.name}さんのコメントを編集", edit_post_comment_path
  parent :post_show, comment.post
end

crumb :experiences do
  link "体験記一覧", experiences_path
  parent :root
end

crumb :experience_new do
  link "登録", new_experience_path
  parent :experiences
end

crumb :experience_show do |experience|
  link "#{experience.date.to_s}の体験記", experience_path
  parent :experiences
end

crumb :experience_edit do |experience|
  link "編集", edit_experience_path
  parent :experience_show, experience
end

crumb :terms do
  link "用語集", terms_path
  parent :root
end

crumb :term_new do
  link "登録", new_term_path
  parent :terms
end

crumb :term_show do |term|
  link term.term, term_path
  parent :terms
end

crumb :term_edit do |term|
  link "編集", edit_term_path
  parent :term_show, term
end