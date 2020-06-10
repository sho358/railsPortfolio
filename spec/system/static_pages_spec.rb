require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do 
    context "ページ全体" do 
      before do 
        visit root_path
      end

      it "筋肉メシ図鑑の文字列が存在することを確認" do 
        expect(page).to have_content '筋肉メシ図鑑'
      end
    end
  end

  describe "aboutページ" do 
    before do 
      visit about_path
    end

    it "筋肉メシ図鑑とは？の文字列が存在することを確認" do 
      expect(page).to have_content '筋肉メシ図鑑とは？'
    end

    it "正しいタイトルが表示されることを確認" do 
      expect(page).to have_title full_title('筋肉メシ図鑑とは？')
    end
  end
end
