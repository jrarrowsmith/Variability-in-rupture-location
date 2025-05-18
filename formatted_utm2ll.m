function formatted_utm2ll(lat, long, zone)
%output formatted lat long from utm
lat
long
zone
ll=utm2ll(lat,long,zone);

fprintf('%.5f %.5f \n', ll(1),ll(2));
end