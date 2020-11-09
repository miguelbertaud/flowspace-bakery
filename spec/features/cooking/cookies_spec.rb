feature 'Cooking cookies' do
  scenario 'Cooking a single cookie' do
    user = create_and_signin
    oven = user.ovens.first

    visit oven_path(oven)

    expect(page).to_not have_content 'Chocolate Chip'
    expect(page).to_not have_content 'Your Cookie is Ready'

    first(".desktop-button-prepare").click
    fill_in 'Fillings', with: 'Chocolate Chip'
    click_button 'Mix and bake'

    expect(current_path).to eq(oven_path(oven))
    expect(page).to have_content 'Chocolate Chip'
    expect(page).to have_content 'Cooking'

    click_button 'Retrieve Cookie'
    expect(page).to_not have_content 'Chocolate Chip'
    expect(page).to_not have_content 'Your Cookie is Ready'

    visit root_path
    within '.store-inventory' do
      expect(page).to have_content '1 Cookie'
    end
  end

  scenario 'Trying to bake a cookie while oven is full' do
    user = create_and_signin
    oven = user.ovens.first

    oven = FactoryBot.create(:oven, user: user)
    visit oven_path(oven)

    first(".desktop-button-prepare").click
    fill_in 'Fillings', with: 'Chocolate Chip'
    click_button 'Mix and bake'

    first(".desktop-button-prepare").click
    expect(page).to have_content 'A cookie is already in the oven!'
    expect(current_path).to eq(oven_path(oven))
    expect(page).to_not have_button 'Mix and bake'
  end

  scenario 'Baking multiple cookies' do
    user = create_and_signin
    oven = user.ovens.first

    oven = FactoryBot.create(:oven, user: user)
    visit oven_path(oven)

    3.times do
      first(".desktop-button-prepare").click
      fill_in 'Fillings', with: 'Chocolate Chip'
      click_button 'Mix and bake'

      click_button 'Retrieve Cookie'
    end

    visit root_path
    within '.store-inventory' do
      expect(page).to have_content '3 Cookies'
    end
  end
end
