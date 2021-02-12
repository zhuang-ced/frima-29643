FactoryBot.define do
  factory :order_address do
    token                   {'tok_abcdefghijk00000000000000000'}
    post_number             {'123-4567'}
    shipping_area_id        {2}
    city                    {'ああああ'}
    house_number            {'いいいい'}
    building_name           {'うううう'}
    telephone_number        {'09012345678'}
  end
end
