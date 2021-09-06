class Category < ActiveHash::Base
  self.data = [   
    {id: 0, kind: '--'},
    {id: 1, kind: 'レディース'}, #{カラム名id: integer,カラム名kind: string}  
    {id: 2, kind: 'メンズ'},
    {id: 3, kind: 'ベビー・キッズ'},
    {id: 4, kind: 'インテリア・住まい・小物'},
    {id: 5, kind: '本・音楽・ゲーム'},
    {id: 6, kind: 'おもちゃ・ホビー・グッズ'},
    {id: 7, kind: '家電・スマホ・カメラ'},
    {id: 8, kind: 'スポーツ・レジャー'},
    {id: 9, kind: 'ハンドメイド'},
    {id: 10, kind: 'その他'}  
  ]
  include ActiveHash::Associations
  has_many :items
  
end
