

#Users(11)

alice = User.create(name: 'Alice', age: 1)
bonnie = User.create(name: 'Bonnie', age: 2)
carolyn = User.create(name: 'Carolyn', age: 3)
danny = User.create(name: 'Danny', age:4 )
eva = User.create(name: 'Eva', age: 5)
faith = User.create(name: 'Faith', age: 6)
georgia = User.create(name: 'Georgia', age: 7)
hope = User.create(name: 'Hope', age:8 )
india = User.create(name: 'India', age: 9)
jack = User.create(name: 'Jack', age: 10)
kim = User.create(name: 'Kim', age: 11)


#Studios(11)

pure_barre = Studio.create(name: 'Pure Barre', category: 'Barre', location: '80 Pine St, New York, NY 10005')
soul_cycle = Studio.create(name: 'Soul Cycle', category: 'Cycling', location: '126 Leroy St, New York, NY 10014' )
bode_nyc = Studio.create(name: 'Bode NYC', category: 'Yoga', location: '82 5th Ave, New York, NY 10010')
corepower_yoga = Studio.create(name: 'CorePower Yoga', category: 'Yoga', location: ' 2030 Broadway #202, New York, NY 10023' )
bar_method = Studio.create(name: 'Bar Method', category: 'Barre', location: '2387 Broadway, New York, NY 10024')
cyc_fitness = Studio.create(name: 'CycFitness', category: 'Cycling', location: ' 4 Astor Pl, New York, NY 10003' )
exceedpc = Studio.create(name: 'Exceed Physical Culture', category: 'HIIT', location:'1477 3rd Ave, New York, NY 10028')
y7_studio = Studio.create(name: 'Y7 Studio', category: 'Yoga' , location: '58 E 11th St, New York, NY 10003')
nyc_pilates = Studio.create(name: 'New York Pilates', category: 'Pilates' , location:'2231 Broadway, New York, NY 10024')
cityrow = Studio.create(name: 'CITYROW', category: 'Rowing', location: '1409 3rd Ave, New York, NY 10075')
everybody_fights = Studio.create(name: 'EverybodyFights', category: 'Boxing' , location: '295 Madison Avenue, On 41st b/t Madison and Park, New York, NY 10017')


#Sessions(11)


s1 = Session.create(user_id: alice, studio_id: pure_barre, datetime: '2019-01-28 6:00')
s2 = Session.create(user_id: bonnie, studio_id: soul_cycle, datetime: '2019-02-28 7:00')
s3 = Session.create(user_id: carolyn, studio_id: bode_nyc, datetime: '2019-03-28 8:00')
s4 = Session.create(user_id: danny, studio_id:corepower_yoga, datetime: '2019-04-28 9:00')
s5 = Session.create(user_id: eva, studio_id: bar_method, datetime: '2019-05-28 13:00')
s6 = Session.create(user_id: faith, studio_id: cyc_fitness, datetime: '2019-06-28 14:00')
s7 = Session.create(user_id: georgia, studio_id: exceedpc, datetime: '2019-07-28 15:00')
s8 = Session.create(user_id: hope, studio_id: y7_studio, datetime: '2019-08-28 16:00')
s9 = Session.create(user_id: india, studio_id: nyc_pilates, datetime: '2019-09-28 17:00')
s10 = Session.create(user_id: jack, studio_id: cityrow, datetime: '2019-10-28 18:00')
s11 = Session.create(user_id: kim, studio_id: everybody_fights, datetime: '2019-11-28 19:00')
