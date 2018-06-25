describe 'tags for posts', :type => :feature do
  let!(:adorable) { Tag.create(name: 'adorable') }
  let!(:cute) { Tag.create(name: 'cute') }

  it 'can create a post without adding tags' do
    visit '/posts/new'
    element = page.find("post[post_name]")
    element.set(@post[:post_name])
    element = page.find("#Post Content")
    element.set(@post[:post_content])
    click_button('Create Post')
    expect(page).to have_content("Post title")
  end

  it 'can create a post with adding one tag' do
    puts cute.inspect
    visit '/posts/new'
    element = page.find("post[post_name]")
    element.set(@post[:post_name])
    element = page.find("#post_content")
    element.set(@post[:post_content])
    check('cute')
    click_button('Create Post')
    expect(page).to have_content("Post title")
    expect(page).to have_content("cute")
  end

  it 'can create a post with adding multiple tags' do
    visit '/posts/new'
    element = page.find("post_post_name")
    element.set(@post[:post_name])
    element = page.find("Post Content")
    element.set(@post[:post_content])
    check('cute')
    check('adorable')
    click_button('Create Post')
    expect(page).to have_content("Post title")
    expect(page).to have_content("cute")
    expect(page).to have_content("adorable")
  end
end
