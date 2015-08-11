# !/bin/sh
# Client IPTables Script
# Written by Bradley Lankford
# bradley@b18.co
# Blocks all inbound traffic except established/related
# Blocks all forward traffic (not a router)
# Permits all outbound traffic except for specified countries assigned to
# 	ISO variable listed below
# Uses IPDeny.com's aggregated country codes and IPSet (for speed) and
# 	IPTables to do so.
# For best results, schedule this script to run at least weekly, to pull
#	down the latest IP block updates from IPDeny.com.

# Resetting IPTables. Blocking all inbound/forward traffic, and allowing outbound.
/sbin/iptables -F
/sbin/iptables -P INPUT ACCEPT

# Accept only inbound traffic to loopback or already established traffic. Allow all outbound.
/sbin/iptables -A INPUT -i lo -j ACCEPT
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -P OUTPUT ACCEPT

# Drop all other traffic
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP

# Destroy existing IPSet lists, if they exist
/sbin/ipset destroy geoblock
/sbin/ipset destroy loc

# Create new empty IPSet lists
/sbin/ipset create geoblock hash:net
/sbin/ipset create loc hash:net

# List of country codes to block outbound traffic to.
ISO="af cn jp kp kr ru so"

# Add each country's list of IPs to our geoblock IPSet list
for country in $ISO
do
   for IP in $(wget -O - http://ipdeny.com/ipblocks/data/aggregated/"$country"-aggregated.zone)
      do
         /sbin/ipset add geoblock $IP
      done
done

# Create RFC 1918 IPSet list
# /sbin/ipset add loc 127.0.0.0/8
# /sbin/ipset add loc 10.0.0.0/8
# /sbin/ipset add loc 172.16.0.0/12
# /sbin/ipset add loc 192.168.0.0/16

# Deny outbound traffic to blacklisted countries.
/sbin/iptables -I OUTPUT -m set --match-set geoblock dst -j DROP
# /sbin/iptables -I OUTPUT -m set --match-set loc dst -j ACCEPT
