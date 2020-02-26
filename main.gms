Sets
    i delivery1to25  /delivery1,delivery2,delivery3,delivery4,delivery5,delivery6,delivery7,delivery8,delivery9,delivery10,delivery11,delivery12,delivery13,delivery14,delivery15,delivery16,delivery17,delivery18,delivery19,delivery20,delivery21,delivery22,delivery23,delivery24,delivery25/
    j driver1to3 /driver1,driver2,driver3/
    k time1to25  /cost,time,parking/;
Parameters
    a(i) only one driver is responsible for one delivery
    / delivery1             1
      delivery2             1
      delivery3             1
      delivery4             1
      delivery5             1
      delivery6             1
      delivery7             1
      delivery8             1
      delivery9             1
      delivery10             1
      delivery11             1
      delivery12             1
      delivery13             1
      delivery14             1
      delivery15             1
      delivery16             1
      delivery17             1
      delivery18             1
      delivery19             1
      delivery20             1
      delivery21             1
      delivery22             1
      delivery23             1
      delivery24             1
      delivery25             1 /

    c(j) one driver can only work for 7 hours per day
    /driver1     7
     driver2     7
     driver3     7/;

Table d(i,j,k) cost in dollar for each driver for one package
                driver1.cost    driver2.cost    driver3.cost    driver1.time    driver2.time    driver3.time    driver1.parking     driver2.parking     driver3.parking
    delivery1      10.23         11.88          13.53           0.5                 2.5             1.5             0.2499875           0.3004375               0.3300625
    delivery2      13.02         15.12          17.22           2                   3               0.5             0.3302                  0.5008                  0.2499875
    delivery3      10.54         12.24          13.94           2                   0.3             2               0.3302                  0.3482149           0.3302
    delivery4      3.72          4.32           4.92            0.2                 1               2               0.4335776           0.25                0.3302
    delivery5      3.1           3.6            4.1             2                   1.5             0.4             0.3302                  0.3300625           0.2884528
    delivery6      8.06          9.36           10.66           2                   0.4             1               0.3302                  0.2884528           0.25
    delivery7      8.99          10.44          11.89           0.1                 0.3             0.9             0.5491807           0.3482149           0.2347783
    delivery8      9.3           10.8           12.3            1                   2               0.6             0.25                    0.3302                  0.2288512
    delivery9      15.5          18             20.5            2.2                 0.6             2.1             0.3120256           0.2288512               0.3213427
    delivery10     2.17          2.52           2.87            0.3                 1.5             1.5             0.3482149           0.3300625               0.3300625
    delivery11     1.24          1.44           1.64            1.2                 1.6             0.5             0.2860816           0.3379072               0.2499875
    delivery12     3.72          4.32           4.92            1.2                 1               2               0.2860816           0.25                0.3302
    delivery13     10.85         12.6           14.35           0.9                 1.3             2.2             0.2347783           0.3033739               0.3120256
    delivery14     8.06          9.36           10.66           2                   1.6             1               0.3302                  0.3379072           0.25
    delivery15     6.51          7.56           8.61            1.5                 0.9             2.7             0.3300625           0.2347783               0.3313501
    delivery16     6.82          7.92           9.02            1.2                 2.5             2.3             0.2860816           0.3004375               0.3039929
    delivery17     14.57         16.92          19.27           2                   3               0.5             0.3302                  0.5008                  0.2499875
    delivery18     10.54         12.24          13.94           3                   1.1             3               0.5008                  0.2677517           0.5008
    delivery19     3.41          3.96           4.51            0.6                 1.2             1.8             0.2288512           0.2860816               0.3412384
    delivery20     13.02         15.12          17.22           1                   2.1             0.7             0.25                    0.3213427           0.2214121
    delivery21     14.26         16.56          18.86           1.4                 1               1.4             0.3183488           0.25                0.3183488
    delivery22     9.92          11.52          13.12           1                   2.1             2.5             0.25                    0.3213427           0.3004375
    delivery23     3.41          3.96           4.51            1.3                 1.3             0.5             0.3033739           0.3033739               0.2499875
    delivery24     6.2           7.2            8.2             1.7                 0.1             2.1             0.3416111           0.5491807               0.3213427
    delivery25     7.44          8.64           9.84            1.2                 0.4             1.4             0.2860816           0.2884528               0.3183488;


Binary Variables
    x(i,j)  driver corresponds to each delivery;

Variable
    z      total cost for the delivery;

Equations
    total_cost total cost for the delivery
    driver_constrain(i)  only one drive is responsible for one delivery
    working_time(j)  one driver can only work for 7 hours per day;

total_cost.. z =e= sum((i,j),x(i,j)*d(i,j,"cost")) + sum((i,j),x(i,j)*d(i,j,"parking"));
driver_constrain(i)..  sum(j,x(i,j)) =e= a(i);
working_time(j).. sum(i,x(i,j)*d(i,j,"time")) =l= c(j);

Model delivery /all/;

Solve delivery minimizing z using mip;

Display x.l, x.m, z.m, z.l

