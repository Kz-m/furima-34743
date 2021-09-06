class Prefecture < ActiveHash::Base
  self.data = [
    {id: 0, pref: '--'},
    {id: 1, pref: '北海道'},
    {id: 2, pref: '青森'},
    {id: 3, pref: '岩手'},
    {id: 4, pref: '宮城'},
    {id: 5, pref: '秋田'},
    {id: 6, pref: '山形'},
    {id: 7, pref: '福島'},
    {id: 8, pref: '茨城'},
    {id: 9, pref: '栃木'},
    {id: 10, pref: '群馬'},
    {id: 11, pref: '埼玉'},
    {id: 12, pref: '千葉'},
    {id: 13, pref: '東京'},
    {id: 14, pref: '神奈川'},
    {id: 15, pref: '新潟'},
    {id: 16, pref: '富山'},
    {id: 17, pref: '石川'},
    {id: 18, pref: '福井'},
    {id: 19, pref: '山梨'},
    {id: 20, pref: '長野'},
    {id: 21, pref: '岐阜'},
    {id: 22, pref: '静岡'},
    {id: 23, pref: '愛知'},
    {id: 24, pref: '三重'},
    {id: 25, pref: '滋賀'},
    {id: 26, pref: '京都'},
    {id: 27, pref: '大阪'},
    {id: 28, pref: '兵庫'},
    {id: 29, pref: '奈良'},
    {id: 30, pref: '和歌山'},
    {id: 31, pref: '鳥取'},
    {id: 32, pref: '島根'},
    {id: 33, pref: '岡山'},
    {id: 34, pref: '広島'},
    {id: 35, pref: '山口'},
    {id: 36, pref: '徳島'},
    {id: 37, pref: '香川'},
    {id: 38, pref: '愛媛'},
    {id: 39, pref: '高知'},
    {id: 40, pref: '福岡'},
    {id: 41, pref: '佐賀'},
    {id: 42, pref: '長崎'},
    {id: 43, pref: '熊本'},
    {id: 44, pref: '大分'},
    {id: 45, pref: '宮崎'},
    {id: 46, pref: '鹿児島'},
    {id: 47, pref: '沖縄'},

  ]
  include ActiveHash::Associations
  has_many :items
end