#!/bin/bash
for ns in $(
	nslookup -q=TXT _spf.google.com 8.8.8.8 |
	grep 'text\ =\ '|
	sed '{s/ include:/\n/g;s/ ip4:/\n/g;s/ ip6:/\n/g}'|
	awk '$2!="text"{print $1}'|
	uniq );do
		for range in $(
			nslookup -q=TXT $ns 8.8.8.8|
			grep 'text\ =\ '|
			sed '{s/ ip4:/\n/g;s/ ip6:/\n/g}'|
			awk '$2!="text"{print $1}'|
			uniq );do
				case $range in
					*:*)
						filter=ip6tables
						oicmp=icmp6-adm-prohibited
						iicmp=$oicmp
					;;
					*)
						filter=iptables
						oicmp=icmp-net-prohibited
						iicmp=icmp-host-prohibited
					;;
				esac
				reject="$filter -j REJECT --reject-with="
				${reject}$oicmp -A OUTPUT -d $range
				${reject}$iicmp -A INPUT -s $range
		done
done
