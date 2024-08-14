
admin = User.find_or_create_by(email: 'admin@example.com') do |user|
  user.name = 'Admin'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.role = 'admin'
end

puts "Usuario Admin creado con el email: #{admin.email}"

# # Creación de usuarios
# User.create!([
#   { name: 'Ernesto', email: 'ernesto@example.com', role: 'ingeniero', color: '#FF5733' },
#   { name: 'Barbara', email: 'barbara@example.com', role: 'ingeniero', color: '#33FF57' },
#   { name: 'Benjamin', email: 'benjamin@example.com', role: 'ingeniero', color: '#3357FF' }
# ])

# Creación de servicios
services = [
  { name: 'Monitoreo Recorrido.cl', description: 'Servicio de monitoreo de la plataforma Recorrido.cl', contract_start_time: '08:00', contract_end_time: '20:00' },
  { name: 'Soporte Técnico 24/7', description: 'Soporte técnico para clientes premium', contract_start_time: '00:00', contract_end_time: '23:59' },
  { name: 'Mantenimiento de Servidores', description: 'Mantenimiento preventivo y correctivo de servidores', contract_start_time: '22:00', contract_end_time: '06:00' }
]

services.each do |service_attrs|
  service = Service.find_or_create_by(name: service_attrs[:name]) do |s|
    s.description = service_attrs[:description]
    s.contract_start_time = service_attrs[:contract_start_time]
    s.contract_end_time = service_attrs[:contract_end_time]
  end
  puts "Servicio '#{service.name}' creado o encontrado"
end

# Creación de semanas (5 semanas en el futuro)
(0..4).each do |i|
  start_date = (Date.today + i.weeks).beginning_of_week
  end_date = start_date.end_of_week

  week = Week.find_or_create_by(start_date: start_date, end_date: end_date)

  puts "Semana desde #{week.start_date} hasta #{week.end_date} creada o encontrada"
end

