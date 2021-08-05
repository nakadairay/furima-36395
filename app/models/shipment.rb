class Shipment < ActiveHash::Base
  self.data = [
    { id: 1, prefecture_id: '--' },
    { id: 2, prefecture_id: '北海道' }, { id: 3, prefecture_id: '青森県' }, { id: 4, prefecture_id: '岩手県' },
    { id: 7, prefecture_id: '宮城県' }, { id: 6, prefecture_id: '秋田県' }, { id: 5, prefecture_id: '山形県' },
    { id: 8, prefecture_id: '福島県' }, { id: 9, prefecture_id: '茨城県' }, { id: 10, prefecture_id: '栃木県' },
    { id: 11, prefecture_id: '群馬県' }, { id: 12, prefecture_id: '埼玉県' }, { id: 13, prefecture_id: '千葉県' },
    { id: 14, prefecture_id: '東京都' }, { id: 15, prefecture_id: '神奈川県' }, { id: 16, prefecture_id: '新潟県' },
    { id: 17, prefecture_id: '富山県' }, { id: 18, prefecture_id: '石川県' }, { id: 19, prefecture_id: '福井県' },
    { id: 20, prefecture_id: '山梨県' }, { id: 21, prefecture_id: '長野県' }, { id: 22, prefecture_id: '岐阜県' },
    { id: 23, prefecture_id: '静岡県' }, { id: 24, prefecture_id: '愛知県' }, { id: 25, prefecture_id: '三重県' },
    { id: 26, prefecture_id: '滋賀県' }, { id: 27, prefecture_id: '京都府' }, { id: 28, prefecture_id: '大阪府' },
    { id: 29, prefecture_id: '兵庫県' }, { id: 30, prefecture_id: '奈良県' }, { id: 31, prefecture_id: '和歌山県' },
    { id: 32, prefecture_id: '鳥取県' }, { id: 33, prefecture_id: '島根県' }, { id: 34, prefecture_id: '岡山県' },
    { id: 35, prefecture_id: '広島県' }, { id: 36, prefecture_id: '山口県' }, { id: 37, prefecture_id: '徳島県' },
    { id: 38, prefecture_id: '香川県' }, { id: 39, prefecture_id: '愛媛県' }, { id: 40, prefecture_id: '高知県' },
    { id: 41, prefecture_id: '福岡県' }, { id: 42, prefecture_id: '佐賀県' }, { id: 43, prefecture_id: '長崎県' },
    { id: 44, prefecture_id: '熊本県' }, { id: 45, prefecture_id: '大分県' }, { id: 46, prefecture_id: '宮崎県' },
    { id: 47, prefecture_id: '鹿児島県' }, { id: 48, prefecture_id: '沖縄県' }
  ]

  include ActiveHash::Associations
  has_many :items
end
