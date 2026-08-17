require('dotenv').config();
const fs=require('fs'),path=require('path');const {Pool}=require('pg');
if(!process.env.DATABASE_URL) throw new Error('DATABASE_URL ausente.');
const pool=new Pool({connectionString:process.env.DATABASE_URL,ssl:{rejectUnauthorized:false},connectionTimeoutMillis:15000,statement_timeout:30000,query_timeout:30000});
(async()=>{try{await pool.query(fs.readFileSync(path.join(__dirname,'schema.sql'),'utf8'));await pool.query(fs.readFileSync(path.join(__dirname,'seed.sql'),'utf8'));console.log('OK: schema + seed aplicados.')}catch(e){console.error('Falha:',e.message);process.exitCode=1}finally{await pool.end()}})();
