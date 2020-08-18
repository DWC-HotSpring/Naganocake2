Product.create!(
  [
    {
      id: 1,
      name: 'ブリオッシュ',
      price: 220,
      genre_id: 1,
      is_active: true,
      description: 'バターの風味豊かな食パンです。'
    },
    {
      id: 2,
      name: 'バゲット',
      price: 150,
      genre_id: 1,
      is_active: true,
      description: '国産小麦100%のフランスパン。'
    },
    {
      id: 3,
      name: 'カレーパン',
      price: 340,
      genre_id: 2,
      is_active: true,
      description: '中辛のカレーを、甘いパン生地と合わせました。'
    },
  ]
)