INSERT INTO items(id,name,category,description,price,xp_required,rarity,asset,is_active) VALUES
('title_beginner','Iniciante','title','Título inicial',0,0,'common','{}',TRUE),
('title_calculator','Calculista','title','Título clássico',300,500,'rare','{}',TRUE),
('title_master','Mestre','title','Título de veterano',1000,2500,'epic','{}',TRUE),
('title_ceo','CEO','title','Título administrativo',0,0,'legendary','{}',TRUE)
ON CONFLICT(id) DO UPDATE SET name=EXCLUDED.name,category=EXCLUDED.category,description=EXCLUDED.description,price=EXCLUDED.price,xp_required=EXCLUDED.xp_required,rarity=EXCLUDED.rarity,asset=EXCLUDED.asset,is_active=EXCLUDED.is_active;
INSERT INTO achievements(id,name,description,icon,xp_reward,coin_reward) VALUES
('first_game','Primeira partida','Jogue sua primeira partida.','🎮',50,50),
('first_win','Primeira vitória','Vença uma partida.','🏆',100,100),
('ten_wins','10 vitórias','Alcance 10 vitórias.','👑',500,500)
ON CONFLICT(id) DO NOTHING;
