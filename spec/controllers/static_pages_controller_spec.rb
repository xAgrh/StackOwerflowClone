require 'spec_helper'

describe StaticPagesController do
  
  it {should route(:get, '/').to(controller: 'static_pages', action: 'home')}
  
  describe "GET 'home'" do
    let(:questions){ create_list(:question, 2) }
    let(:deleted_questions){ create_list(:deleted_question, 2) }
    
    before {get :home}
    
    it "populates an array of all questions" do
      expect(assigns(:questions)).to match_array(questions)
    end
    
    it {should render_template('index')}
  end

end
