require "sinatra"
require "sinatra/reloader" if development?

require "sequel"

DB = Sequel.connect(adapter: 'mysql2', host: '159.89.232.129', database: 'oberlin_environmentaldashboard', user: 'remote_tim', password: '8ZDkv0r9gGFQ04zp')

get '/' do
    DB.fetch("SELECT name,inet_ntoa(ip),water_uuid, elec_uuid, elec_rvid, water_rvid, relative_value FROM orbs o inner join relative_values rv on o.water_rvid=rv.id").map do |row|
      row[:name]
    end
end
