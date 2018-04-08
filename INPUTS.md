INPUT FORMAT: (Try in irb)

```
require '../challenge2016/distribution_helper.rb'
require '../challenge2016/distributor.rb'
require '../challenge2016/sub_distributor.rb'

```

Create distributor objects respectively with their include and exclude locations

```
dis1 = Distributor.new({included_places: [['IN'],['US']], excluded_places: [['IN','KA'],['IN','TN','CENAI']]})
dis2 = SubDistributor.new(dis1,{included_places: [['IN']], excluded_places: [['IN','TN']]}) 
dis3 = SubDistributor.new(dis2,{included_places: [['IN','KA','YELUR']], excluded_places: []})

```

In the above example, dis3 is the subdistributor of dis2 and dis2 is the sub distributor of dis1

dis3 < dis2 < dis1

Now try calling 'valid_distributor' function to know whether the distributor has the permission to distribute in the particular region 

```
dis1.valid_distributor(gets.chomp)

```

Ex TestCases: 

```
dis1.valid_distributor('ALNDI-MH-IN') # - true - Alandi - maharashtra
dis2.valid_distributor('ALNDI-MH-IN') # - true
dis3.valid_distributor('ALNDI-MH-IN') # - false
dis1.valid_distributor('CENAI-TN-IN') # - false - Chennai - tamilnadu
dis2.valid_distributor('CENAI-TN-IN') # - false
dis3.valid_distributor('CENAI-TN-IN') # - false
dis1.valid_distributor('MADUK-TN-IN') # - true - Madukkur - tamilnadu
dis2.valid_distributor('MADUK-TN-IN') # - false
dis3.valid_distributor('MADUK-TN-IN') # - false
dis1.valid_distributor('YELUR-KA-IN') # - false - Yellapur - karnataka
dis2.valid_distributor('YELUR-KA-IN') # - false
dis3.valid_distributor('YELUR-KA-IN') # - false

```
