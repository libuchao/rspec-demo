require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  before(:each) do
    @post = Post.create(title: 'big title', content: nil)
  end
  
  it "renders 'No Content' when @post has no content" do
    render
    expect(rendered).to include('No Content')
  end
  
  it 'renders content when @post has content' do
    allow(view).to receive(:render_content).and_return('Stub Content')
    @post = Post.create(title: 'big title', content: 'I love Rails')
    render
    expect(rendered).not_to include('No Content')
    expect(rendered).not_to include('I love Rails')
    expect(rendered).to include('Stub Content')
  end
end