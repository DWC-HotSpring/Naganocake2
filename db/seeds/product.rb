Product.create!(
  [
    {
      id: 1,
      name: 'ブリオッシュ',
      price: 220,
      genre_id: 1,
      is_active: true,
      description: 'バターの風味豊かな食パンです。',
      created_at: 1.day.ago,
    },
    {
      id: 2,
      name: 'バゲット',
      price: 150,
      genre_id: 1,
      is_active: true,
      description: '国産小麦100%のフランスパン。',
      created_at: 1.month.ago,
    },
    {
      id: 3,
      name: 'カレーパン',
      price: 340,
      genre_id: 2,
      is_active: true,
      description: '中辛のカレーを、甘いパン生地と合わせました。',
      created_at: 2.day.ago,
    },
    {
      id: 4,
      name: 'いちごのショートケーキ',
      price: 300,
      genre_id: 4,
      is_active: true,
      description: '国産いちごをふんだんに使ったショートケーキです。',
      created_at: 3.day.ago,
    },
    {
      id: 5,
      name: 'シュークリーム',
      price: 360,
      genre_id: 3,
      is_active: true,
      description: '圧倒的なクリームの密度・柔らかさを堪能してみてください。',
      created_at: 2.week.ago,
    },
  ]
)