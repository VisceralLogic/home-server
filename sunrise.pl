use DateTime;
use DateTime::Span;
use DateTime::Event::Sunrise;

my $dt = DateTime->now(); $dt->set_time_zone("local");
my $sr = DateTime::Event::Sunrise->new(latitude => "+48", longitude => "-122", precise => '1');
my $tmp = $sr->sunrise_sunset_span($dt);

open( my $start, '>', "start.txt");
my $startTime = $tmp->start->subtract( minutes => 30 );
print $start "0", $startTime->hour(), $startTime->minute(), "\n";
close $start;

open( my $stop, '>', "stop.txt");
my $stopTime = $tmp->end->add( minutes => 30 );
print $stop "", $stopTime->hour(), $stopTime->minute();
close stop;
