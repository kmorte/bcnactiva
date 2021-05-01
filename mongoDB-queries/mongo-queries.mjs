
// m = db.restaurants
// m.find();
// m.find({},{_id: 1, name: 1, borough: 1, cuisine: 1})
// m.find({},{_id: 0, name: 1, borough: 1, cuisine: 1})
// m.find({},{_id: 0, name: 1, borough: 1, "address.zipcode": 1})
// m.find({borough: 'Bronx'})
// m.find({borough: 'Bronx'}).limit(5)
// m.find({borough: 'Bronx'}).skip(5).limit(5)
// m.find({'grades.score': {$gt: 80, $lt: 100}})
// m.find({'address.coord.0': {$lt: -95.754168}})
// m.find({'address.coord.0': {$lt: -65.754168}, cuisine: {$ne: "American "}, 'grades.score': {$gt: 70}})
// m.find({'address.coord.0': {$lt: -65.754168}, cuisine: {$ne: "American "}, 'grades.score': {$gt: 70}})
// m.find({borough: {$ne: 'Brooklyn'}, cuisine: {$ne: "American "}, 'grades.grade': 'A'}).sort({cuisine: -1});
// m.find({name: {$regex: /^Wil/, $options: 'm'}},{_id: 1, name: 1, borough: 1, cuisine: 1})
// m.find({name: {$regex: /ces$/, $options: 'm'}},{_id: 1, name: 1, borough: 1, cuisine: 1})
// m.find({name: {$regex: /Reg/, $options: 'm'}},{_id: 1, name: 1, borough: 1, cuisine: 1})
// m.find({borough: 'Bronx', cuisine: {$in: ["American ","Chinese"]}})
// m.find({borough: {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}},{_id: 1, name: 1, borough: 1, cuisine: 1})
// m.find({borough: {$nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}},{_id: 1, name: 1, borough: 1, cuisine: 1})
// m.find({'grades.score': {$lte: 10}},{_id: 1, name: 1, borough: 1, cuisine: 1})
